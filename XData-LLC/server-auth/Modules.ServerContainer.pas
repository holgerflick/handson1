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
  FireDAC.Moni.RemoteClient, Sparkle.Comp.BasicAuthMiddleware, Sparkle.Comp.CorsMiddleware,
  Sparkle.Comp.GenericMiddleware;

type
  TServerContainer = class(TDataModule)
    Dispatcher: TSparkleHttpSysDispatcher;
    XDataServer: TXDataServer;
    Pool: TXDataConnectionPool;
    AureliusConnection: TAureliusConnection;
    Connection: TFDConnection;
    TokenAuth: TSparkleGenericMiddleware;

    procedure XDataServerEntityList(Sender: TObject; Args: TEntityListArgs);
    procedure XDataServerEntityGet(Sender: TObject; Args: TEntityGetArgs);
    procedure TokenAuthRequest(Sender: TObject; Context: THttpServerContext; Next: THttpServerProc);
    procedure XDataServerEntityDeleting(Sender: TObject; Args: TEntityDeletingArgs);
    procedure XDataServerEntityInserting(Sender: TObject; Args: TEntityInsertingArgs);
    procedure XDataServerEntityModifying(Sender: TObject; Args: TEntityModifyingArgs);
  private
    procedure RegisterFunctions;

  end;

var
  ServerContainer: TServerContainer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  System.Generics.Collections,
  Sparkle.Utils,
  Modules.AuthController,
  XData.Sys.Exceptions,
  Controller.ServiceHelper;

{$R *.dfm}

procedure TServerContainer.RegisterFunctions;
begin
  //TSQLGeneratorRegister.GetInstance.GetGenerator('MySQL').
  //  RegisterFunction('right', TSimpleSQLFunction.Create('right'));

  //TQueryParser.AddMethod('right', TQueryMethod.Create('right', 2));
end;


procedure TServerContainer.TokenAuthRequest(Sender: TObject; Context: THttpServerContext;
  Next: THttpServerProc);

var
  LQuery: String;
  LUser: TUserIdentity;
  LToken: String;
  LUserId: Integer;
  LParams: TArray<TPair<string,string>>;
  LPair: TPair<string,string>;
  LIsLogin: Boolean;
begin
  // is this a login service request?
  LIsLogin := Context.Request.Uri.Path.ToLower.Contains('/loginservice/');

  // login service does not need to authenticate
  if not LIsLogin then
  begin
    LToken := '';

    // try getting token from header
    if Context.Request.Headers.Exists('Authorized') then
    begin
      LToken := Context.Request.Headers.Get('Authorized');
    end;

    // if token was not in header, try URL
    if LToken = '' then
    begin
      // get query string from URL
      LQuery := Context.Request.Uri.Query;

      // create array with pairs
      LParams := TSparkleUtils.GetQueryParams(LQuery);

      // look for parameter value for token
      for LPair in LParams do
      begin
        if LPair.Key.ToLower = 't' then
        begin
          LToken := LPair.Value;
        end;
      end;
    end;

    // if token has been found, validate
    if LToken.Length > 0 then
    begin
      LUserId := AuthController.ValidateToken(LToken);

      // only if token is valid
      if LUserId > -1 then
      begin
        // add user token for later processing
        LUser := TUserIdentity.Create;
        LUser.Claims.AddOrSet('Token', LToken);

        Context.Request.User := LUser;
        Next( Context );
      end
      else
      begin
        Context.Response.StatusCode := 401;
      end;
    end
    else
    begin
      Context.Response.StatusCode := 401;
    end;
  end
  else
  begin
    // no check for login service usage...
    Next( Context );
  end;
end;

procedure TServerContainer.XDataServerEntityDeleting(Sender: TObject; Args: TEntityDeletingArgs);
begin
  TServiceHelper.CheckAuthenticated;
end;

procedure TServerContainer.XDataServerEntityGet(Sender: TObject; Args: TEntityGetArgs);
begin
  TServiceHelper.CheckAuthenticated;
end;

procedure TServerContainer.XDataServerEntityInserting(Sender: TObject; Args: TEntityInsertingArgs);
begin
  TServiceHelper.CheckAuthenticated;
end;

procedure TServerContainer.XDataServerEntityList(Sender: TObject; Args: TEntityListArgs);
begin
  TServiceHelper.CheckAuthenticated;
end;

procedure TServerContainer.XDataServerEntityModifying(Sender: TObject; Args: TEntityModifyingArgs);
begin
  TServiceHelper.CheckAuthenticated;
end;

end.
