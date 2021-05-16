inherited frmConfBxPagar: TfrmConfBxPagar
  Caption = 'Confirmar baixa'
  ClientHeight = 420
  ClientWidth = 594
  ExplicitWidth = 600
  ExplicitHeight = 449
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 336
    Width = 51
    Height = 13
    Caption = 'Valor pago'
  end
  object Label2: TLabel [1]
    Left = 104
    Top = 336
    Width = 29
    Height = 13
    Caption = 'Conta'
  end
  object Label3: TLabel [2]
    Left = 292
    Top = 336
    Width = 72
    Height = 13
    Caption = 'Dt. Pagamento'
  end
  object Label4: TLabel [3]
    Left = 400
    Top = 336
    Width = 78
    Height = 13
    Caption = 'Plano de Contas'
  end
  inherited btFechar: TBitBtn
    Left = 481
    Top = 387
    TabOrder = 5
    ExplicitLeft = 481
    ExplicitTop = 387
  end
  object btBaixar: TBitBtn [5]
    Left = 370
    Top = 387
    Width = 105
    Height = 25
    Hint = 'Baixar parcela'
    Anchors = [akRight, akBottom]
    Caption = '&Baixar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF0104A20104A20104A20104A20104A20104A20104A20104A20104A20104
      A2FF00FFFF00FFFF00FFFF00FFFF00FF0104A25983FF0026FF0030FF0030FB00
      2FF2002FE9002EE10030D80031D00034CB0104A2FF00FFFF00FFFF00FFFF00FF
      0104A2ABC2FF6480FF6688FF6688FF6687FA6787F56787F05779E94D70E44D74
      E20104A2FF00FFFF00FFFF00FFFF00FFFF00FF0104A20104A20104A20104A201
      04A20104A20104A20104A20104A20104A2FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    TabOrder = 4
    OnClick = btBaixarClick
  end
  object wwDataInspector1: TwwDataInspector [6]
    Left = 8
    Top = 0
    Width = 578
    Height = 324
    DisableThemes = False
    CaptionColor = clMoneyGreen
    TabOrder = 6
    DataSource = dsMovimento
    Items = <
      item
        DataSource = dsMovimento
        Caption = 'Fornecedor'
        Expanded = True
        Items = <
          item
            DataSource = dsMovimento
            DataField = 'PES_NOME'
            Caption = 'Nome'
            WordWrap = False
          end
          item
            DataSource = dsMovimento
            DataField = 'PES_CODIGO'
            Caption = 'C'#243'digo'
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = dsMovimento
        Caption = 'NF'
        Expanded = True
        Items = <
          item
            DataSource = dsMovimento
            DataField = 'PAG_NUMERO'
            Caption = 'N'#250'mero'
            WordWrap = False
          end
          item
            DataSource = dsMovimento
            DataField = 'PAG_SERIE'
            Caption = 'S'#233'rie'
            WordWrap = False
          end
          item
            DataSource = dsMovimento
            DataField = 'PAG_MODELO'
            Caption = 'Modelo'
            WordWrap = False
          end
          item
            DataSource = dsMovimento
            DataField = 'PAG_CHAVENFE'
            Caption = 'Chave'
            WordWrap = False
          end
          item
            DataSource = dsMovimento
            DataField = 'PAG_EMISSAO'
            Caption = 'Emiss'#227'o'
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = dsMovimento
        Caption = 'Duplicata'
        Expanded = True
        Items = <
          item
            DataSource = dsMovimento
            DataField = 'PAG_VENCIMENTO'
            Caption = 'Vencimento'
            WordWrap = False
          end
          item
            DataSource = dsMovimento
            DataField = 'PAG_DUPLICATA'
            Caption = 'N'#250'mero'
            WordWrap = False
          end
          item
            DataSource = dsMovimento
            DataField = 'PAG_PARCELA'
            Caption = 'Parcela'
            WordWrap = False
          end
          item
            DataSource = dsMovimento
            DataField = 'PAG_VALOR'
            Caption = 'Valor'
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = dsMovimento
        Caption = 'Valores'
        Expanded = True
        Items = <
          item
            DataSource = dsMovimento
            DataField = 'PAG_VALOR'
            Caption = 'Valor'
            WordWrap = False
          end
          item
            DataSource = dsMovimento
            DataField = 'PAG_ACRESCIMO'
            Caption = 'Acr'#233'scimo'
            WordWrap = False
          end
          item
            DataSource = dsMovimento
            DataField = 'PAG_DESCONTO'
            Caption = 'Desconto'
            WordWrap = False
          end
          item
            DataSource = dsMovimento
            DataField = 'PAG_PAGO'
            Caption = 'Pago'
            WordWrap = False
          end
          item
            DataSource = dsMovimento
            DataField = 'PAG_SALDO'
            Caption = 'Saldo'
            WordWrap = False
          end>
        WordWrap = False
      end>
    CaptionWidth = 100
    Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
  end
  object edValor: TEdit [7]
    Left = 8
    Top = 355
    Width = 90
    Height = 21
    Hint = 'Digite o valor PAGO'#13#10'Formato: (00000,00)'
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = 'edValor'
    OnExit = edValorExit
    OnKeyPress = edValorKeyPress
  end
  object cbConta: TwwDBLookupCombo [8]
    Left = 104
    Top = 355
    Width = 181
    Height = 21
    Hint = 'Conta de onde sair'#225' o dinheiro'
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CON_DESCRICAO'#9'30'#9'Conta'#9'F'#9
      'CON_CODIGO'#9'10'#9'C'#243'digo'#9'F'#9
      'BAN_CODIGO'#9'10'#9'Banco'#9'F'#9)
    LookupTable = dmLookups.qyLkContas
    LookupField = 'CON_DESCRICAO'
    Options = [loColLines, loRowLines]
    ButtonEffects.Transparent = True
    ButtonEffects.Flat = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    AutoDropDown = True
    ShowButton = True
    SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
  end
  object edDtPagamento: TwwDBDateTimePicker [9]
    Left = 292
    Top = 355
    Width = 98
    Height = 21
    Hint = 'Data de pagamento da duplicata'
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    DateFormat = dfLong
    Epoch = 1950
    ButtonEffects.Transparent = True
    ButtonEffects.Flat = True
    ParentShowHint = False
    ShowHint = True
    ShowButton = True
    TabOrder = 2
    DisplayFormat = 'dd/mm/yyyy'
  end
  object cbPlanoContas: TwwDBLookupCombo [10]
    Left = 400
    Top = 355
    Width = 186
    Height = 21
    Hint = 'Plano de contas'
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'PLC_DESCRICAO'#9'30'#9'Descri'#231#227'o'#9'F'#9
      'PLC_CODIGO'#9'10'#9'C'#243'digo'#9'F'#9
      'PLC_TIPO'#9'1'#9'Tipo'#9'F'#9)
    LookupTable = dmLookups.qyLkPlanoContasSai
    LookupField = 'PLC_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    ButtonEffects.Transparent = True
    ButtonEffects.Flat = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    AutoDropDown = True
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
  end
  inherited dsMovimento: TDataSource
    DataSet = dmFinanceiro.qyPagar
    Left = 376
    Top = 8
  end
end
