object Form1: TForm1
  Left = 0
  Top = 0
  Width = 494
  Height = 480
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  TabOrder = 1
  OnCreate = WebFormCreate
  object txtEntity: TWebEdit
    Left = 32
    Top = 16
    Width = 433
    Height = 22
    ChildOrder = 1
    OnChange = txtEntityChange
  end
  object btnConnect: TWebButton
    Left = 352
    Top = 432
    Width = 113
    Height = 25
    Caption = 'Connect'
    ChildOrder = 2
    OnClick = btnConnectClick
  end
  object lbResults: TWebListBox
    Left = 32
    Top = 44
    Width = 433
    Height = 382
    ItemHeight = 14
    ItemIndex = -1
  end
  object btnStatus: TWebButton
    Left = 32
    Top = 432
    Width = 105
    Height = 25
    Caption = 'Service Info'
    ChildOrder = 3
    Enabled = False
    OnClick = btnStatusClick
  end
  object Client: TXDataWebClient
    Connection = Connection
    OnLoad = ClientLoad
    OnError = ClientError
    Left = 56
    Top = 160
  end
  object Connection: TXDataWebConnection
    URL = 'http://localhost/flix'
    OnConnect = ConnectionConnect
    OnError = ConnectionError
    Left = 56
    Top = 232
  end
end
