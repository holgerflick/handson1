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
  FireDAC.Moni.RemoteClient;

type
  TServerContainer = class(TDataModule)
    Dispatcher: TSparkleHttpSysDispatcher;
    XDataServer: TXDataServer;
    Pool: TXDataConnectionPool;
    AureliusConnection: TAureliusConnection;
    Connection: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure RegisterFunctions;
  end;

var
  ServerContainer: TServerContainer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
uses  Aurelius.Sql.Interfaces,
 Aurelius.Sql.Register,
 Aurelius.Sql.Functions,
 XData.Query.Parser;

procedure TServerContainer.DataModuleCreate(Sender: TObject);
begin
  RegisterFunctions;
end;

procedure TServerContainer.RegisterFunctions;
begin
  TSQLGeneratorRegister.GetInstance.GetGenerator('MySQL').
    RegisterFunction('right', TSimpleSQLFunction.Create('right'));

  TQueryParser.AddMethod('right', TQueryMethod.Create('right', 2));
end;

end.
