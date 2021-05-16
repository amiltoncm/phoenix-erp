inherited frmLancPagMan: TfrmLancPagMan
  Caption = 'Lan'#231'amento de duplicatas (Pagar)'
  ClientHeight = 190
  ClientWidth = 578
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  ExplicitWidth = 584
  ExplicitHeight = 219
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 54
    Width = 77
    Height = 13
    Caption = 'Vencimento (1'#186')'
  end
  object Label2: TLabel [1]
    Left = 320
    Top = 8
    Width = 38
    Height = 13
    Caption = 'Emiss'#227'o'
  end
  object Label3: TLabel [2]
    Left = 455
    Top = 8
    Width = 53
    Height = 13
    Caption = 'N'#250'mero NF'
  end
  object Label4: TLabel [3]
    Left = 536
    Top = 8
    Width = 24
    Height = 13
    Caption = 'S'#233'rie'
  end
  object Label5: TLabel [4]
    Left = 143
    Top = 54
    Width = 106
    Height = 13
    Caption = 'Modelo de Documento'
  end
  object Label6: TLabel [5]
    Left = 536
    Top = 54
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label7: TLabel [6]
    Left = 8
    Top = 102
    Width = 40
    Height = 13
    Caption = 'Parcelas'
  end
  object Label8: TLabel [7]
    Left = 54
    Top = 102
    Width = 44
    Height = 13
    Caption = 'Duplicata'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel [8]
    Left = 175
    Top = 102
    Width = 55
    Height = 13
    Caption = 'Fornecedor'
  end
  object Label10: TLabel [9]
    Left = 455
    Top = 102
    Width = 80
    Height = 13
    Caption = 'Valor total da NF'
  end
  object Label11: TLabel [10]
    Left = 8
    Top = 8
    Width = 68
    Height = 13
    Caption = 'Chave da NFe'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited btFechar: TBitBtn
    Left = 465
    Top = 157
    TabOrder = 12
    ExplicitLeft = 465
    ExplicitTop = 157
  end
  object dtpVencimento: TDateTimePicker
    Left = 8
    Top = 73
    Width = 129
    Height = 21
    Date = 43487.344918692130000000
    Time = 43487.344918692130000000
    TabOrder = 4
  end
  object dtpEmissao: TDateTimePicker
    Left = 320
    Top = 27
    Width = 129
    Height = 21
    Date = 43487.345308946760000000
    Time = 43487.345308946760000000
    TabOrder = 1
  end
  object edNumero: TEdit
    Left = 455
    Top = 27
    Width = 75
    Height = 21
    Alignment = taRightJustify
    NumbersOnly = True
    TabOrder = 2
    Text = 'edNumero'
  end
  object edSerie: TEdit
    Left = 536
    Top = 27
    Width = 34
    Height = 21
    Alignment = taRightJustify
    NumbersOnly = True
    TabOrder = 3
    Text = 'edSerie'
    OnExit = edSerieExit
  end
  object cbModelo: TwwDBLookupCombo
    Left = 143
    Top = 73
    Width = 387
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'MDC_DESCRICAO'#9'55'#9'Descri'#231#227'o'#9#9
      'MDC_CODIGO'#9'2'#9'C'#243'digo'#9#9)
    LookupTable = dmLookups.qyLkModDoc
    LookupField = 'MDC_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 5
    AutoDropDown = True
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
    OnExit = cbModeloExit
  end
  object edCodModelo: TEdit
    Left = 536
    Top = 73
    Width = 34
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
    Text = 'edCodModelo'
  end
  object edQtdParcelas: TEdit
    Left = 8
    Top = 121
    Width = 40
    Height = 21
    Alignment = taRightJustify
    NumbersOnly = True
    TabOrder = 7
    Text = 'edQtdParcelas'
  end
  object edDuplicata: TEdit
    Left = 54
    Top = 121
    Width = 115
    Height = 21
    TabOrder = 8
    Text = 'edDuplicata'
  end
  object cbFornecedor: TwwDBLookupCombo
    Left = 175
    Top = 121
    Width = 274
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'PES_NOME'#9'60'#9'Nome'#9#9
      'PES_NOMEFANTASIA'#9'50'#9'Nome Fantasia'#9#9
      'PES_CODIGO'#9'10'#9'C'#243'digo'#9#9)
    LookupTable = dmLookups.qyLkFornecedores
    LookupField = 'PES_NOME'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 9
    AutoDropDown = True
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
  end
  object edChaveNFe: TEdit
    Left = 8
    Top = 27
    Width = 306
    Height = 21
    TabOrder = 0
    Text = 'edChaveNFe'
  end
  object edVlrTotalNF: TEdit
    Left = 455
    Top = 121
    Width = 115
    Height = 21
    Alignment = taRightJustify
    TabOrder = 10
    Text = 'edVlrTotalNF'
    OnExit = edVlrTotalNFExit
    OnKeyPress = edVlrTotalNFKeyPress
  end
  object btLancar: TBitBtn
    Left = 354
    Top = 157
    Width = 105
    Height = 25
    Hint = 'Lan'#231'a duplicata pelo XML'
    Caption = '&Lancar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB98385B98385B98385B983
      85B98385B98385B98385FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFB98385F6DDB7F4D7ACF3D3A1F1CF98F0CA8FB98385FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBA8E85F8E5C98A94D91E47
      F6888ECDF2D19CB98385FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFCB9A82FAEDD91E49F90033FF1E48F6F4D8ABB98385FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDCA887FCF5E98D9DED1E49
      FA8B97E0F6E0BDB98385FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFE3B18EFEFBF6FCF7EDFBF2E4FAEDDAF8E8CEB98385FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEDBD92FFFFFFFEFCFAFDF9
      F2B98384B98384BE8675B78183B78183B78183B78183B78183B78183B78183B7
      8183FF00FFEDBD92FFFFFFFFFFFFFEFDFCB98384D39769FF00FFB78183EED1B1
      E1B894E1B68CDFB180DCAB75EFC686B78183FF00FFEDBD92DCA887DCA887428A
      3EB98384FF00FFFF00FFB78183CA8F6B952B009A3401993401993300E4B57CB7
      8183FF00FFFF00FFFF00FF03750F44D27330AB4AFF00FFFF00FFBA8E85F8EEE5
      A14213972E00942900BD7649FDE5B3B78183FF00FFFF00FF01780949CC725CE7
      8E38C658138E21FF00FFCB9A82FFFFFFD5A992922600A04112ECCCAEFFEFC5B7
      8183FF00FF45812C1097262EA8483ECA6026AF3D199F290A7D12DCA887FFFFFF
      FCF7F5AE5B33CD9574FBF1DEDECBB4B78183FF00FFFF00FFFF00FF03700827B8
      400D8A18FF00FFFF00FFE3B18EFFFFFFFFFFFFEDDBD1F9F2EAB78183B78183B7
      8475FF00FFFF00FFFF00FF097B1114AB25098611FF00FFFF00FFEDBD92FFFFFF
      FFFFFFFFFFFFFDFFFFB78183DC9D64FF00FFFF00FFFF00FF0A88120C91160EA3
      1B077B0DFF00FFFF00FFEDBD92DCA887DCA887DCA887DCA887B78183FF00FFFF
      00FF07800F07800F0490120D9C1907800FFF00FFFF00FFFF00FF}
    TabOrder = 11
    OnClick = btLancarClick
  end
end
