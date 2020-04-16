unit ReportingServiceImplementation;

interface

uses
  Windows,
  Classes,
  SysUtils,
  FireDAC.Stan.Intf,
  FireDAC.Comp.Client,
  XData.Server.Module,
  XData.Service.Common,
  Aurelius.Drivers.Interfaces,
  VCL.FlexCel.Core,
  FlexCel.XlsAdapter,
  FlexCel.Render,
  FlexCel.Report,
  FlexCel.PDF,
  ReportingService;


type
  TLLCFormatUDF = class(TFlexCelUserFunction)

  public

    function Evaluate(const parameters: TFormulaValueArray): TReportValue; override;

  end;

type
  [ServiceImplementation]
  TReportingService = class(TInterfacedObject, IReportingService)
  private
    function GetFDConnection: TFDConnection;

  public

    function GetCompanyProfile( AId: String ): TStream;
  end;

implementation

{ TReportingService }

const
  RC_COMPANYDETAIL = 'CompanyDetail';
  SQL_GETCOMPANY = 'SELECT * FROM companies WHERE ID = :ID';


function TReportingService.GetCompanyProfile(AId: String): TStream;
var
  LCon : TFDConnection;
  LQuery: TFDQuery;
  LReport: TFlexcelReport;

  LResource: TResourceStream;
  LXlsStream: TMemoryStream;
  LXlsFile : TXlsFile;
  LPdf: TFlexCelPdfExport;

begin
  LCon := GetFDConnection;
  LQuery := TFDQuery.Create(nil);
  LReport := TFlexcelReport.Create;
  LResource := TResourceStream.Create(HInstance, RC_COMPANYDETAIL, RT_RCDATA );
  LXlsStream := TMemoryStream.Create;
  LPdf := TFlexCelPdfExport.Create;

  try
    LQuery.Connection := LCon;
    LQuery.SQL.Text := SQL_GETCOMPANY;
    LQuery.Params.ParamByName('ID').AsString := AId;
    LQuery.Open;

    // add query as Q to report
    LReport.AddTable('q',LQuery);


    // LReport.SetUserFunction('LLCFormat',
    //   TLLCFormatUDF.Create);

    // run report
    LReport.Run(LResource, LXlsStream);
    LXlsStream.Position := 0;


    // create result, will be freed by XData
    Result := TMemoryStream.Create;

    // exporting to PDF
    LXlsFile := TXlsFile.Create;
    try
      LPdf.Workbook := LXlsFile;
      LPdf.Workbook.Open(LXlsStream);
      LPdf.Export(Result);
    finally
      LXlsFile.Free;
    end;

    // set content type to PDF
    TXDataOperationContext.Current.Response.Headers.AddValue(
      'Content-type',
      'application/pdf');

    // suggest a filename
    TXDataOperationContext.Current.Response.Headers.AddValue(
      'Content-Disposition',
      'filename=' + AId + '.pdf' );

    // close query
    LQuery.Close;

  finally
    LQuery.Free;
    LReport.Free;
    LPdf.Free;
    LXlsStream.Free;
    LResource.Free;
  end;
end;

function TReportingService.GetFDConnection: TFDConnection;
begin
  Result := (TXDataOperationContext.Current.Connection as IDBConnectionAdapter).AdaptedConnection as TFDConnection;
end;

{ TLLCFormatUDF }

function TLLCFormatUDF.Evaluate(const parameters: TFormulaValueArray): TReportValue;
var
  LDate: String;

begin
  if Length( parameters ) <> 1 then
  begin
    raise Exception.Create('LLCFormat: Number of expected parameters is 1.');
  end;

  LDate := TRIM( parameters[0].ToString );

  Result := '';

  if Length( LDate ) = 8 then
  begin
    Result := COPY( LDate, 1, 2) + '/' +
              COPY( LDate, 3, 2 ) + '/' +
              COPY( LDate, 5, 4 );
  end;

end;

initialization
  RegisterServiceType(TReportingService);

end.
