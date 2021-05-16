inherited frmProcFuncionarios: TfrmProcFuncionarios
  Caption = 'Procura Funcionarios'
  ClientHeight = 349
  ClientWidth = 417
  ExplicitWidth = 423
  ExplicitHeight = 377
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCampo: TLabel
    Width = 41
    Caption = '(Nome)'
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
    Left = 304
    Top = 316
    ExplicitLeft = 304
    ExplicitTop = 316
  end
  inherited btConfirmar: TBitBtn
    Left = 193
    Top = 316
    Anchors = [akRight, akBottom]
    OnClick = btConfirmarClick
    ExplicitLeft = 193
    ExplicitTop = 316
  end
  inherited GridProcura: TDBGrid
    Width = 401
    Height = 256
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'FUN_NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FUN_CODIGO'
        Visible = True
      end>
  end
  inherited cbProcura: TwwDBLookupCombo
    Width = 225
    LookupTable = dmLookups.qyLkFuncionarios
    LookupField = 'FUN_NOME'
    Options = [loColLines, loRowLines, loTitles]
    OnKeyPress = cbProcuraKeyPress
    ExplicitWidth = 225
  end
  inherited dsProcura: TDataSource
    DataSet = dmCadastros.qyFuncionarios
    Left = 88
  end
end
