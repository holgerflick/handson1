unit LoginService;

interface

uses
  XData.Service.Common;

type
  [ServiceContract]
  ILoginService = interface(IInvokable)
    ['{C325E9BA-6069-42A8-AEDE-B3DBC3AF0E05}']

    [HttpGet]
    function Login( AUsername, APassword: String): String;

    [HttpGet]
    function TokenValid( AToken: String ): Boolean;
  end;

implementation

initialization
  RegisterServiceType(TypeInfo(ILoginService));

end.
