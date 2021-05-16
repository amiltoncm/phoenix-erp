inherited frmProcEnderecostipo: TfrmProcEnderecostipo
  Caption = 'Procura Tipos de Endere'#231'o'
  ClientHeight = 271
  ClientWidth = 238
  ExplicitWidth = 244
  ExplicitHeight = 299
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCampo: TLabel
    Width = 64
    Caption = '(descri'#231#227'o)'
    ExplicitWidth = 64
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
    Top = 238
    ExplicitLeft = 125
    ExplicitTop = 238
  end
  inherited btConfirmar: TBitBtn
    Left = 14
    Top = 238
    Anchors = [akRight, akBottom]
    OnClick = btConfirmarClick
    ExplicitLeft = 14
    ExplicitTop = 238
  end
  inherited GridProcura: TDBGrid
    Width = 222
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
  end
  inherited cbProcura: TwwDBLookupCombo
    Width = 164
    LookupTable = dmLookups.qyLkTpEndereco
    LookupField = 'TPE_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    OnKeyPress = cbProcuraKeyPress
    ExplicitWidth = 164
  end
  inherited dsProcura: TDataSource
    DataSet = dmDiversos.qyEnderecosTipo
    Left = 88
  end
end
