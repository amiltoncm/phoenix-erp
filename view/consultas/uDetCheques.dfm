inherited frmDetCheques: TfrmDetCheques
  Caption = 'Detalhes do Cheque'
  ClientHeight = 306
  ClientWidth = 441
  OnKeyPress = FormKeyPress
  ExplicitWidth = 447
  ExplicitHeight = 335
  PixelsPerInch = 96
  TextHeight = 13
  inherited btFechar: TBitBtn
    Left = 328
    Top = 273
    ExplicitLeft = 328
    ExplicitTop = 273
  end
  object wwDataInspector1: TwwDataInspector
    Left = 8
    Top = 8
    Width = 425
    Height = 260
    DisableThemes = False
    TabOrder = 1
    DataSource = dsDetalhes
    Items = <
      item
        DataSource = dsDetalhes
        Caption = 'Cliente'
        Expanded = True
        Items = <
          item
            DataSource = dsDetalhes
            DataField = 'chq_endosso'
            Caption = 'Endosso'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'pes_codigo'
            Caption = 'C'#243'digo'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'chq_telefone'
            Caption = 'Telefone'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'chq_datalanc'
            Caption = 'Data'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'chq_documento'
            Caption = 'Documento'
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = dsDetalhes
        Caption = 'Cheque'
        Expanded = True
        Items = <
          item
            DataSource = dsDetalhes
            DataField = 'chq_vencimento'
            Caption = 'Vencimento'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'chq_titular'
            Caption = 'Titular'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'ban_codigo'
            Caption = 'Banco'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'chq_agencia'
            Caption = 'Ag'#234'ncia'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'chq_conta'
            Caption = 'Conta'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'chq_cheque'
            Caption = 'Cheque'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'chq_valor'
            Caption = 'Valor'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'sta_descricao'
            Caption = 'Status'
            WordWrap = False
          end
          item
            DataSource = dsDetalhes
            DataField = 'chq_destino'
            Caption = 'Destino'
            WordWrap = False
          end>
        WordWrap = False
      end>
    CaptionWidth = 100
    Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
  end
  object dsDetalhes: TDataSource
    DataSet = dmConsultas.qyConsCheques
    Left = 88
    Top = 80
  end
end
