inherited frmConsProdutos: TfrmConsProdutos
  Caption = 'Procurar produtos'
  ClientHeight = 441
  ClientWidth = 901
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  ExplicitWidth = 907
  ExplicitHeight = 470
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 8
    Top = 393
    Width = 89
    Height = 13
    Caption = 'Estoque dispon'#237'vel'
  end
  object Label4: TLabel [1]
    Left = 135
    Top = 393
    Width = 45
    Height = 13
    Caption = 'Reservas'
  end
  object Label5: TLabel [2]
    Left = 262
    Top = 393
    Width = 68
    Height = 13
    Caption = 'Estoque F'#237'sico'
  end
  object Label21: TLabel [3]
    Left = 389
    Top = 393
    Width = 54
    Height = 13
    Caption = 'Localiza'#231#227'o'
    FocusControl = dbLocalizacaoEst
  end
  inherited btFechar: TBitBtn
    Left = 788
    Top = 408
    TabOrder = 1
    ExplicitLeft = 788
    ExplicitTop = 408
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 887
    Height = 346
    ActivePage = tsProduto
    MultiLine = True
    TabOrder = 0
    object tsProduto: TTabSheet
      Caption = 'Produto'
      object Label1: TLabel
        Left = 3
        Top = 8
        Width = 100
        Height = 13
        Caption = 'C'#243'digo / Cod. Barras'
      end
      object Label2: TLabel
        Left = 130
        Top = 8
        Width = 38
        Height = 13
        Caption = 'Produto'
      end
      object SpeedButton1: TSpeedButton
        Left = 648
        Top = 26
        Width = 23
        Height = 22
        Hint = 'Limpar procura (F12)'
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          B78183B78183B78183B78183B78183B78183B78183B78183B78183B78183B781
          83B78183B78183FF00FFFF00FFFF00FFB78183FEEED4D3D8A9DFD9ABF5DBB4ED
          D6A7EED29FF1CF9AF0CF97F0CF98F0CF98F5D49AB78183FF00FFFF00FFFF00FF
          B78183FDEFD9AECE9046AD3889BE6936A72937A7287AB553D6C78AEECC97EECC
          97F3D199B78183FF00FFFF00FFFF00FFB48176FEF3E3CDD9AE20A31C029A0302
          9A03029A03029A0341A82EE6CA95EECC97F3D199B78183FF00FFFF00FFFF00FF
          B48176FFF7EBCCDCB324A51F029A032FA726BBCC8E8CBD680C9C0A90BB63EFCD
          99F3D198B78183FF00FFFF00FFFF00FFBA8E85FFFCF4CBDFBA17A116029A030C
          9D0C9AC57AF4DBBBB8C78887BF69F0D0A1F3D29BB78183FF00FFFF00FFFF00FF
          BA8E85FFFFFDE8EDDBB7D8A6AED399A9CF90AECE90F2DEC0F4DBBAB3D092F0D4
          A9F5D5A3B78183FF00FFFF00FFFF00FFCB9A82FFFFFFBAE2B7FBF3ECF7EEDFB1
          D39CAACF90ACCD8EB3CC8EEFDAB6F2D8B2F6D9ACB78183FF00FFFF00FFFF00FF
          CB9A82FFFFFF8DD28EC1E1BBFBF3EC9CCF8F0D9D0C029A0317A014F6DEC1F4DB
          B9F8DDB4B78183FF00FFFF00FFFF00FFDCA887FFFFFF99D69A0D9D0E93D18EC0
          DEB430AA2C029A0324A41FF6E2C8F7E1C2F0DAB7B78183FF00FFFF00FFFF00FF
          DCA887FFFFFFF6FBF645B546029A03029A03029A03029A0321A41EFCEFD9E6D9
          C4C6BCA9B78183FF00FFFF00FFFF00FFE3B18EFFFFFFFFFFFFE5F5E581CD813B
          B03B38AE378ECD8545AE3DAA8771B8857AB8857AB78183FF00FFFF00FFFF00FF
          E3B18EFFFFFFFFFFFFFFFFFFFFFFFFE8F6E8E7F5E5FFFEF9BEC6A8A2886CE8B2
          70ECA54AC58768FF00FFFF00FFFF00FFEDBD92FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFE4D4D2B8857AFAC577CD9377FF00FFFF00FFFF00FFFF00FF
          EDBD92FCF7F4FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB8857ACF9B
          86FF00FFFF00FFFF00FFFF00FFFF00FFEDBD92DCA887DCA887DCA887DCA887DC
          A887DCA887DCA887DCA887B8857AFF00FFFF00FFFF00FFFF00FF}
        OnClick = SpeedButton1Click
      end
      object edCodigo: TEdit
        Left = 3
        Top = 27
        Width = 121
        Height = 21
        Hint = 'Digite o c'#243'digo do produto, c'#243'digo de barras ou deixe em branco'
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 0
        Text = 'edCodigo'
        OnExit = edCodigoExit
      end
      object edProduto: TEdit
        Left = 130
        Top = 27
        Width = 502
        Height = 21
        Hint = 'Digite parte do nome do produto'
        TabOrder = 1
        Text = 'edProduto'
        OnExit = edProdutoExit
      end
      object GridProdutos: TJvDBGrid
        Left = 3
        Top = 54
        Width = 868
        Height = 262
        DataSource = dsProdutos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = GridProdutosDrawColumnCell
        AlternateRowColor = clMoneyGreen
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'PRO_CODIGO'
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRO_DESCRICAO'
            Width = 580
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNI_CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRO_VLRVAR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRO_VLRATAC'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GRP_DESCRICAO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SGR_DESCRICAO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MAR_DESCRICAO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRO_CODBARRAS'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LOC_DESCRICAO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIP_DESCRICAO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRO_CLASSFISC'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pro_dtcad'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRO_NCM'
            Visible = True
          end>
      end
    end
    object tsDetalhes: TTabSheet
      Caption = 'Detalhes'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label6: TLabel
        Left = 343
        Top = 8
        Width = 54
        Height = 13
        Caption = 'C'#243'd. grupo'
        FocusControl = dbCodGrupo
      end
      object Label7: TLabel
        Left = 8
        Top = 8
        Width = 29
        Height = 13
        Caption = 'Grupo'
        FocusControl = dbGrupo
      end
      object Label8: TLabel
        Left = 343
        Top = 54
        Width = 72
        Height = 13
        Caption = 'C'#243'd. Subgrupo'
        FocusControl = dbCodSubGrupo
      end
      object Label9: TLabel
        Left = 8
        Top = 54
        Width = 46
        Height = 13
        Caption = 'Subgrupo'
        FocusControl = dbSubGrupo
      end
      object Label10: TLabel
        Left = 8
        Top = 100
        Width = 29
        Height = 13
        Caption = 'Marca'
        FocusControl = dbMarca
      end
      object Label11: TLabel
        Left = 343
        Top = 100
        Width = 55
        Height = 13
        Caption = 'C'#243'd. Marca'
        FocusControl = dbCodMarca
      end
      object Label12: TLabel
        Left = 8
        Top = 146
        Width = 54
        Height = 13
        Caption = 'Localiza'#231#227'o'
        FocusControl = dbLocalizacao
      end
      object Label13: TLabel
        Left = 278
        Top = 146
        Width = 50
        Height = 13
        Caption = 'C'#243'd. Local'
        FocusControl = dbCodLocal
      end
      object Label14: TLabel
        Left = 361
        Top = 146
        Width = 57
        Height = 13
        Caption = 'C'#243'd. Barras'
        FocusControl = dbCodBarras
      end
      object Label15: TLabel
        Left = 8
        Top = 192
        Width = 60
        Height = 13
        Caption = 'Tipo do Item'
        FocusControl = dbTpItem
      end
      object Label16: TLabel
        Left = 343
        Top = 192
        Width = 46
        Height = 13
        Caption = 'C'#243'd. Tipo'
        FocusControl = dbCodTp
      end
      object Label17: TLabel
        Left = 8
        Top = 238
        Width = 90
        Height = 13
        Caption = 'Classifica'#231#227'o Fiscal'
        FocusControl = dbClassificacao
      end
      object Label18: TLabel
        Left = 148
        Top = 238
        Width = 52
        Height = 13
        Caption = 'Peso Bruto'
        FocusControl = dbPesoBrt
      end
      object Label19: TLabel
        Left = 288
        Top = 238
        Width = 59
        Height = 13
        Caption = 'Peso L'#237'quido'
        FocusControl = dbPesoLiq
      end
      object Label20: TLabel
        Left = 426
        Top = 238
        Width = 22
        Height = 13
        Caption = 'NCM'
        FocusControl = dbNCM
      end
      object Label24: TLabel
        Left = 480
        Top = 146
        Width = 85
        Height = 13
        Caption = 'Qtde. Embalagem'
        FocusControl = dbCodBarras
      end
      object Label25: TLabel
        Left = 571
        Top = 146
        Width = 92
        Height = 13
        Caption = 'C'#243'd. Barras (Emb.)'
        FocusControl = dbCodBarEmb
      end
      object dbCodGrupo: TDBEdit
        Left = 343
        Top = 27
        Width = 77
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'GRP_CODIGO'
        DataSource = dsProdutos
        ReadOnly = True
        TabOrder = 2
      end
      object dbGrupo: TDBEdit
        Left = 8
        Top = 27
        Width = 329
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'GRP_DESCRICAO'
        DataSource = dsProdutos
        ReadOnly = True
        TabOrder = 3
      end
      object dbCodSubGrupo: TDBEdit
        Left = 343
        Top = 73
        Width = 77
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'SGR_CODIGO'
        DataSource = dsProdutos
        ReadOnly = True
        TabOrder = 4
      end
      object dbSubGrupo: TDBEdit
        Left = 8
        Top = 73
        Width = 329
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'SGR_DESCRICAO'
        DataSource = dsProdutos
        ReadOnly = True
        TabOrder = 5
      end
      object dbMarca: TDBEdit
        Left = 8
        Top = 119
        Width = 329
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'MAR_DESCRICAO'
        DataSource = dsProdutos
        ReadOnly = True
        TabOrder = 6
      end
      object dbCodMarca: TDBEdit
        Left = 343
        Top = 119
        Width = 77
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'MAR_CODIGO'
        DataSource = dsProdutos
        ReadOnly = True
        TabOrder = 7
      end
      object dbLocalizacao: TDBEdit
        Left = 8
        Top = 165
        Width = 264
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'LOC_DESCRICAO'
        DataSource = dsProdutos
        ReadOnly = True
        TabOrder = 0
      end
      object dbCodLocal: TDBEdit
        Left = 278
        Top = 165
        Width = 77
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'LOC_CODIGO'
        DataSource = dsProdutos
        ReadOnly = True
        TabOrder = 8
      end
      object dbCodBarras: TDBEdit
        Left = 361
        Top = 165
        Width = 113
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'PRO_CODBARRAS'
        DataSource = dsProdutos
        ReadOnly = True
        TabOrder = 9
      end
      object dbTpItem: TDBEdit
        Left = 8
        Top = 211
        Width = 329
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'TIP_DESCRICAO'
        DataSource = dsProdutos
        ReadOnly = True
        TabOrder = 10
      end
      object dbCodTp: TDBEdit
        Left = 343
        Top = 211
        Width = 77
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'TIP_CODIGO'
        DataSource = dsProdutos
        ReadOnly = True
        TabOrder = 11
      end
      object dbClassificacao: TDBEdit
        Left = 8
        Top = 257
        Width = 134
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'PRO_CLASSFISC'
        DataSource = dsProdutos
        ReadOnly = True
        TabOrder = 12
      end
      object dbPesoBrt: TDBEdit
        Left = 148
        Top = 257
        Width = 134
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'PRO_PESOBRUTO'
        DataSource = dsProdutos
        ReadOnly = True
        TabOrder = 13
      end
      object dbPesoLiq: TDBEdit
        Left = 288
        Top = 257
        Width = 132
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'PRO_PESOLIQ'
        DataSource = dsProdutos
        ReadOnly = True
        TabOrder = 14
      end
      object dbNCM: TDBEdit
        Left = 426
        Top = 257
        Width = 134
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'PRO_NCM'
        DataSource = dsProdutos
        ReadOnly = True
        TabOrder = 1
      end
      object dbEmbalagem: TDBEdit
        Left = 480
        Top = 165
        Width = 85
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'pro_embalagem'
        DataSource = dsProdutos
        ReadOnly = True
        TabOrder = 15
      end
      object dbCodBarEmb: TDBEdit
        Left = 571
        Top = 165
        Width = 113
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'pro_codbarrasemb'
        DataSource = dsProdutos
        ReadOnly = True
        TabOrder = 16
      end
    end
    object tsMovimentações: TTabSheet
      Caption = 'Movimenta'#231#245'es'
      ImageIndex = 2
      object Panel1: TPanel
        Left = 2
        Top = 3
        Width = 691
        Height = 312
        BevelInner = bvLowered
        Color = clSkyBlue
        ParentBackground = False
        TabOrder = 0
        object Label22: TLabel
          Left = 8
          Top = 8
          Width = 74
          Height = 13
          Caption = 'Movimenta'#231#245'es'
        end
        object GridMov: TDBGrid
          Left = 8
          Top = 27
          Width = 678
          Height = 278
          TabStop = False
          DataSource = dsProdutosMov
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = GridMovDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'prm_data'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PES_NOME'
              Width = 295
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PES_CODIGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRM_NOTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRM_SERIE'
              Width = 32
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRM_MODELO'
              Title.Caption = 'Mod.'
              Width = 32
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRM_QUANTIDADE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRM_TIPO'
              Width = 26
              Visible = True
            end>
        end
      end
      object pnReservas: TPanel
        Left = 697
        Top = 3
        Width = 177
        Height = 312
        BevelInner = bvLowered
        Color = clMoneyGreen
        ParentBackground = False
        TabOrder = 1
        object Label23: TLabel
          Left = 8
          Top = 8
          Width = 111
          Height = 13
          Caption = 'Reservas (Pr'#233'-vendas)'
        end
        object GridReservas: TDBGrid
          Left = 8
          Top = 27
          Width = 163
          Height = 278
          TabStop = False
          DataSource = dsPrevRes
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'prv_numero'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'pri_quantidade'
              Visible = True
            end>
        end
      end
    end
    object tsComplementares: TTabSheet
      Caption = 'Produtos Complementares'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GridComp: TDBGrid
        Left = 3
        Top = 3
        Width = 791
        Height = 312
        TabStop = False
        DataSource = dsProdComp
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'pro_codcomp'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pro_descricao'
            Width = 540
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'uni_codigo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pro_vlrvar'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pro_vlratac'
            Visible = True
          end>
      end
    end
    object tsSimilares: TTabSheet
      Caption = 'Produtos Similares'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GridSim: TDBGrid
        Left = 3
        Top = 3
        Width = 791
        Height = 312
        TabStop = False
        DataSource = dsProdSim
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'pro_codsim'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pro_descricao'
            Width = 540
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'uni_codigo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pro_vlrvar'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pro_vlratac'
            Visible = True
          end>
      end
    end
    object tsObs: TTabSheet
      Caption = 'Obs'
      ImageIndex = 5
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object reMemObs: TDBRichEdit
        Left = 3
        Top = 3
        Width = 873
        Height = 312
        TabStop = False
        DataField = 'pro_obs'
        DataSource = dsProdObs
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 1000
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object panProduto: TPanel
    Left = 8
    Top = 353
    Width = 885
    Height = 34
    BevelInner = bvLowered
    Caption = 'panProduto'
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
  end
  object dbDisponivel: TDBEdit
    Left = 8
    Top = 412
    Width = 121
    Height = 21
    TabStop = False
    Color = clMoneyGreen
    DataField = 'EST_DISPONIVEL'
    DataSource = dsProdutosEst
    ReadOnly = True
    TabOrder = 3
  end
  object dbReservas: TDBEdit
    Left = 135
    Top = 412
    Width = 121
    Height = 21
    TabStop = False
    Color = clMoneyGreen
    DataField = 'EST_RESERVAS'
    DataSource = dsProdutosEst
    ReadOnly = True
    TabOrder = 4
    OnDblClick = dbReservasDblClick
  end
  object dbFisico: TDBEdit
    Left = 262
    Top = 412
    Width = 121
    Height = 21
    TabStop = False
    Color = clMoneyGreen
    DataField = 'EST_FISICO'
    DataSource = dsProdutosEst
    ReadOnly = True
    TabOrder = 5
  end
  object dbLocalizacaoEst: TDBEdit
    Left = 389
    Top = 412
    Width = 264
    Height = 21
    TabStop = False
    Color = clMoneyGreen
    DataField = 'LOC_DESCRICAO'
    DataSource = dsProdutos
    ReadOnly = True
    TabOrder = 6
  end
  object dsProdutos: TDataSource
    DataSet = dmCadastros.qyProdutos
    OnDataChange = dsProdutosDataChange
    Left = 56
    Top = 56
  end
  object dsProdutosEst: TDataSource
    DataSet = dmEstoque.qyProdutosEst
    Left = 56
    Top = 112
  end
  object dsProdutosMov: TDataSource
    DataSet = dmConsultas.qyConsProdutosMov
    Left = 56
    Top = 176
  end
  object dsPrevRes: TDataSource
    DataSet = dmOrcamentos.qyConsPrevRes
    Left = 64
    Top = 248
  end
  object dsProdComp: TDataSource
    DataSet = dmEstoque.qyProdutosComp
    Left = 432
    Top = 256
  end
  object dsProdSim: TDataSource
    DataSet = dmEstoque.qyProdutosSim
    Left = 536
    Top = 256
  end
  object dsProdObs: TDataSource
    DataSet = dmEstoque.qyProdutosObs
    Left = 640
    Top = 256
  end
end
