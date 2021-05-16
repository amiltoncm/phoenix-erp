inherited frmEstacoes: TfrmEstacoes
  Caption = 'Esta'#231#245'es - M'#225'quinas registradas'
  ClientHeight = 424
  ClientWidth = 433
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  ExplicitWidth = 439
  ExplicitHeight = 452
  PixelsPerInch = 96
  TextHeight = 13
  object lbNumMaq: TLabel [0]
    Left = 8
    Top = 403
    Width = 49
    Height = 13
    CustomHint = BalloonHint1
    Caption = 'lbNumMaq'
  end
  inherited btFechar: TBitBtn
    Left = 320
    Top = 391
    ExplicitLeft = 322
    ExplicitTop = 391
  end
  object JvDBGrid1: TJvDBGrid [2]
    Left = 8
    Top = 8
    Width = 417
    Height = 377
    CustomHint = BalloonHint1
    DataSource = dsSistema
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    AlternateRowColor = clMoneyGreen
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
        FieldName = 'SIS_MAQUINA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SIS_ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SIS_SERIAL'
        Visible = True
      end>
  end
  object dsSistema: TDataSource
    DataSet = dmCadastros.qySistema
    Left = 80
    Top = 144
  end
end
