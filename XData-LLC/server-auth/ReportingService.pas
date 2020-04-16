unit ReportingService;

interface

uses
  Classes,
  XData.Service.Common;

type
  [ServiceContract]
  IReportingService = interface(IInvokable)
    ['{533E3282-06CC-4993-BF26-5EB4742637CD}']

    [HttpGet]
    function GetCompanyProfile( T: String; AId: String ): TStream;
  end;

implementation

initialization
  RegisterServiceType(TypeInfo(IReportingService));

end.
