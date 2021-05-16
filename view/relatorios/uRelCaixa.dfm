inherited frmRelCaixa: TfrmRelCaixa
  Caption = 'Relat'#243'rio do Caixa / Contas'
  ClientHeight = 117
  ClientWidth = 456
  ExplicitWidth = 462
  ExplicitHeight = 146
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [1]
    Left = 8
    Top = 30
    Width = 51
    Height = 13
    Caption = 'Data inicial'
  end
  object Label2: TLabel [2]
    Left = 151
    Top = 30
    Width = 46
    Height = 13
    Caption = 'Data final'
  end
  object Label3: TLabel [3]
    Left = 294
    Top = 30
    Width = 29
    Height = 13
    Caption = 'Conta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited sbExportar: TSpeedButton
    Left = 412
    ExplicitLeft = 412
  end
  inherited btFechar: TBitBtn
    Left = 343
    Top = 84
    TabOrder = 5
    ExplicitLeft = 343
    ExplicitTop = 84
  end
  inherited btVisualizar: TBitBtn
    Left = 121
    Top = 84
    TabOrder = 4
    ExplicitLeft = 121
    ExplicitTop = 84
  end
  object dtpDataInicial: TDateTimePicker [7]
    Left = 8
    Top = 49
    Width = 137
    Height = 21
    Date = 43490.853118252310000000
    Time = 43490.853118252310000000
    TabOrder = 0
  end
  object dtpDataFinal: TDateTimePicker [8]
    Left = 151
    Top = 49
    Width = 137
    Height = 21
    Date = 43490.853252037040000000
    Time = 43490.853252037040000000
    TabOrder = 1
  end
  object cbConta: TwwDBLookupCombo [9]
    Left = 294
    Top = 49
    Width = 154
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CON_DESCRICAO'#9'30'#9'Conta'#9#9
      'CON_CODIGO'#9'10'#9'C'#243'digo'#9#9
      'BAN_CODIGO'#9'10'#9'Banco'#9#9)
    LookupTable = dmLookups.qyLkContas
    LookupField = 'CON_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 2
    AutoDropDown = True
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
  end
  inherited btImprimir: TBitBtn
    Left = 232
    Top = 84
    Spacing = 3
    TabOrder = 3
    ExplicitLeft = 232
    ExplicitTop = 84
  end
  inherited dbDados: TppDBPipeline
    object dbDadosppField1: TppField
      FieldAlias = 'CAI_DATA'
      FieldName = 'CAI_DATA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 10
      Position = 0
    end
    object dbDadosppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'CAI_CODIGO'
      FieldName = 'CAI_CODIGO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object dbDadosppField3: TppField
      FieldAlias = 'CON_DESCRICAO'
      FieldName = 'CON_DESCRICAO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 2
    end
    object dbDadosppField4: TppField
      FieldAlias = 'PLC_DESCRICAO'
      FieldName = 'PLC_DESCRICAO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
    object dbDadosppField5: TppField
      FieldAlias = 'CAI_DESCRICAO'
      FieldName = 'CAI_DESCRICAO'
      FieldLength = 25
      DisplayWidth = 25
      Position = 4
    end
    object dbDadosppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'CAI_NUMDOC'
      FieldName = 'CAI_NUMDOC'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object dbDadosppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'CAI_VALOR'
      FieldName = 'CAI_VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object dbDadosppField8: TppField
      FieldAlias = 'USU_NOME'
      FieldName = 'USU_NOME'
      FieldLength = 20
      DisplayWidth = 20
      Position = 7
    end
  end
  inherited Relatorio: TppReport
    PrinterSetup.DocumentName = 'Relat'#243'rio de Caixa'
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
      mmHeight = 5556
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
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 794
        mmWidth = 10583
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 19315
        mmTop = 794
        mmWidth = 12171
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Plano de contas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 52917
        mmTop = 794
        mmWidth = 26723
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 95250
        mmTop = 794
        mmWidth = 17727
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 142082
        mmTop = 794
        mmWidth = 17992
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
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 163513
        mmTop = 794
        mmWidth = 24606
        BandType = 0
        LayerName = Foreground
      end
    end
    inherited ppDetailBand1: TppDetailBand
      mmHeight = 6085
      inherited ppLinha3: TppLine
        mmTop = 5027
        LayerName = Foreground
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CAI_DATA'
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
        mmTop = 794
        mmWidth = 17992
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CON_DESCRICAO'
        DataPipeline = dbDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbDados'
        mmHeight = 3704
        mmLeft = 19315
        mmTop = 794
        mmWidth = 31485
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PLC_DESCRICAO'
        DataPipeline = dbDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbDados'
        mmHeight = 3704
        mmLeft = 52917
        mmTop = 794
        mmWidth = 40481
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CAI_DESCRICAO'
        DataPipeline = dbDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbDados'
        mmHeight = 3704
        mmLeft = 95250
        mmTop = 794
        mmWidth = 44186
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'CAI_NUMDOC'
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
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 794
        mmWidth = 16404
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'CAI_VALOR'
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
        mmLeft = 160602
        mmTop = 794
        mmWidth = 27517
        BandType = 4
        LayerName = Foreground
      end
    end
    inherited ppFooterBand1: TppFooterBand
      mmHeight = 10054
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
        mmLeft = 171270
        mmTop = 265
        mmWidth = 16849
        BandType = 8
        LayerName = Foreground
      end
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
    end
    object ppSummaryBand1: TppSummaryBand [4]
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        Border.Weight = 1.000000000000000000
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 189971
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'CAI_VALOR'
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
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Valor total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 142082
        mmTop = 1852
        mmWidth = 16425
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
    DataSet = dmConsultas.qyConsPagCaixa
    Left = 320
  end
end
