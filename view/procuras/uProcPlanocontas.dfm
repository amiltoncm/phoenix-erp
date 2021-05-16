inherited frmProcPlanocontas: TfrmProcPlanocontas
  Caption = 'Procura Plano de contas'
  ClientHeight = 349
  ClientWidth = 323
  ExplicitWidth = 329
  ExplicitHeight = 377
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
    Left = 210
    Top = 316
    ExplicitLeft = 210
    ExplicitTop = 316
  end
  inherited btConfirmar: TBitBtn
    Left = 99
    Top = 316
    Anchors = [akRight, akBottom]
    OnClick = btConfirmarClick
    ExplicitLeft = 99
    ExplicitTop = 316
  end
  inherited GridProcura: TDBGrid
    Width = 307
    Height = 251
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'PLC_CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLC_DESCRICAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLC_TIPO'
        Visible = True
      end>
  end
  inherited cbProcura: TwwDBLookupCombo
    Width = 225
    LookupTable = dmLookups.qyLkPlanoContas
    LookupField = 'PLC_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    OnKeyPress = cbProcuraKeyPress
    ExplicitWidth = 225
  end
  inherited dsProcura: TDataSource
    DataSet = dmCadastros.qyPlanoContas
    Left = 88
  end
end
