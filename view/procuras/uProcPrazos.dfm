inherited frmProcPrazos: TfrmProcPrazos
  Caption = 'Procura Prazos'
  ClientHeight = 349
  ClientWidth = 428
  ExplicitWidth = 434
  ExplicitHeight = 377
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCampo: TLabel
    Width = 66
    Caption = '(Descri'#231#227'o)'
    ExplicitWidth = 66
  end
  inherited spProcura: TSpeedButton
    Left = 283
    OnClick = spProcuraClick
    ExplicitLeft = 283
  end
  inherited spLimpar: TSpeedButton
    Left = 312
    OnClick = spLimparClick
    ExplicitLeft = 312
  end
  inherited btFechar: TBitBtn
    Left = 315
    Top = 316
    ExplicitLeft = 315
    ExplicitTop = 316
  end
  inherited btConfirmar: TBitBtn
    Left = 204
    Top = 316
    Anchors = [akRight, akBottom]
    OnClick = btConfirmarClick
    ExplicitLeft = 204
    ExplicitTop = 316
  end
  inherited GridProcura: TDBGrid
    Width = 412
    Height = 256
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'prz_codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prz_descricao'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prz_parcelas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prz_juros'
        Visible = True
      end>
  end
  inherited cbProcura: TwwDBLookupCombo
    Width = 269
    LookupTable = dmLookups.qyLkPrazos
    LookupField = 'PRZ_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    OnKeyPress = cbProcuraKeyPress
    ExplicitWidth = 269
  end
  inherited dsProcura: TDataSource
    DataSet = dmFinanceiro.qyPrazos
    Left = 88
  end
end
