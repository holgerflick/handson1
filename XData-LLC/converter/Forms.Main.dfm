object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Convert txt to csv'
  ClientHeight = 90
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Droid Sans'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    533
    90)
  PixelsPerInch = 96
  TextHeight = 18
  object lblFilename: TLabel
    Left = 8
    Top = 41
    Width = 4
    Height = 18
    Anchors = [akLeft, akRight, akBottom]
  end
  object btnConvert: TButton
    Left = 394
    Top = 17
    Width = 131
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Convert'
    TabOrder = 0
    OnClick = btnConvertClick
  end
  object Progress: TAdvProgress
    Left = 8
    Top = 65
    Width = 517
    Height = 17
    Anchors = [akLeft, akRight, akBottom]
    BarColor = clHighlight
    TabOrder = 1
    BkColor = clWindow
    Version = '1.2.0.0'
  end
  object txtFolder: TAdvEditBtn
    Left = 8
    Top = 16
    Width = 380
    Height = 26
    EmptyTextStyle = []
    FlatLineColor = 11250603
    FocusColor = clWhite
    FocusFontColor = 3881787
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = 4474440
    LabelFont.Height = -11
    LabelFont.Name = 'Tahoma'
    LabelFont.Style = []
    Lookup.Font.Charset = DEFAULT_CHARSET
    Lookup.Font.Color = clWindowText
    Lookup.Font.Height = -11
    Lookup.Font.Name = 'Arial'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4474440
    Font.Height = -15
    Font.Name = 'Droid Sans'
    Font.Style = []
    ParentFont = False
    ShortCut = 0
    TabOrder = 2
    Text = ''
    Visible = True
    Version = '1.6.0.0'
    ButtonStyle = bsButton
    ButtonWidth = 16
    Flat = False
    Etched = False
    ButtonCaption = '...'
    ReadOnly = False
    OnClickBtn = txtFolderClickBtn
  end
  object quCompanies: TFDQuery
    SQL.Strings = (
      'select * from companies limit 10')
    Left = 64
    Top = 40
    object quCompaniesid: TStringField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 12
    end
    object quCompaniesname: TStringField
      FieldName = 'name'
      Origin = 'name'
      Size = 192
    end
    object quCompaniesstatus: TStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 1
    end
    object quCompaniesfiling_type: TStringField
      FieldName = 'filing_type'
      Origin = 'filing_type'
      Size = 15
    end
    object quCompaniesprinc_add_1: TStringField
      FieldName = 'princ_add_1'
      Origin = 'princ_add_1'
      Size = 42
    end
    object quCompaniesprinc_add_2: TStringField
      FieldName = 'princ_add_2'
      Origin = 'princ_add_2'
      Size = 42
    end
    object quCompaniesprinc_city: TStringField
      FieldName = 'princ_city'
      Origin = 'princ_city'
      Size = 28
    end
    object quCompaniesprinc_state: TStringField
      FieldName = 'princ_state'
      Origin = 'princ_state'
      Size = 2
    end
    object quCompaniesprinc_zip: TStringField
      FieldName = 'princ_zip'
      Origin = 'princ_zip'
      Size = 10
    end
    object quCompaniesprinc_country: TStringField
      FieldName = 'princ_country'
      Origin = 'princ_country'
      Size = 2
    end
    object quCompaniesmail_add_1: TStringField
      FieldName = 'mail_add_1'
      Origin = 'mail_add_1'
      Size = 42
    end
    object quCompaniesmail_add_2: TStringField
      FieldName = 'mail_add_2'
      Origin = 'mail_add_2'
      Size = 42
    end
    object quCompaniesmail_city: TStringField
      FieldName = 'mail_city'
      Origin = 'mail_city'
      Size = 28
    end
    object quCompaniesmail_state: TStringField
      FieldName = 'mail_state'
      Origin = 'mail_state'
      Size = 2
    end
    object quCompaniesmail_zip: TStringField
      FieldName = 'mail_zip'
      Origin = 'mail_zip'
      Size = 10
    end
    object quCompaniesmail_country: TStringField
      FieldName = 'mail_country'
      Origin = 'mail_country'
      Size = 2
    end
    object quCompaniesfile_date: TStringField
      FieldName = 'file_date'
      Origin = 'file_date'
      Size = 8
    end
    object quCompaniesfei_number: TStringField
      FieldName = 'fei_number'
      Origin = 'fei_number'
      Size = 14
    end
    object quCompaniesmore_than_six_off_flag: TStringField
      FieldName = 'more_than_six_off_flag'
      Origin = 'more_than_six_off_flag'
      Size = 1
    end
    object quCompanieslast_trx_date: TStringField
      FieldName = 'last_trx_date'
      Origin = 'last_trx_date'
      Size = 8
    end
    object quCompaniesstate_country: TStringField
      FieldName = 'state_country'
      Origin = 'state_country'
      Size = 2
    end
    object quCompaniesreport_year_1: TStringField
      FieldName = 'report_year_1'
      Origin = 'report_year_1'
      Size = 4
    end
    object quCompanieshouse_flag_1: TStringField
      FieldName = 'house_flag_1'
      Origin = 'house_flag_1'
      Size = 1
    end
    object quCompaniesreport_date_1: TStringField
      FieldName = 'report_date_1'
      Origin = 'report_date_1'
      Size = 8
    end
    object quCompaniesreport_year_2: TStringField
      FieldName = 'report_year_2'
      Origin = 'report_year_2'
      Size = 4
    end
    object quCompanieshouse_flag_2: TStringField
      FieldName = 'house_flag_2'
      Origin = 'house_flag_2'
      Size = 1
    end
    object quCompaniesreport_date_2: TStringField
      FieldName = 'report_date_2'
      Origin = 'report_date_2'
      Size = 8
    end
    object quCompaniesreport_year_3: TStringField
      FieldName = 'report_year_3'
      Origin = 'report_year_3'
      Size = 4
    end
    object quCompanieshouse_flag_3: TStringField
      FieldName = 'house_flag_3'
      Origin = 'house_flag_3'
      Size = 1
    end
    object quCompaniesreport_date_3: TStringField
      FieldName = 'report_date_3'
      Origin = 'report_date_3'
      Size = 8
    end
    object quCompaniesra_name: TStringField
      FieldName = 'ra_name'
      Origin = 'ra_name'
      Size = 42
    end
    object quCompaniesra_name_type: TStringField
      FieldName = 'ra_name_type'
      Origin = 'ra_name_type'
      Size = 1
    end
    object quCompaniesra_add_1: TStringField
      FieldName = 'ra_add_1'
      Origin = 'ra_add_1'
      Size = 42
    end
    object quCompaniesra_city: TStringField
      FieldName = 'ra_city'
      Origin = 'ra_city'
      Size = 28
    end
    object quCompaniesra_state: TStringField
      FieldName = 'ra_state'
      Origin = 'ra_state'
      Size = 2
    end
    object quCompaniesra_zip5: TStringField
      FieldName = 'ra_zip5'
      Origin = 'ra_zip5'
      Size = 5
    end
    object quCompaniesra_zip4: TStringField
      FieldName = 'ra_zip4'
      Origin = 'ra_zip4'
      Size = 4
    end
    object quCompaniesprinc1_title: TStringField
      FieldName = 'princ1_title'
      Origin = 'princ1_title'
      Size = 4
    end
    object quCompaniesprinc1_name_type: TStringField
      FieldName = 'princ1_name_type'
      Origin = 'princ1_name_type'
      Size = 1
    end
    object quCompaniesprinc1_name: TStringField
      FieldName = 'princ1_name'
      Origin = 'princ1_name'
      Size = 42
    end
    object quCompaniesprinc1_add_1: TStringField
      FieldName = 'princ1_add_1'
      Origin = 'princ1_add_1'
      Size = 42
    end
    object quCompaniesprinc1_city: TStringField
      FieldName = 'princ1_city'
      Origin = 'princ1_city'
      Size = 28
    end
    object quCompaniesprinc1_state: TStringField
      FieldName = 'princ1_state'
      Origin = 'princ1_state'
      Size = 2
    end
    object quCompaniesprinc1_zip5: TStringField
      FieldName = 'princ1_zip5'
      Origin = 'princ1_zip5'
      Size = 5
    end
    object quCompaniesprinc1_zip4: TStringField
      FieldName = 'princ1_zip4'
      Origin = 'princ1_zip4'
      Size = 4
    end
    object quCompaniesprinc2_title: TStringField
      FieldName = 'princ2_title'
      Origin = 'princ2_title'
      Size = 4
    end
    object quCompaniesprinc2_name_type: TStringField
      FieldName = 'princ2_name_type'
      Origin = 'princ2_name_type'
      Size = 1
    end
    object quCompaniesprinc2_name: TStringField
      FieldName = 'princ2_name'
      Origin = 'princ2_name'
      Size = 42
    end
    object quCompaniesprinc2_add_1: TStringField
      FieldName = 'princ2_add_1'
      Origin = 'princ2_add_1'
      Size = 42
    end
    object quCompaniesprinc2_city: TStringField
      FieldName = 'princ2_city'
      Origin = 'princ2_city'
      Size = 28
    end
    object quCompaniesprinc2_state: TStringField
      FieldName = 'princ2_state'
      Origin = 'princ2_state'
      Size = 2
    end
    object quCompaniesprinc2_zip5: TStringField
      FieldName = 'princ2_zip5'
      Origin = 'princ2_zip5'
      Size = 5
    end
    object quCompaniesprinc2_zip4: TStringField
      FieldName = 'princ2_zip4'
      Origin = 'princ2_zip4'
      Size = 4
    end
    object quCompaniesprinc3_title: TStringField
      FieldName = 'princ3_title'
      Origin = 'princ3_title'
      Size = 4
    end
    object quCompaniesprinc3_name_type: TStringField
      FieldName = 'princ3_name_type'
      Origin = 'princ3_name_type'
      Size = 1
    end
    object quCompaniesprinc3_name: TStringField
      FieldName = 'princ3_name'
      Origin = 'princ3_name'
      Size = 42
    end
    object quCompaniesprinc3_add_1: TStringField
      FieldName = 'princ3_add_1'
      Origin = 'princ3_add_1'
      Size = 42
    end
    object quCompaniesprinc3_city: TStringField
      FieldName = 'princ3_city'
      Origin = 'princ3_city'
      Size = 28
    end
    object quCompaniesprinc3_state: TStringField
      FieldName = 'princ3_state'
      Origin = 'princ3_state'
      Size = 2
    end
    object quCompaniesprinc3_zip5: TStringField
      FieldName = 'princ3_zip5'
      Origin = 'princ3_zip5'
      Size = 5
    end
    object quCompaniesprinc3_zip4: TStringField
      FieldName = 'princ3_zip4'
      Origin = 'princ3_zip4'
      Size = 4
    end
    object quCompaniesprinc4_title: TStringField
      FieldName = 'princ4_title'
      Origin = 'princ4_title'
      Size = 4
    end
    object quCompaniesprinc4_name_type: TStringField
      FieldName = 'princ4_name_type'
      Origin = 'princ4_name_type'
      Size = 1
    end
    object quCompaniesprinc4_name: TStringField
      FieldName = 'princ4_name'
      Origin = 'princ4_name'
      Size = 42
    end
    object quCompaniesprinc4_add_1: TStringField
      FieldName = 'princ4_add_1'
      Origin = 'princ4_add_1'
      Size = 42
    end
    object quCompaniesprinc4_city: TStringField
      FieldName = 'princ4_city'
      Origin = 'princ4_city'
      Size = 28
    end
    object quCompaniesprinc4_state: TStringField
      FieldName = 'princ4_state'
      Origin = 'princ4_state'
      Size = 2
    end
    object quCompaniesprinc4_zip5: TStringField
      FieldName = 'princ4_zip5'
      Origin = 'princ4_zip5'
      Size = 5
    end
    object quCompaniesprinc4_zip4: TStringField
      FieldName = 'princ4_zip4'
      Origin = 'princ4_zip4'
      Size = 4
    end
    object quCompaniesprinc5_title: TStringField
      FieldName = 'princ5_title'
      Origin = 'princ5_title'
      Size = 4
    end
    object quCompaniesprinc5_name_type: TStringField
      FieldName = 'princ5_name_type'
      Origin = 'princ5_name_type'
      Size = 1
    end
    object quCompaniesprinc5_name: TStringField
      FieldName = 'princ5_name'
      Origin = 'princ5_name'
      Size = 42
    end
    object quCompaniesprinc5_add_1: TStringField
      FieldName = 'princ5_add_1'
      Origin = 'princ5_add_1'
      Size = 42
    end
    object quCompaniesprinc5_city: TStringField
      FieldName = 'princ5_city'
      Origin = 'princ5_city'
      Size = 28
    end
    object quCompaniesprinc5_state: TStringField
      FieldName = 'princ5_state'
      Origin = 'princ5_state'
      Size = 2
    end
    object quCompaniesprinc5_zip5: TStringField
      FieldName = 'princ5_zip5'
      Origin = 'princ5_zip5'
      Size = 5
    end
    object quCompaniesprinc5_zip4: TStringField
      FieldName = 'princ5_zip4'
      Origin = 'princ5_zip4'
      Size = 4
    end
    object quCompaniesprinc6_title: TStringField
      FieldName = 'princ6_title'
      Origin = 'princ6_title'
      Size = 4
    end
    object quCompaniesprinc6_name_type: TStringField
      FieldName = 'princ6_name_type'
      Origin = 'princ6_name_type'
      Size = 1
    end
    object quCompaniesprinc6_name: TStringField
      FieldName = 'princ6_name'
      Origin = 'princ6_name'
      Size = 42
    end
    object quCompaniesprinc6_add_1: TStringField
      FieldName = 'princ6_add_1'
      Origin = 'princ6_add_1'
      Size = 42
    end
    object quCompaniesprinc6_city: TStringField
      FieldName = 'princ6_city'
      Origin = 'princ6_city'
      Size = 28
    end
    object quCompaniesprinc6_state: TStringField
      FieldName = 'princ6_state'
      Origin = 'princ6_state'
      Size = 2
    end
    object quCompaniesprinc6_zip5: TStringField
      FieldName = 'princ6_zip5'
      Origin = 'princ6_zip5'
      Size = 5
    end
    object quCompaniesprinc6_zip4: TStringField
      FieldName = 'princ6_zip4'
      Origin = 'princ6_zip4'
      Size = 4
    end
  end
  object dlgSelectFolder: TFolderDialog
    Caption = 'Select folder'
    Options = [fdoNewDialogStyle]
    DialogX = 0
    DialogY = 0
    Version = '1.1.4.0'
    Left = 160
    Top = 40
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=floridallc'
      'User_Name=sysdba'
      'Password=masterkey'
      'Server=192.168.0.134'
      'DriverID=MySQL')
    Left = 264
    Top = 48
  end
end
