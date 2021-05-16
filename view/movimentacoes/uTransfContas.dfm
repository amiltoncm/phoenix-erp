inherited frmTransfContas: TfrmTransfContas
  Caption = 'Transfer'#234'ncia entre Contas'
  ClientHeight = 188
  ClientWidth = 516
  OnKeyPress = FormKeyPress
  ExplicitWidth = 522
  ExplicitHeight = 217
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 516
    Height = 65
    Align = alTop
    BevelInner = bvLowered
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 77
      Height = 13
      Caption = 'Conta de d'#233'bito'
    end
    object cbContaDeb: TwwDBLookupCombo
      Left = 8
      Top = 27
      Width = 389
      Height = 21
      Hint = 'Conta para o d'#233'bito'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CON_DESCRICAO'#9'30'#9'Conta'#9#9
        'CON_CODIGO'#9'10'#9'C'#243'digo'#9#9
        'BAN_CODIGO'#9'10'#9'Banco'#9#9)
      LookupTable = dmLookups.qyLkContaDeb
      LookupField = 'CON_DESCRICAO'
      Options = [loColLines, loRowLines, loTitles]
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 65
    Width = 516
    Height = 65
    Align = alTop
    BevelInner = bvLowered
    Color = clGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 6
      Width = 82
      Height = 13
      Caption = 'Conta de Cr'#233'dito'
    end
    object cbContaCred: TwwDBLookupCombo
      Left = 8
      Top = 25
      Width = 389
      Height = 21
      Hint = 'Conta para o cr'#233'dito'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CON_DESCRICAO'#9'30'#9'Conta'#9#9
        'CON_CODIGO'#9'10'#9'C'#243'digo'#9#9
        'BAN_CODIGO'#9'10'#9'Banco'#9#9)
      LookupTable = dmLookups.qyLkContaCred
      LookupField = 'CON_DESCRICAO'
      Options = [loColLines, loRowLines, loTitles]
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
    end
    object Edit1: TEdit
      Left = 600
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'Edit1'
    end
  end
  object Panel3: TPanel [2]
    Left = 0
    Top = 130
    Width = 516
    Height = 57
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    DesignSize = (
      516
      57)
    object Label3: TLabel
      Left = 143
      Top = 6
      Width = 106
      Height = 13
      Caption = 'Valor da transfer'#234'ncia'
    end
    object Label4: TLabel
      Left = 8
      Top = 6
      Width = 105
      Height = 13
      Caption = 'Data da transfer'#234'ncia'
    end
    object dtpData: TDateTimePicker
      Left = 8
      Top = 25
      Width = 129
      Height = 21
      Hint = 'Data da trasnfer'#234'ncia'
      Date = 43487.707759212960000000
      Format = 'dd/MM/yyyy'
      Time = 43487.707759212960000000
      TabOrder = 0
    end
    object edValor: TEdit
      Left = 143
      Top = 25
      Width = 121
      Height = 21
      Alignment = taRightJustify
      TabOrder = 1
      Text = 'edValor'
      OnExit = edValorExit
      OnKeyPress = edValorKeyPress
    end
    object btTransferir: TBitBtn
      Left = 292
      Top = 25
      Width = 105
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Transferir'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFA05027954B25944A25944A24944A24944A24944A2494
        4A24944A24944A24944A24944A24944A24944A24964C25A15127834221FFF9F4
        FFF7EFFEF5EAFEF2E5FEEFDFFEEDD9FEEAD3FEE7CDFEE5C9FDE2C2FEDFBEFDDD
        B9FDDCB4FDD9B09149237F4020FEFBF7FEF9F2FAEAD5F4DDB9F4DBB7FFFFFFFF
        FFFFFADEBCFEE7CCFEE4C6FDE1C0FEDFBCFDDCB7FDDAB38F4823804020FFFCF9
        E5E1DC745E3B7F7E7C7F7E7CA7A7A6FFFFFFFFFFFFFDE8D0FDE5C9FEE2C4FDE0
        BFFDDEBAFEDCB58F4823804020FFFDFB7F7D7B79999300CCFF00CCFFAAEEFFA7
        A7A6FFFFFFFEE9D3FEE6CDFEE4C7FEE2C2FEDFBCFEDDB88F48237F401FFFFEFD
        2A2A2900CCFF00660000660000CCFF7F7E7CF4DBB6FFEBD6DF993EDF993EDF99
        3EDF993EFDDEBB8F48237F401FFFFEFE2A2A2999FFFE00660000660000CCFF7F
        7E7CF4DCB7FEEDD9DF993EDF993EDF993EDF993EFDE0BE8F4823804020FFFFFF
        7F7F7EB3B1AFFFFFFF00CCFFAEA393745D39FBE6CCFEEFDEFEECD8FDE9D2FDE6
        CCFDE3C6FDE2C18F48237F3F1FFFFFFFE5E5E57F7F7E2A2A292A29287F7C78E4
        DDD3FFF3E6FFF1E1FEEEDBFEEBD5FEE8D0FEE6CAFDE3C48E4722854523FFFFFF
        FFFFFFFFFEFEFFFDFBFFFCF8FEF9F3FEF7EEFFF5EAFFF2E4FEEFDFFEECD9FEEA
        D3FEE7CDFDE4C8944D29B26C39D7A961D3A35DD3A35CD3A35CD3A35CD3A35CD3
        A35CD3A35CD4A45DD8AE6DD7A962D9AE6CCFA769CAAA77B56D38AE5C27D87E26
        DB7F26DA7F26DA7F26DA7F26DA7F26DA7F26DA7F26DC822CF6BB80E78A21F6BB
        80B37D534E6ED4B95D19FF00FFA95A2EAA5A2FAA5A2FAA5A2FAA5A2FAA5A2FAA
        5A2FAA5A2FAA5B2FAE5F32AA5827AF6031A3562E9C573BFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 2
      OnClick = btTransferirClick
    end
  end
  inherited btFechar: TBitBtn
    Left = 403
    Top = 155
    TabOrder = 3
    ExplicitLeft = 403
    ExplicitTop = 155
  end
  inherited dsMovimento: TDataSource
    DataSet = dmFinanceiro.qyCaixa
    Left = 336
    Top = 16
  end
end
