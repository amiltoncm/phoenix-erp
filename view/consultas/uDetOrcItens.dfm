inherited frmDetOrcItens: TfrmDetOrcItens
  Caption = 'Detalhes do item'
  ClientHeight = 259
  ClientWidth = 399
  OnKeyPress = FormKeyPress
  ExplicitWidth = 405
  ExplicitHeight = 288
  PixelsPerInch = 96
  TextHeight = 13
  inherited btFechar: TBitBtn
    Left = 286
    Top = 226
    ExplicitLeft = 286
    ExplicitTop = 226
  end
  object wwDataInspector1: TwwDataInspector
    Left = 8
    Top = 8
    Width = 383
    Height = 212
    DisableThemes = False
    ScrollBars = ssNone
    TabOrder = 1
    DataSource = dsItensOrc
    Items = <
      item
        DataSource = dsItensOrc
        DataField = 'ORC_NUMERO'
        Caption = 'N'#250'mero'
        WordWrap = False
      end
      item
        DataSource = dsItensOrc
        DataField = 'ORT_CODIGO'
        Caption = 'C'#243'digo'
        WordWrap = False
      end
      item
        DataSource = dsItensOrc
        DataField = 'ORT_QUANTIDADE'
        Caption = 'Quantidade'
        WordWrap = False
      end
      item
        DataSource = dsItensOrc
        DataField = 'PRO_DESCRICAO'
        Caption = 'Produto'
        WordWrap = False
      end
      item
        DataSource = dsItensOrc
        DataField = 'UNI_CODIGO'
        Caption = 'Un.'
        WordWrap = False
      end
      item
        DataSource = dsItensOrc
        DataField = 'PRO_CODIGO'
        Caption = 'C'#243'digo'
        WordWrap = False
      end
      item
        DataSource = dsItensOrc
        DataField = 'ORT_VLRBRT'
        Caption = 'Vlr. Bruto'
        WordWrap = False
      end
      item
        DataSource = dsItensOrc
        DataField = 'ORT_VLRDESC'
        Caption = 'Vlr. Desconto'
        WordWrap = False
      end
      item
        DataSource = dsItensOrc
        DataField = 'ORT_PERCDESC'
        Caption = '% Desc.'
        WordWrap = False
      end
      item
        DataSource = dsItensOrc
        DataField = 'ORT_VLRLIQ'
        Caption = 'Vlr. L'#237'quido'
        WordWrap = False
      end
      item
        DataSource = dsItensOrc
        DataField = 'ORT_VLRTOTAL'
        Caption = 'Vlr. Total'
        WordWrap = False
      end
      item
        DataSource = dsItensOrc
        DataField = 'ORT_VLRCUSTO'
        Caption = 'Vlr. Custo'
        WordWrap = False
      end
      item
        DataSource = dsItensOrc
        DataField = 'ORT_PERCMG'
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
  object dsItensOrc: TDataSource
    DataSet = dmOrcamentos.qyOrcItens
    Left = 128
    Top = 24
  end
end
