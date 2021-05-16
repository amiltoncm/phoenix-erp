inherited frmProcPessoas: TfrmProcPessoas
  Caption = 'Procura Pessoas'
  ClientHeight = 349
  ClientWidth = 660
  ExplicitWidth = 666
  ExplicitHeight = 377
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCampo: TLabel
    Width = 39
    Caption = '(nome)'
    ExplicitWidth = 39
  end
  inherited spProcura: TSpeedButton
    Left = 353
    OnClick = spProcuraClick
    ExplicitLeft = 353
  end
  inherited spLimpar: TSpeedButton
    Left = 375
    OnClick = spLimparClick
    ExplicitLeft = 375
  end
  inherited btFechar: TBitBtn
    Left = 547
    Top = 316
    ExplicitLeft = 547
    ExplicitTop = 316
  end
  inherited btConfirmar: TBitBtn
    Left = 436
    Top = 316
    Anchors = [akRight, akBottom]
    OnClick = btConfirmarClick
    ExplicitLeft = 436
    ExplicitTop = 316
  end
  inherited GridProcura: TDBGrid
    Width = 644
    Height = 256
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'PES_CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PES_NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PES_NOMEFANTASIA'
        Visible = True
      end>
  end
  inherited cbProcura: TwwDBLookupCombo
    Width = 339
    LookupTable = dmLookups.qyLkPessoas
    LookupField = 'PES_NOME'
    Options = [loColLines, loRowLines, loTitles]
    OnKeyPress = cbProcuraKeyPress
    ExplicitWidth = 339
  end
  inherited dsProcura: TDataSource
    DataSet = dmPessoas.qyPessoas
    Left = 88
  end
end
