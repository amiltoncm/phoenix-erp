inherited frmProcFormpag: TfrmProcFormpag
  Caption = 'Procura Forma de Pagamento'
  ClientHeight = 323
  ClientWidth = 238
  ExplicitWidth = 244
  ExplicitHeight = 351
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCampo: TLabel
    Width = 66
    Caption = '(Descri'#231#227'o)'
    ExplicitWidth = 66
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
    Left = 125
    Top = 290
    ExplicitLeft = 125
    ExplicitTop = 290
  end
  inherited btConfirmar: TBitBtn
    Left = 14
    Top = 290
    Anchors = [akRight, akBottom]
    OnClick = btConfirmarClick
    ExplicitLeft = 14
    ExplicitTop = 290
  end
  inherited GridProcura: TDBGrid
    Width = 222
    Height = 227
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'frp_descricao'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'frp_codigo'
        Visible = True
      end>
  end
  inherited cbProcura: TwwDBLookupCombo
    Width = 162
    LookupTable = dmLookups.qyLkFormPag
    LookupField = 'FRP_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    OnKeyPress = cbProcuraKeyPress
    ExplicitWidth = 162
  end
  inherited dsProcura: TDataSource
    DataSet = dmFinanceiro.qyFormPag
    Left = 88
  end
end
