unit LookupService;

interface

uses
  XData.Service.Common,
  System.Generics.Collections,
  ReturnTypes;

type
  [ServiceContract]
  ILookupService = interface(IInvokable)
    ['{BB4A252A-3B15-4587-9478-2428B0C461E3}']

    [HttpGet]
    function GetStatus : TStatusItem;

    [HttpGet]
    function GetBusinessEntityNames(const AStart: String): TList<TBusinessEntityItem>;
  end;

implementation

initialization
  RegisterServiceType(TypeInfo(ILookupService));

end.
