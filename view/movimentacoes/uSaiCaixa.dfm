inherited frmSaiCaixa: TfrmSaiCaixa
  Caption = 'Sa'#237'das do Caixa'
  ClientHeight = 182
  OnKeyPress = FormKeyPress
  ExplicitHeight = 211
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 47
    Width = 23
    Height = 13
    Caption = 'Data'
  end
  object Label2: TLabel [1]
    Left = 135
    Top = 47
    Width = 29
    Height = 13
    Caption = 'Conta'
  end
  object Label3: TLabel [2]
    Left = 359
    Top = 47
    Width = 78
    Height = 13
    Caption = 'Plano de Contas'
  end
  object Label4: TLabel [3]
    Left = 8
    Top = 93
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
    FocusControl = dbDescricao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel [4]
    Left = 343
    Top = 93
    Width = 54
    Height = 13
    Caption = 'Documento'
    FocusControl = dbDocumento
  end
  object Label6: TLabel [5]
    Left = 483
    Top = 93
    Width = 24
    Height = 13
    Caption = 'Valor'
    FocusControl = dbValor
  end
  inherited btFechar: TBitBtn
    Top = 149
    TabOrder = 7
    ExplicitTop = 149
  end
  object Panel1: TPanel [7]
    Left = 0
    Top = 0
    Width = 603
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = 'Sa'#237'das Diversas do Caixa'
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 8
  end
  object cbConta: TwwDBLookupCombo [8]
    Left = 135
    Top = 66
    Width = 218
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CON_DESCRICAO'#9'30'#9'Conta'#9#9
      'CON_CODIGO'#9'10'#9'C'#243'digo'#9#9
      'BAN_CODIGO'#9'10'#9'Banco'#9#9)
    LookupTable = dmLookups.qyLkContas
    LookupField = 'CON_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 1
    AutoDropDown = True
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
  end
  object cbPlanoContas: TwwDBLookupCombo [9]
    Left = 359
    Top = 66
    Width = 236
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'PLC_DESCRICAO'#9'30'#9'Descri'#231#227'o'#9#9
      'PLC_CODIGO'#9'10'#9'C'#243'digo'#9#9)
    LookupTable = dmLookups.qyLkPlanoContasSai
    LookupField = 'PLC_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 2
    AutoDropDown = True
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
  end
  object dbDescricao: TDBEdit [10]
    Left = 8
    Top = 112
    Width = 329
    Height = 21
    DataField = 'CAI_DESCRICAO'
    DataSource = dsMovimento
    TabOrder = 3
  end
  object dbDocumento: TDBEdit [11]
    Left = 343
    Top = 112
    Width = 134
    Height = 21
    DataField = 'CAI_NUMDOC'
    DataSource = dsMovimento
    TabOrder = 4
  end
  object dbValor: TDBEdit [12]
    Left = 483
    Top = 112
    Width = 112
    Height = 21
    DataField = 'CAI_VALOR'
    DataSource = dsMovimento
    TabOrder = 5
  end
  object btLancar: TBitBtn [13]
    Left = 379
    Top = 149
    Width = 105
    Height = 25
    Hint = 'Confirma lan'#231'amento no caixa'
    Anchors = [akRight, akBottom]
    Caption = 'Lan'#231'ar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0066001EB2311FB13300
      6600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF00660031C24F22B7381AB02D21B437006600FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF00660047D36D3BCB5E25A83B0066001B
      A92E1DB132006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600
      4FD67953DE7F31B54D006600FF00FF006600179D271EAE31006600FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF00660041C563006600FF00FFFF00FFFF
      00FFFF00FF00660019AA2B006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600149D210066
      00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    TabOrder = 6
    OnClick = btLancarClick
  end
  object dtpData: TDateTimePicker [14]
    Left = 8
    Top = 66
    Width = 121
    Height = 21
    Hint = 'Data da trasnfer'#234'ncia'
    Date = 43487.000000000000000000
    Format = 'dd/MM/yyyy'
    Time = 0.707759212957171300
    TabOrder = 0
  end
  inherited dsMovimento: TDataSource
    DataSet = dmFinanceiro.qyCaixa
    Left = 128
    Top = 96
  end
end
