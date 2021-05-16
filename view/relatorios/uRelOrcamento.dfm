inherited frmRelOrcamento: TfrmRelOrcamento
  Caption = 'Imprimir Or'#231'amento'
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbDados: TppDBPipeline
    object dbDadosppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORT_QUANTIDADE'
      FieldName = 'ORT_QUANTIDADE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object dbDadosppField2: TppField
      FieldAlias = 'PRO_DESCRICAO'
      FieldName = 'PRO_DESCRICAO'
      FieldLength = 50
      DisplayWidth = 52
      Position = 1
    end
    object dbDadosppField3: TppField
      FieldAlias = 'UNI_CODIGO'
      FieldName = 'UNI_CODIGO'
      FieldLength = 2
      DisplayWidth = 2
      Position = 2
    end
    object dbDadosppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRO_CODIGO'
      FieldName = 'PRO_CODIGO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object dbDadosppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORT_VLRBRT'
      FieldName = 'ORT_VLRBRT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object dbDadosppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORT_VLRDESC'
      FieldName = 'ORT_VLRDESC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object dbDadosppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORT_VLRLIQ'
      FieldName = 'ORT_VLRLIQ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object dbDadosppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORT_PERCDESC'
      FieldName = 'ORT_PERCDESC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 8
      Position = 7
    end
    object dbDadosppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORT_VLRTOTAL'
      FieldName = 'ORT_VLRTOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object dbDadosppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORT_VLRCUSTO'
      FieldName = 'ORT_VLRCUSTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object dbDadosppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORT_PERCMG'
      FieldName = 'ORT_PERCMG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 8
      Position = 10
    end
    object dbDadosppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORT_CODIGO'
      FieldName = 'ORT_CODIGO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 11
    end
    object dbDadosppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORC_NUMERO'
      FieldName = 'ORC_NUMERO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 12
    end
  end
  inherited Relatorio: TppReport
    PrinterSetup.DocumentName = 'DAV - Or'#231'amento'
    PDFSettings.Author = 'M Tecnologia'
    PDFSettings.Creator = 'Comercial - M Tecnologia'
    PDFSettings.Subject = 'Or'#231'amento'
    PDFSettings.Title = 'Or'#231'amento'
    DataPipelineName = 'dbDados'
    inherited ppTitleBand1: TppTitleBand
      PrintHeight = phDynamic
      mmHeight = 40000
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'ORC_NUMERO'
        DataPipeline = dbDados
        DisplayFormat = '000,000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbDados'
        mmHeight = 4763
        mmLeft = 142346
        mmTop = 1058
        mmWidth = 17992
        BandType = 1
        LayerName = Foreground
      end
      object ImgLogoRel: TppImage
        UserName = 'ImgLogoRel'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Transparent = True
        mmHeight = 20108
        mmLeft = 0
        mmTop = 1058
        mmWidth = 39688
        BandType = 1
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'EMP_RAZAO'
        DataPipeline = dbEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbEmpresa'
        mmHeight = 3704
        mmLeft = 42863
        mmTop = 7408
        mmWidth = 102923
        BandType = 1
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'EMP_CNPJ'
        DataPipeline = dbEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbEmpresa'
        mmHeight = 3704
        mmLeft = 157163
        mmTop = 7408
        mmWidth = 30163
        BandType = 1
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'EMP_LOGRADOURO'
        DataPipeline = dbEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbEmpresa'
        mmHeight = 3704
        mmLeft = 59796
        mmTop = 12965
        mmWidth = 70379
        BandType = 1
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'EMP_BAIRRO'
        DataPipeline = dbEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbEmpresa'
        mmHeight = 3704
        mmLeft = 156634
        mmTop = 12965
        mmWidth = 33073
        BandType = 1
        LayerName = Foreground
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'EMP_CIDADE'
        DataPipeline = dbEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbEmpresa'
        mmHeight = 3704
        mmLeft = 62442
        mmTop = 18521
        mmWidth = 59796
        BandType = 1
        LayerName = Foreground
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'EMP_UF'
        DataPipeline = dbEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbEmpresa'
        mmHeight = 3704
        mmLeft = 123561
        mmTop = 18521
        mmWidth = 5027
        BandType = 1
        LayerName = Foreground
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'EMP_CEP'
        DataPipeline = dbEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbEmpresa'
        mmHeight = 3704
        mmLeft = 137848
        mmTop = 18521
        mmWidth = 16669
        BandType = 1
        LayerName = Foreground
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'EMP_IE'
        DataPipeline = dbEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbEmpresa'
        mmHeight = 3704
        mmLeft = 170127
        mmTop = 18521
        mmWidth = 19844
        BandType = 1
        LayerName = Foreground
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'EMP_FONE'
        DataPipeline = dbEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbEmpresa'
        mmHeight = 3704
        mmLeft = 42598
        mmTop = 23548
        mmWidth = 21960
        BandType = 1
        LayerName = Foreground
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'EMP_EMAIL'
        DataPipeline = dbEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbEmpresa'
        mmHeight = 3810
        mmLeft = 66940
        mmTop = 23548
        mmWidth = 61913
        BandType = 1
        LayerName = Foreground
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'EMP_HOMEPAGE'
        DataPipeline = dbEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbEmpresa'
        mmHeight = 3810
        mmLeft = 129646
        mmTop = 23548
        mmWidth = 60061
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'CNPJ:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 147109
        mmTop = 7408
        mmWidth = 9525
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Bairro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 144992
        mmTop = 12965
        mmWidth = 10319
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Endere'#231'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 42863
        mmTop = 12965
        mmWidth = 15610
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Insc. Est.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 155575
        mmTop = 18521
        mmWidth = 15028
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'CEP:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 129382
        mmTop = 18521
        mmWidth = 7408
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Cidade / UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 42863
        mmTop = 18521
        mmWidth = 18521
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Contato:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 29104
        mmTop = 23548
        mmWidth = 12965
        BandType = 1
        LayerName = Foreground
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'EMP_NUMERO'
        DataPipeline = dbEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbEmpresa'
        mmHeight = 3598
        mmLeft = 131763
        mmTop = 12965
        mmWidth = 11113
        BandType = 1
        LayerName = Foreground
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 27781
        mmWidth = 189442
        BandType = 1
        LayerName = Foreground
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 39158
        mmWidth = 189442
        BandType = 1
        LayerName = Foreground
      end
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        Caption = 
          'N'#195'O '#201' DOCUMENTO FISCAL - N'#195'O '#201' V'#193'LIDO COMO RECIBO E COMO GARANTI' +
          'A DE '#13#10'MERCADORIA - N'#195'O COMPROVA PAGAMENTO'#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Lines.Strings = (
          
            'N'#195'O '#201' DOCUMENTO FISCAL - N'#195'O '#201' V'#193'LIDO COMO RECIBO E COMO GARANTI' +
            'A DE '
          'MERCADORIA - N'#195'O COMPROVA PAGAMENTO')
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 10054
        mmLeft = 1058
        mmTop = 28575
        mmWidth = 186796
        BandType = 1
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11377
        mmLeft = 0
        mmTop = 28046
        mmWidth = 794
        BandType = 1
        LayerName = Foreground
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 11377
        mmLeft = 188913
        mmTop = 27781
        mmWidth = 794
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'Documento Auxiliar de Venda (DAV) - Or'#231'amento N.'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4657
        mmLeft = 42863
        mmTop = 1058
        mmWidth = 96690
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel30: TppLabel
        UserName = 'Label1'
        Caption = 'ORC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4657
        mmLeft = 180743
        mmTop = 1058
        mmWidth = 8636
        BandType = 1
        LayerName = Foreground
      end
    end
    inherited ppHeaderBand1: TppHeaderBand
      mmHeight = 19300
      object ppLines003: TppLine [0]
        UserName = 'Lines003'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 13758
        mmWidth = 189707
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel9: TppLabel [1]
        UserName = 'Label9'
        Caption = 'Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 794
        mmWidth = 12965
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText15: TppDBText [2]
        UserName = 'DBText15'
        DataField = 'PES_NOME'
        DataPipeline = dbOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbOrcamento'
        mmHeight = 3969
        mmLeft = 14817
        mmTop = 794
        mmWidth = 63236
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText16: TppDBText [3]
        UserName = 'DBText16'
        DataField = 'PES_FONE'
        DataPipeline = dbOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbOrcamento'
        mmHeight = 3969
        mmLeft = 79640
        mmTop = 794
        mmWidth = 28310
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel11: TppLabel [4]
        UserName = 'Label11'
        Caption = 'Referente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 5027
        mmWidth = 17463
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText17: TppDBText [5]
        UserName = 'DBText17'
        DataField = 'ORC_REFERENTE'
        DataPipeline = dbOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'dbOrcamento'
        mmHeight = 7673
        mmLeft = 17992
        mmTop = 5292
        mmWidth = 135732
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText18: TppDBText [6]
        UserName = 'DBText18'
        DataField = 'ORC_CONTATO'
        DataPipeline = dbOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbOrcamento'
        mmHeight = 3969
        mmLeft = 125413
        mmTop = 794
        mmWidth = 28310
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel12: TppLabel [7]
        UserName = 'Label12'
        Caption = 'Contato:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 110861
        mmTop = 794
        mmWidth = 14552
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText19: TppDBText [8]
        UserName = 'DBText19'
        DataField = 'ORC_DATA'
        DataPipeline = dbOrcamento
        DisplayFormat = 'dd/MM/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbOrcamento'
        mmHeight = 3969
        mmLeft = 171450
        mmTop = 794
        mmWidth = 18256
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel13: TppLabel [9]
        UserName = 'Label13'
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 162190
        mmTop = 794
        mmWidth = 8731
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel14: TppLabel [10]
        UserName = 'Label14'
        Caption = 'Validade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 154782
        mmTop = 5292
        mmWidth = 15610
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText20: TppDBText [11]
        UserName = 'DBText20'
        DataField = 'ORC_VALIDADE'
        DataPipeline = dbOrcamento
        DisplayFormat = '00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbOrcamento'
        mmHeight = 3969
        mmLeft = 171450
        mmTop = 5292
        mmWidth = 6879
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel15: TppLabel [12]
        UserName = 'Label15'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 14817
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel16: TppLabel [13]
        UserName = 'Label16'
        Caption = 'Un.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 17992
        mmTop = 14817
        mmWidth = 5027
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel17: TppLabel [14]
        UserName = 'Label17'
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 14817
        mmWidth = 14288
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel18: TppLabel [15]
        UserName = 'Label18'
        Caption = 'Unit'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 142346
        mmTop = 14817
        mmWidth = 11113
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel19: TppLabel [16]
        UserName = 'Label19'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 164836
        mmTop = 14817
        mmWidth = 7144
        BandType = 0
        LayerName = Foreground
      end
      inherited ppLinha2: TppLine [17]
        mmHeight = 265
        mmTop = 18785
        LayerName = Foreground
      end
      object ppLabel25: TppLabel [18]
        UserName = 'Label25'
        Caption = 'dias.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 179388
        mmTop = 5292
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground
      end
      inherited ppLinha1: TppLine [19]
        LayerName = Foreground
      end
    end
    inherited ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmHeight = 5030
      inherited ppLinha3: TppLine
        Anchors = [atLeft, atBottom]
        StretchWithParent = True
        mmHeight = 265
        mmTop = 4236
        LayerName = Foreground
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'ORT_QUANTIDADE'
        DataPipeline = dbDados
        DisplayFormat = '#,###,##0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbDados'
        mmHeight = 3598
        mmLeft = 0
        mmTop = 529
        mmWidth = 16404
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'UNI_CODIGO'
        DataPipeline = dbDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbDados'
        mmHeight = 3704
        mmLeft = 17992
        mmTop = 529
        mmWidth = 5027
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'ORT_VLRLIQ'
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
        mmLeft = 142346
        mmTop = 529
        mmWidth = 20902
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'ORT_VLRTOTAL'
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
        mmLeft = 164836
        mmTop = 529
        mmWidth = 24606
        BandType = 4
        LayerName = Foreground
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'PRO_DESCRICAO'
        DataPipeline = dbDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'dbDados'
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 529
        mmWidth = 95779
        BandType = 4
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'PRO_CODIGO'
        DataPipeline = dbDados
        DisplayFormat = '000,000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbDados'
        mmHeight = 3598
        mmLeft = 123031
        mmTop = 529
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground
      end
    end
    inherited ppFooterBand1: TppFooterBand
      mmHeight = 10050
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 0
        mmTop = 5556
        mmWidth = 29337
        BandType = 8
        LayerName = Foreground
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 189707
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
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3598
        mmLeft = 173366
        mmTop = 5556
        mmWidth = 16341
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppSummaryBand1: TppSummaryBand [4]
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 53200
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 189707
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Frete:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 1323
        mmWidth = 9790
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel20: TppLabel
        UserName = 'Label101'
        Caption = 'Prazo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 529
        mmTop = 6350
        mmWidth = 10753
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Forma de Pagamento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 529
        mmTop = 11377
        mmWidth = 36957
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel22: TppLabel
        UserName = 'Label102'
        Caption = 'Subtotal:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 142346
        mmTop = 1323
        mmWidth = 13758
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Desconto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 140229
        mmTop = 6350
        mmWidth = 15875
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 146579
        mmTop = 11377
        mmWidth = 9525
        BandType = 7
        LayerName = Foreground
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'ORC_SUBTOTAL'
        DataPipeline = dbOrcamento
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbOrcamento'
        mmHeight = 3969
        mmLeft = 162719
        mmTop = 1323
        mmWidth = 27252
        BandType = 7
        LayerName = Foreground
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'ORC_VLRDESC'
        DataPipeline = dbOrcamento
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbOrcamento'
        mmHeight = 3969
        mmLeft = 162719
        mmTop = 6350
        mmWidth = 27252
        BandType = 7
        LayerName = Foreground
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'ORC_VLRTOTAL'
        DataPipeline = dbOrcamento
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbOrcamento'
        mmHeight = 4233
        mmLeft = 162719
        mmTop = 11377
        mmWidth = 27252
        BandType = 7
        LayerName = Foreground
      end
      object lbSimb01: TppLabel
        UserName = 'Label20'
        Caption = '$$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 157957
        mmTop = 1323
        mmWidth = 3969
        BandType = 7
        LayerName = Foreground
      end
      object lbSimb02: TppLabel
        UserName = 'Label201'
        Caption = '$$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 157957
        mmTop = 6350
        mmWidth = 3969
        BandType = 7
        LayerName = Foreground
      end
      object lbSimb03: TppLabel
        UserName = 'lbSimb03'
        Caption = '$$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 157957
        mmTop = 11377
        mmWidth = 3969
        BandType = 7
        LayerName = Foreground
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'prz_descricao'
        DataPipeline = dbOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbOrcamento'
        mmHeight = 4233
        mmLeft = 13494
        mmTop = 6350
        mmWidth = 64558
        BandType = 7
        LayerName = Foreground
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        DataField = 'FRP_DESCRICAO'
        DataPipeline = dbOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbOrcamento'
        mmHeight = 4233
        mmLeft = 39158
        mmTop = 11377
        mmWidth = 64558
        BandType = 7
        LayerName = Foreground
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        DataField = 'ORC_OBS'
        DataPipeline = dbOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'dbOrcamento'
        mmHeight = 10848
        mmLeft = 529
        mmTop = 21960
        mmWidth = 188913
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Obs.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 0
        mmTop = 17198
        mmWidth = 9017
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'SDS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 37306
        mmWidth = 7144
        BandType = 7
        LayerName = Foreground
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        DataField = 'FUN_NOME'
        DataPipeline = dbOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbOrcamento'
        mmHeight = 3969
        mmLeft = 0
        mmTop = 42333
        mmWidth = 80433
        BandType = 7
        LayerName = Foreground
      end
      object lbData: TppLabel
        UserName = 'Label22'
        Caption = 'Label22'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 49212
        mmWidth = 12435
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'De acordo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 98161
        mmTop = 37306
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 116417
        mmTop = 41540
        mmWidth = 73554
        BandType = 7
        LayerName = Foreground
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        DataField = 'PES_NOME'
        DataPipeline = dbOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'dbOrcamento'
        mmHeight = 3969
        mmLeft = 121973
        mmTop = 43127
        mmWidth = 63765
        BandType = 7
        LayerName = Foreground
      end
      object lbTotExt: TppLabel
        UserName = 'lbTotExt'
        Caption = 'lbTotExt'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3598
        mmLeft = 178065
        mmTop = 17198
        mmWidth = 11261
        BandType = 7
        LayerName = Foreground
      end
      object ppDBText29: TppDBText
        UserName = 'DBText201'
        DataField = 'ent_descricao'
        DataPipeline = dbOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbOrcamento'
        mmHeight = 4233
        mmLeft = 11906
        mmTop = 1323
        mmWidth = 50536
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel1: TppLabel
        UserName = 'Label103'
        Caption = 'Pagamento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 63765
        mmTop = 1323
        mmWidth = 20151
        BandType = 7
        LayerName = Foreground
      end
      object ppDBText34: TppDBText
        UserName = 'DBText29'
        DataField = 'mdf_descricao'
        DataPipeline = dbOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbOrcamento'
        mmHeight = 4233
        mmLeft = 85725
        mmTop = 1323
        mmWidth = 48683
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
    DataSet = dmOrcamentos.qyOrcItens
  end
  object dsEmpresa: TDataSource
    DataSet = dmConfig.qyEmpresa
    Left = 224
    Top = 32
  end
  object dbEmpresa: TppDBPipeline
    DataSource = dsEmpresa
    UserName = 'dbEmpresa'
    Left = 224
    object dbEmpresappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'EMP_CODIGO'
      FieldName = 'EMP_CODIGO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object dbEmpresappField2: TppField
      FieldAlias = 'EMP_RAZAO'
      FieldName = 'EMP_RAZAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object dbEmpresappField3: TppField
      FieldAlias = 'EMP_FANTASIA'
      FieldName = 'EMP_FANTASIA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object dbEmpresappField4: TppField
      FieldAlias = 'EMP_CNPJ'
      FieldName = 'EMP_CNPJ'
      FieldLength = 18
      DisplayWidth = 18
      Position = 3
    end
    object dbEmpresappField5: TppField
      FieldAlias = 'EMP_IE'
      FieldName = 'EMP_IE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object dbEmpresappField6: TppField
      FieldAlias = 'EMP_IMUN'
      FieldName = 'EMP_IMUN'
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
    object dbEmpresappField7: TppField
      FieldAlias = 'EMP_LOGRADOURO'
      FieldName = 'EMP_LOGRADOURO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object dbEmpresappField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'EMP_NUMERO'
      FieldName = 'EMP_NUMERO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object dbEmpresappField9: TppField
      FieldAlias = 'EMP_COMPLEMENTO'
      FieldName = 'EMP_COMPLEMENTO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 8
    end
    object dbEmpresappField10: TppField
      FieldAlias = 'EMP_BAIRRO'
      FieldName = 'EMP_BAIRRO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 9
    end
    object dbEmpresappField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'EMP_CODCIDADE'
      FieldName = 'EMP_CODCIDADE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 10
    end
    object dbEmpresappField12: TppField
      FieldAlias = 'EMP_CIDADE'
      FieldName = 'EMP_CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 11
    end
    object dbEmpresappField13: TppField
      FieldAlias = 'EMP_UF'
      FieldName = 'EMP_UF'
      FieldLength = 2
      DisplayWidth = 2
      Position = 12
    end
    object dbEmpresappField14: TppField
      FieldAlias = 'EMP_CEP'
      FieldName = 'EMP_CEP'
      FieldLength = 9
      DisplayWidth = 9
      Position = 13
    end
    object dbEmpresappField15: TppField
      FieldAlias = 'EMP_FONE'
      FieldName = 'EMP_FONE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 14
    end
    object dbEmpresappField16: TppField
      FieldAlias = 'EMP_EMAIL'
      FieldName = 'EMP_EMAIL'
      FieldLength = 50
      DisplayWidth = 50
      Position = 15
    end
    object dbEmpresappField17: TppField
      FieldAlias = 'EMP_HOMEPAGE'
      FieldName = 'EMP_HOMEPAGE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 16
    end
    object dbEmpresappField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'EMP_CODPAIS'
      FieldName = 'EMP_CODPAIS'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 17
    end
    object dbEmpresappField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'REG_CODIGO'
      FieldName = 'REG_CODIGO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 18
    end
    object dbEmpresappField20: TppField
      FieldAlias = 'REG_DESCRICAO'
      FieldName = 'REG_DESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 19
    end
  end
  object dbOrcamento: TppDBPipeline
    DataSource = dsOrcamento
    UserName = 'dbOrcamento'
    Left = 256
    object dbOrcamentoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'orc_numero'
      FieldName = 'orc_numero'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object dbOrcamentoppField2: TppField
      FieldAlias = 'orc_data'
      FieldName = 'orc_data'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 1
    end
    object dbOrcamentoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'pes_codigo'
      FieldName = 'pes_codigo'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object dbOrcamentoppField4: TppField
      FieldAlias = 'pes_nome'
      FieldName = 'pes_nome'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object dbOrcamentoppField5: TppField
      FieldAlias = 'pes_fone'
      FieldName = 'pes_fone'
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object dbOrcamentoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'pet_codigo'
      FieldName = 'pet_codigo'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object dbOrcamentoppField7: TppField
      FieldAlias = 'pet_nome'
      FieldName = 'pet_nome'
      FieldLength = 25
      DisplayWidth = 25
      Position = 6
    end
    object dbOrcamentoppField8: TppField
      FieldAlias = 'orc_contato'
      FieldName = 'orc_contato'
      FieldLength = 20
      DisplayWidth = 20
      Position = 7
    end
    object dbOrcamentoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'fun_codigo'
      FieldName = 'fun_codigo'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object dbOrcamentoppField10: TppField
      FieldAlias = 'fun_nome'
      FieldName = 'fun_nome'
      FieldLength = 50
      DisplayWidth = 50
      Position = 9
    end
    object dbOrcamentoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'orc_tabvenda'
      FieldName = 'orc_tabvenda'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 10
    end
    object dbOrcamentoppField12: TppField
      FieldAlias = 'orc_referente'
      FieldName = 'orc_referente'
      FieldLength = 100
      DisplayWidth = 100
      Position = 11
    end
    object dbOrcamentoppField13: TppField
      FieldAlias = 'orc_obs'
      FieldName = 'orc_obs'
      FieldLength = 255
      DisplayWidth = 255
      Position = 12
    end
    object dbOrcamentoppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'orc_vlrcusto'
      FieldName = 'orc_vlrcusto'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object dbOrcamentoppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'orc_subtotal'
      FieldName = 'orc_subtotal'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object dbOrcamentoppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'orc_vlrdesc'
      FieldName = 'orc_vlrdesc'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object dbOrcamentoppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'orc_percdesc'
      FieldName = 'orc_percdesc'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object dbOrcamentoppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'orc_vlrtotal'
      FieldName = 'orc_vlrtotal'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object dbOrcamentoppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'orc_percmg'
      FieldName = 'orc_percmg'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object dbOrcamentoppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'orc_vlrlucro'
      FieldName = 'orc_vlrlucro'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object dbOrcamentoppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'orc_validade'
      FieldName = 'orc_validade'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 20
    end
    object dbOrcamentoppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'prz_codigo'
      FieldName = 'prz_codigo'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 21
    end
    object dbOrcamentoppField23: TppField
      FieldAlias = 'prz_descricao'
      FieldName = 'prz_descricao'
      FieldLength = 30
      DisplayWidth = 30
      Position = 22
    end
    object dbOrcamentoppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'frp_codigo'
      FieldName = 'frp_codigo'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 23
    end
    object dbOrcamentoppField25: TppField
      FieldAlias = 'frp_descricao'
      FieldName = 'frp_descricao'
      FieldLength = 20
      DisplayWidth = 20
      Position = 24
    end
    object dbOrcamentoppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'mdf_codigo'
      FieldName = 'mdf_codigo'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 25
    end
    object dbOrcamentoppField27: TppField
      FieldAlias = 'mdf_descricao'
      FieldName = 'mdf_descricao'
      FieldLength = 20
      DisplayWidth = 20
      Position = 26
    end
    object dbOrcamentoppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'sto_codigo'
      FieldName = 'sto_codigo'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 27
    end
    object dbOrcamentoppField29: TppField
      FieldAlias = 'sto_descricao'
      FieldName = 'sto_descricao'
      FieldLength = 20
      DisplayWidth = 20
      Position = 28
    end
    object dbOrcamentoppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'prv_numero'
      FieldName = 'prv_numero'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 29
    end
    object dbOrcamentoppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'ent_codigo'
      FieldName = 'ent_codigo'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 30
    end
    object dbOrcamentoppField32: TppField
      FieldAlias = 'ent_descricao'
      FieldName = 'ent_descricao'
      FieldLength = 20
      DisplayWidth = 20
      Position = 31
    end
  end
  object dsOrcamento: TDataSource
    DataSet = dmOrcamentos.qyOrcamentos
    Left = 272
    Top = 32
  end
end
