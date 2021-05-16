inherited frmImpItensFor: TfrmImpItensFor
  Caption = 'Importa'#231#227'o de Itens do Fornecedor'
  ClientHeight = 547
  ClientWidth = 994
  ExplicitWidth = 1000
  ExplicitHeight = 576
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 146
    Width = 994
    Height = 401
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    object JvDBGrid1: TJvDBGrid
      Left = 8
      Top = 63
      Width = 867
      Height = 330
      TabStop = False
      DataSource = dsItens
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      AlternateRowColor = clSkyBlue
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 17
      TitleRowHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'nItem'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cProd'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cEAN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'xProd'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'qCom'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'uCom'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NCM'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CEST'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vUnCom'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CFOP'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EXTIPI'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vProd'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cEANTrib'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'uTrib'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'qTrib'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vUnTrib'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'indTot'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'xPed'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nFCI'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'orig'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ICMS10_CST'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'modBC'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ICMS10_vBC'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pICMS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vICMS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'modBCST'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pMVAST'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vBCST'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pICMSST'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vICMSST'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IPITrib_CST'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IPITrib_vBC'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pIPI'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vIPI'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PISAliq_CST'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PISAliq_vBC'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pPIS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vPIS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COFINSAliq_CST'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COFINSAliq_vBC'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pCOFINS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vCOFINS'
          Visible = True
        end>
    end
    object btEntrada: TBitBtn
      Left = 881
      Top = 336
      Width = 105
      Height = 25
      Hint = 'Entrada no estoque'
      Caption = '&Entrada'
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
        E1B894E1B68CDFB180DCAB75EFC686B78183FF00FFEDBD92DCA887DCA887DCA8
        87B98384FF00FF007404B78183CA8F6B952B009A3401993401993300E4B57CB7
        8183FF00FFFF00FF45812CFF00FFFF00FFFF00FFFF00FF057E0EBA8E85F8EEE5
        A14213972E00942900BD7649FDE5B3B78183FF00FF017809109726FF00FFFF00
        FFFF00FF049012087F10CB9A82FFFFFFD5A992922600A04112ECCCAEFFEFC5B7
        818303750F49CC722EA848037008097B110C91160D9C1905730BDCA887FFFFFF
        FCF7F5AE5B33CD9574FBF1DEDECBB4428A3E44D2735CE78E3ECA6027B84014AB
        250EA31B07800FFF00FFE3B18EFFFFFFFFFFFFEDDBD1F9F2EAB78183B78183B7
        847530AB4A38C65826AF3D0D8A18098611077B0DFF00FFFF00FFEDBD92FFFFFF
        FFFFFFFFFFFFFDFFFFB78183DC9D64FF00FFFF00FF138E21199F29FF00FFFF00
        FFFF00FFFF00FFFF00FFEDBD92DCA887DCA887DCA887DCA887B78183FF00FFFF
        00FFFF00FFFF00FF0A7D12FF00FFFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 1
      OnClick = btEntradaClick
    end
    object btCadastrar: TBitBtn
      Left = 881
      Top = 74
      Width = 105
      Height = 25
      Hint = 'Vincular Produto x Fornecedor'
      Caption = '&Cadastrar'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00330F0000330F0000330F0000330F0000330F0000330F0000330F00003815
        0000330F0000381500003815000038150000FF00FF00FF00FF00FF00FF00FF00
        FF00330F0000330F0000613B0900613B09005E3908005C370700593406005632
        0500330F0000D4D4D400D4D4D40038150000FF00FF00FF00FF00FF00FF00FF00
        FF00330F0000330F0000673F0A00673F0A00643D0A00623B09005F3908005C37
        0700330F0000A5A5A500D4D4D40038150000FF00FF00FF00FF00FF00FF00FF00
        FF00330F0000330F000072490E006C440C006A420B0067400B00643E0A00613B
        0900330F0000FFFFFF00D4D4D40038150000FF00FF00FF00FF00FF00FF00FF00
        FF00330F0000330F000072490E0072490E006F470D006D440C006A420B00663F
        0A00330F0000A5A5A500D4D4D40038150000FF00FF00FF00FF00FF00FF00FF00
        FF00330F0000330F00007D521100774D1000754B0F0072490E00633B0A005D36
        0900330F0000FFFFFF00D4D4D40038150000FF00FF00FF00FF00FF00FF00FF00
        FF00330F0000330F00007D5211007D5211007A4F1000774D0F00381500003815
        00003815000038150000381500003815000038150000FF00FF00FF00FF00FF00
        FF00330F0000330F000086591400815613007E5312007B51110038150000FFFF
        FF00875A1400875A1400754B0F00754B0F00330F0000FF00FF00FF00FF00FF00
        FF00330F0000330F00008659140086591400835713008054120038150000330F
        0000330F0000330F0000330F0000330F0000330F0000FF00FF00FF00FF00FF00
        FF00330F0000330F00008E6017008A5D1500875A140084571300805412007C51
        1100330F0000FFFFFF00D4D4D40038150000FF00FF00FF00FF00FF00FF00FF00
        FF00330F0000330F00008E6017008E6017008B5D1600875A1400835713007F54
        1200330F0000A5A5A500D4D4D40038150000FF00FF00FF00FF00FF00FF00FF00
        FF00330F0000330F00009263180092631800330F00008A5D1500865A14008256
        1300330F0000FFFFFF00D4D4D40038150000FF00FF00FF00FF00FF00FF00FF00
        FF00330F0000330F00009566190095661900330F00008D5F1600895C15008558
        1400330F0000A5A5A500D4D4D40038150000FF00FF00FF00FF00FF00FF00FF00
        FF00330F0000330F00009768190097681900330F00008F6117008B5D1600865A
        1400330F0000FFFFFF00D4D4D40038150000FF00FF00FF00FF00FF00FF00FF00
        FF00330F0000330F000099691A0099691A00330F0000916217008C5E1600885B
        1500330F0000D4D4D400D4D4D40038150000FF00FF00FF00FF00FF00FF00FF00
        FF00330F0000330F0000330F0000330F0000330F0000330F0000330F0000330F
        000038150000381500003815000038150000FF00FF00FF00FF00}
      TabOrder = 2
      OnClick = btCadastrarClick
    end
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 990
      Height = 55
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 3
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = dbCodProduto
      end
      object Label14: TLabel
        Left = 71
        Top = 8
        Width = 38
        Height = 13
        Caption = 'Produto'
        FocusControl = dbProduto
      end
      object Label15: TLabel
        Left = 405
        Top = 8
        Width = 55
        Height = 13
        Caption = 'Fornecedor'
        FocusControl = dbFornecedor
      end
      object Label16: TLabel
        Left = 681
        Top = 8
        Width = 79
        Height = 13
        Caption = 'Ref. Fornecedor'
        FocusControl = dbRefForn
      end
      object Label17: TLabel
        Left = 801
        Top = 8
        Width = 57
        Height = 13
        Caption = 'Un. Compra'
        FocusControl = dbCompra
      end
      object Label18: TLabel
        Left = 867
        Top = 8
        Width = 50
        Height = 13
        Caption = 'Un. Venda'
        FocusControl = dbVenda
      end
      object sbVincular: TSpeedButton
        Left = 932
        Top = 27
        Width = 23
        Height = 22
        Hint = 'Vincular item'
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08
          780E08780EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF08780E76F9A70DA31B08780EFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08780E76
          F9A70EAA1D08780EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF08780E76F9A70EA81C08780EFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08780E76
          F9A710AA1F08780EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          08780E08780E08780E08780E08780E76F9A719B02C08780E08780E08780E0878
          0E08780EFF00FFFF00FFFF00FF08780E76F9A755E38349DA7242D36837C8562A
          B94322B3371CB23016AF270FA81D0EA91B0DA21B08780EFF00FFFF00FF08780E
          76F9A776F9A776F9A776F9A776F9A776F9A72CBB4876F9A776F9A776F9A776F9
          A776F9A708780EFF00FFFF00FFFF00FF08780E08780E08780E08780E08780E76
          F9A73CCB5D08780E08780E08780E08780E08780EFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF08780E76F9A749D97208780EFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08780E76
          F9A755E28208780EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF08780E76F9A763F09708780EFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08780E76
          F9A776F9A708780EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF08780E08780EFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        OnClick = sbVincularClick
      end
      object sbDesvincular: TSpeedButton
        Left = 961
        Top = 27
        Width = 23
        Height = 22
        Hint = 'Desvincular item'
        Flat = True
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
        OnClick = sbDesvincularClick
      end
      object dbCodProduto: TDBEdit
        Left = 8
        Top = 27
        Width = 57
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'PRO_CODIGO'
        DataSource = dsProdutosFor
        ReadOnly = True
        TabOrder = 0
      end
      object dbProduto: TDBEdit
        Left = 71
        Top = 27
        Width = 328
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'PRO_DESCRICAO'
        DataSource = dsProdutosFor
        ReadOnly = True
        TabOrder = 1
      end
      object dbFornecedor: TDBEdit
        Left = 405
        Top = 27
        Width = 270
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'PES_NOME'
        DataSource = dsProdutosFor
        ReadOnly = True
        TabOrder = 2
      end
      object dbRefForn: TDBEdit
        Left = 681
        Top = 27
        Width = 114
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'PRF_REFERENCIA'
        DataSource = dsProdutosFor
        ReadOnly = True
        TabOrder = 3
      end
      object dbCompra: TDBEdit
        Left = 801
        Top = 27
        Width = 60
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'PRF_UNIDADECP'
        DataSource = dsProdutosFor
        ReadOnly = True
        TabOrder = 4
      end
      object dbVenda: TDBEdit
        Left = 867
        Top = 27
        Width = 59
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'PRF_UNIDADEVD'
        DataSource = dsProdutosFor
        ReadOnly = True
        TabOrder = 5
      end
    end
  end
  inherited btFechar: TBitBtn
    Left = 881
    Top = 514
    ExplicitLeft = 881
    ExplicitTop = 514
  end
  object panFornecedor: TPanel
    Left = 0
    Top = 0
    Width = 994
    Height = 146
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 6
      Width = 59
      Height = 13
      Caption = 'Raz'#227'o social'
    end
    object Label3: TLabel
      Left = 8
      Top = 52
      Width = 25
      Height = 13
      Caption = 'CNPJ'
    end
    object Label4: TLabel
      Left = 505
      Top = 6
      Width = 69
      Height = 13
      Caption = 'Nome fantasia'
    end
    object Label5: TLabel
      Left = 127
      Top = 52
      Width = 68
      Height = 13
      Caption = 'Insc. Estadual'
    end
    object Label6: TLabel
      Left = 231
      Top = 52
      Width = 55
      Height = 13
      Caption = 'Logradouro'
    end
    object Label7: TLabel
      Left = 655
      Top = 52
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object Label8: TLabel
      Left = 718
      Top = 52
      Width = 28
      Height = 13
      Caption = 'Bairro'
    end
    object Label9: TLabel
      Left = 8
      Top = 98
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label10: TLabel
      Left = 407
      Top = 98
      Width = 59
      Height = 13
      Caption = 'C'#243'd. Cidade'
    end
    object Label11: TLabel
      Left = 472
      Top = 98
      Width = 13
      Height = 13
      Caption = 'UF'
    end
    object Label12: TLabel
      Left = 505
      Top = 98
      Width = 19
      Height = 13
      Caption = 'CEP'
    end
    object Label13: TLabel
      Left = 580
      Top = 98
      Width = 24
      Height = 13
      Caption = 'Fone'
    end
    object dbRazaoSocial: TDBEdit
      Left = 8
      Top = 25
      Width = 491
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'xNome'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 0
    end
    object dbFantasia: TDBEdit
      Left = 505
      Top = 25
      Width = 481
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'xFant'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 1
    end
    object dbCnpj: TDBEdit
      Left = 8
      Top = 71
      Width = 113
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'CNPJ'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 2
    end
    object dbIe: TDBEdit
      Left = 127
      Top = 71
      Width = 98
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'IE'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 3
    end
    object dbLogradouro: TDBEdit
      Left = 231
      Top = 71
      Width = 418
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'xLgr'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 4
    end
    object dbNumero: TDBEdit
      Left = 655
      Top = 71
      Width = 57
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'nro'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 5
    end
    object dbBairro: TDBEdit
      Left = 718
      Top = 71
      Width = 268
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'xBairro'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 6
    end
    object dbCidade: TDBEdit
      Left = 8
      Top = 117
      Width = 393
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'xMun'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 7
    end
    object dbCodCidade: TDBEdit
      Left = 407
      Top = 117
      Width = 59
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'cMun'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 8
    end
    object dbUf: TDBEdit
      Left = 472
      Top = 117
      Width = 27
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'UF'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 9
    end
    object dbCep: TDBEdit
      Left = 505
      Top = 117
      Width = 69
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'CEP'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 10
    end
    object dbFone: TDBEdit
      Left = 580
      Top = 117
      Width = 121
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'fone'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 11
    end
  end
  object dsProdutosFor: TDataSource
    DataSet = dmEstoque.qyProdutosFor
    Left = 88
    Top = 96
  end
  object dsItens: TDataSource
    DataSet = frmImpXMLPag.cdsItens
    OnDataChange = dsItensDataChange
    Left = 96
    Top = 272
  end
  object dsFornecedor: TDataSource
    DataSet = frmImpXMLPag.cdsFornecedor
    Left = 88
    Top = 24
  end
end
