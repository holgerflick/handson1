program LLCServerAuth;

{$R *.dres}

uses
  Vcl.Forms,
  Modules.ServerContainer in 'Modules.ServerContainer.pas' {ServerContainer: TDataModule},
  Forms.Main in 'Forms.Main.pas' {MainForm},
  Entities.Companies in 'Entities.Companies.pas',
  LookupService in 'LookupService.pas',
  LookupServiceImplementation in 'LookupServiceImplementation.pas',
  ReturnTypes in 'ReturnTypes.pas',
  ReportingService in 'ReportingService.pas',
  ReportingServiceImplementation in 'ReportingServiceImplementation.pas',
  Modules.AuthController in 'Modules.AuthController.pas' {AuthController: TDataModule},
  LoginService in 'LoginService.pas',
  LoginServiceImplementation in 'LoginServiceImplementation.pas',
  Entities.Users in 'Entities.Users.pas',
  Controller.ServiceHelper in 'Controller.ServiceHelper.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'LLC XData Server';
  Application.CreateForm(TServerContainer, ServerContainer);
  Application.CreateForm(TAuthController, AuthController);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
