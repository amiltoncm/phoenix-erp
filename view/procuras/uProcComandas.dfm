inherited frmProcComandas: TfrmProcComandas
  Caption = 'Procura Comandas'
  ClientHeight = 315
  ClientWidth = 239
  ExplicitWidth = 245
  ExplicitHeight = 344
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCampo: TLabel
    Width = 66
    Caption = '(Descri'#231#227'o)'
    ExplicitWidth = 66
  end
  inherited spProcura: TSpeedButton
    Left = 181
    OnClick = spProcuraClick
    ExplicitLeft = 181
  end
  inherited spLimpar: TSpeedButton
    Left = 210
    OnClick = spLimparClick
    ExplicitLeft = 210
  end
  inherited btFechar: TBitBtn
    Left = 126
    Top = 282
    ExplicitLeft = 192
    ExplicitTop = 316
  end
  inherited btConfirmar: TBitBtn
    Left = 15
    Top = 282
    Anchors = [akRight, akBottom]
    OnClick = btConfirmarClick
    ExplicitLeft = 84
    ExplicitTop = 316
  end
  inherited GridProcura: TDBGrid
    Width = 223
    Height = 219
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'cma_descricao'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cma_codigo'
        Visible = True
      end>
  end
  inherited cbProcura: TwwDBLookupCombo
    Width = 167
    LookupTable = dmLookups.qyLkComandas
    LookupField = 'cma_descricao'
    Options = [loColLines, loRowLines, loTitles]
    OnKeyPress = cbProcuraKeyPress
    ExplicitWidth = 167
  end
  inherited dsProcura: TDataSource
    DataSet = dmGestao.qyComandas
    Left = 88
  end
end
