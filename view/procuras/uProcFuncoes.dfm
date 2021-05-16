inherited frmProcFuncoes: TfrmProcFuncoes
  Caption = 'Procura Fun'#231#245'es'
  ClientHeight = 282
  ClientWidth = 238
  ExplicitWidth = 244
  ExplicitHeight = 310
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCampo: TLabel
    Width = 66
    Caption = '(Descri'#231#227'o)'
    ExplicitWidth = 66
  end
  inherited spProcura: TSpeedButton
    Left = 178
    OnClick = spProcuraClick
    ExplicitLeft = 178
  end
  inherited spLimpar: TSpeedButton
    Left = 207
    OnClick = spLimparClick
    ExplicitLeft = 207
  end
  inherited btFechar: TBitBtn
    Left = 125
    Top = 249
    ExplicitLeft = 125
    ExplicitTop = 249
  end
  inherited btConfirmar: TBitBtn
    Left = 14
    Top = 249
    Anchors = [akRight, akBottom]
    OnClick = btConfirmarClick
    ExplicitLeft = 14
    ExplicitTop = 249
  end
  inherited GridProcura: TDBGrid
    Width = 222
    Height = 187
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'FNC_CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FNC_DESCRICAO'
        Visible = True
      end>
  end
  inherited cbProcura: TwwDBLookupCombo
    Width = 164
    LookupTable = dmLookups.qyLkFuncoes
    LookupField = 'FNC_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    OnKeyPress = cbProcuraKeyPress
    ExplicitWidth = 164
  end
  inherited dsProcura: TDataSource
    DataSet = dmCadastros.qyFuncoes
    Left = 88
  end
end
