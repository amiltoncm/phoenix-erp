inherited frmProcClientes: TfrmProcClientes
  Caption = 'Procura Clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCampo: TLabel
    Width = 41
    Caption = '(Nome)'
    ExplicitWidth = 41
  end
  inherited spProcura: TSpeedButton
    OnClick = spProcuraClick
  end
  inherited spLimpar: TSpeedButton
    OnClick = spLimparClick
  end
  inherited btConfirmar: TBitBtn
    OnClick = btConfirmarClick
  end
  inherited GridProcura: TDBGrid
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
  end
  inherited cbProcura: TwwDBLookupCombo
    LookupTable = dmLookups.qyLkClientes
    LookupField = 'PES_NOME'
    OnKeyPress = cbProcuraKeyPress
  end
  inherited dsProcura: TDataSource
    DataSet = dmPessoas.qyPessoas
  end
end
