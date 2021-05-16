inherited frmProcCidades: TfrmProcCidades
  Caption = 'Procura N_Tabela'
  ClientHeight = 377
  ClientWidth = 445
  ExplicitWidth = 451
  ExplicitHeight = 405
  DesignSize = (
    445
    377)
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCampo: TLabel
    Width = 39
    Caption = '(nome)'
    ExplicitWidth = 39
  end
  inherited spProcura: TSpeedButton
    Left = 385
    OnClick = spProcuraClick
    ExplicitLeft = 385
  end
  inherited spLimpar: TSpeedButton
    Left = 414
    OnClick = spLimparClick
    ExplicitLeft = 414
  end
  inherited btFechar: TBitBtn
    Left = 332
    Top = 344
    ExplicitLeft = 332
    ExplicitTop = 344
  end
  inherited btConfirmar: TBitBtn
    Left = 221
    Top = 344
    Anchors = [akRight, akBottom]
    OnClick = btConfirmarClick
    ExplicitLeft = 221
    ExplicitTop = 344
  end
  inherited GridProcura: TDBGrid
    Width = 429
    Height = 284
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'CID_CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CID_MUNICIPIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UF_SIGLA'
        Visible = True
      end>
  end
  inherited cbProcura: TwwDBLookupCombo
    Width = 371
    LookupTable = dmLookups.qyLkCidades
    LookupField = 'CID_MUNICIPIO'
    Options = [loColLines, loRowLines, loTitles]
    OnKeyPress = cbProcuraKeyPress
    ExplicitWidth = 371
  end
  inherited dsProcura: TDataSource
    DataSet = dmCadastros.qyCidades
    Left = 88
  end
end
