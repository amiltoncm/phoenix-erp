inherited frmConsItensPV: TfrmConsItensPV
  Caption = 'Itens da Pr'#233'-venda'
  ClientHeight = 425
  ClientWidth = 977
  OnKeyPress = FormKeyPress
  ExplicitLeft = -34
  ExplicitWidth = 983
  ExplicitHeight = 454
  PixelsPerInch = 96
  TextHeight = 13
  inherited btFechar: TBitBtn
    Left = 864
    Top = 392
  end
  object GridPagar: TJvDBGrid
    Left = 8
    Top = 8
    Width = 961
    Height = 376
    TabStop = False
    DataSource = dsItensPV
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
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
        FieldName = 'PRI_QUANTIDADE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_DESCRICAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNI_CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRI_VLRBRT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRI_VLRDESC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRI_PERCDESC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRI_VLRLIQ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRI_VLRTOTAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOC_DESCRICAO'
        Visible = True
      end>
  end
  object dsItensPV: TDataSource
    DataSet = dmConsultas.qyConsPrevItens
    Left = 120
    Top = 280
  end
end
