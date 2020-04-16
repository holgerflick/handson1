object AuthController: TAuthController
  OldCreateOrder = False
  Height = 150
  Width = 215
  object Connection: TFDConnection
    Params.Strings = (
      'Database=floridallc'
      'Server=192.168.0.134'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 80
    Top = 40
  end
end
