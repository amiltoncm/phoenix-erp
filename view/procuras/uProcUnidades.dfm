inherited frmProcUnidades: TfrmProcUnidades
  Caption = 'Procura Unidades'
  ClientHeight = 307
  ClientWidth = 230
  ExplicitWidth = 236
  ExplicitHeight = 335
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCampo: TLabel
    Width = 66
    Caption = '(Descri'#231#227'o)'
    ExplicitWidth = 66
  end
  inherited spProcura: TSpeedButton
    Left = 177
    Top = -15
    Anchors = [akRight, akBottom]
    OnClick = spProcuraClick
    ExplicitLeft = 286
    ExplicitTop = -15
  end
  inherited spLimpar: TSpeedButton
    Left = 199
    Top = -15
    Anchors = [akRight, akBottom]
    OnClick = spLimparClick
    ExplicitLeft = 308
    ExplicitTop = -15
  end
  inherited btFechar: TBitBtn
    Left = 117
    Top = 274
    ExplicitLeft = 109
    ExplicitTop = 274
  end
  inherited btConfirmar: TBitBtn
    Left = 8
    Top = 274
    Anchors = [akRight, akBottom]
    OnClick = btConfirmarClick
    ExplicitLeft = 8
    ExplicitTop = 274
  end
  inherited GridProcura: TDBGrid
    Width = 146
    Height = 211
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'UNI_CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNI_DESCRICAO'
        Width = 75
        Visible = True
      end>
  end
  inherited cbProcura: TwwDBLookupCombo
    Width = 124
    LookupTable = dmLookups.qyLkUnidades
    LookupField = 'UNI_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    OnKeyPress = cbProcuraKeyPress
    ExplicitWidth = 124
  end
  inherited dsProcura: TDataSource
    DataSet = dmCadastros.qyUnidades
    Left = 88
  end
end
