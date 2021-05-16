inherited frmEntradaManual: TfrmEntradaManual
  Caption = 'Entrada Manual no Estoque'
  ClientHeight = 632
  ClientWidth = 738
  OnKeyPress = FormKeyPress
  ExplicitWidth = 744
  ExplicitHeight = 661
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel [0]
    Left = 8
    Top = 224
    Width = 25
    Height = 13
    Caption = 'Itens'
  end
  object Label7: TLabel [1]
    Left = 8
    Top = 119
    Width = 3
    Height = 13
  end
  inherited btFechar: TBitBtn
    Left = 625
    Top = 599
    TabOrder = 3
    ExplicitLeft = 625
    ExplicitTop = 638
  end
  object pnFornecedor: TPanel
    Left = 0
    Top = 0
    Width = 738
    Height = 107
    Hint = 'S'#233'rie'
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 55
      Height = 13
      Caption = 'Fornecedor'
    end
    object Label2: TLabel
      Left = 541
      Top = 8
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object Label3: TLabel
      Left = 8
      Top = 53
      Width = 20
      Height = 13
      Caption = 'Tipo'
    end
    object Label4: TLabel
      Left = 542
      Top = 53
      Width = 23
      Height = 13
      Caption = 'Nota'
    end
    object Label5: TLabel
      Left = 670
      Top = 53
      Width = 24
      Height = 13
      Caption = 'S'#233'rie'
    end
    object cbFornecedor: TwwDBLookupCombo
      Left = 8
      Top = 26
      Width = 475
      Height = 21
      Hint = 'Digite a busca e tecle ENTER'
      DropDownAlignment = taLeftJustify
      LookupTable = dmLookups.qyLkFornecedores
      LookupField = 'PES_NOME'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnExit = cbFornecedorExit
      OnKeyPress = cbFornecedorKeyPress
    end
    object dtpData: TDateTimePicker
      Left = 541
      Top = 26
      Width = 191
      Height = 21
      Hint = 'Data da entrada'
      Date = 43935.000000000000000000
      Time = 0.717090486112283500
      TabOrder = 1
      OnKeyPress = dtpDataKeyPress
    end
    object cbTipo: TwwDBLookupCombo
      Left = 8
      Top = 72
      Width = 476
      Height = 21
      Hint = 'Tipo de NF'
      DropDownAlignment = taLeftJustify
      LookupTable = dmLookups.qyLkModDoc
      LookupField = 'MDC_DESCRICAO'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnExit = cbTipoExit
      OnKeyPress = cbTipoKeyPress
    end
    object edNF: TEdit
      Left = 542
      Top = 72
      Width = 120
      Height = 21
      Hint = 'NF'
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 3
      Text = 'edNF'
      OnExit = edNFExit
      OnKeyPress = edNFKeyPress
    end
    object edSerie: TEdit
      Left = 670
      Top = 72
      Width = 62
      Height = 21
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 4
      Text = 'edSerie'
      OnExit = edSerieExit
      OnKeyPress = edSerieKeyPress
    end
    object dbModDoc: TDBEdit
      Left = 490
      Top = 72
      Width = 46
      Height = 21
      Hint = 'C'#243'digo do tipo de NF'
      TabStop = False
      DataField = 'MDC_CODIGO'
      DataSource = dsModDoc
      ReadOnly = True
      TabOrder = 5
    end
    object edCodFornecedor: TEdit
      Left = 489
      Top = 26
      Width = 46
      Height = 21
      Hint = 'C'#243'digo do Fornecedor'
      TabStop = False
      ReadOnly = True
      TabOrder = 6
      Text = 'edCodFornecedor'
    end
  end
  object GridTemp: TDBGrid
    Left = 8
    Top = 243
    Width = 724
    Height = 350
    Hint = 'Itens'
    TabStop = False
    DataSource = dsEntTemp
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Lancamento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Width = 430
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Visible = True
      end>
  end
  object pnCodBar: TPanel
    Left = 0
    Top = 107
    Width = 738
    Height = 111
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label8: TLabel
      Left = 8
      Top = 8
      Width = 220
      Height = 20
      Caption = 'C'#243'digo (Barras ou Produto)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 151
      Top = 37
      Width = 81
      Height = 20
      Caption = 'Quant. (F9)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 8
      Top = 37
      Width = 92
      Height = 20
      Caption = 'C'#243'digo (F10)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edQtde: TEdit
      Left = 151
      Top = 63
      Width = 81
      Height = 28
      Hint = 'Quantidade a ser lida'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'edQtde'
      OnExit = edQtdeExit
      OnKeyPress = edQtdeKeyPress
    end
    object edCodBar: TEdit
      Left = 8
      Top = 63
      Width = 137
      Height = 28
      Hint = 'C'#243'digo de Barras ou do Produto'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 14
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
      Text = 'edCodBar'
      OnExit = edCodBarExit
      OnKeyPress = edCodBarKeyPress
    end
    object btProcurar: TBitBtn
      Left = 638
      Top = 6
      Width = 94
      Height = 25
      Hint = 'Procurar produto'
      ParentCustomHint = False
      Action = actProcProd
      Caption = 'Procurar (F4)'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000975A700075C84000C6F
        9D00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000670A4003F9AB8006E533B001521
        260018769F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000670A40031CDFF0050A8BF00FFDAA0007C5F
        45001B3B4C00FF00FF000052860000528600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000670A4002FBFF00028ACDF0059D2FE0078C9E700E3BB8F00D7A8
        7900283239001D7BAB0000528600005286000A587E00FF00FF00FF00FF00FF00
        FF000670A40043D0FE006CDEFF005CB4DB00AEDDF300F1FFFF00DEDBD5009B88
        73002C5F76005FBDE60065BFE000837561001716150004557F000C7BAE002998
        C80077DDFF00A3E5FF00CFF1FF00DBF0F9005AA9C800B1D8E9008BCAE500379A
        C6001AABDA004AD0FF002EB8E700D0BE9D007C563900023B5700086C9F000670
        A400CDEBF900FAFFFF00F2FCFF00DBF5FF0060BDE0000697C600008EBC000089
        B8000BA9D50034C7FA0033CFFF007EB8BF008B6B4C00014262000670A400BCDB
        EA000670A400A1D2E60093D9F70072DBFF0053D6FF0033C0F100189CCE00058C
        BC0000A0CB001FB5E40037CBFC0023B1E5001A668700025F8F00FF00FF000670
        A4000670A4000670A40026A1D20026ADE00031C2F50037C9FB0034C4F7002AB5
        E700128DBE000172A1000F7BAF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000E85B8000C7EB2001393C5000B8DC000006C
        9F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TabStop = False
    end
    object edDescProd: TEdit
      Left = 238
      Top = 63
      Width = 415
      Height = 28
      TabStop = False
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      Text = 'edDescProd'
    end
    object edCodigo: TEdit
      Left = 659
      Top = 63
      Width = 73
      Height = 28
      Hint = 'Quantidade a ser lida'
      TabStop = False
      Alignment = taRightJustify
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Text = 'edCodigo'
    end
  end
  object btGravar: TBitBtn
    Left = 514
    Top = 599
    Width = 105
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
    TabOrder = 2
    OnClick = btGravarClick
    ExplicitTop = 638
  end
  object dsEntTemp: TDataSource
    DataSet = dmTemp.mdEntManual
    Left = 136
    Top = 8
  end
  object ActionList1: TActionList
    Left = 32
    Top = 384
    object actQtde: TAction
      ShortCut = 120
      OnExecute = actQtdeExecute
    end
    object actCodBar: TAction
      ShortCut = 121
      OnExecute = actCodBarExecute
    end
    object actProcProd: TAction
      Caption = 'Procurar (F4)'
      ShortCut = 115
      OnExecute = actProcProdExecute
    end
  end
  object dsModDoc: TDataSource
    DataSet = dmLookups.qyLkModDoc
    Left = 200
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 152
    Top = 400
    object Excluir1: TMenuItem
      Caption = 'Excluir'
      OnClick = Excluir1Click
    end
  end
end
