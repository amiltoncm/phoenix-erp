inherited frmConsCartoes: TfrmConsCartoes
  Caption = 'Consulta Cart'#245'es'
  ClientHeight = 514
  ClientWidth = 858
  OnKeyPress = FormKeyPress
  ExplicitLeft = -75
  ExplicitTop = -98
  ExplicitWidth = 864
  ExplicitHeight = 543
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 51
    Height = 13
    Caption = #192' partir de'
  end
  inherited btFechar: TBitBtn
    Left = 745
    Top = 481
    ExplicitLeft = 745
    ExplicitTop = 688
  end
  object dtpDataInicial: TDateTimePicker
    Left = 8
    Top = 27
    Width = 137
    Height = 21
    Date = 43490.853118252310000000
    Time = 43490.853118252310000000
    TabOrder = 1
  end
  object JvDBGrid1: TJvDBGrid
    Left = 8
    Top = 54
    Width = 842
    Height = 419
    TabStop = False
    DataSource = dsConsulta
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    ScrollBars = ssVertical
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'cai_dataefet'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cai_data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cai_id'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pes_nome'
        Width = 305
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cai_numdoc'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mdc_codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'con_codigo'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'con_descricao'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cai_valor'
        Visible = True
      end>
  end
  object btFiltrar: TBitBtn
    Left = 151
    Top = 27
    Width = 94
    Height = 25
    Hint = 'Clique para executar o filtro'
    Caption = 'Fil&trar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFB78183
      B78183B78183B78183B78183B78183B78183B78183B78183B78183B78183B781
      83B78183FF00FFFF00FFFF00FFB78183FEEED4F7E3C5C7895DBB6221D9A878F3
      D3A2F1CF9AF0CF97F0CF98F0CF98F5D49AB78183FF00FFFF00FFFF00FFB78183
      FDEFD99FCBD03AA9CC677771BA5F1A7B70599DA795EECC99EECC97EECC97F3D1
      99B78183FF00FFFF00FFFF00FFB48176FEF3E337ADD393DCF572D1F066969FBC
      601AA67B52CC9062E3B887EECC97F3D199B78183FF00FFFF00FFFF00FFB48176
      FFF7EB37ADD3C1EFFE98DDF662CFF163A5B5BB6321D6B492C06A2BCD9365F3D1
      98B78183FF00FFFF00FFFF00FFBA8E85FFFCF437ADD3D8F8FFBCEBFD7CDDF863
      D5F54C95ABBF6A2BF6EDE4BE611CBD601AB78183FF00FFFF00FFFF00FFBA8E85
      FFFFFD37ADD3DDF9FFCDF4FF8FE8FE76E2FB37ADD3EAC8A6C27139EDD2BDEABF
      90BD601ABD601AFF00FFFF00FFCB9A82FFFFFF37ADD3DBF9FFCDF3FF94ECFE86
      EBFF3AA9CCE8C6A8C98252BD611CE4AF76DE9852BD601ABD601AFF00FFCB9A82
      FFFFFF37ADD3DCF9FFCFF4FF95EDFE8AEFFF3EA3C2BF6B32D59F77E1A261D789
      39BD601AFF00FFFF00FFFF00FFDCA887FFFFFF37ADD3E1FBFFD1F4FF95EDFF8C
      F0FF37ADD3E3BEA4C3733BBD601BDA8B39CA6504BD601AFF00FFFF00FFDCA887
      FFFFFF37ADD337ADD337ADD337ADD337ADD337ADD3FAEDDCFAEAD4CA9B81BD61
      1BBD601ABD601ABD601AFF00FFE3B18EFFFFFF37ADD398E1F494E4F982E2F871
      DBF337ADD3F1E1D5B8857AB8857AB8857AB78183FF00FFFF00FFFF00FFE3B18E
      FFFFFF99D7EB37ADD337ADD337ADD337ADD39BD7E8E3CFC9B8857AE8B270ECA5
      4AC58768FF00FFFF00FFFF00FFEDBD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFE4D4D2B8857AFAC577CD9377FF00FFFF00FFFF00FFFF00FFEDBD92
      FCF7F4FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB8857ACF9B86FF00
      FFFF00FFFF00FFFF00FFFF00FFEDBD92DCA887DCA887DCA887DCA887DCA887DC
      A887DCA887DCA887B8857AFF00FFFF00FFFF00FFFF00FFFF00FF}
    ParentShowHint = False
    ShowHint = True
    Spacing = 3
    TabOrder = 3
    OnClick = btFiltrarClick
  end
  object dsConsulta: TDataSource
    DataSet = dmConsultas.qyConsCartoes
    Left = 176
    Top = 24
  end
end
