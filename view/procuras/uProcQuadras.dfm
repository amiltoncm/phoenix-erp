inherited frmProcQuadras: TfrmProcQuadras
  Caption = 'Procura Quadra'
  ClientHeight = 299
  ClientWidth = 240
  ExplicitWidth = 246
  ExplicitHeight = 328
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCampo: TLabel
    Width = 66
    Caption = '(Descri'#231#227'o)'
    ExplicitWidth = 66
  end
  inherited spProcura: TSpeedButton
    Left = 179
    OnClick = spProcuraClick
    ExplicitLeft = 179
  end
  inherited spLimpar: TSpeedButton
    Left = 208
    OnClick = spLimparClick
    ExplicitLeft = 208
  end
  inherited btFechar: TBitBtn
    Left = 127
    Top = 266
    ExplicitLeft = 127
    ExplicitTop = 266
  end
  inherited btConfirmar: TBitBtn
    Left = 16
    Top = 266
    Anchors = [akRight, akBottom]
    OnClick = btConfirmarClick
    ExplicitLeft = 16
    ExplicitTop = 266
  end
  inherited GridProcura: TDBGrid
    Width = 223
    Height = 203
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
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
  inherited cbProcura: TwwDBLookupCombo
    Width = 165
    LookupTable = dmLookups.qyLkQuadras
    LookupField = 'qda_descricao'
    Options = [loColLines, loRowLines, loTitles]
    OnKeyPress = cbProcuraKeyPress
    ExplicitWidth = 165
  end
  inherited dsProcura: TDataSource
    DataSet = dmGestao.qyQuadras
    Left = 88
  end
end
