inherited frmConsEstMin: TfrmConsEstMin
  Caption = 'Consulta estoque abaixo do m'#237'nimo'
  ClientHeight = 511
  ClientWidth = 1014
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  ExplicitLeft = -231
  ExplicitTop = -95
  ExplicitWidth = 1020
  ExplicitHeight = 540
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 478
    Width = 178
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Estoque dispon'#237'vel abaixo do m'#237'nimo.'
    ExplicitTop = 688
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 494
    Width = 155
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Estoque f'#237'sico abaixo do m'#237'nimo.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitTop = 704
  end
  object sbReservas: TSpeedButton [2]
    Left = 208
    Top = 481
    Width = 23
    Height = 22
    Hint = 'Ver itens reservados'
    Anchors = [akLeft, akBottom]
    Flat = True
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FF7A78787A78787A78787A78787A78787A7878FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7A77777A7878C7C7C8B5B4B3A6
      A39CA8A198B0A7A5C0B4B57A78787A7878FF00FFFF00FFFF00FFFF00FFFF00FF
      7A7878DAD9DBB3B3B1A7A598CBCAB9B5BACD9BA6D0CFCBBCA8A092A69692D0BB
      BC7A7878FF00FFFF00FFFF00FF7A7878DFDDDE5B915C5D9556FBF1DDFDE5C8AA
      B5F15774F5FFEDD9FFFFFBC0BFB49E8D86D5BBBC7A7878FF00FFFF00FF7A7878
      7DA87D0C85180C851893B46FF5D6A4F7CC94F6BF82F1C48FFCEDCAFFFFFDBEBC
      B0AA918D7A7878FF00FF7A787899C09C0C851852DE7F5EE9910C8518ABCE90FE
      F5CCF9E0B3F2C897F2CC99F7DBB1FDFCF19F9385D5B5B57A78785F8A620C8518
      3DCC6144D16A4DD9784DD4770C8518A9CF95FDFAD5FFF1C4FDD09AF3BB80FFEA
      CDC8C2B6BFA29D7A78780C85180C8518158D213ACA5C3CC65F0C85180C85180C
      851885867DB2B59CB09E7FCEA172AAB5F1A6AFCCB1968F7A78787A7878DFDAD6
      0C85182FBD4C32BC4F0C8518FDFDD8A5A5962E30323839372E3032B9976D5774
      F58092CBB89D937A78787A7878E6E5E50C851828B6412ABA4574B277FFFFECF7
      F7D7C5C5AF2E3032BBB59BFFDFA9FFE7BECDCBB3C4A5A57A78787A7878E8E7E9
      B1B79E0C851828BC410C8518BED9BFFFFFF3FFFFEADADAC32E30329E8C74FDFA
      DCAAA395D5B5B77A7878FF00FF7A7878DCD9D787A9760C851828BA410C85187B
      B77EB3D4B1C2DDC1B8CAA6A4A497CDCEB8B5A09E7A7878FF00FFFF00FF7A7877
      DDDEDFCCC8C491B17F0C85180C85180C85180C85180C851898C595DEDFC5B0A3
      9ED6BCBC7A7878FF00FFFF00FFFF00FF7A7878D7D7D9D1CDCBCFC6B8E7DDCEDF
      E3E0CEDEE4E7E4D7C5C2B5BFB0AECFBABA7A7878FF00FFFF00FFFF00FFFF00FF
      FF00FF7A78787A7878C8C9CAC6C4C2C5C0BAC6BFB7C2BAB7C3B8B97A78787A78
      78FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7B79797A78787A
      78787A78787A78787B7979FF00FFFF00FFFF00FFFF00FFFF00FF}
    OnClick = sbReservasClick
    ExplicitTop = 691
  end
  inherited btFechar: TBitBtn
    Left = 902
    Top = 478
    ExplicitLeft = 902
    ExplicitTop = 688
  end
  object GridEstMin: TJvDBGrid
    Left = 8
    Top = 8
    Width = 999
    Height = 465
    TabStop = False
    DataSource = dsConsulta
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = GridEstMinDrawColumnCell
    OnDblClick = GridEstMinDblClick
    SortMarker = smDown
    TitleButtons = True
    OnTitleBtnClick = GridEstMinTitleBtnClick
    ScrollBars = ssVertical
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    CanDelete = False
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'pro_descricao'
        Width = 268
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pro_codigo'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'uni_codigo'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'grp_descricao'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sgr_descricao'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mar_descricao'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pro_vlrcusto'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pro_estideal'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pro_estmin'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'est_fisico'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'est_reservas'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'est_disponivel'
        Width = 55
        Visible = True
      end>
  end
  object dsConsulta: TDataSource
    DataSet = dmConsultas.qyProdEstMin
    Left = 40
    Top = 256
  end
end
