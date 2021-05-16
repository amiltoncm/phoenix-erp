inherited frmProcBancos: TfrmProcBancos
  Caption = 'Procura Bancos'
  ClientHeight = 351
  ClientWidth = 418
  ExplicitWidth = 424
  ExplicitHeight = 379
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCampo: TLabel
    Width = 64
    Caption = '(descri'#231#227'o)'
    ExplicitWidth = 64
  end
  inherited spProcura: TSpeedButton
    Left = 358
    OnClick = spProcuraClick
    ExplicitLeft = 358
  end
  inherited spLimpar: TSpeedButton
    Left = 387
    OnClick = spLimparClick
    ExplicitLeft = 387
  end
  inherited btFechar: TBitBtn
    Left = 305
    Top = 318
    ExplicitLeft = 305
    ExplicitTop = 318
  end
  inherited btConfirmar: TBitBtn
    Left = 194
    Top = 318
    Anchors = [akRight, akBottom]
    OnClick = btConfirmarClick
    ExplicitLeft = 194
    ExplicitTop = 318
  end
  inherited GridProcura: TDBGrid
    Width = 402
    Height = 256
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
  end
  inherited cbProcura: TwwDBLookupCombo
    Width = 289
    Selected.Strings = (
      'BAN_DESCRICAO'#9'50'#9'Descri'#231#227'o'#9#9
      'BAN_CODIGO'#9'10'#9'C'#243'digo'#9#9)
    LookupTable = dmLookups.qyLkBancos
    LookupField = 'BAN_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    OnKeyPress = cbProcuraKeyPress
    ExplicitWidth = 289
  end
  inherited dsProcura: TDataSource
    DataSet = dmCadastros.qyBancos
    Left = 88
  end
end
