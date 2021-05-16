inherited frmProcMarcas: TfrmProcMarcas
  Caption = 'Procura Marcas'
  ClientHeight = 314
  ClientWidth = 268
  ExplicitWidth = 274
  ExplicitHeight = 342
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCampo: TLabel
    Width = 66
    Caption = '(Descri'#231#227'o)'
    ExplicitWidth = 66
  end
  inherited spProcura: TSpeedButton
    Left = 215
    Top = -8
    Anchors = [akRight, akBottom]
    OnClick = spProcuraClick
    ExplicitLeft = 249
    ExplicitTop = -8
  end
  inherited spLimpar: TSpeedButton
    Left = 237
    Top = -8
    Anchors = [akRight, akBottom]
    OnClick = spLimparClick
    ExplicitLeft = 271
    ExplicitTop = -8
  end
  inherited btFechar: TBitBtn
    Left = 155
    Top = 281
    ExplicitLeft = 155
    ExplicitTop = 281
  end
  inherited btConfirmar: TBitBtn
    Left = 44
    Top = 281
    Anchors = [akRight, akBottom]
    OnClick = btConfirmarClick
    ExplicitLeft = 44
    ExplicitTop = 281
  end
  inherited GridProcura: TDBGrid
    Width = 251
    Height = 219
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'MAR_CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MAR_DESCRICAO'
        Visible = True
      end>
  end
  inherited cbProcura: TwwDBLookupCombo
    Width = 196
    LookupTable = dmLookups.qyLkMarcas
    LookupField = 'MAR_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    OnKeyPress = cbProcuraKeyPress
    ExplicitWidth = 196
  end
  inherited dsProcura: TDataSource
    DataSet = dmCadastros.qyMarcas
    Left = 88
  end
end
