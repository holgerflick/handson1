program UserManager;

uses
  Vcl.Forms,
  WEBLib.Forms,
  Forms.Main in 'Forms.Main.pas' {Form1: TWebForm} {*.html};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
