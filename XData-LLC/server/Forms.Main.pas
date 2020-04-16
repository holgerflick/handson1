unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, AdvTypes, Vcl.ExtCtrls, Vcl.Menus, Vcl.AppEvnts;

type
  TMainForm = class(TForm)
    mmInfo: TMemo;
    btStart: TButton;
    btStop: TButton;
    Image1: TImage;
    TrayIcon: TTrayIcon;
    popTray: TPopupMenu;
    menStart: TMenuItem;
    menStop: TMenuItem;
    N1: TMenuItem;
    menQuit: TMenuItem;
    menShow: TMenuItem;
    N2: TMenuItem;
    ApplicationEvents: TApplicationEvents;
    procedure btStartClick(ASender: TObject);
    procedure btStopClick(ASender: TObject);
    procedure FormCreate(ASender: TObject);
    procedure menQuitClick(Sender: TObject);
    procedure menStartClick(Sender: TObject);
    procedure menStopClick(Sender: TObject);
    procedure menShowClick(Sender: TObject);
    procedure ApplicationEventsMinimize(Sender: TObject);
    procedure TrayIconDblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  strict private
    FCanClose: Boolean;

    procedure UpdateGUI;

    procedure DoStart;
    procedure DoStop;
    procedure DoShow;
    procedure DoHide;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses
 Modules.ServerContainer;

resourcestring
  SServerStopped = 'Server stopped';
  SServerStartedAt = 'Server started at ';

{ TMainForm }

procedure TMainForm.ApplicationEventsMinimize(Sender: TObject);
begin
  DoHide;
end;

procedure TMainForm.btStartClick(ASender: TObject);
begin
  DoStart;
end;

procedure TMainForm.btStopClick(ASender: TObject);
begin
  DoStop;
end;

procedure TMainForm.DoHide;
begin
  TrayIcon.Visible := True;
  self.Hide;
  self.WindowState := wsMinimized;

  TrayIcon.ShowBalloonHint;
end;

procedure TMainForm.DoShow;
begin
  self.Show;
  self.WindowState := wsNormal;
  Application.BringToFront();
end;

procedure TMainForm.DoStart;
begin
  ServerContainer.Dispatcher.Start;
  UpdateGUI;
end;

procedure TMainForm.DoStop;
begin
  ServerContainer.Dispatcher.Stop;
  UpdateGUI;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not FCanClose then
  begin
    CanClose := False;
    DoHide;
  end;
end;

procedure TMainForm.FormCreate(ASender: TObject);
begin
  FCanClose := False;
  UpdateGUI;
end;

procedure TMainForm.menQuitClick(Sender: TObject);
begin
  FCanClose := True;
  self.Close;
end;

procedure TMainForm.menShowClick(Sender: TObject);
begin
  DoShow;
end;

procedure TMainForm.menStartClick(Sender: TObject);
begin
  DoStart;
end;

procedure TMainForm.menStopClick(Sender: TObject);
begin
  DoStop;
end;

procedure TMainForm.TrayIconDblClick(Sender: TObject);
begin
  TrayIcon.Visible := False;
  DoShow;
end;

procedure TMainForm.UpdateGUI;
const
  cHttp = 'http://+';
  cHttpLocalhost = 'http://localhost';
begin
  btStart.Enabled := not ServerContainer.Dispatcher.Active;
  btStop.Enabled := not btStart.Enabled;

  menStart.Enabled := btStart.Enabled;
  menStop.Enabled := btStop.Enabled;
  if ServerContainer.Dispatcher.Active then
    mmInfo.Lines.Add(SServerStartedAt + StringReplace(
      ServerContainer.XDataServer.BaseUrl,
      cHttp, cHttpLocalhost, [rfIgnoreCase]))
  else
    mmInfo.Lines.Add(SServerStopped);
end;

end.
