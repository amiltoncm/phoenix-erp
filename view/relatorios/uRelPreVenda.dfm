inherited frmRelPreVenda: TfrmRelPreVenda
  Caption = 'Imprimir Pr'#233'-venda'
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbDados: TppDBPipeline
    Left = 112
    Top = 0
  end
  inherited Relatorio: TppReport
    PrinterSetup.DocumentName = 'Pr'#233'-venda'
    CachePages = True
    Left = 40
    Top = 24
    DataPipelineName = 'dbDados'
    inherited ppTitleBand1: TppTitleBand
      mmHeight = 9260
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDocumentName
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4995
        mmLeft = 0
        mmTop = 4233
        mmWidth = 20447
        BandType = 1
        LayerName = Foreground
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'PRV_NUMERO'
        DataPipeline = dbDados
        DisplayFormat = '000,000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbDados'
        mmHeight = 4995
        mmLeft = 172244
        mmTop = 4233
        mmWidth = 17198
        BandType = 1
        LayerName = Foreground
      end
    end
    inherited ppHeaderBand1: TppHeaderBand
      mmHeight = 47890
      inherited ppLinha1: TppLine
        LayerName = Foreground
      end
      object ppLabel1: TppLabel [1]
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Localiza'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 43921
        mmWidth = 20373
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel [2]
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 24871
        mmTop = 43921
        mmWidth = 19050
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel [3]
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Un.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 46038
        mmTop = 43921
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel [4]
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 56092
        mmTop = 43921
        mmWidth = 37571
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText6: TppDBText [5]
        UserName = 'DBText6'
        DataField = 'PES_NOME'
        DataPipeline = dbPrevenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbPrevenda'
        mmHeight = 3969
        mmLeft = 13229
        mmTop = 2910
        mmWidth = 87313
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel [6]
        UserName = 'Label5'
        Caption = 'Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 0
        mmTop = 2910
        mmWidth = 11853
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText7: TppDBText [7]
        UserName = 'DBText7'
        DataField = 'PES_CODIGO'
        DataPipeline = dbPrevenda
        DisplayFormat = '000,000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPrevenda'
        mmHeight = 4022
        mmLeft = 102394
        mmTop = 2910
        mmWidth = 14288
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel [8]
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Endere'#231'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 7938
        mmWidth = 16669
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText8: TppDBText [9]
        UserName = 'DBText8'
        DataField = 'PES_LOGRADOURO'
        DataPipeline = dbPrevenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbPrevenda'
        mmHeight = 3969
        mmLeft = 18256
        mmTop = 7938
        mmWidth = 73819
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText9: TppDBText [10]
        UserName = 'DBText9'
        DataField = 'PES_BAIRRO'
        DataPipeline = dbPrevenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbPrevenda'
        mmHeight = 3969
        mmLeft = 119327
        mmTop = 7938
        mmWidth = 70115
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText10: TppDBText [11]
        UserName = 'DBText10'
        DataField = 'PES_NUMERO'
        DataPipeline = dbPrevenda
        DisplayFormat = '###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPrevenda'
        mmHeight = 3969
        mmLeft = 102394
        mmTop = 7938
        mmWidth = 14288
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel7: TppLabel [12]
        UserName = 'Label7'
        Caption = 'N'#186'.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 94721
        mmTop = 7938
        mmWidth = 5757
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText11: TppDBText [13]
        UserName = 'DBText11'
        DataField = 'CID_MUNICIPIO'
        DataPipeline = dbPrevenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbPrevenda'
        mmHeight = 3969
        mmLeft = 0
        mmTop = 12965
        mmWidth = 92075
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText12: TppDBText [14]
        UserName = 'DBText12'
        DataField = 'UF_SIGLA'
        DataPipeline = dbPrevenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbPrevenda'
        mmHeight = 3969
        mmLeft = 94721
        mmTop = 12965
        mmWidth = 5821
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText13: TppDBText [15]
        UserName = 'DBText13'
        DataField = 'PES_CEP'
        DataPipeline = dbPrevenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbPrevenda'
        mmHeight = 3969
        mmLeft = 128852
        mmTop = 12965
        mmWidth = 17198
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel8: TppLabel [16]
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Fone:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 151077
        mmTop = 12965
        mmWidth = 10054
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText14: TppDBText [17]
        UserName = 'DBText14'
        DataField = 'PES_FONE'
        DataPipeline = dbPrevenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbPrevenda'
        mmHeight = 3969
        mmLeft = 162984
        mmTop = 12965
        mmWidth = 26458
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel9: TppLabel [18]
        UserName = 'Label9'
        Caption = 'CEP:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 119327
        mmTop = 12965
        mmWidth = 8170
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel10: TppLabel [19]
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Projeto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 17727
        mmWidth = 12965
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText15: TppDBText [20]
        UserName = 'DBText15'
        DataField = 'PRJ_CODIGO'
        DataPipeline = dbPrevenda
        DisplayFormat = '(000,000,000)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbPrevenda'
        mmHeight = 3969
        mmLeft = 147638
        mmTop = 17727
        mmWidth = 23283
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText16: TppDBText [21]
        UserName = 'DBText16'
        DataField = 'PRJ_DESCRICAO'
        DataPipeline = dbPrevenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbPrevenda'
        mmHeight = 3969
        mmLeft = 14288
        mmTop = 17727
        mmWidth = 131763
        BandType = 0
        LayerName = Foreground
      end
      object ppLine1: TppLine [22]
        UserName = 'Line1'
        Border.Weight = 1.000000000000000000
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 529
        mmTop = 22225
        mmWidth = 189707
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel11: TppLabel [23]
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 159015
        mmTop = 2646
        mmWidth = 10319
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText17: TppDBText [24]
        UserName = 'DBText17'
        DataField = 'PRV_DATA'
        DataPipeline = dbPrevenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbPrevenda'
        mmHeight = 4022
        mmLeft = 171186
        mmTop = 2646
        mmWidth = 18256
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText18: TppDBText [25]
        UserName = 'DBText18'
        DataField = 'MDF_DESCRICAO'
        DataPipeline = dbPrevenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbPrevenda'
        mmHeight = 3969
        mmLeft = 67204
        mmTop = 23019
        mmWidth = 38100
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel12: TppLabel [26]
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Entrega:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 23019
        mmWidth = 15081
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText19: TppDBText [27]
        UserName = 'DBText19'
        DataField = 'ENT_DESCRICAO'
        DataPipeline = dbPrevenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbPrevenda'
        mmHeight = 3969
        mmLeft = 15875
        mmTop = 23019
        mmWidth = 40746
        BandType = 0
        LayerName = Foreground
      end
      inherited ppLinha2: TppLine
        mmHeight = 265
        mmTop = 43392
        LayerName = Foreground
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Border.Weight = 1.000000000000000000
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 47361
        mmWidth = 189707
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Endere'#231'o de entrega:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 27781
        mmWidth = 32808
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'END_LOGRADOURO'
        DataPipeline = dbEndereco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbEndereco'
        mmHeight = 3969
        mmLeft = 34396
        mmTop = 27781
        mmWidth = 66146
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'N'#186'.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 102923
        mmTop = 27781
        mmWidth = 5757
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'END_NUMERO'
        DataPipeline = dbEndereco
        DisplayFormat = '#,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbEndereco'
        mmHeight = 3969
        mmLeft = 110067
        mmTop = 27781
        mmWidth = 14288
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = 'Complemento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 126736
        mmTop = 27781
        mmWidth = 23283
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'END_COMPLEMENTO'
        DataPipeline = dbEndereco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbEndereco'
        mmHeight = 3969
        mmLeft = 151871
        mmTop = 27781
        mmWidth = 37571
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'Bairro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 32544
        mmWidth = 10583
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'END_BAIRRO'
        DataPipeline = dbEndereco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbEndereco'
        mmHeight = 3969
        mmLeft = 12965
        mmTop = 32544
        mmWidth = 56092
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = 'Cidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 70644
        mmTop = 32544
        mmWidth = 13229
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'CID_MUNICIPIO'
        DataPipeline = dbEndereco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbEndereco'
        mmHeight = 3969
        mmLeft = 84667
        mmTop = 32544
        mmWidth = 64294
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = 'CEP:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 161925
        mmTop = 32544
        mmWidth = 9260
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'END_CEP'
        DataPipeline = dbEndereco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbEndereco'
        mmHeight = 3969
        mmLeft = 172244
        mmTop = 32544
        mmWidth = 17198
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'UF_SIGLA'
        DataPipeline = dbEndereco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbEndereco'
        mmHeight = 3969
        mmLeft = 151871
        mmTop = 32544
        mmWidth = 5821
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = 'Pt. de refer'#234'ncia:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 37571
        mmWidth = 27517
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'END_PTREFERENCIA'
        DataPipeline = dbEndereco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbEndereco'
        mmHeight = 3969
        mmLeft = 29369
        mmTop = 37571
        mmWidth = 96309
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 173038
        mmTop = 43921
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground
      end
    end
    inherited ppDetailBand1: TppDetailBand
      inherited ppLinha3: TppLine
        mmHeight = 265
        mmTop = 5556
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'LOC_DESCRICAO'
        DataPipeline = dbDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbDados'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1588
        mmWidth = 23813
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PRI_QUANTIDADE'
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
        mmLeft = 24871
        mmTop = 1588
        mmWidth = 19050
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'UNI_CODIGO'
        DataPipeline = dbDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbDados'
        mmHeight = 3598
        mmLeft = 46038
        mmTop = 1588
        mmWidth = 7408
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = dbDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbDados'
        mmHeight = 3704
        mmLeft = 56092
        mmTop = 1588
        mmWidth = 113506
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
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
        mmLeft = 172244
        mmTop = 1588
        mmWidth = 17198
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
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3598
        mmLeft = 173038
        mmTop = 5556
        mmWidth = 16341
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
    end
    object ppDesignLayers1: TppDesignLayers [4]
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
      end
    end
  end
  inherited dsDados: TDataSource
    DataSet = dmOrcamentos.qyPrevItens
    Left = 112
    Top = 56
  end
  object dsPrevenda: TDataSource
    DataSet = dmOrcamentos.qyPrevendas
    Left = 192
    Top = 64
  end
  object dbPrevenda: TppDBPipeline
    DataSource = dsPrevenda
    UserName = 'dbPrevenda'
    Left = 200
  end
  object dbEndereco: TppDBPipeline
    DataSource = dsEndereco
    UserName = 'dbEndereco'
    Left = 280
  end
  object dsEndereco: TDataSource
    DataSet = dmOrcamentos.qyRelEndEnt
    Left = 280
    Top = 56
  end
end
