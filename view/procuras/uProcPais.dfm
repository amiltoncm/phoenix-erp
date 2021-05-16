inherited frmProcPais: TfrmProcPais
  Caption = 'Procura Pais'
  ClientHeight = 349
  ClientWidth = 456
  ExplicitWidth = 462
  ExplicitHeight = 377
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCampo: TLabel
    Width = 32
    Caption = '(pais)'
    ExplicitWidth = 32
  end
  inherited spProcura: TSpeedButton
    Left = 314
    OnClick = spProcuraClick
    ExplicitLeft = 314
  end
  inherited spLimpar: TSpeedButton
    Left = 343
    OnClick = spLimparClick
    ExplicitLeft = 343
  end
  inherited btFechar: TBitBtn
    Left = 343
    Top = 316
    ExplicitLeft = 343
    ExplicitTop = 316
  end
  inherited btConfirmar: TBitBtn
    Left = 232
    Top = 316
    Anchors = [akRight, akBottom]
    OnClick = btConfirmarClick
    ExplicitLeft = 232
    ExplicitTop = 316
  end
  inherited GridProcura: TDBGrid
    Width = 440
    Height = 256
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
  end
  inherited cbProcura: TwwDBLookupCombo
    Width = 300
    LookupTable = dmLookups.qyLkPais
    LookupField = 'PAI_PAIS'
    Options = [loColLines, loRowLines, loTitles]
    OnKeyPress = cbProcuraKeyPress
    ExplicitWidth = 300
  end
  inherited dsProcura: TDataSource
    DataSet = dmDiversos.qyPais
    Left = 88
  end
end
