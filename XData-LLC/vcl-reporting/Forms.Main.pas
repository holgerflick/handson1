unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvCustomControl, AdvWebBrowser, AdvStyleIF,
  AdvAppStyler, AdvGlowButton, AdvEdit;

type
  TFrmMain = class(TForm)
    Browser: TAdvWebBrowser;
    FormStyler: TAdvFormStyler;
    AppStyler: TAdvAppStyler;
    btnLookup: TAdvGlowButton;
    btnSettings: TAdvGlowButton;
    txtId: TAdvEdit;
    procedure btnLookupClick(Sender: TObject);
    procedure btnSettingsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FToken: String;

    function TokenValid: Boolean;
  public
    { Public declarations }

  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses
  Forms.Settings,
  XData.Client,
  LoginService;

const
  WSROOT = 'http://localhost/flix';


procedure TFrmMain.btnLookupClick(Sender: TObject);
begin
  if TokenValid then
  begin
    Browser.URL :=
      Format( WSROOT + '/ReportingService/GetCompanyProfile?T=%s&AId=%s', [ FToken, txtID.Text ])
  end;
end;

procedure TFrmMain.btnSettingsClick(Sender: TObject);
begin
  FrmSettings.Styler.AppStyle := self.AppStyler;
  if FrmSettings.ShowModal = mrOK then
  begin
    FToken := '';

    TokenValid;
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  FToken := '';
end;

function TFrmMain.TokenValid: Boolean;
var
  LClient: TXDataClient;
  LLogin : ILoginService;

begin
  Result := False;

  LClient := TXDataClient.Create;
  try
    LClient.Uri := WSROOT;

    LLogin := LClient.Service<ILoginService>;

    if FToken <> '' then
    begin
      if not LLogin.TokenValid(FToken) then
      begin
        FToken := '';
      end
      else
      begin
        Result := True;
      end;
    end;

    if not Result then
    begin
      FToken := LLogin.Login(FrmSettings.Login, FrmSettings.Password);

      if FToken = '' then
      begin
        ShowMessage('Invalid login credentials.');
      end
      else
      begin
        Result := True;
      end;
    end;

  finally
    LClient.Free;
  end;
end;

end.
