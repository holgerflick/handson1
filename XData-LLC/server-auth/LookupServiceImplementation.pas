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
    procedure RaiseUnauthorizedIfNecessary;
  public
    function GetBusinessEntityNames( const AStart: string): TList<TBusinessEntityItem>;
    function GetStatus : TStatusItem;
    function GetServerTimeUTC: TDateTime;
  end;

implementation


{ TLookupService }

 uses
  System.SysUtils,
  System.DateUtils,
  XData.Sys.Exceptions,
  Flexcel.Core,
  Controller.ServiceHelper;

resourcestring
 SQL_GetBusinessEntityNames =
   'SELECT ID, NAME FROM companies WHERE name ' +
   'LIKE :name LIMIT :limit';

  // ORDER BY CONVERT(RIGHT(FILE_DATE,4), UNSIGNED) DESC ';

const
  SQL_RESULT_LIMIT = 50;

function TLookupService.GetBusinessEntityNames(
  const AStart: string): TList<TBusinessEntityItem>;
var
  LConnection: TFDConnection;
  LQuery: TFDQuery;

begin
  Result := TList<TBusinessEntityItem>.Create;
  LConnection := TServiceHelper.GetFDConnection;

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

function TLookupService.GetServerTimeUTC: TDateTime;
var
  LLocal: TTimeZone;
begin
  LLocal := TTimeZone.Local;
  Result := LLocal.ToUniversalTime(Now);
end;

function TLookupService.GetStatus: TStatusItem;
var
  LCon : TFDConnection;
  LQuery: TFDQuery;
  LServer:String;
  LVersion:String;

begin
  RaiseUnauthorizedIfNecessary;

  LCon := TServiceHelper.GetFDConnection;
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

procedure TLookupService.RaiseUnauthorizedIfNecessary;
begin
  if TXDataOperationContext.Current.Request.User = nil then
  begin
    raise EXDataHttpUnauthorized.Create('Please login.');
  end;
end;

initialization
  RegisterServiceType(TLookupService);

end.
