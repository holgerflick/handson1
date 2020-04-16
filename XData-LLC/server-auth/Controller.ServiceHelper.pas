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
  end;

implementation

{ TServiceHelper }

class function TServiceHelper.GetFDConnection: TFDConnection;
begin
  Result := (TXDataOperationContext.Current.Connection as IDBConnectionAdapter).AdaptedConnection as TFDConnection;
end;

end.
