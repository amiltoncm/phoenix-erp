inherited frmProcFonestipo: TfrmProcFonestipo
  Caption = 'Procura tipos de fone'
  ClientHeight = 298
  ClientWidth = 363
  ExplicitWidth = 369
  ExplicitHeight = 326
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCampo: TLabel
    Width = 64
    Caption = '(descri'#231#227'o)'
    ExplicitWidth = 64
  end
  inherited spProcura: TSpeedButton
    Left = 249
    OnClick = spProcuraClick
    ExplicitLeft = 249
  end
  inherited spLimpar: TSpeedButton
    Left = 271
    OnClick = spLimparClick
    ExplicitLeft = 271
  end
  inherited btFechar: TBitBtn
    Left = 250
    Top = 265
    ExplicitLeft = 250
    ExplicitTop = 265
  end
  inherited btConfirmar: TBitBtn
    Left = 139
    Top = 265
    Anchors = [akRight, akBottom]
    OnClick = btConfirmarClick
    ExplicitLeft = 139
    ExplicitTop = 265
  end
  inherited GridProcura: TDBGrid
    Width = 347
    Height = 203
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
  end
  inherited cbProcura: TwwDBLookupCombo
    Width = 225
    LookupTable = dmLookups.qyLkTpFone
    LookupField = 'TPF_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    OnKeyPress = cbProcuraKeyPress
    ExplicitWidth = 225
  end
  inherited dsProcura: TDataSource
    DataSet = dmDiversos.qyFonesTipo
    Left = 88
  end
end
