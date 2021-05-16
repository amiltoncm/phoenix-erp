inherited frmConsAgenda: TfrmConsAgenda
  Caption = 'Agenda - Vis'#227'o Geral'
  ClientHeight = 631
  ClientWidth = 986
  OnKeyPress = FormKeyPress
  ExplicitTop = -25
  ExplicitWidth = 992
  ExplicitHeight = 660
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 47
    Width = 23
    Height = 13
    Caption = 'Data'
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 232
    Width = 36
    Height = 13
    Caption = 'Quadra'
  end
  object Label3: TLabel [2]
    Left = 239
    Top = 47
    Width = 72
    Height = 13
    Caption = 'Agendamentos'
  end
  inherited btFechar: TBitBtn
    Left = 873
    Top = 600
    TabOrder = 2
    ExplicitLeft = 901
    ExplicitTop = 600
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 986
    Height = 41
    Align = alTop
    Caption = 'Agenda - Vis'#227'o Geral'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    ExplicitLeft = 152
    ExplicitTop = 48
    ExplicitWidth = 185
  end
  object mcDataAge: TMonthCalendar
    Left = 8
    Top = 66
    Width = 225
    Height = 160
    Date = 44198.000000000000000000
    TabOrder = 0
    TabStop = True
    OnClick = mcDataAgeClick
  end
  object JvDBGrid1: TJvDBGrid
    Left = 8
    Top = 251
    Width = 223
    Height = 374
    DataSource = dsQuadras
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = JvDBGrid1CellClick
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
        FieldName = 'qda_codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qda_descricao'
        Visible = True
      end>
  end
  object JvDBGrid2: TJvDBGrid
    Left = 239
    Top = 66
    Width = 623
    Height = 559
    TabStop = False
    DataSource = dsConsAgenda
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = JvDBGrid2DrawColumnCell
    OnDblClick = JvDBGrid2DblClick
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
        FieldName = 'agd_dataag'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hor_horas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pes_nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pes_fone'
        Visible = True
      end>
  end
  object dsQuadras: TDataSource
    DataSet = dmGestao.qyQuadras
    Left = 48
    Top = 88
  end
  object dsConsAgenda: TDataSource
    DataSet = dmGestao.qyConsAgenda
    Left = 288
    Top = 88
  end
end
