program VCLAsyncLookup;

uses
  Vcl.Forms,
  Forms.Main in 'Forms.Main.pas' {FrmMain},
  Forms.Settings in 'Forms.Settings.pas' {FrmSettings},
  LoginService in '..\server-auth\LoginService.pas',
  LookupService in '..\server-auth\LookupService.pas',
  ReturnTypes in '..\server-auth\ReturnTypes.pas',
  Modules.Resources in 'Modules.Resources.pas' {Resources: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TResources, Resources);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmSettings, FrmSettings);
  Application.Run;
end.
