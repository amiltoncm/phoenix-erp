inherited frmProcEndeletrotipo: TfrmProcEndeletrotipo
  Caption = 'Procura Endeletrotipo'
  ClientHeight = 290
  ClientWidth = 238
  ExplicitWidth = 244
  ExplicitHeight = 318
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCampo: TLabel
    Width = 64
    Caption = '(descri'#231#227'o)'
    ExplicitWidth = 64
  end
  inherited spProcura: TSpeedButton
    Left = 183
    OnClick = spProcuraClick
    ExplicitLeft = 183
  end
  inherited spLimpar: TSpeedButton
    Left = 207
    OnClick = spLimparClick
    ExplicitLeft = 207
  end
  inherited btFechar: TBitBtn
    Left = 125
    Top = 257
    ExplicitLeft = 125
    ExplicitTop = 257
  end
  inherited btConfirmar: TBitBtn
    Left = 14
    Top = 257
    Anchors = [akRight, akBottom]
    OnClick = btConfirmarClick
    ExplicitLeft = 14
    ExplicitTop = 257
  end
  inherited GridProcura: TDBGrid
    Width = 222
    Height = 197
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
  end
  inherited cbProcura: TwwDBLookupCombo
    Width = 167
    LookupTable = dmLookups.qyLkEndEletroTipo
    LookupField = 'TPN_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    OnKeyPress = cbProcuraKeyPress
    ExplicitWidth = 167
  end
  inherited dsProcura: TDataSource
    DataSet = dmDiversos.qyEndEletroTipo
    Left = 88
  end
end
