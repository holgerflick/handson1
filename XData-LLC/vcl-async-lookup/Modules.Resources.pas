unit Modules.Resources;

interface

uses
  System.SysUtils, System.Classes, AdvStyleIF, Vcl.BaseImageCollection, AdvTypes, System.ImageList,
  Vcl.ImgList, Vcl.VirtualImageList, AdvAppStyler;

type
  TResources = class(TDataModule)
    AppStyler: TAdvAppStyler;
    ToolbarList: TVirtualImageList;
    ToolbarCollection: TAdvSVGImageCollection;
    ButtonsCollection: TAdvSVGImageCollection;
    ButtonsList: TVirtualImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Resources: TResources;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
