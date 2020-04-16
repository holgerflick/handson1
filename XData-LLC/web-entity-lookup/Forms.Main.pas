unit Forms.Main;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, WEBLib.StdCtrls, Vcl.Controls, Vcl.StdCtrls, XData.Web.Connection,
  XData.Web.Client;

type
  TForm1 = class(TWebForm)
    Client: TXDataWebClient;
    Connection: TXDataWebConnection;
    txtEntity: TWebEdit;
    btnConnect: TWebButton;
    lbResults: TWebListBox;
    btnStatus: TWebButton;
    procedure txtEntityChange(Sender: TObject);
    procedure ClientLoad(Response: TXDataClientResponse);
    procedure ConnectionConnect(Sender: TObject);
    procedure WebFormCreate(Sender: TObject);
    procedure ClientError(Error: TXDataClientError);
    procedure ConnectionError(Error: TXDataWebConnectionError);
    procedure btnConnectClick(Sender: TObject);
    procedure btnStatusClick(Sender: TObject);
  private
    FConnected: Boolean;
    { Private declarations }

    procedure DoConnect;
    procedure DoRequestStatus;
    procedure DoLookup( AStart: String );
    procedure SetConnected(const Value: Boolean);

    procedure HandleNameLookup( AResponse: TXDataClientResponse );
    procedure HandleStatusLookup( AResponse: TXDataClientResponse );
  public
    { Public declarations }
    property Connected: Boolean read FConnected write SetConnected;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const
  SERVICE_GETBUSINESSENTITY = 'ILookupService.GetBusinessEntityNames';
  SERVICE_GETSTATUS = 'ILookupService.GetStatus';

procedure TForm1.btnConnectClick(Sender: TObject);
begin
  DoConnect;
end;

procedure TForm1.btnStatusClick(Sender: TObject);
begin
  DoRequestStatus;
end;

procedure TForm1.ClientError(Error: TXDataClientError);
begin
  Connected := False;

  ShowMessage('Connection error. Please reconnect.');
end;

procedure TForm1.ClientLoad(Response: TXDataClientResponse);
begin

  if Response.StatusCode = 200 then
  begin
    if Response.RequestId = SERVICE_GETBUSINESSENTITY then
    begin
      HandleNameLookup(Response);
    end;

    if Response.RequestId = SERVICE_GETSTATUS then
    begin
      HandleStatusLookup(Response);
    end;
  end;
end;

procedure TForm1.ConnectionConnect(Sender: TObject);
begin
  Connected := True;
end;

procedure TForm1.ConnectionError(Error: TXDataWebConnectionError);
begin
  Connected := False;
  ShowMessage( 'Cannot connect to web service. Please reconnect.' );
end;

procedure TForm1.DoConnect;
begin
  Connection.Connected := True;
end;

procedure TForm1.DoLookup(AStart: String);
begin
  Client.RawInvoke(SERVICE_GETBUSINESSENTITY, [ AStart ]);
end;

procedure TForm1.DoRequestStatus;
begin
  Client.RawInvoke(SERVICE_GETSTATUS, nil );
end;

procedure TForm1.HandleNameLookup(AResponse: TXDataClientResponse);
var
  LArray: TJSArray;
  LObj: TJSObject;
  i: Integer;

begin
  LArray := TJSArray(TJSObject( AResponse.Result ) ['value']) ;
  lbResults.BeginUpdate;
  lbResults.Items.Clear;
  for i := 0 to LArray.Length -1 do
  begin
    LObj := TJSObject( LArray[i] );
    lbResults.Items.Add(
      string( LObj['Name'] ) +
      ' (' + string(LObj['Id']) + ')' );
  end;

  lbResults.EndUpdate;
end;

procedure TForm1.HandleStatusLookup(AResponse: TXDataClientResponse);
var
  LObj : TJSObject;

begin
  LObj := TJSObject( AResponse.Result );

  Showmessage(
    Format(
    'Approx. total number of records: %.0n' + #10 +
    'Lookup results limited to: %d' +#10 +
    'Report Engine: %s' +#10 +
    'Database Engine: %s' , [
    double(LObj['RecordCount']),
    integer(LObj['ResultLimit']),
    string(LObj['ReportEngine']),
    string(LObj['DatabaseEngine'])
    ]
    ) );

end;

procedure TForm1.SetConnected(const Value: Boolean);
begin
  FConnected := Value;

  // edit control
  txtEntity.Enabled := FConnected;

  // update listbox
  lbResults.Items.Clear;
  lbResults.Enabled := FConnected;

  // button states
  btnConnect.Enabled:= not FConnected;
  btnStatus.Enabled := FConnected;

  // text in button control
  if FConnected then
  begin
    txtEntity.Text := '';
  end
  else
  begin
    txtEntity.Text := 'Please connect.';
  end;
end;

procedure TForm1.txtEntityChange(Sender: TObject);
begin
  if Length( txtEntity.Text ) > 3 then
  begin
    DoLookup( txtEntity.Text );
  end;
end;

procedure TForm1.WebFormCreate(Sender: TObject);
begin
  DoConnect;
end;

end.