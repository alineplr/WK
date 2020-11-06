object DataModuleWK: TDataModuleWK
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 285
  Width = 445
  object ADOConnectionwk: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=aBm21051982;Persist Security Info=Tr' +
      'ue;User ID=root;Data Source=dbwk;Initial Catalog=dbwk'
    KeepConnection = False
    LoginPrompt = False
    Left = 112
    Top = 64
  end
end
