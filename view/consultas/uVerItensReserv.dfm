inherited frmVerItensReserv: TfrmVerItensReserv
  Caption = 'Itens reservados'
  ClientHeight = 721
  ClientWidth = 861
  OnKeyPress = FormKeyPress
  ExplicitLeft = -145
  ExplicitWidth = 867
  ExplicitHeight = 750
  PixelsPerInch = 96
  TextHeight = 13
  inherited btFechar: TBitBtn
    Left = 748
    Top = 688
    ExplicitLeft = 748
    ExplicitTop = 688
  end
  object JvDBGrid1: TJvDBGrid
    Left = 8
    Top = 8
    Width = 845
    Height = 674
    TabStop = False
    DataSource = dsConsulta
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    AlternateRowColor = clMoneyGreen
    AlternateRowFontColor = clBlack
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
        FieldName = 'prv_numero'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prv_data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pro_codigo'
        Title.Caption = 'C'#243'd. Prod.'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pro_descricao'
        Width = 290
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pes_nome'
        Width = 215
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pes_codigo'
        Title.Caption = 'C'#243'digo'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pri_quantidade'
        Visible = True
      end>
  end
  object dsConsulta: TDataSource
    DataSet = dmConsultas.qyItensReservados
    Left = 80
    Top = 88
  end
end
