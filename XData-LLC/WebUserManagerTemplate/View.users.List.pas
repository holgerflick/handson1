unit View.users.List;

interface

uses
  System.SysUtils, System.Classes, WEBLib.Graphics, WEBLib.Forms, WEBLib.Dialogs,
  Vcl.Controls, Vcl.StdCtrls, Math,

  WEBLib.StdCtrls, Web, JS, WEBLib.Lists,

  App.Types, WEBLib.Controls, WEBLib.Grids, Data.DB,
  XData.Web.Dataset, WEBLib.DBCtrls, WEBLib.DB, WEBLib.ExtCtrls,

  XData.Web.JsonDataset,
  XData.Web.Dataset,

  Grid.Plugins,
  Crud.Utils;

type
  TFViewusersList = class(TWebForm)
    btNew: TWebButton;
    usersDataset: TXDataWebDataSet;
    usersDatasetid: TLargeIntField;
    usersDatasetlogin: TStringField;
    usersDatasetname: TStringField;
    usersDatasetpw: TStringField;
    WebDBTableControl1: TWebDBTableControl;
    WebDataSource: TWebDataSource;
    cbPageSize: TWebComboBox;
    edSearch: TWebEdit;
    lbPaginationInfo: TWebLabel;
    lcPaginator: TWebListControl;
    procedure WebFormCreate(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure WebDBTableControl1GetCellChildren(Sender: TObject; ACol,
      ARow: Integer; AField: TField; AValue: string; AElement: TJSHTMLElement);
    procedure cbPageSizeChange(Sender: TObject);
    procedure edSearchChange(Sender: TObject);
  private
    FEditProc: TEditProc;
    FGridPlugin: TGridPlugin;
  public
    class function CreateForm(AElementID: string; AShowEditProc: TEditProc): TWebForm;
  end;

var
  FViewusersList: TFViewusersList;

implementation

uses
  ConnectionModule;

{$R *.dfm}

{ TFViewusersList }

procedure TFViewusersList.cbPageSizeChange(Sender: TObject);
begin
  FGridPlugin.SetPageSize(StrToInt(cbPageSize.Text), True);
end;

class function TFViewusersList.CreateForm(AElementID: string;
  AShowEditProc: TEditProc): TWebForm;

  procedure AfterCreate(AForm: TObject);
  begin
    TFViewusersList(AForm).FEditProc := AShowEditProc;
  end;

begin
  Application.CreateForm(TFViewusersList, AElementID, Result, @AfterCreate);
end;

procedure TFViewusersList.edSearchChange(Sender: TObject);
begin
  FGridPlugin.SetFilterText(edSearch.Text, True);
end;

procedure TFViewusersList.btNewClick(Sender: TObject);
begin
  FEditProc( nil );
end;

procedure TFViewusersList.WebDBTableControl1GetCellChildren(Sender: TObject;
  ACol, ARow: Integer; AField: TField; AValue: string;
  AElement: TJSHTMLElement);
var
  RecordId: JSValue;

  procedure EditButtonClick(Sender: TObject);
  begin
    FEditProc(RecordId);
  end;

var
  Button: TWebButton;
begin
  if ARow = 0 then
    Exit;

  if WebDBTableControl1.Columns[ACol].Title = 'Actions' then
  begin
    RecordId := TCrudUtils.GetIdFromObject(
      usersDataset.Connection.Model.DefaultSchema.FindEntityType(usersDataset.EntitySetName),
      usersDataset.CurrentData
    );
    Button := TWebButton.Create(nil);
    Button.Caption := 'Edit';
    Button.OnClick := @EditButtonClick;
    Button.ElementClassName := 'btn btn-outline btn-default btn-xs';
    Button.ParentElement := AElement;
    Button.WidthStyle := TSizeStyle.ssAuto;
    Button.HeightStyle := TSizeStyle.ssAuto;
  end;
end;

procedure TFViewusersList.WebFormCreate(Sender: TObject);
begin
  FGridPlugin := TGridPlugin.Create(
    WebDBTableControl1,
    usersDataset,
    lcPaginator,
    lbPaginationInfo
  );
  FGridPlugin.SetPageSize(StrToInt(cbPageSize.Text));
  FGridPlugin.SetFilterText(edSearch.Text);
  FGridPlugin.Load;
end;

end.
