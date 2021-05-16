inherited frmEmpresa: TfrmEmpresa
  Caption = 'Empresa'
  ClientHeight = 325
  ClientWidth = 747
  OnKeyPress = FormKeyPress
  ExplicitWidth = 753
  ExplicitHeight = 354
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 11
    Height = 13
    Caption = 'ID'
    FocusControl = dbID
  end
  object Label2: TLabel [1]
    Left = 55
    Top = 8
    Width = 60
    Height = 13
    Caption = 'Raz'#227'o Social'
    FocusControl = dbRazao
  end
  object Label3: TLabel [2]
    Left = 578
    Top = 8
    Width = 25
    Height = 13
    Caption = 'CNPJ'
    FocusControl = dbCNPJ
  end
  object Label4: TLabel [3]
    Left = 459
    Top = 50
    Width = 46
    Height = 13
    Caption = 'Insc. Est.'
    FocusControl = dbIe
  end
  object Label5: TLabel [4]
    Left = 603
    Top = 51
    Width = 51
    Height = 13
    Caption = 'Insc. Mun.'
    FocusControl = dbInscMun
  end
  object Label6: TLabel [5]
    Left = 8
    Top = 96
    Width = 55
    Height = 13
    Caption = 'Logradouro'
    FocusControl = dbLogradouro
  end
  object Label7: TLabel [6]
    Left = 658
    Top = 96
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
    FocusControl = dbNumero
  end
  object Label8: TLabel [7]
    Left = 8
    Top = 139
    Width = 65
    Height = 13
    Caption = 'Complemento'
    FocusControl = dbComplemento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel [8]
    Left = 359
    Top = 139
    Width = 28
    Height = 13
    Caption = 'Bairro'
    FocusControl = dbBairro
  end
  object Label10: TLabel [9]
    Left = 8
    Top = 187
    Width = 33
    Height = 13
    Caption = 'Cidade'
    FocusControl = dbCidade
  end
  object Label11: TLabel [10]
    Left = 442
    Top = 187
    Width = 13
    Height = 13
    Caption = 'UF'
    FocusControl = dbUf
  end
  object Label12: TLabel [11]
    Left = 546
    Top = 185
    Width = 19
    Height = 13
    Caption = 'CEP'
    FocusControl = dbCep
  end
  object Label13: TLabel [12]
    Left = 649
    Top = 187
    Width = 24
    Height = 13
    Caption = 'Fone'
    FocusControl = dbFone
  end
  object Label14: TLabel [13]
    Left = 8
    Top = 231
    Width = 28
    Height = 13
    Caption = 'e-mail'
    FocusControl = dbEmail
  end
  object Label15: TLabel [14]
    Left = 374
    Top = 233
    Width = 54
    Height = 13
    Caption = 'Home Page'
    FocusControl = dbHomePage
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label16: TLabel [15]
    Left = 478
    Top = 187
    Width = 45
    Height = 13
    Caption = 'C'#243'd. Pais'
    FocusControl = dbUf
  end
  object Label17: TLabel [16]
    Left = 374
    Top = 187
    Width = 59
    Height = 13
    Caption = 'C'#243'd. Cidade'
    FocusControl = dbUf
  end
  object Label18: TLabel [17]
    Left = 8
    Top = 277
    Width = 35
    Height = 13
    Caption = 'Regime'
  end
  object Label19: TLabel [18]
    Left = 374
    Top = 278
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label20: TLabel [19]
    Left = 8
    Top = 50
    Width = 71
    Height = 13
    Caption = 'Nome Fantasia'
  end
  object sbBuscaCep: TSpeedButton [20]
    Left = 454
    Top = 295
    Width = 23
    Height = 22
    Hint = 'Busca endere'#231'o pelo CEP'
    Flat = True
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFB2B2B2949393FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFBDBEBE9495959B9B9BFF00FFFF00FF
      FF00FFFF00FFFF00FF815148876C5F8A8877948678FF00FFFF00FFFF00FFACAC
      AC999A9A9D9E9EFF00FFFF00FFFF00FFFF00FF662C166A392674493968715869
      8B717D9C8494AD9A9C95899C9999A0A0A09EA0A0FF00FFFF00FFFF00FFFF00FF
      75310B6C26006D270260421C63836D747B757F827F89908A8C908A9FA0A09593
      92FF00FFFF00FFFF00FFFF00FF8B410E8140044D611B50631A7582747B92798C
      B2898FAF8E95AD979A9F99918F90886C67FF00FFFF00FFFF00FFFF00FFA35405
      4B8223238514688C6076906C8DBB808BB57F89AE7F87A88189A98BA0A19D7864
      5FFF00FFFF00FFFF00FFA75A11B96B014699272A9D0D73816C92C57190C0768E
      BA778DB97C89B37F89AE8490A58B8A7B78603229FF00FFFF00FFB46C13CC8A0F
      60B2413BB11E7A8C6F97CE7095CE8093CA808FBE7B86C48A89B07A84A3778D87
      82452A13FF00FFFF00FFBE7E1FDBA62CD7B8486CD1707B8B77A0DD95BED894AF
      D493A9C6868CC1818BAE7387AA8381887B2C461BFF00FFFF00FFC4882EE8BC4F
      F0D075CCE19D87A2919CC68E9CDF999BDFA68FCE9692C2818FBD7894A18A4465
      3F2A3E15FF00FFFF00FFFF00FFEECA6AF7DF9AF4EEBFC8E6C389908B96C9959C
      D4818FD19182C9878BAF8B7E8D7A0E570EFF00FFFF00FFFF00FFFF00FF89B23F
      FAE3A9FEF1CAD9EDCBB5D7B087A2908F9C8895A48B8F9E8E6E936C2A73242460
      23FF00FFFF00FFFF00FFFF00FFFF00FF6EC44DCFE498C1DD89D4E0A148DA8B4B
      CE8558BC7346AE6C308E392C7B3AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF1AAB101DC221A1C759B4C9718DC0655FC47854BA82649670FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF58914748913A5B
      8733588F53FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    OnClick = sbBuscaCepClick
  end
  inherited btFechar: TBitBtn
    Left = 634
    Top = 292
    TabOrder = 21
    ExplicitLeft = 634
    ExplicitTop = 292
  end
  object dbID: TDBEdit [22]
    Left = 8
    Top = 24
    Width = 41
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'EMP_CODIGO'
    DataSource = dsMovimento
    ReadOnly = True
    TabOrder = 0
  end
  object dbRazao: TDBEdit [23]
    Left = 55
    Top = 24
    Width = 517
    Height = 21
    DataField = 'EMP_RAZAO'
    DataSource = dsMovimento
    TabOrder = 1
  end
  object dbCNPJ: TDBEdit [24]
    Left = 578
    Top = 23
    Width = 161
    Height = 21
    DataField = 'EMP_CNPJ'
    DataSource = dsMovimento
    TabOrder = 2
  end
  object dbIe: TDBEdit [25]
    Left = 459
    Top = 69
    Width = 138
    Height = 21
    DataField = 'EMP_IE'
    DataSource = dsMovimento
    TabOrder = 4
  end
  object dbInscMun: TDBEdit [26]
    Left = 603
    Top = 69
    Width = 136
    Height = 21
    DataField = 'EMP_IMUN'
    DataSource = dsMovimento
    TabOrder = 5
  end
  object dbLogradouro: TDBEdit [27]
    Left = 8
    Top = 115
    Width = 644
    Height = 21
    DataField = 'EMP_LOGRADOURO'
    DataSource = dsMovimento
    TabOrder = 6
  end
  object dbNumero: TDBEdit [28]
    Left = 658
    Top = 115
    Width = 81
    Height = 21
    DataField = 'EMP_NUMERO'
    DataSource = dsMovimento
    TabOrder = 7
  end
  object dbComplemento: TDBEdit [29]
    Left = 8
    Top = 158
    Width = 345
    Height = 21
    DataField = 'EMP_COMPLEMENTO'
    DataSource = dsMovimento
    TabOrder = 8
  end
  object dbBairro: TDBEdit [30]
    Left = 359
    Top = 158
    Width = 380
    Height = 21
    DataField = 'EMP_BAIRRO'
    DataSource = dsMovimento
    TabOrder = 9
  end
  object dbCidade: TDBEdit [31]
    Left = 8
    Top = 206
    Width = 360
    Height = 21
    DataField = 'EMP_CIDADE'
    DataSource = dsMovimento
    TabOrder = 10
  end
  object dbUf: TDBEdit [32]
    Left = 442
    Top = 206
    Width = 30
    Height = 21
    DataField = 'EMP_UF'
    DataSource = dsMovimento
    TabOrder = 12
  end
  object dbCep: TDBEdit [33]
    Left = 546
    Top = 204
    Width = 97
    Height = 21
    DataField = 'EMP_CEP'
    DataSource = dsMovimento
    TabOrder = 14
  end
  object dbFone: TDBEdit [34]
    Left = 649
    Top = 206
    Width = 90
    Height = 21
    DataField = 'EMP_FONE'
    DataSource = dsMovimento
    TabOrder = 15
  end
  object dbEmail: TDBEdit [35]
    Left = 8
    Top = 250
    Width = 360
    Height = 21
    DataField = 'EMP_EMAIL'
    DataSource = dsMovimento
    TabOrder = 16
  end
  object dbHomePage: TDBEdit [36]
    Left = 374
    Top = 250
    Width = 365
    Height = 21
    DataField = 'EMP_HOMEPAGE'
    DataSource = dsMovimento
    TabOrder = 17
  end
  object btGravar: TBitBtn [37]
    Left = 534
    Top = 292
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
    TabOrder = 20
    OnClick = btGravarClick
  end
  object dbFantasia: TDBEdit [38]
    Left = 8
    Top = 69
    Width = 445
    Height = 21
    DataField = 'EMP_FANTASIA'
    DataSource = dsMovimento
    TabOrder = 3
  end
  object dbCodCidade: TDBEdit [39]
    Left = 374
    Top = 206
    Width = 62
    Height = 21
    DataField = 'EMP_CODCIDADE'
    DataSource = dsMovimento
    TabOrder = 11
  end
  object dbCodPais: TDBEdit [40]
    Left = 478
    Top = 206
    Width = 62
    Height = 21
    DataField = 'EMP_CODPAIS'
    DataSource = dsMovimento
    TabOrder = 13
  end
  object cbRegime: TwwDBLookupCombo [41]
    Left = 8
    Top = 296
    Width = 360
    Height = 21
    DropDownAlignment = taLeftJustify
    DataField = 'REG_DESCRICAO'
    DataSource = dsMovimento
    LookupTable = dmLookups.qyLkRegime
    LookupField = 'REG_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 18
    AutoDropDown = True
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
    OnExit = cbRegimeExit
  end
  object dbCodRegime: TDBEdit [42]
    Left = 374
    Top = 296
    Width = 62
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'REG_CODIGO'
    DataSource = dsMovimento
    ReadOnly = True
    TabOrder = 19
  end
  inherited dsMovimento: TDataSource
    DataSet = dmConfig.qyEmpresa
    OnStateChange = dsMovimentoStateChange
    Left = 72
    Top = 72
  end
end
