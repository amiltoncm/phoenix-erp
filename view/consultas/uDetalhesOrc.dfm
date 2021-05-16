inherited frmDetalhesOrc: TfrmDetalhesOrc
  Caption = 'Detalhes do Or'#231'amento'
  ClientHeight = 388
  ClientWidth = 417
  OnKeyPress = FormKeyPress
  ExplicitWidth = 423
  ExplicitHeight = 417
  PixelsPerInch = 96
  TextHeight = 13
  inherited btFechar: TBitBtn
    Left = 304
    Top = 355
    ExplicitLeft = 304
    ExplicitTop = 355
  end
  object wwDataInspector1: TwwDataInspector
    Left = 8
    Top = 8
    Width = 401
    Height = 340
    DisableThemes = False
    TabOrder = 1
    DataSource = dsDetalhes
    Items = <
      item
        DataSource = dsDetalhes
        Caption = 'Or'#231'amento'
        Expanded = True
        Items = <
          item
            DataSource = dsDetalhes
            DataField = 'ORC_NUMERO'
            Caption = 'N'#250'mero'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'ORC_DATA'
            Caption = 'Data'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'PES_NOME'
            Caption = 'Cliente'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'PRJ_DESCRICAO'
            Caption = 'Projeto'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'FUN_NOME'
            Caption = 'Funcion'#225'rio'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'ORC_REFERENTE'
            Caption = 'Referente'
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = dsDetalhes
        Caption = 'Custos'
        Expanded = True
        Items = <
          item
            DataSource = dsDetalhes
            DataField = 'ORC_VLRCUSTO'
            Caption = 'Valor de custo'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'ORC_SUBTOTAL'
            Caption = 'Subtotal'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'ORC_PERCDESC'
            Caption = 'Desconto %'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'ORC_VLRDESC'
            Caption = 'Valor do desconto'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'ORC_VLRTOTAL'
            Caption = 'Valor total'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'ORC_PERCMG'
            Caption = 'Margem %'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'ORC_VLRLUCRO'
            Caption = 'Lucro bruto'
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = dsDetalhes
        Caption = 'Condi'#231#245'es comerciais'
        Expanded = True
        Items = <
          item
            DataSource = dsDetalhes
            DataField = 'ORC_VALIDADE'
            Caption = 'Validade do or'#231'amento'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'PRZ_DESCRICAO'
            Caption = 'Prazo de pagamento'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'FRP_DESCRICAO'
            Caption = 'Forma de pagamento'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'MDF_DESCRICAO'
            Caption = 'Frete'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'ORC_ENTREGA'
            Caption = 'Prazo de entrega'
            WordWrap = False
          end>
        WordWrap = False
      end>
    CaptionWidth = 146
    Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
  end
  object dsDetalhes: TDataSource
    DataSet = dmOrcamentos.qyOrcamentos
    Left = 256
    Top = 8
  end
end
