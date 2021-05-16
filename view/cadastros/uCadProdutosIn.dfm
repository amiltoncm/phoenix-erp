inherited frmCadProdutosIn: TfrmCadProdutosIn
  Caption = 'Cadastro de Produtos'
  ClientHeight = 369
  ClientWidth = 994
  ExplicitWidth = 1000
  ExplicitHeight = 397
  PixelsPerInch = 96
  TextHeight = 13
  inherited btFechar: TBitBtn
    Left = 881
    Top = 336
    ExplicitLeft = 881
    ExplicitTop = 336
  end
  object panCaption: TPanel [1]
    Left = 0
    Top = 0
    Width = 994
    Height = 29
    CustomHint = BalloonHint1
    Align = alTop
    Caption = 'frmTmpCadastro'
    Color = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
  object PageCadastro: TPageControl [2]
    Left = 8
    Top = 35
    Width = 867
    Height = 326
    CustomHint = BalloonHint1
    ActivePage = tsDescricao
    TabOrder = 2
    object tsDescricao: TTabSheet
      CustomHint = BalloonHint1
      Caption = 'Descric'#227'o'
      object lbCodigo: TLabel
        Left = 8
        Top = 8
        Width = 33
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Codigo'
        FocusControl = dbCodigo
      end
      object lbDescricao: TLabel
        Left = 81
        Top = 8
        Width = 46
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Descricao'
      end
      object Label1: TLabel
        Left = 434
        Top = 8
        Width = 91
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Unidade de medida'
      end
      object Label2: TLabel
        Left = 597
        Top = 8
        Width = 55
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'C'#243'd. Barras'
        FocusControl = dbCodBarras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 698
        Top = 8
        Width = 54
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Localiza'#231#227'o'
      end
      object Label4: TLabel
        Left = 8
        Top = 54
        Width = 29
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Grupo'
      end
      object Label5: TLabel
        Left = 209
        Top = 54
        Width = 54
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'C'#243'd. grupo'
        FocusControl = dbCodGrupo
      end
      object Label6: TLabel
        Left = 561
        Top = 8
        Width = 33
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Abrev.'
      end
      object Label7: TLabel
        Left = 293
        Top = 54
        Width = 46
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Subgrupo'
      end
      object Label8: TLabel
        Left = 501
        Top = 54
        Width = 72
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'C'#243'd. Subgrupo'
        FocusControl = dbCodSub
      end
      object Label9: TLabel
        Left = 778
        Top = 53
        Width = 55
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'C'#243'd. Marca'
        FocusControl = dbCodMarca
      end
      object Label10: TLabel
        Left = 585
        Top = 54
        Width = 29
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Marca'
      end
      object Label11: TLabel
        Left = 8
        Top = 100
        Width = 31
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Status'
      end
      object Label12: TLabel
        Left = 135
        Top = 100
        Width = 82
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Inativar ao Zerar'
      end
      object Label24: TLabel
        Left = 221
        Top = 100
        Width = 85
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Data de Cadastro'
      end
      object dbCodigo: TDBEdit
        Left = 8
        Top = 27
        Width = 67
        Height = 21
        Hint = 'Codigo'
        CustomHint = BalloonHint1
        TabStop = False
        Color = clBtnFace
        DataField = 'PRO_CODIGO'
        DataSource = dsMovimento
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
      end
      object cbUnidades: TwwDBLookupCombo
        Left = 434
        Top = 27
        Width = 121
        Height = 21
        CustomHint = BalloonHint1
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'UNI_DESCRICAO'#9'10'#9'Descri'#231#227'o'#9#9)
        DataField = 'UNI_DESCRICAO'
        DataSource = dsMovimento
        LookupTable = dmLookups.qyLkUnidades
        LookupField = 'UNI_DESCRICAO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        ShowMatchText = True
        OnExit = cbUnidadesExit
      end
      object dbCodUnidade: TDBEdit
        Left = 561
        Top = 27
        Width = 30
        Height = 21
        CustomHint = BalloonHint1
        TabStop = False
        Color = clBtnFace
        DataField = 'UNI_CODIGO'
        DataSource = dsMovimento
        ReadOnly = True
        TabOrder = 3
      end
      object dbCodBarras: TDBEdit
        Left = 597
        Top = 27
        Width = 95
        Height = 21
        CustomHint = BalloonHint1
        DataField = 'PRO_CODBARRAS'
        DataSource = dsMovimento
        TabOrder = 4
      end
      object cbLocalizacao: TwwDBLookupCombo
        Left = 698
        Top = 27
        Width = 158
        Height = 21
        CustomHint = BalloonHint1
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'LOC_DESCRICAO'#9'20'#9'Descri'#231#227'o'#9#9
          'LOC_CODIGO'#9'10'#9'C'#243'digo'#9#9)
        DataField = 'LOC_DESCRICAO'
        DataSource = dsMovimento
        LookupTable = dmLookups.qyLkLocalizacao
        LookupField = 'LOC_DESCRICAO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        ShowMatchText = True
        OnExit = cbLocalizacaoExit
      end
      object cbGrupos: TwwDBLookupCombo
        Left = 8
        Top = 73
        Width = 195
        Height = 21
        CustomHint = BalloonHint1
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'GRP_DESCRICAO'#9'25'#9'Descri'#231#227'o'#9#9
          'GRP_CODIGO'#9'10'#9'C'#243'digo'#9#9)
        DataField = 'GRP_DESCRICAO'
        DataSource = dsMovimento
        LookupTable = dmLookups.qyLkGrupos
        LookupField = 'GRP_DESCRICAO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        ShowMatchText = True
        OnExit = cbGruposExit
      end
      object dbCodGrupo: TDBEdit
        Left = 209
        Top = 73
        Width = 78
        Height = 21
        CustomHint = BalloonHint1
        TabStop = False
        Color = clBtnFace
        DataField = 'GRP_CODIGO'
        DataSource = dsMovimento
        ReadOnly = True
        TabOrder = 7
      end
      object cbSubgrupo: TwwDBLookupCombo
        Left = 293
        Top = 73
        Width = 202
        Height = 21
        CustomHint = BalloonHint1
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SGR_DESCRICAO'#9'25'#9'Descri'#231#227'o'#9#9
          'SGR_CODIGO'#9'10'#9'C'#243'digo'#9#9)
        DataField = 'SGR_DESCRICAO'
        DataSource = dsMovimento
        LookupTable = dmLookups.qyLkSubGruposCad
        LookupField = 'SGR_DESCRICAO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 8
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        ShowMatchText = True
        OnExit = cbSubgrupoExit
      end
      object dbCodSub: TDBEdit
        Left = 501
        Top = 73
        Width = 78
        Height = 21
        CustomHint = BalloonHint1
        TabStop = False
        Color = clBtnFace
        DataField = 'SGR_CODIGO'
        DataSource = dsMovimento
        ReadOnly = True
        TabOrder = 9
      end
      object cbMarca: TwwDBLookupCombo
        Left = 585
        Top = 73
        Width = 187
        Height = 21
        CustomHint = BalloonHint1
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MAR_DESCRICAO'#9'25'#9'Descri'#231#227'o'#9#9
          'MAR_CODIGO'#9'10'#9'C'#243'digo'#9#9)
        DataField = 'MAR_DESCRICAO'
        DataSource = dsMovimento
        LookupTable = dmLookups.qyLkMarcas
        LookupField = 'MAR_DESCRICAO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 10
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        ShowMatchText = True
        OnExit = cbMarcaExit
      end
      object dbCodMarca: TDBEdit
        Left = 778
        Top = 73
        Width = 78
        Height = 21
        CustomHint = BalloonHint1
        TabStop = False
        Color = clBtnFace
        DataField = 'MAR_CODIGO'
        DataSource = dsMovimento
        ReadOnly = True
        TabOrder = 11
      end
      object cbStatus: TwwDBComboBox
        Left = 8
        Top = 119
        Width = 121
        Height = 21
        CustomHint = BalloonHint1
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = False
        AutoDropDown = True
        ShowMatchText = True
        DataField = 'PRO_STATUS'
        DataSource = dsMovimento
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'Ativo'#9'A'
          'Inativo'#9'I'
          'Promo'#231#227'o'#9'P')
        Sorted = False
        TabOrder = 12
        UnboundDataType = wwDefault
      end
      object cbInativar: TwwDBComboBox
        Left = 135
        Top = 119
        Width = 80
        Height = 21
        CustomHint = BalloonHint1
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = False
        AutoDropDown = True
        ShowMatchText = True
        DataField = 'PRO_INATZERAR'
        DataSource = dsMovimento
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'Sim'#9'1'
          'N'#227'o'#9'0')
        Sorted = False
        TabOrder = 13
        UnboundDataType = wwDefault
        OnExit = cbInativarExit
      end
      object dtpDataCad: TwwDBDateTimePicker
        Left = 221
        Top = 119
        Width = 121
        Height = 21
        CustomHint = BalloonHint1
        TabStop = False
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'Tahoma'
        CalendarAttributes.Font.Style = []
        Color = clBtnFace
        DataField = 'PRO_DTCAD'
        DataSource = dsMovimento
        Epoch = 1950
        ReadOnly = True
        ShowButton = True
        TabOrder = 14
        DisplayFormat = 'dd/MM/yyyy'
      end
      object cbDescricao: TwwDBLookupCombo
        Left = 81
        Top = 27
        Width = 347
        Height = 21
        CustomHint = BalloonHint1
        DropDownAlignment = taLeftJustify
        DataField = 'PRO_DESCRICAO'
        DataSource = dsMovimento
        LookupTable = dmLookups.qyLkProdutos
        LookupField = 'PRO_DESCRICAO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
      end
    end
    object tsCustos: TTabSheet
      CustomHint = BalloonHint1
      Caption = 'Custos'
      ImageIndex = 1
      object Label13: TLabel
        Left = 8
        Top = 8
        Width = 56
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Vlr. Unit'#225'rio'
        FocusControl = dbVlrUnitario
      end
      object Label14: TLabel
        Left = 125
        Top = 8
        Width = 45
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Vlr. Frete'
        FocusControl = dbVlrFrete
      end
      object Label15: TLabel
        Left = 242
        Top = 8
        Width = 52
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Vlr. Outras'
        FocusControl = dbVlrOutras
      end
      object Label16: TLabel
        Left = 359
        Top = 8
        Width = 74
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Vlr. Importa'#231#227'o'
        FocusControl = dbVlrImportacao
      end
      object Label17: TLabel
        Left = 476
        Top = 8
        Width = 47
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Vlr. Custo'
        FocusControl = dbVlrCusto
      end
      object Label18: TLabel
        Left = 8
        Top = 54
        Width = 66
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Mkp. Atacado'
        FocusControl = dbMkpAtac
      end
      object Label19: TLabel
        Left = 94
        Top = 54
        Width = 59
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Vrl. Atacado'
        FocusControl = dbVlrAtac
      end
      object Label20: TLabel
        Left = 211
        Top = 54
        Width = 57
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Mkp. Varejo'
        FocusControl = dbMkpVar
      end
      object Label21: TLabel
        Left = 297
        Top = 54
        Width = 50
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Vlr. Varejo'
        FocusControl = dbVlrVar
      end
      object Label22: TLabel
        Left = 8
        Top = 100
        Width = 53
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Mg. M'#237'nima'
        FocusControl = dbMgMin
      end
      object Label23: TLabel
        Left = 94
        Top = 100
        Width = 54
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Desc. Max.'
        FocusControl = dbDescMax
      end
      object dbVlrUnitario: TDBEdit
        Left = 8
        Top = 27
        Width = 111
        Height = 21
        CustomHint = BalloonHint1
        DataField = 'PRO_VLRUNITARIO'
        DataSource = dsMovimento
        TabOrder = 0
        OnExit = dbVlrUnitarioExit
      end
      object dbVlrFrete: TDBEdit
        Left = 125
        Top = 27
        Width = 111
        Height = 21
        CustomHint = BalloonHint1
        DataField = 'PRO_VLRFRETE'
        DataSource = dsMovimento
        TabOrder = 1
        OnExit = dbVlrFreteExit
      end
      object dbVlrOutras: TDBEdit
        Left = 242
        Top = 27
        Width = 111
        Height = 21
        CustomHint = BalloonHint1
        DataField = 'PRO_VLROUTRAS'
        DataSource = dsMovimento
        TabOrder = 2
        OnExit = dbVlrOutrasExit
      end
      object dbVlrImportacao: TDBEdit
        Left = 359
        Top = 27
        Width = 111
        Height = 21
        CustomHint = BalloonHint1
        DataField = 'PRO_VLRIMPORT'
        DataSource = dsMovimento
        TabOrder = 3
        OnExit = dbVlrImportacaoExit
      end
      object dbVlrCusto: TDBEdit
        Left = 476
        Top = 27
        Width = 111
        Height = 21
        CustomHint = BalloonHint1
        DataField = 'PRO_VLRCUSTO'
        DataSource = dsMovimento
        TabOrder = 4
        OnExit = dbVlrCustoExit
      end
      object dbMkpAtac: TDBEdit
        Left = 8
        Top = 73
        Width = 80
        Height = 21
        CustomHint = BalloonHint1
        DataField = 'PRO_MKPATAC'
        DataSource = dsMovimento
        TabOrder = 5
        OnExit = dbMkpAtacExit
      end
      object dbVlrAtac: TDBEdit
        Left = 94
        Top = 73
        Width = 111
        Height = 21
        CustomHint = BalloonHint1
        DataField = 'PRO_VLRATAC'
        DataSource = dsMovimento
        TabOrder = 6
        OnExit = dbVlrAtacExit
      end
      object dbMkpVar: TDBEdit
        Left = 211
        Top = 73
        Width = 80
        Height = 21
        CustomHint = BalloonHint1
        DataField = 'PRO_MKPVAR'
        DataSource = dsMovimento
        TabOrder = 7
        OnExit = dbMkpVarExit
      end
      object dbVlrVar: TDBEdit
        Left = 297
        Top = 73
        Width = 111
        Height = 21
        CustomHint = BalloonHint1
        DataField = 'PRO_VLRVAR'
        DataSource = dsMovimento
        TabOrder = 8
        OnExit = dbVlrVarExit
      end
      object dbMgMin: TDBEdit
        Left = 8
        Top = 119
        Width = 80
        Height = 21
        CustomHint = BalloonHint1
        DataField = 'PRO_MGMIN'
        DataSource = dsMovimento
        TabOrder = 9
      end
      object dbDescMax: TDBEdit
        Left = 94
        Top = 119
        Width = 79
        Height = 21
        CustomHint = BalloonHint1
        DataField = 'PRO_DESMAX'
        DataSource = dsMovimento
        TabOrder = 10
        OnExit = dbDescMaxExit
      end
    end
    object tsEstoque: TTabSheet
      CustomHint = BalloonHint1
      Caption = 'Estoque'
      ImageIndex = 2
      object Label25: TLabel
        Left = 8
        Top = 8
        Width = 68
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Move estoque'
      end
      object Label26: TLabel
        Left = 115
        Top = 8
        Width = 54
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Est. M'#237'nimo'
        FocusControl = dbEstMin
      end
      object Label27: TLabel
        Left = 222
        Top = 8
        Width = 46
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Est. Ideal'
        FocusControl = dbEstIde
      end
      object Label28: TLabel
        Left = 329
        Top = 8
        Width = 52
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Peso Bruto'
        FocusControl = dbPesoBrt
      end
      object Label29: TLabel
        Left = 436
        Top = 8
        Width = 59
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Peso L'#237'quido'
        FocusControl = dbPesoLiq
      end
      object dbEstMin: TDBEdit
        Left = 115
        Top = 27
        Width = 101
        Height = 21
        CustomHint = BalloonHint1
        DataField = 'PRO_ESTMIN'
        DataSource = dsMovimento
        TabOrder = 1
      end
      object dbEstIde: TDBEdit
        Left = 222
        Top = 27
        Width = 101
        Height = 21
        CustomHint = BalloonHint1
        DataField = 'PRO_ESTIDEAL'
        DataSource = dsMovimento
        TabOrder = 2
      end
      object dbPesoBrt: TDBEdit
        Left = 329
        Top = 27
        Width = 101
        Height = 21
        CustomHint = BalloonHint1
        DataField = 'PRO_PESOBRUTO'
        DataSource = dsMovimento
        TabOrder = 3
      end
      object dbPesoLiq: TDBEdit
        Left = 436
        Top = 27
        Width = 101
        Height = 21
        CustomHint = BalloonHint1
        DataField = 'PRO_PESOLIQ'
        DataSource = dsMovimento
        TabOrder = 4
        OnExit = dbPesoLiqExit
      end
      object cbMovEst: TwwDBComboBox
        Left = 8
        Top = 27
        Width = 101
        Height = 21
        CustomHint = BalloonHint1
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = False
        DataField = 'PRO_MOVEST'
        DataSource = dsMovimento
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'Sim'#9'S'
          'N'#227'o'#9'N')
        Sorted = False
        TabOrder = 0
        UnboundDataType = wwDefault
      end
    end
    object tsFiscal: TTabSheet
      CustomHint = BalloonHint1
      Caption = 'Fiscal'
      ImageIndex = 3
      object Label30: TLabel
        Left = 8
        Top = 8
        Width = 60
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Tipo de Item'
      end
      object Label31: TLabel
        Left = 271
        Top = 8
        Width = 46
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'C'#243'd. Tipo'
        FocusControl = dbCodTipo
      end
      object Label32: TLabel
        Left = 351
        Top = 8
        Width = 60
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'C'#243'd. Origem'
        FocusControl = dbCodTipo
      end
      object Label33: TLabel
        Left = 8
        Top = 54
        Width = 90
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'Classifica'#231#227'o Fiscal'
      end
      object Label34: TLabel
        Left = 271
        Top = 54
        Width = 22
        Height = 13
        CustomHint = BalloonHint1
        Caption = 'NCM'
      end
      object cbTipoItem: TwwDBLookupCombo
        Left = 8
        Top = 27
        Width = 257
        Height = 21
        CustomHint = BalloonHint1
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TIP_DESCRICAO'#9'30'#9'Descri'#231#227'o'#9#9
          'TIP_CODIGO'#9'10'#9'Tipo'#9#9)
        DataField = 'TIP_DESCRICAO'
        DataSource = dsMovimento
        LookupTable = dmLookups.qyLkTipoItem
        LookupField = 'TIP_DESCRICAO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        ShowMatchText = True
      end
      object dbCodTipo: TDBEdit
        Left = 271
        Top = 27
        Width = 74
        Height = 21
        CustomHint = BalloonHint1
        TabStop = False
        Color = clBtnFace
        DataField = 'TIP_CODIGO'
        DataSource = dsMovimento
        ReadOnly = True
        TabOrder = 1
      end
      object cbOrigem: TwwDBComboBox
        Left = 351
        Top = 27
        Width = 121
        Height = 21
        CustomHint = BalloonHint1
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = False
        DataField = 'PRO_ORIGEM'
        DataSource = dsMovimento
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'Nacional'#9'1'
          'Importado'#9'2')
        Sorted = False
        TabOrder = 2
        UnboundDataType = wwDefault
      end
      object cbClassFisc: TwwDBComboBox
        Left = 8
        Top = 73
        Width = 257
        Height = 21
        CustomHint = BalloonHint1
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = False
        AutoDropDown = True
        ShowMatchText = True
        DataField = 'PRO_CLASSFISC'
        DataSource = dsMovimento
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'TRIBUTADO (ICMS)'#9'1'
          'SUBSTITUI'#199#195'O TRIBUT'#193'RIA (ST)'#9'2'
          'ISENTO'#9'3')
        Sorted = False
        TabOrder = 3
        UnboundDataType = wwDefault
      end
      object dbNCM: TDBEdit
        Left = 271
        Top = 73
        Width = 98
        Height = 21
        CustomHint = BalloonHint1
        DataField = 'PRO_NCM'
        DataSource = dsMovimento
        TabOrder = 4
      end
    end
  end
  object btGravar: TBitBtn [3]
    Left = 881
    Top = 305
    Width = 105
    Height = 25
    Hint = 'Gravar altera'#231#245'es'
    CustomHint = BalloonHint1
    ParentCustomHint = False
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
    TabOrder = 3
    OnClick = btGravarClick
  end
  inherited dsMovimento: TDataSource
    DataSet = dmCadastros.qyProdutos
    OnDataChange = dsMovimentoDataChange
  end
end
