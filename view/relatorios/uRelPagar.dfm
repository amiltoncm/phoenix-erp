inherited frmRelPagar: TfrmRelPagar
  Caption = 'Relat'#243'rio de Contas '#224' Pagar'
  ClientHeight = 117
  ClientWidth = 569
  ExplicitWidth = 575
  ExplicitHeight = 146
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [1]
    Left = 8
    Top = 32
    Width = 13
    Height = 13
    Caption = 'De'
  end
  object Label2: TLabel [2]
    Left = 143
    Top = 32
    Width = 17
    Height = 13
    Caption = 'At'#233
  end
  object Label3: TLabel [3]
    Left = 278
    Top = 32
    Width = 54
    Height = 13
    Caption = 'Fornecedor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  inherited sbExportar: TSpeedButton
    Left = 525
    ExplicitLeft = 525
  end
  inherited btFechar: TBitBtn
    Left = 456
    Top = 84
    TabOrder = 5
    ExplicitLeft = 456
    ExplicitTop = 84
  end
  inherited btVisualizar: TBitBtn
    Left = 234
    Top = 84
    TabOrder = 4
    ExplicitLeft = 234
    ExplicitTop = 84
  end
  object dtpInicial: TDateTimePicker [7]
    Left = 8
    Top = 51
    Width = 129
    Height = 21
    Date = 43486.901238067130000000
    Time = 43486.901238067130000000
    TabOrder = 0
  end
  object dtpFinal: TDateTimePicker [8]
    Left = 143
    Top = 51
    Width = 129
    Height = 21
    Date = 43486.901607847220000000
    Time = 43486.901607847220000000
    TabOrder = 1
  end
  object cbFornecedor: TwwDBLookupCombo [9]
    Left = 278
    Top = 51
    Width = 283
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'PES_NOME'#9'60'#9'Raz'#227'o Social / Nome '#9#9
      'PES_NOMEFANTASIA'#9'50'#9'Fantasia / Apelido'#9#9
      'PES_CODIGO'#9'10'#9'C'#243'digo'#9#9)
    LookupTable = dmLookups.qyLkFornecedores
    LookupField = 'PES_NOME'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 2
    AutoDropDown = True
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
  end
  inherited btImprimir: TBitBtn
    Left = 345
    Top = 84
    TabOrder = 3
    ExplicitLeft = 345
    ExplicitTop = 84
  end
  inherited dbDados: TppDBPipeline
    Left = 208
    object dbDadosppField1: TppField
      FieldAlias = 'PAG_VENCIMENTO'
      FieldName = 'PAG_VENCIMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 0
      Position = 0
    end
    object dbDadosppField2: TppField
      FieldAlias = 'PAG_EMISSAO'
      FieldName = 'PAG_EMISSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 10
      Position = 1
    end
    object dbDadosppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_NUMERO'
      FieldName = 'PAG_NUMERO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object dbDadosppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_SERIE'
      FieldName = 'PAG_SERIE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 6
      Position = 3
    end
    object dbDadosppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_PARCELA'
      FieldName = 'PAG_PARCELA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 8
      Position = 4
    end
    object dbDadosppField6: TppField
      FieldAlias = 'PES_NOME'
      FieldName = 'PES_NOME'
      FieldLength = 60
      DisplayWidth = 40
      Position = 5
    end
    object dbDadosppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_VALOR'
      FieldName = 'PAG_VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object dbDadosppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_DESCONTO'
      FieldName = 'PAG_DESCONTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object dbDadosppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_ACRESCIMO'
      FieldName = 'PAG_ACRESCIMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object dbDadosppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_PAGO'
      FieldName = 'PAG_PAGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object dbDadosppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_SALDO'
      FieldName = 'PAG_SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
  end
  inherited Relatorio: TppReport
    Left = 176
    DataPipelineName = 'dbDados'
    inherited ppTitleBand1: TppTitleBand
      mmHeight = 16140
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDocumentName
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = []
        Transparent = True
        mmHeight = 6350
        mmLeft = 0
        mmTop = 3440
        mmWidth = 22490
        BandType = 1
        LayerName = Foreground
      end
      object lbSubTitulo: TppLabel
        UserName = 'lbSubTitulo'
        Caption = 'lbSubTitulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 0
        mmTop = 11906
        mmWidth = 17484
        BandType = 1
        LayerName = Foreground
      end
    end
    inherited ppHeaderBand1: TppHeaderBand
      mmHeight = 5292
      inherited ppLinha1: TppLine
        LayerName = Foreground
      end
      inherited ppLinha2: TppLine
        mmHeight = 265
        mmTop = 5027
        LayerName = Foreground
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 529
        mmWidth = 18521
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Forncedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 20902
        mmTop = 529
        mmWidth = 24606
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'N'#250'mero'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 79904
        mmTop = 529
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'S'#233'rie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 97631
        mmTop = 529
        mmWidth = 9790
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Parc.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 108744
        mmTop = 529
        mmWidth = 10054
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 120650
        mmTop = 529
        mmWidth = 21431
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 143669
        mmTop = 529
        mmWidth = 21431
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 166688
        mmTop = 529
        mmWidth = 21431
        BandType = 0
        LayerName = Foreground
      end
    end
    inherited ppDetailBand1: TppDetailBand
      mmHeight = 5292
      inherited ppLinha3: TppLine
        mmHeight = 265
        mmTop = 5027
        LayerName = Foreground
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'PAG_VENCIMENTO'
        DataPipeline = dbDados
        DisplayFormat = 'dd/MM/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbDados'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 529
        mmWidth = 17727
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'PES_NOME'
        DataPipeline = dbDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbDados'
        mmHeight = 3704
        mmLeft = 20902
        mmTop = 529
        mmWidth = 57944
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PAG_NUMERO'
        DataPipeline = dbDados
        DisplayFormat = '###,000,000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbDados'
        mmHeight = 3598
        mmLeft = 79904
        mmTop = 529
        mmWidth = 16404
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'PAG_SERIE'
        DataPipeline = dbDados
        DisplayFormat = '00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbDados'
        mmHeight = 3704
        mmLeft = 97631
        mmTop = 529
        mmWidth = 9790
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PAG_PARCELA'
        DataPipeline = dbDados
        DisplayFormat = '00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbDados'
        mmHeight = 3704
        mmLeft = 108744
        mmTop = 529
        mmWidth = 10054
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'PAG_VALOR'
        DataPipeline = dbDados
        DisplayFormat = '#,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbDados'
        mmHeight = 3598
        mmLeft = 120650
        mmTop = 529
        mmWidth = 21431
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'PAG_PAGO'
        DataPipeline = dbDados
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbDados'
        mmHeight = 3598
        mmLeft = 143669
        mmTop = 529
        mmWidth = 21431
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'PAG_SALDO'
        DataPipeline = dbDados
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbDados'
        mmHeight = 3704
        mmLeft = 166688
        mmTop = 529
        mmWidth = 21431
        BandType = 4
        LayerName = Foreground
      end
    end
    inherited ppFooterBand1: TppFooterBand
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 0
        mmTop = 265
        mmWidth = 29591
        BandType = 8
        LayerName = Foreground
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3810
        mmLeft = 171186
        mmTop = 265
        mmWidth = 16849
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppSummaryBand1: TppSummaryBand [4]
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object lbTotal: TppLabel
        UserName = 'lbTotal'
        Caption = 'Valor total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3810
        mmLeft = 141552
        mmTop = 1852
        mmWidth = 16425
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'PAG_SALDO'
        DataPipeline = dbDados
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbDados'
        mmHeight = 3810
        mmLeft = 160602
        mmTop = 1852
        mmWidth = 27517
        BandType = 7
        LayerName = Foreground
      end
    end
    object ppDesignLayers1: TppDesignLayers [5]
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
      end
    end
  end
  inherited dsDados: TDataSource
    DataSet = dmConsultas.qyRelPagar
    Left = 232
  end
end
