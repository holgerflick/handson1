program LLCServer;

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
  ReportingServiceImplementation in 'ReportingServiceImplementation.pas';

{$R *.res}

begin
  // report memory leaks when terminating the app
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'LLC XData Server';
  Application.CreateForm(TServerContainer, ServerContainer);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
