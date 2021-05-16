inherited frmProcContas: TfrmProcContas
  Caption = 'Procura Contas'
  ClientHeight = 349
  ClientWidth = 363
  ExplicitWidth = 369
  ExplicitHeight = 377
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCampo: TLabel
    Width = 41
    Caption = '(conta)'
    ExplicitWidth = 41
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
    Top = 316
    ExplicitLeft = 250
    ExplicitTop = 316
  end
  inherited btConfirmar: TBitBtn
    Left = 139
    Top = 316
    Anchors = [akRight, akBottom]
    OnClick = btConfirmarClick
    ExplicitLeft = 139
    ExplicitTop = 316
  end
  inherited GridProcura: TDBGrid
    Width = 347
    Height = 256
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'CON_DESCRICAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CON_CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BAN_CODIGO'
        Visible = True
      end>
  end
  inherited cbProcura: TwwDBLookupCombo
    Width = 225
    LookupTable = dmLookups.qyLkContas
    LookupField = 'CON_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    OnKeyPress = cbProcuraKeyPress
    ExplicitWidth = 225
  end
  inherited dsProcura: TDataSource
    DataSet = dmCadastros.qyContas
    Left = 88
  end
end
