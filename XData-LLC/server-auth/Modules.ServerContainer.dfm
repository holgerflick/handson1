object ServerContainer: TServerContainer
  OldCreateOrder = False
  Height = 210
  Width = 431
  object Dispatcher: TSparkleHttpSysDispatcher
    Active = True
    Left = 72
    Top = 16
  end
  object XDataServer: TXDataServer
    BaseUrl = 'http://+:80/flix'
    Dispatcher = Dispatcher
    Pool = Pool
    DefaultEntitySetPermissions = [List]
    EntitySetPermissions = <
      item
        EntitySetName = 'users'
        Permissions = [List, Get, Insert, Modify, Delete]
      end
      item
        EntitySetName = 'companies'
        Permissions = [List, Get]
      end>
    OnEntityInserting = XDataServerEntityInserting
    OnEntityModifying = XDataServerEntityModifying
    OnEntityDeleting = XDataServerEntityDeleting
    OnEntityGet = XDataServerEntityGet
    OnEntityList = XDataServerEntityList
    Left = 216
    Top = 16
    object TokenAuth: TSparkleGenericMiddleware
      OnRequest = TokenAuthRequest
    end
  end
  object Pool: TXDataConnectionPool
    Connection = AureliusConnection
    Left = 216
    Top = 72
  end
  object AureliusConnection: TAureliusConnection
    AdapterName = 'FireDac'
    AdaptedConnection = Connection
    SQLDialect = 'MySQL'
    Left = 216
    Top = 128
  end
  object Connection: TFDConnection
    Params.Strings = (
      'Database=floridallc'
      'User_Name=sysdba'
      'Password=masterkey'
      'Server=192.168.162.130'
      'DriverID=MySQL')
    FetchOptions.AssignedValues = [evItems, evRowsetSize, evUnidirectional, evCursorKind]
    FetchOptions.RowsetSize = 10000
    FetchOptions.Items = [fiDetails, fiMeta]
    ResourceOptions.AssignedValues = [rvStoreItems]
    ResourceOptions.StoreItems = [siData]
    TxOptions.ReadOnly = True
    LoginPrompt = False
    Left = 328
    Top = 128
  end
end
