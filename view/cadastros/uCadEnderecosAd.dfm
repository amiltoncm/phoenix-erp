inherited frmCadEnderecosAd: TfrmCadEnderecosAd
  Caption = 'Endere'#231'o adicional'
  ClientHeight = 182
  ClientWidth = 818
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  ExplicitWidth = 824
  ExplicitHeight = 210
  PixelsPerInch = 96
  TextHeight = 13
  object Label18: TLabel [0]
    Left = 9
    Top = 11
    Width = 20
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'Tipo'
  end
  object Label19: TLabel [1]
    Left = 153
    Top = 11
    Width = 90
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'Tipo de logradouro'
  end
  object Label20: TLabel [2]
    Left = 251
    Top = 11
    Width = 55
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'Logradouro'
    FocusControl = dbLogradouroEnd
  end
  object Label21: TLabel [3]
    Left = 738
    Top = 11
    Width = 37
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'N'#250'mero'
    FocusControl = dbNumeroEnd
  end
  object Label22: TLabel [4]
    Left = 9
    Top = 57
    Width = 64
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'Complemento'
    FocusControl = dbComplementoEnd
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label23: TLabel [5]
    Left = 351
    Top = 57
    Width = 28
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'Bairro'
    FocusControl = dbBairroEnd
  end
  object Label27: TLabel [6]
    Left = 689
    Top = 57
    Width = 19
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'CEP'
    FocusControl = dbCepEnd
  end
  object Label24: TLabel [7]
    Left = 9
    Top = 103
    Width = 68
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'Pt. Refer'#234'ncia'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label28: TLabel [8]
    Left = 409
    Top = 103
    Width = 56
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'Cidade / UF'
  end
  object Label25: TLabel [9]
    Left = 780
    Top = 103
    Width = 13
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'UF'
    FocusControl = dbUfEnd
  end
  inherited btFechar: TBitBtn
    Left = 705
    Top = 149
    TabOrder = 11
    ExplicitLeft = 704
    ExplicitTop = 371
  end
  object cbTipoEnd: TwwDBLookupCombo [11]
    Left = 9
    Top = 30
    Width = 138
    Height = 21
    CustomHint = BalloonHint1
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'TPE_DESCRICAO'#9'20'#9'Tipo de endere'#231'o'#9#9)
    DataField = 'TPE_DESCRICAO'
    DataSource = dsEnderecos
    LookupTable = dmLookups.qyLkTpEndereco
    LookupField = 'TPE_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 0
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
    OnExit = cbTipoEndExit
  end
  object cbTpLogradouroEnd: TwwDBLookupCombo [12]
    Left = 153
    Top = 30
    Width = 92
    Height = 21
    CustomHint = BalloonHint1
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'TPL_DESCRICAO'#9'20'#9'Tipo'#9#9)
    DataField = 'TPL_DESCRICAO'
    DataSource = dsEnderecos
    LookupTable = dmLookups.qyLkTpLogradouro
    LookupField = 'TPL_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 1
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
    OnExit = cbTpLogradouroEndExit
  end
  object dbLogradouroEnd: TDBEdit [13]
    Left = 251
    Top = 30
    Width = 481
    Height = 21
    CustomHint = BalloonHint1
    DataField = 'END_LOGRADOURO'
    DataSource = dsEnderecos
    TabOrder = 2
  end
  object dbNumeroEnd: TDBEdit [14]
    Left = 738
    Top = 30
    Width = 72
    Height = 21
    CustomHint = BalloonHint1
    DataField = 'END_NUMERO'
    DataSource = dsEnderecos
    TabOrder = 3
  end
  object dbComplementoEnd: TDBEdit [15]
    Left = 9
    Top = 76
    Width = 336
    Height = 21
    CustomHint = BalloonHint1
    DataField = 'END_COMPLEMENTO'
    DataSource = dsEnderecos
    TabOrder = 4
  end
  object dbBairroEnd: TDBEdit [16]
    Left = 351
    Top = 76
    Width = 332
    Height = 21
    CustomHint = BalloonHint1
    DataField = 'END_BAIRRO'
    DataSource = dsEnderecos
    TabOrder = 5
  end
  object dbCepEnd: TDBEdit [17]
    Left = 689
    Top = 76
    Width = 121
    Height = 21
    CustomHint = BalloonHint1
    DataField = 'END_CEP'
    DataSource = dsEnderecos
    TabOrder = 6
  end
  object dbPtReferenciaEnd: TDBEdit [18]
    Left = 9
    Top = 122
    Width = 394
    Height = 21
    CustomHint = BalloonHint1
    DataField = 'END_PTREFERENCIA'
    DataSource = dsEnderecos
    TabOrder = 7
  end
  object cbCidadeEnd: TwwDBLookupCombo [19]
    Left = 409
    Top = 122
    Width = 360
    Height = 21
    CustomHint = BalloonHint1
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CID_MUNICIPIO'#9'50'#9'Cidade'#9#9
      'UF_SIGLA'#9'2'#9'Sigla'#9#9
      'CID_CODIGO'#9'10'#9'C'#243'digo'#9#9)
    DataField = 'CID_MUNICIPIO'
    DataSource = dsEnderecos
    LookupTable = dmLookups.qyLkCidades
    LookupField = 'CID_MUNICIPIO'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 8
    AutoDropDown = True
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
    OnExit = cbCidadeEndExit
  end
  object dbUfEnd: TDBEdit [20]
    Left = 780
    Top = 122
    Width = 30
    Height = 21
    CustomHint = BalloonHint1
    TabStop = False
    DataField = 'UF_SIGLA'
    DataSource = dsEnderecos
    ReadOnly = True
    TabOrder = 9
  end
  object btGravar: TBitBtn [21]
    Left = 594
    Top = 149
    Width = 105
    Height = 25
    Hint = 'Fecha a janela'
    CustomHint = BalloonHint1
    Anchors = [akRight, akBottom]
    Caption = '&Gravar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FF0955A10857A60557AA0655A70954A00954A0FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0872DD0362C3006CDB0877E711
      7DEA0877E70069DD005DC70654A50654A5FF00FFFF00FFFF00FFFF00FFFF00FF
      0F6BC90872DD3E99F591C4F9D6E9FDEEF7FFE4F1FFB0D4FB59A5F50570E5035A
      B70B5095FF00FFFF00FFFF00FF1278E0127CE870B4F9F6FAFEFFFFFFEEF6FDD3
      E6FBE2EEFDFFFFFFFFFFFFAED2FA0E78ED025AB60653A2FF00FFFF00FF1278E0
      6DB2F9FEFEFFF4F9FE77B6F63391F0B5D5F91B7FEA4693EEC9E0FAFFFFFFB0D5
      FA0970E60653A2FF00FF0B70D53695F4E8F3FEFFFFFF4FA3F61F88F2D4E7FCFF
      FFFF489BEF0065E60E74E8C9E1FAFFFFFF58A5F5005EC70858AB137AE371B5FB
      FFFFFFB2D7FC469FF7DEEEFDFDFEFEE0EEFDA1CCF80173E9006AE74294EDFFFF
      FFB3D7FB016BDE0858AB1F85ECA2CFFDFFFFFF71B7FDACD4FDFAFCFF66AFF83F
      9AF5E2EFFD2D8EF00075EB0575E9E2EEFCE6F3FF0E7BE9065AB02F8FF1B7DAFD
      FFFFFF6BB4FF3C9DFE4FA5FB1D8AF81484F5A0CDFB84BDF8067AEF0374EBD4E8
      FBF0F8FF1A82EC055CB53693F0B8DAFEFFFFFF8EC6FF2391FF2E95FE2B93FC21
      8CF92D92F79ACAFB1D86F21D86F0F3F8FED9EBFE117DE9095CB22689EDAFD6FD
      FFFFFFE1F0FF3499FF2F96FF3399FF2E94FD218CF950A4F9419BF77DBBF8FFFF
      FF99C9FA0773E10958ABFF00FF3994F0F1F8FFFFFFFFADD6FF3499FF2592FF28
      93FF238FFC1788FA6FB4FAF4FAFFF5FAFE49A0F7076ACEFF00FFFF00FF3994F0
      CDE6FFF6FAFFFFFFFFE0EFFF8DC6FF6EB6FE79BBFFB6DAFEFFFFFFFFFFFF78B9
      F9137BE6076ACEFF00FFFF00FFFF00FF64ACF6D4EAFFF9FCFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFE7F3FE77B8FA1D85ED0D6DD0FF00FFFF00FFFF00FFFF00FF
      FF00FF459AF0A7D2FCD8ECFFE2F1FFE4F1FED1E7FE9DCDFD4DA2F7177FE8177F
      E8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3B94F061ABF665
      ADF7489EF42286EC127AE4FF00FFFF00FFFF00FFFF00FFFF00FF}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = btGravarClick
  end
  object dsEnderecos: TDataSource
    DataSet = dmPessoas.qyEnderecos
    Left = 424
    Top = 8
  end
end
