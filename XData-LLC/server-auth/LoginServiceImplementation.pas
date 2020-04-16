unit LoginServiceImplementation;

interface

uses
  XData.Server.Module,
  XData.Service.Common,
  LoginService;

type
  [ServiceImplementation]
  TLoginService = class(TInterfacedObject, ILoginService)
  public
      function Login( AUsername, APassword: String): String;
      function TokenValid( AToken: String ): Boolean;
  end;

implementation
uses Modules.AuthController;

{ TLoginService }

function TLoginService.Login(AUsername, APassword: String): String;
var
  LToken: String;

begin
  AuthController.IsCorrectLogin(AUsername, APassword, LToken);

  Result := LToken;
end;

function TLoginService.TokenValid(AToken: String): Boolean;
begin
  Result := AuthController.ValidateToken(AToken) <> -1;
end;

initialization
  RegisterServiceType(TLoginService);

end.
