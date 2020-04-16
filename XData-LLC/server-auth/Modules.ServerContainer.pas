unit Modules.ServerContainer;

interface

uses
  System.SysUtils, System.Classes, Sparkle.HttpServer.Module,
  Sparkle.HttpServer.Context, Sparkle.Comp.Server,
  Sparkle.Comp.HttpSysDispatcher, Aurelius.Drivers.Interfaces,
  Aurelius.Comp.Connection, XData.Comp.ConnectionPool, XData.Server.Module,
  XData.Comp.Server, Aurelius.Sql.MySQL, Aurelius.Schema.MySQL, Aurelius.Drivers.FireDac,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Moni.Base,
  FireDAC.Moni.RemoteClient, Sparkle.Comp.BasicAuthMiddleware, Sparkle.Comp.CorsMiddleware;

type
  TServerContainer = class(TDataModule)
    Dispatcher: TSparkleHttpSysDispatcher;
    XDataServer: TXDataServer;
    Pool: TXDataConnectionPool;
    AureliusConnection: TAureliusConnection;
    Connection: TFDConnection;
    BasicAuth: TSparkleBasicAuthMiddleware;
    XDataServerCORS: TSparkleCorsMiddleware;

    procedure BasicAuthAuthenticate(Sender: TObject; const UserName, Password: string;
      var User: IUserIdentity);
  private
    procedure RegisterFunctions;
  end;

var
  ServerContainer: TServerContainer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Modules.AuthController;

{$R *.dfm}

procedure TServerContainer.RegisterFunctions;
begin
  //TSQLGeneratorRegister.GetInstance.GetGenerator('MySQL').
  //  RegisterFunction('right', TSimpleSQLFunction.Create('right'));

  //TQueryParser.AddMethod('right', TQueryMethod.Create('right', 2));
end;


procedure TServerContainer.BasicAuthAuthenticate(Sender: TObject; const UserName,
  Password: string; var User: IUserIdentity);
var
  LValid: Boolean;
  LToken: String;
begin
  LValid := AuthController.IsCorrectLogin(UserName,Password, LToken);

  User := nil;
  if LValid then
  begin
    User := TUserIdentity.Create;
    User.Claims.AddOrSet('Token', LToken);
  end;
end;

end.
