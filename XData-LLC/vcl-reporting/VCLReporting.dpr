program VCLReporting;

uses
  Vcl.Forms,
  Forms.Main in 'Forms.Main.pas' {FrmMain},
  Forms.Settings in 'Forms.Settings.pas' {FrmSettings},
  LoginService in '..\server-auth\LoginService.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmSettings, FrmSettings);
  Application.Run;
end.
