inherited frmConfig: TfrmConfig
  Caption = 'Configura'#231#227'o do sistema'
  ClientHeight = 240
  ClientWidth = 465
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  ExplicitWidth = 471
  ExplicitHeight = 269
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
    FocusControl = dbCodigo
  end
  object Label2: TLabel [1]
    Left = 87
    Top = 8
    Width = 33
    Height = 13
    Caption = 'Vers'#227'o'
    FocusControl = dbVersao
  end
  object Label3: TLabel [2]
    Left = 205
    Top = 8
    Width = 96
    Height = 13
    Caption = 'C'#243'd. Cidade Padr'#227'o'
    FocusControl = dbCodCidade
  end
  object Label4: TLabel [3]
    Left = 385
    Top = 8
    Width = 62
    Height = 13
    Caption = 'Lan'#231'ar NF 3'#186
  end
  object Label5: TLabel [4]
    Left = 307
    Top = 8
    Width = 54
    Height = 13
    Caption = 'Buscar CEP'
  end
  object Label6: TLabel [5]
    Left = 8
    Top = 51
    Width = 74
    Height = 13
    Caption = 'val. Or'#231'amento'
  end
  object Label7: TLabel [6]
    Left = 96
    Top = 51
    Width = 72
    Height = 13
    Caption = 'Desconto M'#225'x.'
  end
  object Label8: TLabel [7]
    Left = 199
    Top = 51
    Width = 61
    Height = 13
    Caption = 'Margem M'#237'n.'
  end
  object Label9: TLabel [8]
    Left = 302
    Top = 51
    Width = 112
    Height = 13
    Caption = 'Descri'#231#227'o dos Produtos'
  end
  object Label10: TLabel [9]
    Left = 8
    Top = 97
    Width = 38
    Height = 13
    Caption = 'PIS (%)'
  end
  object Label11: TLabel [10]
    Left = 96
    Top = 97
    Width = 60
    Height = 13
    Caption = 'COFINS (%)'
  end
  object Label13: TLabel [11]
    Left = 184
    Top = 97
    Width = 92
    Height = 13
    Caption = 'Funcion'#225'rio padr'#227'o'
  end
  object Label14: TLabel [12]
    Left = 370
    Top = 97
    Width = 87
    Height = 13
    Caption = 'Efetiva Pr'#233'-venda'
  end
  object Label12: TLabel [13]
    Left = 172
    Top = 143
    Width = 67
    Height = 13
    Caption = 'Div. Comanda'
  end
  object Label15: TLabel [14]
    Left = 88
    Top = 143
    Width = 68
    Height = 13
    Caption = 'Fecha PV Aut.'
  end
  object Label16: TLabel [15]
    Left = 8
    Top = 143
    Width = 63
    Height = 13
    Caption = 'Efet. PV Aut.'
  end
  object Label17: TLabel [16]
    Left = 271
    Top = 143
    Width = 44
    Height = 13
    Caption = 'User App'
  end
  object Label18: TLabel [17]
    Left = 371
    Top = 142
    Width = 86
    Height = 13
    Caption = 'Refresh Comanda'
  end
  object Label19: TLabel [18]
    Left = 8
    Top = 188
    Width = 64
    Height = 13
    Caption = 'User Delivery'
  end
  inherited btFechar: TBitBtn
    Left = 352
    Top = 207
    TabOrder = 20
    ExplicitLeft = 352
    ExplicitTop = 207
  end
  object dbCodigo: TDBEdit [20]
    Left = 8
    Top = 24
    Width = 73
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'CFG_CODIGO'
    DataSource = dsMovimento
    ParentShowHint = False
    ReadOnly = True
    ShowHint = False
    TabOrder = 0
  end
  object dbVersao: TDBEdit [21]
    Left = 87
    Top = 24
    Width = 111
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'CFG_VERSAO'
    DataSource = dsMovimento
    ParentShowHint = False
    ReadOnly = True
    ShowHint = False
    TabOrder = 1
  end
  object dbCodCidade: TDBEdit [22]
    Left = 204
    Top = 24
    Width = 97
    Height = 21
    DataField = 'CFG_CODCIDADEPADRAO'
    DataSource = dsMovimento
    TabOrder = 2
  end
  object btGravar: TBitBtn [23]
    Left = 252
    Top = 207
    Width = 94
    Height = 25
    Hint = 'Grava as altera'#231#245'es'
    ParentCustomHint = False
    Anchors = [akRight, akBottom]
    Caption = 'Gravar'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF000955A1000857A6000557AA000655A7000954
      A0000954A000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF000872DD000362C300006CDB000877E700117DEA000877E7000069
      DD00005DC7000654A5000654A500FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF000F6BC9000872DD003E99F50091C4F900D6E9FD00EEF7FF00E4F1FF00B0D4
      FB0059A5F5000570E500035AB7000B509500FF00FF00FF00FF00FF00FF001278
      E000127CE80070B4F900F6FAFE00FFFFFF00EEF6FD00D3E6FB00E2EEFD00FFFF
      FF00FFFFFF00AED2FA000E78ED00025AB6000653A200FF00FF00FF00FF001278
      E0006DB2F900FEFEFF00F4F9FE0077B6F6003391F000B5D5F9001B7FEA004693
      EE00C9E0FA00FFFFFF00B0D5FA000970E6000653A200FF00FF000B70D5003695
      F400E8F3FE00FFFFFF004FA3F6001F88F200D4E7FC00FFFFFF00489BEF000065
      E6000E74E800C9E1FA00FFFFFF0058A5F500005EC7000858AB00137AE30071B5
      FB00FFFFFF00B2D7FC00469FF700DEEEFD00FDFEFE00E0EEFD00A1CCF8000173
      E900006AE7004294ED00FFFFFF00B3D7FB00016BDE000858AB001F85EC00A2CF
      FD00FFFFFF0071B7FD00ACD4FD00FAFCFF0066AFF8003F9AF500E2EFFD002D8E
      F0000075EB000575E900E2EEFC00E6F3FF000E7BE900065AB0002F8FF100B7DA
      FD00FFFFFF006BB4FF003C9DFE004FA5FB001D8AF8001484F500A0CDFB0084BD
      F800067AEF000374EB00D4E8FB00F0F8FF001A82EC00055CB5003693F000B8DA
      FE00FFFFFF008EC6FF002391FF002E95FE002B93FC00218CF9002D92F7009ACA
      FB001D86F2001D86F000F3F8FE00D9EBFE00117DE900095CB2002689ED00AFD6
      FD00FFFFFF00E1F0FF003499FF002F96FF003399FF002E94FD00218CF90050A4
      F900419BF7007DBBF800FFFFFF0099C9FA000773E1000958AB00FF00FF003994
      F000F1F8FF00FFFFFF00ADD6FF003499FF002592FF002893FF00238FFC001788
      FA006FB4FA00F4FAFF00F5FAFE0049A0F700076ACE00FF00FF00FF00FF003994
      F000CDE6FF00F6FAFF00FFFFFF00E0EFFF008DC6FF006EB6FE0079BBFF00B6DA
      FE00FFFFFF00FFFFFF0078B9F900137BE600076ACE00FF00FF00FF00FF00FF00
      FF0064ACF600D4EAFF00F9FCFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7F3FE0077B8FA001D85ED000D6DD000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00459AF000A7D2FC00D8ECFF00E2F1FF00E4F1FE00D1E7FE009DCD
      FD004DA2F700177FE800177FE800FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF003B94F00061ABF60065ADF700489EF4002286
      EC00127AE400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 19
    OnClick = btGravarClick
  end
  object cbBuscaCep: TwwDBComboBox [24]
    Left = 307
    Top = 24
    Width = 72
    Height = 21
    ShowButton = True
    Style = csDropDown
    MapList = True
    AllowClearKey = False
    AutoDropDown = True
    ShowMatchText = True
    DataField = 'CFG_BUSCACEP'
    DataSource = dsMovimento
    DropDownCount = 8
    ItemHeight = 0
    Items.Strings = (
      'Sim'#9'S'
      'N'#227'o'#9'N')
    Sorted = False
    TabOrder = 3
    UnboundDataType = wwDefault
  end
  object cbLanc3: TwwDBComboBox [25]
    Left = 385
    Top = 24
    Width = 72
    Height = 21
    ShowButton = True
    Style = csDropDown
    MapList = True
    AllowClearKey = False
    AutoDropDown = True
    ShowMatchText = True
    DataField = 'CFG_LANNFTER'
    DataSource = dsMovimento
    DropDownCount = 8
    ItemHeight = 0
    Items.Strings = (
      'Sim'#9'S'
      'N'#227'o'#9'N')
    Sorted = False
    TabOrder = 4
    UnboundDataType = wwDefault
  end
  object wwDBSpinEdit1: TwwDBSpinEdit [26]
    Left = 8
    Top = 70
    Width = 82
    Height = 21
    Increment = 1.000000000000000000
    MaxValue = 99.000000000000000000
    MinValue = 1.000000000000000000
    DataField = 'CFG_VALORC'
    DataSource = dsMovimento
    MaxLength = 2
    TabOrder = 5
    UnboundDataType = wwDefault
  end
  object dbDescMax: TDBEdit [27]
    Left = 96
    Top = 70
    Width = 97
    Height = 21
    DataField = 'CFG_DESCMAX'
    DataSource = dsMovimento
    TabOrder = 6
  end
  object dbMgMin: TDBEdit [28]
    Left = 199
    Top = 70
    Width = 97
    Height = 21
    DataField = 'CFG_MGMIN'
    DataSource = dsMovimento
    TabOrder = 7
  end
  object cbCaseProd: TwwDBComboBox [29]
    Left = 302
    Top = 70
    Width = 155
    Height = 21
    ShowButton = True
    Style = csDropDown
    MapList = True
    AllowClearKey = False
    DataField = 'CFG_PRODCASE'
    DataSource = dsMovimento
    DropDownCount = 8
    ItemHeight = 0
    Items.Strings = (
      'Normal'#9'N'
      'MAI'#218'SCULA'#9'U'
      'min'#250'scula'#9'L')
    Sorted = False
    TabOrder = 8
    UnboundDataType = wwDefault
  end
  object dbPIS: TDBEdit [30]
    Left = 8
    Top = 116
    Width = 82
    Height = 21
    DataField = 'cfg_pis'
    DataSource = dsMovimento
    TabOrder = 9
  end
  object dbCofins: TDBEdit [31]
    Left = 96
    Top = 116
    Width = 82
    Height = 21
    DataField = 'cfg_cofins'
    DataSource = dsMovimento
    TabOrder = 10
  end
  object dbNomeFunc: TDBEdit [32]
    Left = 184
    Top = 116
    Width = 180
    Height = 21
    Hint = 'Nome do Funcion'#225'rio Padr'#227'o'
    DataField = 'FUN_NOME'
    DataSource = dsFuncionarios
    TabOrder = 11
  end
  object cbEfetPV: TwwDBComboBox [33]
    Left = 370
    Top = 116
    Width = 87
    Height = 21
    Hint = 'Efetivar Pr'#233'-venda'
    ShowButton = True
    Style = csDropDown
    MapList = True
    AllowClearKey = False
    DataField = 'cfg_efetprv'
    DataSource = dsMovimento
    DropDownCount = 8
    ItemHeight = 0
    Items.Strings = (
      'N'#227'o'#9'0'
      'Sim'#9'1')
    Sorted = False
    TabOrder = 12
    UnboundDataType = wwDefault
  end
  object cbDivComanda: TwwDBComboBox [34]
    Left = 172
    Top = 161
    Width = 93
    Height = 21
    Hint = 'Divide comanda no fechamento'
    ShowButton = True
    Style = csDropDown
    MapList = True
    AllowClearKey = False
    DataField = 'cfg_divcomanda'
    DataSource = dsMovimento
    DropDownCount = 8
    ItemHeight = 0
    Items.Strings = (
      'N'#227'o'#9'0'
      'Sim'#9'1')
    Sorted = False
    TabOrder = 15
    UnboundDataType = wwDefault
  end
  object cbEfetPVAut: TwwDBComboBox [35]
    Left = 8
    Top = 161
    Width = 74
    Height = 21
    Hint = 'Efetivar Pr'#233'-venda Automaticamente'
    ShowButton = True
    Style = csDropDown
    MapList = True
    AllowClearKey = False
    DataField = 'cfg_efetprvaut'
    DataSource = dsMovimento
    DropDownCount = 8
    ItemHeight = 0
    Items.Strings = (
      'N'#227'o'#9'0'
      'Sim'#9'1')
    Sorted = False
    TabOrder = 13
    UnboundDataType = wwDefault
  end
  object cbFechaPVAut: TwwDBComboBox [36]
    Left = 88
    Top = 161
    Width = 74
    Height = 21
    Hint = 'Fecha Pr'#233'-venda Automaticamente'
    ShowButton = True
    Style = csDropDown
    MapList = True
    AllowClearKey = False
    DataField = 'cfg_fechaprvaut'
    DataSource = dsMovimento
    DropDownCount = 8
    ItemHeight = 0
    Items.Strings = (
      'N'#227'o'#9'0'
      'Sim'#9'1')
    Sorted = False
    TabOrder = 14
    UnboundDataType = wwDefault
  end
  object cbUserApp: TwwDBComboBox [37]
    Left = 271
    Top = 161
    Width = 94
    Height = 21
    Hint = 'Usu'#225'rio de Aplicativo M'#243'vel'
    ShowButton = True
    Style = csDropDown
    MapList = True
    AllowClearKey = False
    DataField = 'cfg_userapp'
    DataSource = dsMovimento
    DropDownCount = 8
    ItemHeight = 0
    Items.Strings = (
      'N'#227'o'#9'0'
      'Sim'#9'1')
    Sorted = False
    TabOrder = 16
    UnboundDataType = wwDefault
  end
  object wwDBComboBox1: TwwDBComboBox [38]
    Left = 371
    Top = 161
    Width = 86
    Height = 21
    Hint = 'Usu'#225'rio de Aplicativo M'#243'vel'
    ShowButton = True
    Style = csDropDown
    MapList = True
    AllowClearKey = False
    DataField = 'cfg_autupdcom'
    DataSource = dsMovimento
    DropDownCount = 8
    ItemHeight = 0
    Items.Strings = (
      'N'#227'o'#9'0'
      'Sim'#9'1')
    Sorted = False
    TabOrder = 17
    UnboundDataType = wwDefault
  end
  object cbDelivery: TwwDBComboBox [39]
    Left = 8
    Top = 207
    Width = 94
    Height = 21
    Hint = 'Usu'#225'rio de AMDelivery'
    ShowButton = True
    Style = csDropDown
    MapList = True
    AllowClearKey = False
    DataField = 'cfg_delivery'
    DataSource = dsMovimento
    DropDownCount = 8
    ItemHeight = 0
    Items.Strings = (
      'N'#227'o'#9'0'
      'Sim'#9'1')
    Sorted = False
    TabOrder = 18
    UnboundDataType = wwDefault
  end
  inherited dsMovimento: TDataSource
    DataSet = dmConfig.qyConfig
    OnStateChange = dsMovimentoStateChange
    Top = 8
  end
  object dsFuncionarios: TDataSource
    DataSet = dmCadastros.qyFuncionarios
    OnStateChange = dsFuncionariosStateChange
    Left = 144
    Top = 8
  end
end
