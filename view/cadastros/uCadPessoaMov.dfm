inherited frmCadPessoaMov: TfrmCadPessoaMov
  Caption = 'Cadastro de Pessoas (Simplificado)'
  ClientHeight = 280
  ClientWidth = 879
  OnClose = FormClose
  ExplicitWidth = 885
  ExplicitHeight = 309
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 9
    Top = 11
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
    FocusControl = dbCodigo
  end
  object Label2: TLabel [1]
    Left = 91
    Top = 11
    Width = 20
    Height = 13
    Caption = 'Tipo'
  end
  object Label3: TLabel [2]
    Left = 263
    Top = 11
    Width = 97
    Height = 13
    Caption = 'Raz'#227'o Social / Nome'
    FocusControl = dbNome
  end
  object Label17: TLabel [3]
    Left = 799
    Top = 11
    Width = 25
    Height = 13
    Caption = 'Ativo'
  end
  object Label4: TLabel [4]
    Left = 9
    Top = 57
    Width = 116
    Height = 13
    Caption = 'Nome Fantasia / Apelido'
    FocusControl = dbFantasia
  end
  object Label5: TLabel [5]
    Left = 595
    Top = 57
    Width = 54
    Height = 13
    Caption = 'CNPJ / CPF'
    FocusControl = dbDocumento
  end
  object Label6: TLabel [6]
    Left = 762
    Top = 57
    Width = 78
    Height = 13
    Caption = 'Insc. Est. / R.G.'
    FocusControl = dbIdentificacao
  end
  object Label7: TLabel [7]
    Left = 9
    Top = 103
    Width = 55
    Height = 13
    Caption = 'Logradouro'
  end
  object Label8: TLabel [8]
    Left = 781
    Top = 103
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
    FocusControl = dbNumero
  end
  object Label9: TLabel [9]
    Left = 9
    Top = 149
    Width = 64
    Height = 13
    Caption = 'Complemento'
    FocusControl = dbComplemento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel [10]
    Left = 169
    Top = 149
    Width = 28
    Height = 13
    Caption = 'Bairro'
    FocusControl = dbBairro
  end
  object Label11: TLabel [11]
    Left = 466
    Top = 149
    Width = 56
    Height = 13
    Caption = 'Cidade / UF'
  end
  object Label13: TLabel [12]
    Left = 762
    Top = 149
    Width = 13
    Height = 13
    Caption = 'UF'
    FocusControl = dbUf
  end
  object Label12: TLabel [13]
    Left = 796
    Top = 149
    Width = 69
    Height = 13
    Caption = 'C'#243'd. Munic'#237'pio'
    FocusControl = dbCodMunicipio
  end
  object Label14: TLabel [14]
    Left = 9
    Top = 195
    Width = 68
    Height = 13
    Caption = 'Pt. Refer'#234'ncia'
    FocusControl = dbPtRefer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label15: TLabel [15]
    Left = 409
    Top = 195
    Width = 24
    Height = 13
    Caption = 'Fone'
    FocusControl = dbFone
  end
  object Label16: TLabel [16]
    Left = 560
    Top = 195
    Width = 19
    Height = 13
    Caption = 'CEP'
    FocusControl = dbCep
  end
  inherited btFechar: TBitBtn
    Left = 766
    Top = 247
    ExplicitLeft = 766
    ExplicitTop = 247
  end
  object dbCodigo: TDBEdit [18]
    Left = 9
    Top = 30
    Width = 76
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'PES_CODIGO'
    DataSource = dsMovimento
    ReadOnly = True
    TabOrder = 1
  end
  object cbTipo: TwwDBComboBox [19]
    Left = 91
    Top = 30
    Width = 166
    Height = 21
    ShowButton = True
    Style = csDropDown
    MapList = True
    AllowClearKey = False
    AutoDropDown = True
    ShowMatchText = True
    DataField = 'PES_TIPO'
    DataSource = dsMovimento
    DropDownCount = 8
    ItemHeight = 0
    Items.Strings = (
      'Pessoas F'#237'sica'#9'F'
      'Pessoa Jur'#237'dica'#9'J')
    Sorted = False
    TabOrder = 2
    UnboundDataType = wwDefault
    OnExit = cbTipoExit
  end
  object dbNome: TDBEdit [20]
    Left = 263
    Top = 30
    Width = 530
    Height = 21
    DataField = 'PES_NOME'
    DataSource = dsMovimento
    TabOrder = 3
    OnExit = dbNomeExit
  end
  object cbAtivo: TwwDBComboBox [21]
    Left = 798
    Top = 30
    Width = 72
    Height = 21
    ShowButton = True
    Style = csDropDown
    MapList = True
    AllowClearKey = False
    AutoDropDown = True
    ShowMatchText = True
    DataField = 'PES_ATIVO'
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
  object dbFantasia: TDBEdit [22]
    Left = 9
    Top = 76
    Width = 580
    Height = 21
    DataField = 'PES_NOMEFANTASIA'
    DataSource = dsMovimento
    TabOrder = 5
  end
  object dbDocumento: TDBEdit [23]
    Left = 595
    Top = 76
    Width = 161
    Height = 21
    DataField = 'PES_DOCUMENTO'
    DataSource = dsMovimento
    TabOrder = 6
  end
  object dbIdentificacao: TDBEdit [24]
    Left = 760
    Top = 76
    Width = 109
    Height = 21
    DataField = 'PES_IDENTIFICACAO'
    DataSource = dsMovimento
    TabOrder = 7
  end
  object cbTpLogradouro: TwwDBLookupCombo [25]
    Left = 9
    Top = 122
    Width = 154
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'TPL_DESCRICAO'#9'20'#9'Tipo'#9#9)
    DataField = 'TPL_DESCRICAO'
    DataSource = dsMovimento
    LookupTable = dmLookups.qyLkTpLogradouro
    LookupField = 'TPL_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 8
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
  end
  object dbLogradouro: TDBEdit [26]
    Left = 169
    Top = 122
    Width = 606
    Height = 21
    DataField = 'PES_LOGRADOURO'
    DataSource = dsMovimento
    TabOrder = 9
  end
  object dbNumero: TDBEdit [27]
    Left = 779
    Top = 122
    Width = 90
    Height = 21
    DataField = 'PES_NUMERO'
    DataSource = dsMovimento
    TabOrder = 10
  end
  object dbComplemento: TDBEdit [28]
    Left = 9
    Top = 168
    Width = 154
    Height = 21
    DataField = 'PES_COMPLEMENTO'
    DataSource = dsMovimento
    TabOrder = 11
  end
  object dbBairro: TDBEdit [29]
    Left = 169
    Top = 168
    Width = 291
    Height = 21
    DataField = 'PES_BAIRRO'
    DataSource = dsMovimento
    TabOrder = 12
  end
  object cbCidade: TwwDBLookupCombo [30]
    Left = 466
    Top = 168
    Width = 290
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CID_MUNICIPIO'#9'50'#9'Cidade'#9#9
      'UF_SIGLA'#9'2'#9'Sigla'#9#9
      'CID_CODIGO'#9'10'#9'C'#243'digo'#9#9)
    DataField = 'CID_MUNICIPIO'
    DataSource = dsMovimento
    LookupTable = dmLookups.qyLkCidades
    LookupField = 'CID_MUNICIPIO'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 13
    AutoDropDown = True
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
  end
  object dbUf: TDBEdit [31]
    Left = 762
    Top = 168
    Width = 30
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'UF_SIGLA'
    DataSource = dsMovimento
    ReadOnly = True
    TabOrder = 14
  end
  object dbCodMunicipio: TDBEdit [32]
    Left = 796
    Top = 168
    Width = 73
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'CID_CODIGO'
    DataSource = dsMovimento
    ReadOnly = True
    TabOrder = 15
  end
  object dbPtRefer: TDBEdit [33]
    Left = 9
    Top = 214
    Width = 394
    Height = 21
    DataField = 'PES_PTREFERENCIA'
    DataSource = dsMovimento
    TabOrder = 16
  end
  object dbFone: TDBEdit [34]
    Left = 409
    Top = 214
    Width = 145
    Height = 21
    DataField = 'PES_FONE'
    DataSource = dsMovimento
    TabOrder = 17
  end
  object dbCep: TDBEdit [35]
    Left = 560
    Top = 214
    Width = 106
    Height = 21
    DataField = 'PES_CEP'
    DataSource = dsMovimento
    TabOrder = 18
  end
  object DBCheckBox1: TDBCheckBox [36]
    Left = 9
    Top = 247
    Width = 97
    Height = 17
    Caption = 'Cliente'
    DataField = 'PES_CLIENTE'
    DataSource = dsMovimento
    TabOrder = 19
    ValueChecked = 'S'
    ValueUnchecked = 'N'
  end
  object DBCheckBox2: TDBCheckBox [37]
    Left = 116
    Top = 247
    Width = 97
    Height = 17
    Caption = 'Fornecedor'
    DataField = 'PES_FORNECEDOR'
    DataSource = dsMovimento
    TabOrder = 20
    ValueChecked = 'S'
    ValueUnchecked = 'N'
  end
  object DBCheckBox3: TDBCheckBox [38]
    Left = 249
    Top = 247
    Width = 97
    Height = 17
    Caption = 'Transportadora'
    DataField = 'PES_TRANSPORTADORA'
    DataSource = dsMovimento
    TabOrder = 21
    ValueChecked = 'S'
    ValueUnchecked = 'N'
  end
  object btGravar: TBitBtn [39]
    Left = 655
    Top = 247
    Width = 105
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
    TabOrder = 22
    OnClick = btGravarClick
  end
  inherited dsMovimento: TDataSource
    DataSet = dmPessoas.qyPessoas
    Left = 312
    Top = 160
  end
end
