inherited frmAltDuplicataTmp: TfrmAltDuplicataTmp
  Caption = 'Altera Duplicata'
  ClientHeight = 139
  ClientWidth = 558
  ExplicitWidth = 564
  ExplicitHeight = 168
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 55
    Height = 13
    Caption = 'Vencimento'
  end
  object Label2: TLabel [1]
    Left = 135
    Top = 8
    Width = 38
    Height = 13
    Caption = 'Emiss'#227'o'
  end
  object Label3: TLabel [2]
    Left = 262
    Top = 8
    Width = 44
    Height = 13
    Caption = 'Duplicata'
    FocusControl = dbDuplicata
  end
  object Label4: TLabel [3]
    Left = 405
    Top = 8
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
    Enabled = False
    FocusControl = dbNumero
  end
  object Label5: TLabel [4]
    Left = 514
    Top = 8
    Width = 35
    Height = 13
    Caption = 'Parcela'
    Enabled = False
    FocusControl = dbParcela
  end
  object Label6: TLabel [5]
    Left = 8
    Top = 54
    Width = 24
    Height = 13
    Caption = 'Valor'
    FocusControl = dbValor
  end
  object Label7: TLabel [6]
    Left = 119
    Top = 54
    Width = 24
    Height = 13
    Caption = 'Pago'
    Enabled = False
    FocusControl = dbPago
  end
  object Label8: TLabel [7]
    Left = 231
    Top = 54
    Width = 48
    Height = 13
    Caption = 'Acrescimo'
    FocusControl = dbAcrescimo
  end
  object Label9: TLabel [8]
    Left = 338
    Top = 54
    Width = 45
    Height = 13
    Caption = 'Desconto'
    FocusControl = dbDesconto
  end
  object Label10: TLabel [9]
    Left = 447
    Top = 54
    Width = 26
    Height = 13
    Caption = 'Saldo'
    Enabled = False
    FocusControl = dbSaldo
  end
  inherited btFechar: TBitBtn
    Left = 445
    Top = 106
    TabOrder = 11
    ExplicitLeft = 445
    ExplicitTop = 106
  end
  object dbDuplicata: TDBEdit [11]
    Left = 262
    Top = 27
    Width = 137
    Height = 21
    DataField = 'Duplicata'
    DataSource = dsMovimento
    TabOrder = 2
  end
  object dbNumero: TDBEdit [12]
    Left = 405
    Top = 27
    Width = 103
    Height = 21
    TabStop = False
    DataField = 'Numero'
    DataSource = dsMovimento
    Enabled = False
    ReadOnly = True
    TabOrder = 3
  end
  object dbParcela: TDBEdit [13]
    Left = 514
    Top = 27
    Width = 36
    Height = 21
    TabStop = False
    DataField = 'Parcela'
    DataSource = dsMovimento
    Enabled = False
    ReadOnly = True
    TabOrder = 4
  end
  object dbValor: TDBEdit [14]
    Left = 8
    Top = 73
    Width = 105
    Height = 21
    DataField = 'Valor'
    DataSource = dsMovimento
    TabOrder = 5
    OnExit = dbValorExit
  end
  object dbPago: TDBEdit [15]
    Left = 119
    Top = 73
    Width = 106
    Height = 21
    TabStop = False
    DataField = 'Pago'
    DataSource = dsMovimento
    Enabled = False
    ReadOnly = True
    TabOrder = 6
  end
  object dbAcrescimo: TDBEdit [16]
    Left = 231
    Top = 73
    Width = 101
    Height = 21
    DataField = 'Acrescimo'
    DataSource = dsMovimento
    TabOrder = 7
    OnExit = dbAcrescimoExit
  end
  object dbDesconto: TDBEdit [17]
    Left = 338
    Top = 73
    Width = 103
    Height = 21
    DataField = 'Desconto'
    DataSource = dsMovimento
    TabOrder = 8
    OnExit = dbDescontoExit
  end
  object dbSaldo: TDBEdit [18]
    Left = 447
    Top = 73
    Width = 103
    Height = 21
    TabStop = False
    DataField = 'Saldo'
    DataSource = dsMovimento
    Enabled = False
    ReadOnly = True
    TabOrder = 9
  end
  object cbVencimento: TwwDBDateTimePicker [19]
    Left = 8
    Top = 27
    Width = 121
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'Tahoma'
    CalendarAttributes.Font.Style = []
    DataField = 'Vencimento'
    DataSource = dsMovimento
    Epoch = 1950
    ShowButton = True
    TabOrder = 0
  end
  object cbEmissao: TwwDBDateTimePicker [20]
    Left = 135
    Top = 27
    Width = 121
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'Tahoma'
    CalendarAttributes.Font.Style = []
    DataField = 'Emissao'
    DataSource = dsMovimento
    Epoch = 1950
    ShowButton = True
    TabOrder = 1
  end
  object btGravar: TBitBtn [21]
    Left = 334
    Top = 106
    Width = 105
    Height = 25
    Hint = 'Clique para gravar as altera'#231#245'es'
    Anchors = [akRight, akBottom]
    Caption = '&Gravar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFB78183
      B78183B78183B78183B78183B78183B78183B78183B78183B78183B78183B781
      83B78183FF00FFFF00FFFF00FFB78183FEEED4F7E3C5F6DFBCF5DBB4F3D7ABF3
      D3A2F1CF9AC06662B0847FDECDC5FBFBF5BC8A89A73347FF00FFFF00FFB78183
      FDEFD99FCBD037ADD337ADD337ADD337ADD3C4726EC667699D5252AE7675F6FA
      FACA96969F3131C23D80FF00FFB48176FEF3E337ADD393DCF572D1F04AC4EC3F
      BDE9B87271C65D5DB66464AA6768CCA7A6C87C7BB24445C53B87FF00FFB48176
      FFF7EB37ADD3C1EFFE98DDF662CFF14EC8EEB16E6CCC7F7DE0AAA9E0ABAADAA0
      9EDDA7A6D48787C43B86FF00FFBA8E85FFFCF437ADD3D8F8FFBCEBFD7CDDF863
      D5F5B1716DE0AAA9E6E6E6E6E6E6E6E6E6E6E6E6E0AAA9C33682FF00FFBA8E85
      FFFFFD37ADD3DDF9FFCDF4FF8FE8FE76E2FBB47270E0AAA9E6E6E6E6E6E6E6E6
      E6E6E6E6E0AAA9C33881FF00FFCB9A82FFFFFF37ADD3DBF9FFCDF3FF94ECFE86
      EBFFB5716EE0AAA9E6E6E6E6E6E6E6E6E6E6E6E6E0AAA9C33783FF00FFCB9A82
      FFFFFF37ADD3DCF9FFCFF4FF95EDFE8AEFFF37ADD3E0AAA9E6E6E6E6E6E6E6E6
      E6E6E6E6E0AAA9FF00FFFF00FFDCA887FFFFFF37ADD3E1FBFFD1F4FF95EDFF8C
      F0FF37ADD3F8E6D1F6E2C8F7E1C2F0DAB7B78183FF00FFFF00FFFF00FFDCA887
      FFFFFF37ADD337ADD337ADD337ADD337ADD337ADD3FAEDDCFCEFD9E6D9C4C6BC
      A9B78183FF00FFFF00FFFF00FFE3B18EFFFFFF37ADD398E1F494E4F982E2F871
      DBF337ADD3F1E1D5B8857AB8857AB8857AB78183FF00FFFF00FFFF00FFE3B18E
      FFFFFF99D7EB37ADD337ADD337ADD337ADD39BD7E8E3CFC9B8857AE8B270ECA5
      4AC58768FF00FFFF00FFFF00FFEDBD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFE4D4D2B8857AFAC577CD9377FF00FFFF00FFFF00FFFF00FFEDBD92
      FCF7F4FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB8857ACF9B86FF00
      FFFF00FFFF00FFFF00FFFF00FFEDBD92DCA887DCA887DCA887DCA887DCA887DC
      A887DCA887DCA887B8857AFF00FFFF00FFFF00FFFF00FFFF00FF}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = btGravarClick
  end
  inherited dsMovimento: TDataSource
    DataSet = dmTemp.mdPagar
    Top = 32
  end
end
