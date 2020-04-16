unit Forms.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TMSFNCTypes, FMX.TMSFNCUtils,
  FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes, FMX.TMSFNCWebCoreClientBrowser,
  FMX.TMSFNCCustomControl, FMX.TMSFNCWebBrowser, FMX.StdCtrls, FMX.TMSFNCButton,
  FMX.Controls.Presentation, FMX.Edit, FMX.TMSFNCEdit;

type
  TFrmMain = class(TForm)
    txtId: TTMSFNCEdit;
    btnLookup: TTMSFNCButton;
    Browser: TTMSFNCWebBrowser;
    procedure btnLookupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.fmx}
const
  WSROOT = 'http://192.168.0.2/flix';



procedure TFrmMain.btnLookupClick(Sender: TObject);
begin
  Browser.URL :=
      Format( WSROOT + '/ReportingService/GetCompanyProfile?AId=%s', [ txtID.Text ])
end;

end.
