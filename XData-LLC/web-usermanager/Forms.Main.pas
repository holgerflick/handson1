unit Forms.Main;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, XData.Web.Connection, Data.DB, XData.Web.JsonDataset,
  XData.Web.Dataset, Vcl.Controls, Vcl.Grids, WEBLib.DBCtrls, WEBLib.DB, Vcl.StdCtrls,
  WEBLib.StdCtrls, XData.Web.Client, WEBLib.REST;

type
  TForm1 = class(TWebForm)
    WebDBGrid1: TWebDBGrid;
    dsUsers: TXDataWebDataSet;
    DataConnection: TXDataWebConnection;
    DataSource: TWebDataSource;
    btnConnect: TWebButton;
    btnApply: TWebButton;
    WebDBNavigator1: TWebDBNavigator;
    dsUsersid: TLargeintField;
    dsUserslogin: TStringField;
    dsUsersname: TStringField;
    dsUserspw: TStringField;
    txtUser: TWebEdit;
    txtPassword: TWebEdit;
    WebLabel1: TWebLabel;
    WebLabel2: TWebLabel;
    reqLogin: TWebHttpRequest;
    procedure btnConnectClick(Sender: TObject);
    procedure DataConnectionConnect(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure reqLoginResponse(Sender: TObject; AResponse: string);
    procedure dsUsersAfterApplyUpdates(Sender: TDataSet; Info: TResolveResults);
    procedure dsUsersPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure DataConnectionRequest(Args: TXDataWebConnectionRequest);
    procedure DataConnectionError(Error: TXDataWebConnectionError);
    procedure reqLoginError(Sender: TObject; ARequest: TJSXMLHttpRequestRecord;
      Event: TJSEventRecord; var Handled: Boolean);
  private
    { Private declarations }
    FToken: String;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
 WEBLib.JSON;

{$R *.dfm}

procedure TForm1.btnApplyClick(Sender: TObject);
begin
  dsUsers.ApplyUpdates;
end;

procedure TForm1.btnConnectClick(Sender: TObject);
begin
  FToken := '';

  btnConnect.Enabled := false;

  // get token
  reqLogin.URL :=
    Format( 'http://localhost/flix/LoginService/Login?AUsername=%s&APassword=%s',
      [txtUser.Text, txtPassword.Text] );
  reqLogin.Execute;
end;

procedure TForm1.DataConnectionConnect(Sender: TObject);
begin
  dsUsers.Load;
end;

procedure TForm1.DataConnectionError(Error: TXDataWebConnectionError);
begin
  btnConnect.Enabled := True;
  ShowMessage('Invalid login.');
end;

procedure TForm1.DataConnectionRequest(Args: TXDataWebConnectionRequest);
begin
  // add the token to the header of any data request
  Args.Request.Headers.AddValue('Authorized', FToken);
end;

procedure TForm1.dsUsersAfterApplyUpdates(Sender: TDataSet; Info: TResolveResults);
begin
  ShowMessage( 'Changes saved.' );
end;

procedure TForm1.dsUsersPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  ShowMessage( 'Error storing data.' );
end;

procedure TForm1.reqLoginError(Sender: TObject; ARequest: TJSXMLHttpRequestRecord;
  Event: TJSEventRecord; var Handled: Boolean);
begin
  btnConnect.Enabled := True;
  ShowMessage('Invalid login.');
end;

procedure TForm1.reqLoginResponse(Sender: TObject; AResponse: string);
var
  LJSON: TJSON;
  LObj: TJSONObject;

begin
  // process JSON response
  LJSON := TJSON.Create;
  LObj :=  LJSON.Parse(AResponse);

  FToken := LObj.GetValue('value').Value;

  if FToken <> '' then
  begin
    // we have the token, so we can request data
    DataConnection.Connected := True;
  end
  else
  begin
    // no token, enable connect button again
    ShowMessage( 'Login failed.' );
    btnConnect.Enabled := True;
  end;
end;

end.
