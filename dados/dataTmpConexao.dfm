object dmTmpConexao: TdmTmpConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 850
  Width = 927
  object database: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    ClientCodepage = 'LATIN1'
    Catalog = ''
    Properties.Strings = (
      'codepage=LATIN1')
    HostName = 'localhost'
    Port = 5432
    Database = 'phoenix'
    User = 'postgres'
    Password = '@I19c11m13*/'
    Protocol = 'postgresql'
    LibraryLocation = 'C:\Phoenix\lib\postgres\x86\libpq.dll'
    Left = 40
    Top = 16
  end
  object QGeraCodigo: TZQuery
    Connection = database
    Params = <>
    Left = 200
    Top = 16
  end
  object QTemp: TZQuery
    Connection = database
    Params = <>
    Left = 288
    Top = 16
  end
end
