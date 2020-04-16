unit View.users.Edit;

interface

uses
  System.SysUtils, System.Classes, WEBLib.Graphics, WEBLib.Forms, WEBLib.Dialogs,
  Vcl.Controls, Vcl.StdCtrls, WEBLib.StdCtrls,

  Bcl.Rtti.Common, XData.Web.Client, Data.DB, WEBLib.CDS,
  WEBLib.DBCtrls, XData.Web.JsonDataset, XData.Web.Dataset, JS,

  App.Types, Crud.Utils, WEBLib.DB, WEBLib.Controls, WEBLib.ExtCtrls;

type
  TFViewusersEdit = class(TWebForm)
    pnlMessage: TWebPanel;
    lbMessage: TWebLabel;
    btCloseMessage: TWebButton;
    DataSource: TWebDatasource;
    btCancel: TWebButton;
    btSave: TWebButton;
    btDelete: TWebButton;
    lbid: TWebLabel;
    edid: TWebDBEdit;
    lblogin: TWebLabel;
    edlogin: TWebDBEdit;
    lbname: TWebLabel;
    edname: TWebDBEdit;
    lbpw: TWebLabel;
    edpw: TWebDBEdit;
    XDataClientusersGet: TXDataWebClient;
    XDataClientusersDelete: TXDataWebClient;
    usersDataset: TXDataWebDataSet;
    usersDatasetid: TLargeIntField;
    usersDatasetlogin: TStringField;
    usersDatasetname: TStringField;
    usersDatasetpw: TStringField;
    procedure btCloseMessageClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure XDataClientusersGetLoad(Response: TXDataClientResponse);
    procedure XDataClientusersDeleteLoad(Response: TXDataClientResponse);
    procedure XDataClientusersDeleteError(Error: TXDataClientError);
    procedure usersDatasetAfterApplyUpdates(Sender: TDataSet;
      Info: TResolveResults);
    procedure WebFormCreate(Sender: TObject);
  private
    FId: JSValue;
    FShowListProc: TListProc;
    procedure InsertEntity;
    procedure LoadEntity;
    procedure ShowNotification(Notification: string);
    procedure HiddenNotification;
    class function InternalCreateForm(AElementID: string;
      AShowListProc: TListProc; AInserting: Boolean; AId: JSValue): TWebForm; overload;
  protected
    FInserting: Boolean;
  public
    class function CreateForm(AElementID: string;
      AShowListProc: TListProc; AId: JSValue): TWebForm; overload;
  end;

var
  FViewusersEdit: TFViewusersEdit;

implementation

uses
  ConnectionModule;

{$R *.dfm}

{ TFViewusersEdit }

procedure TFViewusersEdit.btSaveClick(Sender: TObject);
begin
  if usersDataset.State in dsEditModes then
  begin
        usersDataset.Post;
    usersDataset.ApplyUpdates;
  end
  else
    FShowListProc;
end;

procedure TFViewusersEdit.btDeleteClick(Sender: TObject);
begin
  if usersDataset.State in dsEditModes then
    usersDataset.Post;
  XDataClientusersDelete.Delete(usersDataset.EntitySetName,
    TJSObject(usersDataset.CurrentData));
end;


class function TFViewusersEdit.CreateForm(AElementID: string;
  AShowListProc: TListProc; AId: JSValue): TWebForm;
var
  Inserting: Boolean;
begin
  Inserting := isNull(AId);
  Result := InternalCreateForm(AElementID, AShowListProc, Inserting, AId);
end;

procedure TFViewusersEdit.HiddenNotification;
begin
  pnlMessage.ElementHandle.hidden := True;
end;

procedure TFViewusersEdit.InsertEntity;
begin
  usersDataset.Close;
  usersDataset.SetJsonData('{}');
  usersDataset.Open;
  usersDataset.Insert;
end;

class function TFViewusersEdit.InternalCreateForm(AElementID: string;
  AShowListProc: TListProc; AInserting: Boolean; AId: JSValue): TWebForm;

  procedure AfterCreate(AForm: TObject);
  begin
    TFViewusersEdit(AForm).FInserting := AInserting;
    TFViewusersEdit(AForm).FId := AId;
    TFViewusersEdit(AForm).FShowListProc := AShowListProc;
    if AInserting then
      TFViewusersEdit(AForm).InsertEntity
    else
      TFViewusersEdit(AForm).LoadEntity;
    TFViewusersEdit(AForm).btDelete.Enabled := not AInserting;
  end;

begin
  Application.CreateForm(TFViewusersEdit, AElementID, Result, @AfterCreate);
end;

procedure TFViewusersEdit.LoadEntity;
var
  QueryString: string;
begin
  QueryString := TCrudUtils.GetEntityGetQueryString(
    usersDataset.Connection.Model.DefaultSchema.FindEntityType(
      usersDataset.EntitySetName
    )
  );
  XDataClientusersGet.Get(usersDataset.EntitySetName, QueryString, FId);
end;

procedure TFViewusersEdit.ShowNotification(Notification: string);
begin
  lbMessage.Caption := Notification;
  pnlMessage.ElementHandle.hidden := False;
end;

procedure TFViewusersEdit.btCloseMessageClick(Sender: TObject);
begin
  HiddenNotification;
end;

procedure TFViewusersEdit.WebFormCreate(Sender: TObject);
begin
  HiddenNotification;
end;

procedure TFViewusersEdit.XDataClientusersGetLoad(Response: TXDataClientResponse);
begin
  usersDataset.Close;
  usersDataset.SetJsonData(Response.Result);
  usersDataset.Open;
  
  usersDataset.Edit;  
end;

procedure TFViewusersEdit.XDataClientusersDeleteError(
  Error: TXDataClientError);
begin
  ShowNotification(Error.ErrorMessage);
end;

procedure TFViewusersEdit.XDataClientusersDeleteLoad(
  Response: TXDataClientResponse);
begin
  FShowListProc;
end;

procedure TFViewusersEdit.usersDatasetAfterApplyUpdates(Sender: TDataSet;
  Info: TResolveResults);
var
  I: integer;
  ResolveInfo: TResolveInfo;
begin
  for I := 0 to Length(Info.Records) - 1 do
  begin
    ResolveInfo := Info.Records[I];
//    if ResolveInfo.ResolveStatus = TResolveStatus.rsResolveFailed then
    if ResolveInfo.Error <> '' then
    begin
      ShowNotification(ResolveInfo.Error);
      Exit;
    end;
  end;
  FShowListProc;
end;

procedure TFViewusersEdit.btCancelClick(Sender: TObject);
begin
  FShowListProc;
end;

end.
