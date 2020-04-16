unit LookupServiceImplementation;

interface

uses
  XData.Server.Module,
  XData.Service.Common,
  System.Generics.Collections,
  LookupService,
  ReturnTypes,
  Data.DB,
  FireDAC.Comp.Client,
  Aurelius.Drivers.Interfaces;

type
  [ServiceImplementation]
  TLookupService = class(TInterfacedObject, ILookupService)
  private
    function GetFDConnection: TFDConnection;
  public
    function GetBusinessEntityNames( const AStart: string): TList<TBusinessEntityItem>;
    function GetStatus : TStatusItem;
  end;

implementation


{ TLookupService }

 uses
   Flexcel.Core;

resourcestring
 SQL_GetBusinessEntityNames = 'SELECT ID, NAME FROM companies WHERE name LIKE :name ORDER BY CONVERT(RIGHT(FILE_DATE,4), UNSIGNED) DESC LIMIT :limit';

const
  SQL_RESULT_LIMIT = 25;

function TLookupService.GetBusinessEntityNames(
  const AStart: string)
    : System.Generics.Collections.TList<TBusinessEntityItem>;
var
  LConnection: TFDConnection;
  LQuery: TFDQuery;

begin
  Result := TList<TBusinessEntityItem>.Create;
  LConnection := GetFDConnection;

  LQuery := TFDQuery.Create(nil);
  try
    LQuery.Connection := LConnection;
    LQuery.SQL.Text := SQL_GetBusinessEntityNames;
    LQuery.Params.ParamByName('name').AsString := AStart + '%';
    LQuery.Params.ParamByName('limit').AsInteger := SQL_RESULT_LIMIT;
    LQuery.Open();

    while not LQuery.Eof do
    begin
      Result.Add(
        TBusinessEntityItem.Create(
         LQuery.FieldByName('id').AsString,
         LQuery.FieldByName('name').AsString
        )
      );
      LQuery.Next;
    end;
    LQuery.Close;

  finally
    LQuery.Free;
  end;
end;

function TLookupService.GetFDConnection: TFDConnection;
begin
  Result := (TXDataOperationContext.Current.Connection as IDBConnectionAdapter).AdaptedConnection as TFDConnection;
end;

function TLookupService.GetStatus: TStatusItem;
var
  LCon : TFDConnection;
  LQuery: TFDQuery;
  LServer:String;
  LVersion:String;

begin
  LCon := GetFDConnection;
  LQuery := TFDQuery.Create(nil);

  Result := TStatusItem.Create;
  Result.ResultLimit := SQL_RESULT_LIMIT;
  Result.RecordCount := -1;
  try
    LQuery.Connection := LCon;

    LQuery.Open('EXPLAIN SELECT COUNT(*) FROM companies');
    Result.RecordCount := LQuery.FieldByName('rows').AsInteger;
    LQuery.Close;

    LQuery.Open('SELECT VERSION() AS V');
    LVersion := LQuery.FieldByName('V').AsString;
    LQuery.Close;

    LQuery.SQL.Text := 'SHOW VARIABLES LIKE :param';
    LQuery.ParamByName('param').AsString := 'version_comment';
    LQuery.Open();
    LServer := LQuery.FieldByName('Value').AsString;
    LQuery.Close;

    Result.DatabaseEngine := LServer + ' ' + LVersion;
    Result.ReportEngine :='TMS FlexCel for VCL ' + FlexCelVersion;
  finally
    LQuery.Free;
  end;

end;

initialization
  RegisterServiceType(TLookupService);

end.
