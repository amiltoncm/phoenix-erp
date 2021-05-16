inherited frmProcUf: TfrmProcUf
  Caption = 'Procura Uf'
  ClientHeight = 349
  ClientWidth = 470
  ExplicitWidth = 476
  ExplicitHeight = 377
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCampo: TLabel
    Width = 47
    Caption = '(estado)'
    ExplicitWidth = 47
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
    Left = 357
    Top = 316
    ExplicitLeft = 357
    ExplicitTop = 316
  end
  inherited btConfirmar: TBitBtn
    Left = 249
    Top = 316
    Anchors = [akRight, akBottom]
    OnClick = btConfirmarClick
    ExplicitLeft = 249
    ExplicitTop = 316
  end
  inherited GridProcura: TDBGrid
    Width = 454
    Height = 256
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
  end
  inherited cbProcura: TwwDBLookupCombo
    Width = 225
    LookupTable = dmLookups.qyLkUf
    LookupField = 'UF_ESTADO'
    Options = [loColLines, loRowLines, loTitles]
    OnKeyPress = cbProcuraKeyPress
    ExplicitWidth = 225
  end
  inherited dsProcura: TDataSource
    DataSet = dmDiversos.qyUf
    Left = 88
  end
end
