object Form1: TForm1
  Left = 0
  Top = 0
  Width = 709
  Height = 374
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Droid Sans Mono'
  Font.Style = []
  TabOrder = 1
  object WebDBGrid1: TWebDBGrid
    Left = 8
    Top = 8
    Width = 673
    Height = 281
    BorderStyle = bsNone
    Columns = <
      item
        DataField = 'name'
        Title = 'Full name'
        Width = 155
      end
      item
        DataField = 'login'
        Title = 'Login'
        Width = 163
      end
      item
        DataField = 'pw'
        Title = 'Password'
        Width = 161
      end>
    DataSource = DataSource
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
    ColWidths = (
      155
      163
      161)
  end
  object btnConnect: TWebButton
    Left = 16
    Top = 341
    Width = 153
    Height = 25
    Caption = 'Connect...'
    ChildOrder = 1
    OnClick = btnConnectClick
  end
  object btnApply: TWebButton
    Left = 175
    Top = 341
    Width = 153
    Height = 25
    Caption = 'Save changes'
    ChildOrder = 1
    OnClick = btnApplyClick
  end
  object WebDBNavigator1: TWebDBNavigator
    Left = 16
    Top = 295
    Width = 665
    Height = 25
    DataSource = DataSource
    Hints.Strings = (
      'First'
      'Prior'
      'Next'
      'Last'
      'Edit'
      'Post'
      'Insert'
      'Delete'
      'Cancel')
    VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
  end
  object dsUsers: TXDataWebDataSet
    EntitySetName = 'users'
    Connection = Connection
    Left = 112
    Top = 152
    object dsUsersid: TLargeintField
      FieldName = 'id'
      Required = True
    end
    object dsUserslogin: TStringField
      FieldName = 'login'
      Required = True
      Size = 50
    end
    object dsUsersname: TStringField
      FieldName = 'name'
      Required = True
      Size = 100
    end
    object dsUserspw: TStringField
      FieldName = 'pw'
      Required = True
      Size = 100
    end
  end
  object Connection: TXDataWebConnection
    URL = 'http://localhost/flix'
    OnConnect = ConnectionConnect
    Left = 168
    Top = 152
  end
  object DataSource: TWebDataSource
    DataSet = dsUsers
    Left = 48
    Top = 152
  end
end
