inherited frmVincProdFor: TfrmVincProdFor
  Caption = 'Vincular Produto  X Fornecedor'
  ClientHeight = 232
  ClientWidth = 648
  OnCloseQuery = FormCloseQuery
  ExplicitWidth = 654
  ExplicitHeight = 261
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 48
    Width = 38
    Height = 13
    Caption = 'Produto'
  end
  object Label2: TLabel [1]
    Left = 546
    Top = 48
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label3: TLabel [2]
    Left = 8
    Top = 94
    Width = 55
    Height = 13
    Caption = 'Fornecedor'
    FocusControl = dbFornecedor
  end
  object Label4: TLabel [3]
    Left = 546
    Top = 94
    Width = 81
    Height = 13
    Caption = 'C'#243'd. Fornecedor'
    FocusControl = dbCodFornecedor
  end
  object Label5: TLabel [4]
    Left = 8
    Top = 140
    Width = 79
    Height = 13
    Caption = 'Ref. Fornecedor'
    FocusControl = dbReferencia
  end
  object Label6: TLabel [5]
    Left = 176
    Top = 140
    Width = 57
    Height = 13
    Caption = 'C'#243'd. Barras'
    FocusControl = dbCodBarras
  end
  object Label7: TLabel [6]
    Left = 275
    Top = 140
    Width = 57
    Height = 13
    Caption = 'Un. Compra'
    FocusControl = dbUniCp
  end
  object Label8: TLabel [7]
    Left = 338
    Top = 140
    Width = 50
    Height = 13
    Caption = 'Un. Venda'
    FocusControl = bUniVd
  end
  inherited btFechar: TBitBtn
    Left = 535
    Top = 199
    ExplicitLeft = 413
    ExplicitTop = 199
  end
  object cbProduto: TwwDBLookupCombo
    Left = 8
    Top = 67
    Width = 532
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'PRO_DESCRICAO'#9'50'#9'Descri'#231#227'o'#9#9
      'PRO_CODIGO'#9'10'#9'C'#243'digo'#9#9
      'UNI_CODIGO'#9'2'#9'Un.'#9#9)
    DataField = 'PRO_DESCRICAO'
    DataSource = dsProdutosFor
    LookupTable = dmLookups.qyLkProdutos
    LookupField = 'PRO_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 1
    AutoDropDown = True
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
    OnExit = cbProdutoExit
  end
  object dbCodProduto: TDBEdit
    Left = 546
    Top = 67
    Width = 94
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'PRO_CODIGO'
    DataSource = dsProdutosFor
    ReadOnly = True
    TabOrder = 2
  end
  object dbFornecedor: TDBEdit
    Left = 8
    Top = 113
    Width = 532
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'PES_NOME'
    DataSource = dsProdutosFor
    ReadOnly = True
    TabOrder = 3
  end
  object dbCodFornecedor: TDBEdit
    Left = 546
    Top = 113
    Width = 94
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'PES_CODIGO'
    DataSource = dsProdutosFor
    ReadOnly = True
    TabOrder = 4
  end
  object dbReferencia: TDBEdit
    Left = 8
    Top = 159
    Width = 162
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'PRF_REFERENCIA'
    DataSource = dsProdutosFor
    ReadOnly = True
    TabOrder = 5
  end
  object dbCodBarras: TDBEdit
    Left = 176
    Top = 159
    Width = 93
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'PRO_CODBARRAS'
    DataSource = dsProdutosFor
    ReadOnly = True
    TabOrder = 6
  end
  object dbUniCp: TDBEdit
    Left = 275
    Top = 159
    Width = 57
    Height = 21
    DataField = 'PRF_UNIDADECP'
    DataSource = dsProdutosFor
    TabOrder = 7
  end
  object bUniVd: TDBEdit
    Left = 338
    Top = 159
    Width = 57
    Height = 21
    DataField = 'PRF_UNIDADEVD'
    DataSource = dsProdutosFor
    TabOrder = 8
  end
  object btGravar: TBitBtn
    Left = 435
    Top = 199
    Width = 94
    Height = 25
    ParentCustomHint = False
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
    TabOrder = 9
    OnClick = btGravarClick
    ExplicitLeft = 313
  end
  object panProduto: TPanel
    Left = 0
    Top = 0
    Width = 648
    Height = 41
    Align = alTop
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '    panProduto'
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 10
    ExplicitWidth = 526
  end
  object btCadastrar: TBitBtn
    Left = 8
    Top = 199
    Width = 105
    Height = 25
    Caption = '&Cadastrar'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00330F0000330F0000330F0000330F0000330F0000330F0000330F00003815
      0000330F0000381500003815000038150000FF00FF00FF00FF00FF00FF00FF00
      FF00330F0000330F0000613B0900613B09005E3908005C370700593406005632
      0500330F0000D4D4D400D4D4D40038150000FF00FF00FF00FF00FF00FF00FF00
      FF00330F0000330F0000673F0A00673F0A00643D0A00623B09005F3908005C37
      0700330F0000A5A5A500D4D4D40038150000FF00FF00FF00FF00FF00FF00FF00
      FF00330F0000330F000072490E006C440C006A420B0067400B00643E0A00613B
      0900330F0000FFFFFF00D4D4D40038150000FF00FF00FF00FF00FF00FF00FF00
      FF00330F0000330F000072490E0072490E006F470D006D440C006A420B00663F
      0A00330F0000A5A5A500D4D4D40038150000FF00FF00FF00FF00FF00FF00FF00
      FF00330F0000330F00007D521100774D1000754B0F0072490E00633B0A005D36
      0900330F0000FFFFFF00D4D4D40038150000FF00FF00FF00FF00FF00FF00FF00
      FF00330F0000330F00007D5211007D5211007A4F1000774D0F00381500003815
      00003815000038150000381500003815000038150000FF00FF00FF00FF00FF00
      FF00330F0000330F000086591400815613007E5312007B51110038150000FFFF
      FF00875A1400875A1400754B0F00754B0F00330F0000FF00FF00FF00FF00FF00
      FF00330F0000330F00008659140086591400835713008054120038150000330F
      0000330F0000330F0000330F0000330F0000330F0000FF00FF00FF00FF00FF00
      FF00330F0000330F00008E6017008A5D1500875A140084571300805412007C51
      1100330F0000FFFFFF00D4D4D40038150000FF00FF00FF00FF00FF00FF00FF00
      FF00330F0000330F00008E6017008E6017008B5D1600875A1400835713007F54
      1200330F0000A5A5A500D4D4D40038150000FF00FF00FF00FF00FF00FF00FF00
      FF00330F0000330F00009263180092631800330F00008A5D1500865A14008256
      1300330F0000FFFFFF00D4D4D40038150000FF00FF00FF00FF00FF00FF00FF00
      FF00330F0000330F00009566190095661900330F00008D5F1600895C15008558
      1400330F0000A5A5A500D4D4D40038150000FF00FF00FF00FF00FF00FF00FF00
      FF00330F0000330F00009768190097681900330F00008F6117008B5D1600865A
      1400330F0000FFFFFF00D4D4D40038150000FF00FF00FF00FF00FF00FF00FF00
      FF00330F0000330F000099691A0099691A00330F0000916217008C5E1600885B
      1500330F0000D4D4D400D4D4D40038150000FF00FF00FF00FF00FF00FF00FF00
      FF00330F0000330F0000330F0000330F0000330F0000330F0000330F0000330F
      000038150000381500003815000038150000FF00FF00FF00FF00}
    TabOrder = 11
    OnClick = btCadastrarClick
  end
  object dsProdutosFor: TDataSource
    DataSet = dmEstoque.qyProdutosFor
    Left = 184
    Top = 8
  end
  object dsItens: TDataSource
    DataSet = frmImpXMLPag.cdsItens
    Left = 120
    Top = 8
  end
end
