unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvCustomControl, AdvWebBrowser, AdvStyleIF,
  AdvAppStyler, AdvGlowButton, AdvEdit, AdvUtil, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, AdvToolBar,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, Vcl.BaseImageCollection, AdvTypes,
  Vcl.ExtCtrls, AdvSplitter, Modules.Resources,   System.Generics.Collections,
  ReturnTypes;

type
  TFrmMain = class(TForm)
    Browser: TAdvWebBrowser;
    gridCompanies: TAdvStringGrid;
    DockPanel: TAdvDockPanel;
    AdvToolBar1: TAdvToolBar;
    txtName: TAdvEdit;
    btnSettings: TAdvGlowButton;
    AdvToolBarSeparator1: TAdvToolBarSeparator;
    Splitter: TAdvSplitter;
    FormStyler: TAdvFormStyler;
    btnExit: TAdvGlowButton;
    procedure FormCreate(Sender: TObject);
    procedure txtNameChange(Sender: TObject);
    procedure gridCompaniesDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure btnSettingsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SplitterMoved(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    { Private declarations }
    FToken: String;

    function TokenValid: Boolean;

    procedure AlignGrid;
    procedure UpdateGrid( AList: TList<TBusinessEntityItem> );

    procedure DoLookup( const AName: String );
    procedure ShowReport( const AId: String );
    procedure ShowSettings;
  public
    { Public declarations }

  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses
  Forms.Settings,
  XData.Client,
  LoginService,
  LookupService,
  System.Threading,
  Sparkle.Http.Engine
  ;

const
  WSROOT = 'http://localhost/flix';


procedure TFrmMain.btnSettingsClick(Sender: TObject);
begin
  ShowSettings;
end;

procedure TFrmMain.AlignGrid;
begin
  gridCompanies.AutoFitColumns(True);
end;

procedure TFrmMain.btnExitClick(Sender: TObject);
begin
  self.Close;
end;

procedure TFrmMain.DoLookup( const AName: String );
begin
  TTask.Run( procedure
    var
      LLookup: ILookupService;
      LClient: TXDataClient;
      LItems : TList<TBusinessEntityItem>;

    begin
      // only proceed if token is valid
      if TokenValid then
      begin

        LClient := TXDataClient.Create;

        // add token to header
        LClient.HttpClient.OnSendingRequest :=
                procedure(Req: THttpRequest)
                begin
                  Req.Headers.SetValue('Authorized', FToken);
                end;

        try
          // use lookup service
          LClient.Uri := WSROOT;
          LLookup := LClient.Service<ILookupService>;
          LItems := LLookup.GetBusinessEntityNames( AName );
          try
            // UI interaction has to be called synchronized
            TThread.Synchronize( nil,
                procedure
                begin
                  // update grid with results
                  UpdateGrid(LItems);
                end
                );
          finally
            LItems.Free;
          end;
        finally
          LClient.Free;
        end;
      end;
    end
    );
end;


procedure TFrmMain.FormCreate(Sender: TObject);
begin
  FToken := '';
  txtName.Text := '';
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  txtName.SetFocus;
end;

procedure TFrmMain.gridCompaniesDblClickCell(Sender: TObject; ARow, ACol: Integer);
var
  LId: String;

begin
  if ARow > 0 then
  begin
    Lid := gridCompanies.Cells[0,ARow];

    ShowReport( LId );
  end;
end;

procedure TFrmMain.ShowReport(const AId: String);
begin
 if TokenValid then
  begin
    Browser.URL :=
      Format( WSROOT + '/ReportingService/GetCompanyProfile?AId=%s&T=%s', [  AId, FToken ])
  end;
end;

procedure TFrmMain.ShowSettings;
begin
  if FrmSettings.ShowModal = mrOK then
  begin
    FToken := '';

    TokenValid;
  end;
end;

procedure TFrmMain.SplitterMoved(Sender: TObject);
begin
  AlignGrid;
end;

function TFrmMain.TokenValid: Boolean;
var
  LClient: TXDataClient;
  LLogin : ILoginService;

begin
  Result := False;

  LClient := TXDataClient.Create;
  try
    LClient.Uri := WSROOT;
    LLogin := LClient.Service<ILoginService>;

    if FToken <> '' then
    begin
      if not LLogin.TokenValid(FToken) then
      begin
        FToken := '';
      end
      else
      begin
        Result := True;
      end;
    end;

    if not Result then
    begin
      FToken := LLogin.Login(FrmSettings.Login, FrmSettings.Password);

      if FToken = '' then
      begin
        ShowMessage('Invalid login credentials.');
      end
      else
      begin
        Result := True;
      end;
    end;

  finally
    LClient.Free;
  end;
end;

procedure TFrmMain.txtNameChange(Sender: TObject);
begin
  if txtName.Text.Length > 3 then
  begin
    // lookup partial name
    DoLookup( txtName.Text );
  end;
end;

procedure TFrmMain.UpdateGrid(AList: TList<TBusinessEntityItem>);
 var
  LRow : Integer;
  LItem: TBusinessEntityItem;

begin
  // add all items to the grid

  gridCompanies.BeginUpdate;

  gridCompanies.RowCount := AList.Count + 1;

  LRow := 1;
  gridCompanies.Cells[0,0] := 'Doc Id';
  gridCompanies.Cells[1,0] := 'Business Name';

  for LItem in AList do
  begin
    gridCompanies.Cells[0, LRow] := LItem.Id;
    gridCompanies.Cells[1, LRow] := LItem.Name;

    Inc(LRow);
  end;

  gridCompanies.AutoFitColumns( True );
  gridCompanies.EndUpdate;
end;

end.
