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

  [ServiceImplementation]
  TReportingService = class(TInterfacedObject, IReportingService)
  private
    procedure CheckCreds(AToken: String);

  public
    function GetCompanyProfile( T: String; AId: String ): TStream;
  end;

implementation

{ TReportingService }

uses
  XData.Sys.Exceptions,
  Modules.AuthController,
  Controller.ServiceHelper,
  System.IOUtils;

const
  RC_COMPANYDETAIL = 'CompanyDetail';
  SQL_GETCOMPANY = 'SELECT * FROM companies WHERE ID = :ID';


function TReportingService.GetCompanyProfile(T: String; AId: String): TStream;
var
  LQuery: TFDQuery;
  LReport: TFlexcelReport;

  LResource: TResourceStream;
  LXlsStream: TMemoryStream;
  LXlsFile : TXlsFile;
  LPdf: TFlexCelPdfExport;

  LCert : TX509Certificate2;
  LSignature: TPdfSignature;
  LSigner: TCmsSigner;

begin
  CheckCreds(T);

  LQuery := TFDQuery.Create(nil);

  LReport := TFlexcelReport.Create;

  // load resource
  LResource := TResourceStream.Create(HInstance, RC_COMPANYDETAIL, RT_RCDATA );

  LXlsStream := TMemoryStream.Create;
  LPdf := TFlexCelPdfExport.Create;

  try
    // run query
    LQuery.Connection := TServiceHelper.GetFDConnection;
    LQuery.SQL.Text := SQL_GETCOMPANY;
    LQuery.Params.ParamByName('ID').AsString := AId;
    LQuery.Open;

    // add query as Q to report
    LReport.AddTable('q',LQuery);

    LReport.SetUserFunction('LLCFormat',
       TLLCFormatUDF.Create);

    // run report
    LReport.Run(LResource, LXlsStream);
    LXlsStream.Position := 0;

    // export Xls to PDF
    Result := TMemoryStream.Create;

    LXlsFile := TXlsFile.Create;
    try
      LPdf.Workbook := LXlsFile;
      LPdf.Workbook.Open(LXlsStream);

      // embed fonts
      LPdf.FontEmbed := TFontEmbed.Embed;

      // sign
      LCert := EncryptionFactory.GetX509Certificate( TFile.ReadAllBytes('d:\flix.pfx'), 'Lesina' );

      LSigner := EncryptionFactory.GetSigner( TArray<TX509Certificate2>.Create(LCert), '' );
      try
        LSignature := TPdfSignature.Create(TBuiltInSignerFactory.Create(LSigner),
                                                'FlixEngineering LLC',
                                                'Document has been generated and is unchanged.',
                                                'Florida',
                                                'info@flixengineering.com');
        LSigner := nil;
      except
        LSigner.Free;    // if there is an error we need to free...
      end;

      LPdf.Sign( LSignature );

      LPdf.Export(Result);

      LCert.Free;

    finally
      LXlsFile.Free;
    end;

    // set content type to PDF document
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
    LResource.Free;
    LXlsStream.Free;
    LPdf.Free;
  end;
end;


procedure TReportingService.CheckCreds(AToken:String);
var
  LId : Integer;
begin
  LId := AuthController.ValidateToken(AToken);

  if LId < 0 then
  begin
    raise EXDataHttpUnauthorized.Create('Please login.');
  end;
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
