inherited frmBxCheque: TfrmBxCheque
  Caption = 'Baixa de cheques'
  ClientHeight = 189
  ClientWidth = 597
  OnKeyPress = FormKeyPress
  ExplicitWidth = 603
  ExplicitHeight = 218
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 30
    Height = 13
    Caption = 'Titular'
    FocusControl = dbTitular
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 54
    Width = 29
    Height = 13
    Caption = 'Banco'
    FocusControl = dbBanco
  end
  object Label3: TLabel [2]
    Left = 71
    Top = 54
    Width = 38
    Height = 13
    Caption = 'Ag'#234'ncia'
    FocusControl = dbAgencia
  end
  object Label4: TLabel [3]
    Left = 142
    Top = 54
    Width = 29
    Height = 13
    Caption = 'Conta'
    FocusControl = dbConta
  end
  object Label5: TLabel [4]
    Left = 248
    Top = 54
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
    FocusControl = dbNumero
  end
  object Label6: TLabel [5]
    Left = 354
    Top = 54
    Width = 24
    Height = 13
    Caption = 'Valor'
    FocusControl = dbValor
  end
  object Label7: TLabel [6]
    Left = 479
    Top = 54
    Width = 55
    Height = 13
    Caption = 'Vencimento'
    FocusControl = dbValor
  end
  object Label8: TLabel [7]
    Left = 8
    Top = 101
    Width = 135
    Height = 13
    Caption = 'Conta de destino (Dep'#243'sito)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel [8]
    Left = 239
    Top = 101
    Width = 88
    Height = 13
    Caption = 'Destino (Repasse)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited btFechar: TBitBtn
    Left = 484
    Top = 156
    TabOrder = 10
    ExplicitLeft = 484
    ExplicitTop = 156
  end
  object dbTitular: TDBEdit
    Left = 8
    Top = 27
    Width = 581
    Height = 21
    TabStop = False
    Color = clSkyBlue
    DataField = 'chq_titular'
    DataSource = dsConsulta
    ReadOnly = True
    TabOrder = 0
  end
  object dbBanco: TDBEdit
    Left = 8
    Top = 73
    Width = 57
    Height = 21
    TabStop = False
    Color = clSkyBlue
    DataField = 'ban_codigo'
    DataSource = dsConsulta
    ReadOnly = True
    TabOrder = 1
  end
  object dbAgencia: TDBEdit
    Left = 71
    Top = 73
    Width = 65
    Height = 21
    TabStop = False
    Color = clSkyBlue
    DataField = 'chq_agencia'
    DataSource = dsConsulta
    ReadOnly = True
    TabOrder = 2
  end
  object dbConta: TDBEdit
    Left = 142
    Top = 73
    Width = 100
    Height = 21
    TabStop = False
    Color = clSkyBlue
    DataField = 'chq_conta'
    DataSource = dsConsulta
    ReadOnly = True
    TabOrder = 3
  end
  object dbNumero: TDBEdit
    Left = 248
    Top = 73
    Width = 100
    Height = 21
    TabStop = False
    Color = clSkyBlue
    DataField = 'chq_cheque'
    DataSource = dsConsulta
    ReadOnly = True
    TabOrder = 4
  end
  object dbValor: TDBEdit
    Left = 354
    Top = 73
    Width = 119
    Height = 21
    TabStop = False
    Color = clSkyBlue
    DataField = 'chq_valor'
    DataSource = dsConsulta
    ReadOnly = True
    TabOrder = 5
  end
  object btAlterar: TBitBtn
    Left = 373
    Top = 156
    Width = 105
    Height = 25
    Hint = 'Baixar cheque'
    Anchors = [akRight, akBottom]
    Caption = '&Alterar'
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
    TabOrder = 9
    OnClick = btAlterarClick
  end
  object dbVencimento: TDBEdit
    Left = 479
    Top = 73
    Width = 110
    Height = 21
    TabStop = False
    Color = clSkyBlue
    DataField = 'chq_vencimento'
    DataSource = dsConsulta
    ReadOnly = True
    TabOrder = 6
  end
  object cbProcura: TwwDBLookupCombo
    Left = 8
    Top = 120
    Width = 225
    Height = 21
    Hint = 'Digite a busca e tecle ENTER'
    DropDownAlignment = taLeftJustify
    LookupTable = dmLookups.qyLkContas
    LookupField = 'CON_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 7
    AutoDropDown = True
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
    OnExit = cbProcuraExit
  end
  object edDestino: TEdit
    Left = 239
    Top = 120
    Width = 350
    Height = 21
    TabOrder = 8
    Text = 'edDestino'
  end
  object dsConsulta: TDataSource
    DataSet = dmConsultas.qyConsCheques
    Left = 152
  end
end
