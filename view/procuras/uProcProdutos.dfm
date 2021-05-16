inherited frmProcProdutos: TfrmProcProdutos
  Caption = 'Procura Produtos'
  ClientHeight = 349
  ClientWidth = 817
  OnKeyPress = FormKeyPress
  ExplicitLeft = -43
  ExplicitWidth = 823
  ExplicitHeight = 378
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCampo: TLabel
    Width = 66
    Caption = '(Descri'#231#227'o)'
    ExplicitWidth = 66
  end
  inherited spProcura: TSpeedButton
    Left = 574
    OnClick = spProcuraClick
    ExplicitLeft = 574
  end
  inherited spLimpar: TSpeedButton
    Left = 603
    OnClick = spLimparClick
    ExplicitLeft = 603
  end
  inherited btFechar: TBitBtn
    Left = 704
    Top = 316
    ExplicitLeft = 542
    ExplicitTop = 316
  end
  inherited btConfirmar: TBitBtn
    Left = 593
    Top = 316
    Anchors = [akRight, akBottom]
    OnClick = btConfirmarClick
    ExplicitLeft = 431
    ExplicitTop = 316
  end
  inherited GridProcura: TDBGrid
    Width = 801
    Height = 256
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'pro_descricao'
        Width = 550
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pro_codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mar_descricao'
        Visible = True
      end>
  end
  inherited cbProcura: TwwDBLookupCombo
    Width = 560
    LookupTable = dmLookups.qyLkProdutos
    LookupField = 'PRO_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    OnKeyPress = cbProcuraKeyPress
    ExplicitWidth = 560
  end
  inherited dsProcura: TDataSource
    DataSet = dmCadastros.qyProdutos
    Left = 88
  end
end
