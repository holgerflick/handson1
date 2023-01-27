unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.ComCtrls, AdvProgr, AdvEdit, AdvEdBtn, FolderDialog;

type
  TFrmMain = class(TForm)
    quCompanies: TFDQuery;
    quCompaniesid: TStringField;
    quCompaniesname: TStringField;
    quCompaniesstatus: TStringField;
    quCompaniesfiling_type: TStringField;
    quCompaniesprinc_add_1: TStringField;
    quCompaniesprinc_add_2: TStringField;
    quCompaniesprinc_city: TStringField;
    quCompaniesprinc_state: TStringField;
    quCompaniesprinc_zip: TStringField;
    quCompaniesprinc_country: TStringField;
    quCompaniesmail_add_1: TStringField;
    quCompaniesmail_add_2: TStringField;
    quCompaniesmail_city: TStringField;
    quCompaniesmail_state: TStringField;
    quCompaniesmail_zip: TStringField;
    quCompaniesmail_country: TStringField;
    quCompaniesfile_date: TStringField;
    quCompaniesfei_number: TStringField;
    quCompaniesmore_than_six_off_flag: TStringField;
    quCompanieslast_trx_date: TStringField;
    quCompaniesstate_country: TStringField;
    quCompaniesreport_year_1: TStringField;
    quCompanieshouse_flag_1: TStringField;
    quCompaniesreport_date_1: TStringField;
    quCompaniesreport_year_2: TStringField;
    quCompanieshouse_flag_2: TStringField;
    quCompaniesreport_date_2: TStringField;
    quCompaniesreport_year_3: TStringField;
    quCompanieshouse_flag_3: TStringField;
    quCompaniesreport_date_3: TStringField;
    quCompaniesra_name: TStringField;
    quCompaniesra_name_type: TStringField;
    quCompaniesra_add_1: TStringField;
    quCompaniesra_city: TStringField;
    quCompaniesra_state: TStringField;
    quCompaniesra_zip5: TStringField;
    quCompaniesra_zip4: TStringField;
    quCompaniesprinc1_title: TStringField;
    quCompaniesprinc1_name_type: TStringField;
    quCompaniesprinc1_name: TStringField;
    quCompaniesprinc1_add_1: TStringField;
    quCompaniesprinc1_city: TStringField;
    quCompaniesprinc1_state: TStringField;
    quCompaniesprinc1_zip5: TStringField;
    quCompaniesprinc1_zip4: TStringField;
    quCompaniesprinc2_title: TStringField;
    quCompaniesprinc2_name_type: TStringField;
    quCompaniesprinc2_name: TStringField;
    quCompaniesprinc2_add_1: TStringField;
    quCompaniesprinc2_city: TStringField;
    quCompaniesprinc2_state: TStringField;
    quCompaniesprinc2_zip5: TStringField;
    quCompaniesprinc2_zip4: TStringField;
    quCompaniesprinc3_title: TStringField;
    quCompaniesprinc3_name_type: TStringField;
    quCompaniesprinc3_name: TStringField;
    quCompaniesprinc3_add_1: TStringField;
    quCompaniesprinc3_city: TStringField;
    quCompaniesprinc3_state: TStringField;
    quCompaniesprinc3_zip5: TStringField;
    quCompaniesprinc3_zip4: TStringField;
    quCompaniesprinc4_title: TStringField;
    quCompaniesprinc4_name_type: TStringField;
    quCompaniesprinc4_name: TStringField;
    quCompaniesprinc4_add_1: TStringField;
    quCompaniesprinc4_city: TStringField;
    quCompaniesprinc4_state: TStringField;
    quCompaniesprinc4_zip5: TStringField;
    quCompaniesprinc4_zip4: TStringField;
    quCompaniesprinc5_title: TStringField;
    quCompaniesprinc5_name_type: TStringField;
    quCompaniesprinc5_name: TStringField;
    quCompaniesprinc5_add_1: TStringField;
    quCompaniesprinc5_city: TStringField;
    quCompaniesprinc5_state: TStringField;
    quCompaniesprinc5_zip5: TStringField;
    quCompaniesprinc5_zip4: TStringField;
    quCompaniesprinc6_title: TStringField;
    quCompaniesprinc6_name_type: TStringField;
    quCompaniesprinc6_name: TStringField;
    quCompaniesprinc6_add_1: TStringField;
    quCompaniesprinc6_city: TStringField;
    quCompaniesprinc6_state: TStringField;
    quCompaniesprinc6_zip5: TStringField;
    quCompaniesprinc6_zip4: TStringField;
    btnConvert: TButton;
    Progress: TAdvProgress;
    lblFilename: TLabel;
    dlgSelectFolder: TFolderDialog;
    txtFolder: TAdvEditBtn;
    Connection: TFDConnection;
    procedure btnConvertClick(Sender: TObject);
    procedure txtFolderClickBtn(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ConvertFile( const AFilename: String );
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

{ TFrmMain }

uses System.IOUtils;

procedure TFrmMain.btnConvertClick(Sender: TObject);
var
  LDir : String;
  LFile: String;
  i: Integer;

begin
  LDir := txtFolder.Text;

  // files are named cordata[0-9].txt
  for i := 0 to 9 do begin
    LFile := TPath.Combine(LDir, 'cordata' + i.ToString + '.txt');

    // if file exists, process it
    if TFile.Exists(LFile) then
    begin
      lblFilename.Caption := LFile;
      ConvertFile( LFile );
    end;
  end;

  ShowMessage('Done.');
end;

procedure TFrmMain.ConvertFile( const AFilename: String);
var
  LInputFile: TFileStream;
  LOutputFile: TFileStream;

  LReader: TStreamReader;
  LWriter: TStreamWriter;

  LLine: String;
  LField: TField;
  LBuffer: String;
  LNewLine: String;
  LPos : Integer;

  i : Integer;

  LCount: Integer;
  LMax : Integer;

  LDontAdd: Boolean;

begin
  // streams for files
  LInputFile := TFileStream.Create(AFilename, fmOpenRead );
  LOutputFile := TFileStream.Create(AFilename + '.csv', fmCreate );

  // writer and reader
  LWriter := TStreamWriter.Create(LOutputFile);
  LReader := TStreamReader.Create(LInputFile, TEncoding.ANSI);

  // init count vars
  LCount := 0;
  LMax := 0;

  try
    //
    // count lines
    while not LReader.EndOfStream do
    begin
      Inc( LMax );
      LReader.ReadLine;
      if LMax MOD 500 = 0 then
      begin
        Application.ProcessMessages;
      end;
    end;

    // set up progress bar
    Progress.Max := LMax;
    Progress.Min := 0;
    Progress.Position := 0;


    // restart reader
    LReader.Rewind;

    // write header with column names
    LLine := '';
    for LField in quCompanies.Fields  do
    begin
      if LLine <> '' then
      begin
        LLine := LLine + #9;
      end;

      LLine := LLine + LField.Name;
    end;


    // not needed for LOAD DATA LOCAL INFILE
    // LWriter.WriteLine( LLine );

    // iterate all records
    while not LReader.EndOfStream do
    begin
      // get line
      LLine := LReader.ReadLine;
      Inc( LCount );

      // one lines with complete data
      if Length( LLine ) > 50 then
      begin
        LPos := 1;
        LNewLine := '';
        LDontAdd := False;

        // iterate all fields and assign values
        for i := 0 to quCompanies.FieldCount -1 do
        begin
          LField := quCompanies.Fields[i];

          LBuffer := TRIM( COPY( LLine, LPos, LField.DisplayWidth ) );
          LBuffer := LBuffer.Replace(#9, '', [] );

          while LBuffer.Contains('\') do
          begin
            LBuffer := LBuffer.Replace('\', '/', [ rfReplaceAll ] );
          end;

          while LBuffer.Contains('  ') do
          begin
            LBuffer := LBuffer.Replace('  ', ' ', [ ] );
          end;

          if i > 0 then
          begin
            LNewLine := LNewLine + #9;
          end;

          LNewLine := LNewLine + TRIM( LBuffer );

          Inc(LPos, LField.DisplayWidth );

          if ( LField.DisplayLabel = 'status' )  then
          begin
            if LBuffer.Length > 0 then
            begin
              if not ( LBuffer[1] in ['A', 'E', 'I'] ) then
              begin
                LDontAdd := True;
              end;
            end
            else
            begin
              LDontAdd := True;
            end;
          end;

          if LDontAdd then
          begin
            LNewLine := '';
            break;
          end;

        end; // iterating fields

        if LNewLine <> '' then
        begin
          // write line
          LWriter.WriteLine(LNewLine);
        end;
      end;  // processing line

      // update progress bar
      if LCount MOD 500 = 0 then
      begin
        Progress.Position := LCount;
        Application.ProcessMessages;
      end;
    end; // end while

  finally
    LReader.Free;
    LWriter.Free;
    LOutputFile.Free;
    LInputFile.Free;

    Progress.Position := 0;
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  dlgSelectFolder.Options :=
   dlgSelectFolder.Options +
   [ fdoEditBox,              // show edit box
     fdoNoNewFolderButton     // no button to add folders
     ];

   dlgSelectFolder.Title := 'Please select the folder with the source files.'
end;

procedure TFrmMain.txtFolderClickBtn(Sender: TObject);
begin
  if dlgSelectFolder.Execute then
  begin
    txtFolder.Text := dlgSelectFolder.Directory;
  end;
end;

end.
