inherited frmProcSetor: TfrmProcSetor
  Caption = 'Procura Setor'
  ClientHeight = 298
  ClientWidth = 238
  ExplicitWidth = 244
  ExplicitHeight = 326
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
    Top = 265
    ExplicitLeft = 125
    ExplicitTop = 265
  end
  inherited btConfirmar: TBitBtn
    Left = 14
    Top = 265
    Anchors = [akRight, akBottom]
    OnClick = btConfirmarClick
    ExplicitLeft = 14
    ExplicitTop = 265
  end
  inherited GridProcura: TDBGrid
    Width = 222
    Height = 203
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
  end
  inherited cbProcura: TwwDBLookupCombo
    Width = 164
    LookupTable = dmLookups.qyLkSetor
    LookupField = 'SET_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    OnKeyPress = cbProcuraKeyPress
    ExplicitWidth = 164
  end
  inherited dsProcura: TDataSource
    DataSet = dmDiversos.qySetor
    Left = 88
  end
end
