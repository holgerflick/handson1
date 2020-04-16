unit Modules.AuthController;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Comp.Client,
  XData.Server.Module,
  Aurelius.Drivers.Interfaces, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TAuthController = class(TDataModule)
    Connection: TFDConnection;
  private
    { Private declarations }
    function GetTokenForId( AUserId : Integer ):String;
  public
    { Public declarations }
    function IsCorrectLogin( ALogin, APw : String; var AToken:String ): Boolean;
    function ValidateToken( AToken: String ):Integer;
  end;

var
  AuthController: TAuthController;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TAuthController }

uses Variants;

CONST
  SQL_LOGIN_VALID = 'SELECT ID FROM USERS WHERE ( login = :login AND pw = :pw )';
  SQL_GETTOKEN    = 'SELECT token FROM tokens WHERE (userid = :id) ' +
                    'AND (validuntil > CURRENT_TIMESTAMP())';
  SQL_DELTOKEN    = 'DELETE FROM tokens WHERE userid = :id';
  SQL_CREATETOKEN = 'INSERT INTO tokens ( userid ) VALUES ( :userid  )';

  SQL_GETUSER     = 'SELECT userid FROM tokens WHERE (token = :token) ' +
                    'AND (validuntil > CURRENT_TIMESTAMP())';

  SQL_TOKENS      = 'SELECT login, token, userId, pw, validUntil ' +
                    'FROM tokens t, users u WHERE t.userId = u.Id';

function TAuthController.GetTokenForId(AUserId: Integer): String;
var
  LToken: String;

begin
  LToken := Connection.ExecSQLScalar( SQL_GETTOKEN, [ AUserId ] );

  if LToken = '' then
  begin
    Connection.ExecSQL( SQL_DELTOKEN, [ AUserId ] );
    Connection.ExecSQL( SQL_CREATETOKEN, [ AUserId ] );
    LToken := Connection.ExecSQLScalar( SQL_GETTOKEN, [ AUserId ] );
  end;

  Result := LToken;
end;

function TAuthController.IsCorrectLogin(ALogin, APw: String; var AToken: String): Boolean;
var
  LFound: Variant;
  LUserId: Integer;
begin
  AToken := '';
  Result := False;

  LFound := Connection.ExecSQLScalar(SQL_LOGIN_VALID, [ALogin, APw]);
  if not VarIsEmpty( LFound ) then
  begin
    Result := true;
    LUserId := LFound;
    AToken := GetTokenForId( LUserId );

  end;
end;

function TAuthController.ValidateToken(AToken: String): Integer;
var
 LResult: Variant;
 LUserId: Integer;

begin
 LResult := Connection.ExecSQLScalar(SQL_GETUSER, [ AToken ]);

 if not VarIsEmpty( LResult ) then
 begin
   Result := LResult;
 end
 else
 begin
   Result := -1;
 end;
end;

end.
