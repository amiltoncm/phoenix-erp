inherited frmProcLocalizacao: TfrmProcLocalizacao
  Caption = 'Procura Localizacao'
  ClientHeight = 330
  ClientWidth = 232
  ExplicitWidth = 238
  ExplicitHeight = 358
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCampo: TLabel
    Width = 66
    Caption = '(Descri'#231#227'o)'
    ExplicitWidth = 66
  end
  inherited spProcura: TSpeedButton
    Left = 179
    Anchors = [akRight, akBottom]
    OnClick = spProcuraClick
    ExplicitLeft = 179
  end
  inherited spLimpar: TSpeedButton
    Left = 201
    Anchors = [akRight, akBottom]
    OnClick = spLimparClick
    ExplicitLeft = 201
  end
  inherited btFechar: TBitBtn
    Left = 119
    Top = 297
    ExplicitLeft = 119
    ExplicitTop = 297
  end
  inherited btConfirmar: TBitBtn
    Left = 8
    Top = 297
    Anchors = [akRight, akBottom]
    OnClick = btConfirmarClick
    ExplicitLeft = 8
    ExplicitTop = 297
  end
  inherited GridProcura: TDBGrid
    Width = 216
    Height = 235
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'LOC_CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOC_DESCRICAO'
        Visible = True
      end>
  end
  inherited cbProcura: TwwDBLookupCombo
    Width = 165
    LookupTable = dmLookups.qyLkLocalizacao
    LookupField = 'LOC_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    OnKeyPress = cbProcuraKeyPress
    ExplicitWidth = 165
  end
  inherited dsProcura: TDataSource
    DataSet = dmCadastros.qyLocalizacao
    Left = 88
  end
end
