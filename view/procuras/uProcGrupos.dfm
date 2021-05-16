inherited frmProcGrupos: TfrmProcGrupos
  Caption = 'Procura Grupos'
  ClientHeight = 349
  ClientWidth = 266
  ExplicitWidth = 272
  ExplicitHeight = 377
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCampo: TLabel
    Width = 66
    Caption = '(Descri'#231#227'o)'
    ExplicitWidth = 66
  end
  inherited spProcura: TSpeedButton
    Left = 213
    Anchors = [akTop, akRight]
    OnClick = spProcuraClick
    ExplicitLeft = 249
  end
  inherited spLimpar: TSpeedButton
    Left = 235
    Anchors = [akTop, akRight]
    OnClick = spLimparClick
    ExplicitLeft = 271
  end
  inherited btFechar: TBitBtn
    Left = 153
    Top = 316
    ExplicitLeft = 153
    ExplicitTop = 316
  end
  inherited btConfirmar: TBitBtn
    Left = 42
    Top = 316
    Anchors = [akRight, akBottom]
    OnClick = btConfirmarClick
    ExplicitLeft = 42
    ExplicitTop = 316
  end
  inherited GridProcura: TDBGrid
    Width = 249
    Height = 256
    OnDblClick = GridProcuraDblClick
    OnKeyPress = GridProcuraKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'GRP_DESCRICAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRP_CODIGO'
        Visible = True
      end>
  end
  inherited cbProcura: TwwDBLookupCombo
    Width = 175
    Selected.Strings = (
      'GRP_DESCRICAO'#9'25'#9'Descri'#231#227'o'#9#9
      'GRP_CODIGO'#9'10'#9'C'#243'digo'#9#9)
    LookupTable = dmLookups.qyLkGrupos
    LookupField = 'GRP_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    OnKeyPress = cbProcuraKeyPress
    ExplicitWidth = 175
  end
  inherited dsProcura: TDataSource
    DataSet = dmCadastros.qyGrupos
    Left = 88
  end
end
