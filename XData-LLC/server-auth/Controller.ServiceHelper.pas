unit Controller.ServiceHelper;

interface
uses
  FireDAC.Stan.Intf,
  FireDAC.Comp.Client,
  XData.Server.Module,
  XData.Service.Common,
  Aurelius.Drivers.Interfaces;

type
  TServiceHelper = class
    class function GetFDConnection: TFDConnection;

    class procedure CheckAuthenticated;
  end;

implementation

uses
  Modules.AuthController,
  XData.Sys.Exceptions,
  Sparkle.Security;

{ TServiceHelper }

class procedure TServiceHelper.CheckAuthenticated;
var
  LUser: TUserIdentity;
  LToken: String;

begin
  LUser := TXDataOperationContext.Current.Request.User as TUserIdentity;

  if LUser = nil then
  begin
    raise EXDataHttpUnauthorized.Create('Please authenticate.');
  end;
end;

class function TServiceHelper.GetFDConnection: TFDConnection;
begin
  Result := (TXDataOperationContext.Current.Connection as IDBConnectionAdapter).AdaptedConnection as TFDConnection;
end;

end.
