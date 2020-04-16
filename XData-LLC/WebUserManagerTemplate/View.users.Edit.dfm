object FViewusersEdit: TFViewusersEdit
  Left = 0
  Top = 0
  Width = 593
  Height = 373
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TabOrder = 1
  OnCreate = WebFormCreate 
  object pnlMessage: TWebPanel
    Left = 296
    Top = 113
    Width = 273
    Height = 60
    ElementID = 'view.users.form.message'
    BorderColor = clSilver
    BorderStyle = bsSingle
    object lbMessage: TWebLabel
      Left = 16
      Top = 24
      Width = 42
      Height = 13
      Caption = 'Message'
      ElementID = 'view.users.form.message.label'
      Transparent = True
    end
    object btCloseMessage: TWebButton
      Left = 248
      Top = 11
      Width = 22
      Height = 25
      Caption = 'x'
      ElementID = 'view.users.form.message.button'
      TabOrder = 0
      OnClick = btCloseMessageClick
    end
  end    
  object btCancel: TWebButton
    Left = 126
    Top = 313
    Width = 96
    Height = 25
    Caption = 'Cancel'
    ElementID = 'view.users.form.btBack'
    TabOrder = 1
    OnClick = btCancelClick
  end
  object btSave: TWebButton
    Left = 24
    Top = 313
    Width = 96
    Height = 25
    Caption = 'Save'
    ElementID = 'view.users.form.btSave'
    TabOrder = 4
    OnClick = btSaveClick
  end
  object btDelete: TWebButton
    Left = 305
    Top = 313
    Width = 96
    Height = 25
    Caption = 'Delete'
    ElementID = 'view.users.form.btDelete'
    TabOrder = 5
    OnClick = btDeleteClick
  end
  object lbid: TWebLabel
    Left = 24
    Top = 192
    Width = 14
    Height = 13
    Caption = 'id:'
    ElementID = 'view.users.form.lbid'
    Transparent = True
  end
  object edid: TWebDBEdit
    Left = 221
    Top = 189
    Width = 200
    Height = 21
    ElementID = 'view.users.form.edid'
    Enabled = True
    TabOrder = 6
    Text = 'edid'
    DataField = 'id'
    DataSource = DataSource
  end
  object lblogin: TWebLabel
    Left = 24
    Top = 219
    Width = 14
    Height = 13
    Caption = 'login:'
    ElementID = 'view.users.form.lblogin'
    Transparent = True
  end
  object edlogin: TWebDBEdit
    Left = 221
    Top = 216
    Width = 200
    Height = 21
    ElementID = 'view.users.form.edlogin'
    Enabled = True
    TabOrder = 7
    Text = 'edlogin'
    DataField = 'login'
    DataSource = DataSource
  end
  object lbname: TWebLabel
    Left = 24
    Top = 246
    Width = 14
    Height = 13
    Caption = 'name:'
    ElementID = 'view.users.form.lbname'
    Transparent = True
  end
  object edname: TWebDBEdit
    Left = 221
    Top = 243
    Width = 200
    Height = 21
    ElementID = 'view.users.form.edname'
    Enabled = True
    TabOrder = 8
    Text = 'edname'
    DataField = 'name'
    DataSource = DataSource
  end
  object lbpw: TWebLabel
    Left = 24
    Top = 273
    Width = 14
    Height = 13
    Caption = 'pw:'
    ElementID = 'view.users.form.lbpw'
    Transparent = True
  end
  object edpw: TWebDBEdit
    Left = 221
    Top = 270
    Width = 200
    Height = 21
    ElementID = 'view.users.form.edpw'
    Enabled = True
    TabOrder = 9
    Text = 'edpw'
    DataField = 'pw'
    DataSource = DataSource
  end
  object DataSource: TWebDataSource
    DataSet = usersDataset
    Left = 176
    Top = 56
  end
  object usersDataset: TXDataWebDataSet
    AfterApplyUpdates = usersDatasetAfterApplyUpdates
    EntitySetName = 'users'
    Connection = DMConnection.ApiConnection
    Left = 176
    Top = 8
    object usersDatasetid: TLargeIntField
      FieldName = 'id'
      Required = True
    end
    object usersDatasetlogin: TStringField
      FieldName = 'login'
      Required = True
      Size = 50
    end
    object usersDatasetname: TStringField
      FieldName = 'name'
      Required = True
      Size = 100
    end
    object usersDatasetpw: TStringField
      FieldName = 'pw'
      Required = True
      Size = 100
    end
  end
  object XDataClientusersGet: TXDataWebClient
    Connection = DMConnection.ApiConnection
    OnLoad = XDataClientusersGetLoad
    Left = 64
    Top = 8
  end
  object XDataClientusersDelete: TXDataWebClient
    Connection = DMConnection.ApiConnection
    OnLoad = XDataClientusersDeleteLoad
    OnError = XDataClientusersDeleteError
    Left = 64
    Top = 56
  end
end
