unit Forms.Settings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvEdit, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.BaseImageCollection, AdvTypes, CryptBase, AESObj, AdvGlowButton,
  AdvStyleIF, AdvAppStyler, AdvOfficeButtons, AdvCombo;

type
  TFrmSettings = class(TForm)
    txtLogin: TAdvEdit;
    txtPassword: TAdvEdit;
    SVGCollection: TAdvSVGImageCollection;
    VImgList: TVirtualImageList;
    AES: TAESEncryption;
    btnCancel: TAdvGlowButton;
    btnOK: TAdvGlowButton;
    Styler: TAdvFormStyler;
    cbShowPassword: TAdvOfficeCheckBox;
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbPasswordClick(Sender: TObject);
  private
    FShowPassword: Boolean;
    { Private declarations }
    procedure DoStore;
    procedure DoLoad;
    function GetLogin: String;
    function GetPassword: String;
    procedure SetShowPassword(const Value: Boolean);
  public
    { Public declarations }
    property Login: String read GetLogin;
    property Password: String read GetPassword;
    property ShowPassword : Boolean read FShowPassword write SetShowPassword;
  end;

var
  FrmSettings: TFrmSettings;

implementation

{$R *.dfm}

uses Registry;

CONST
  KEY = 'nMy,aO-;Ar,HDBnMy,aO-;Ar,HDsd5yBdc/0%xbnMy,aO-;Ar,HDB*SH\6MkVgr47f5t';


procedure TFrmSettings.btnOKClick(Sender: TObject);
begin
  DoStore;
end;

procedure TFrmSettings.cbPasswordClick(Sender: TObject);
begin
  ShowPassword := not ShowPassword;
end;

procedure TFrmSettings.DoLoad;
var
  LReg: TRegistry;
  LEncrypted: String;
begin
  LReg := TRegistry.Create;
  try
    LReg.RootKey := HKEY_CURRENT_USER;

    if LReg.OpenKey('Software\FlixEngineering\ReportingDemo',False) then
    begin
      // TODO: decrypt
      txtLogin.Text := LReg.ReadString('Login');

      LEncrypted := LReg.ReadString('Password');

      txtPassword.Text := AES.Decrypt(LEncrypted);

      LReg.CloseKey;
    end;

  finally
    LReg.Free;
  end;
end;

procedure TFrmSettings.DoStore;
var
  LReg: TRegistry;

begin
  LReg := TRegistry.Create;
  try
    LReg.RootKey := HKEY_CURRENT_USER;

    if LReg.OpenKey('Software\FlixEngineering\ReportingDemo',True) then
    begin
      LReg.WriteString('Login', Login);
      LReg.WriteString('Password', AES.Encrypt(Password));

      LReg.CloseKey;
    end;

  finally
    LReg.Free;
  end;
end;

procedure TFrmSettings.FormCreate(Sender: TObject);
begin
  AES.key := COPY( KEY, 10, 32 );
  DoLoad;
end;

procedure TFrmSettings.FormShow(Sender: TObject);
begin
  txtLogin.SetFocus;
end;

function TFrmSettings.GetLogin: String;
begin
  Result := txtLogin.Text;
end;

function TFrmSettings.GetPassword: String;
begin
  Result := txtPassword.Text;
end;


procedure TFrmSettings.SetShowPassword(const Value: Boolean);
begin
  FShowPassword := Value;

  if not Value then
  begin
    txtPassword.PasswordChar := #183;
  end
  else
  begin
    txtPassword.PasswordChar := #0;
  end;
end;

end.
