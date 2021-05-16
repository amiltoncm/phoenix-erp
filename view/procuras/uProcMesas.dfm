inherited frmProcMesas: TfrmProcMesas
  Caption = 'Procura Mesas'
  ClientHeight = 323
  ClientWidth = 241
  ExplicitWidth = 247
  ExplicitHeight = 352
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCampo: TLabel
    Width = 64
    Caption = '(descri'#231#227'o)'
    ExplicitWidth = 64
  end
  inherited spProcura: TSpeedButton
    Left = 176
    OnClick = spProcuraClick
    ExplicitLeft = 176
  end
  inherited spLimpar: TSpeedButton
    Left = 205
    OnClick = spLimparClick
    ExplicitLeft = 205
  end
  inherited btFechar: TBitBtn
    Left = 128
    Top = 290
    ExplicitLeft = 129
    ExplicitTop = 290
  end
  inherited btConfirmar: TBitBtn
    Left = 17
    Top = 290
    Anchors = [akRight, akBottom]
    OnClick = btConfirmarClick
    ExplicitLeft = 78
    ExplicitTop = 316
  end
  inherited GridProcura: TDBGrid
    Left = 10
    Width = 223
    Height = 227
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'mes_codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mes_descricao'
        Visible = True
      end>
  end
  inherited cbProcura: TwwDBLookupCombo
    Width = 162
    LookupTable = dmLookups.qyLkMesas
    LookupField = 'mes_descricao'
    Options = [loColLines, loRowLines, loTitles]
    OnKeyPress = cbProcuraKeyPress
    ExplicitWidth = 162
  end
  inherited dsProcura: TDataSource
    DataSet = dmGestao.qyMesas
    Left = 88
  end
end
