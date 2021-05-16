inherited frmDetPVItens: TfrmDetPVItens
  Caption = 'Detalhes do item'
  ClientHeight = 248
  ClientWidth = 399
  OnKeyPress = FormKeyPress
  ExplicitWidth = 405
  ExplicitHeight = 277
  PixelsPerInch = 96
  TextHeight = 13
  inherited btFechar: TBitBtn
    Left = 286
    Top = 215
    ExplicitLeft = 286
    ExplicitTop = 215
  end
  object wwDataInspector1: TwwDataInspector
    Left = 8
    Top = 8
    Width = 383
    Height = 196
    DisableThemes = False
    ScrollBars = ssNone
    TabOrder = 1
    DataSource = dsItensPV
    Items = <
      item
        DataSource = dsItensPV
        DataField = 'PRV_NUMERO'
        Caption = 'N'#250'mero'
        WordWrap = False
      end
      item
        DataSource = dsItensPV
        DataField = 'PRI_QUANTIDADE'
        Caption = 'Quantidade'
        WordWrap = False
      end
      item
        DataSource = dsItensPV
        DataField = 'PRO_DESCRICAO'
        Caption = 'Produto'
        WordWrap = False
      end
      item
        DataSource = dsItensPV
        DataField = 'UNI_CODIGO'
        Caption = 'Un.'
        WordWrap = False
      end
      item
        DataSource = dsItensPV
        DataField = 'PRO_CODIGO'
        Caption = 'C'#243'digo'
        WordWrap = False
      end
      item
        DataSource = dsItensPV
        DataField = 'PRI_VLRBRT'
        Caption = 'Vlr. Bruto'
        WordWrap = False
      end
      item
        DataSource = dsItensPV
        DataField = 'PRI_VLRDESC'
        Caption = 'Vlr. Desconto'
        WordWrap = False
      end
      item
        DataSource = dsItensPV
        DataField = 'PRI_PERCDESC'
        Caption = '% Desc.'
        WordWrap = False
      end
      item
        DataSource = dsItensPV
        DataField = 'PRI_VLRLIQ'
        Caption = 'Vlr. L'#237'quido'
        WordWrap = False
      end
      item
        DataSource = dsItensPV
        DataField = 'PRI_VLRTOTAL'
        Caption = 'Vlr. Total'
        WordWrap = False
      end
      item
        DataSource = dsItensPV
        DataField = 'PRI_VLRCUSTO'
        Caption = 'Vlr. Custo'
        WordWrap = False
      end
      item
        DataSource = dsItensPV
        DataField = 'PRI_PERCMG'
        Caption = '% Margem'
        WordWrap = False
      end>
    CaptionWidth = 100
    Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
    ReadOnly = True
  end
  object dsItensPV: TDataSource
    DataSet = dmOrcamentos.qyPrevItens
    Left = 128
    Top = 24
  end
end
