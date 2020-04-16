unit Forms.Main;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, XData.Web.Connection, Data.DB, XData.Web.JsonDataset,
  XData.Web.Dataset, Vcl.Controls, Vcl.Grids, WEBLib.DBCtrls, WEBLib.DB, Vcl.StdCtrls,
  WEBLib.StdCtrls;

type
  TForm1 = class(TWebForm)
    WebDBGrid1: TWebDBGrid;
    dsUsers: TXDataWebDataSet;
    Connection: TXDataWebConnection;
    DataSource: TWebDataSource;
    btnConnect: TWebButton;
    btnApply: TWebButton;
    WebDBNavigator1: TWebDBNavigator;
    dsUsersid: TLargeintField;
    dsUserslogin: TStringField;
    dsUsersname: TStringField;
    dsUserspw: TStringField;
    procedure btnConnectClick(Sender: TObject);
    procedure ConnectionConnect(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnApplyClick(Sender: TObject);
begin
  dsUsers.ApplyUpdates;
end;

procedure TForm1.btnConnectClick(Sender: TObject);
begin
  Connection.Connected := true;
end;

procedure TForm1.ConnectionConnect(Sender: TObject);
begin
  dsUsers.Load;
end;

end.