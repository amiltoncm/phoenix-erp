inherited frmDetReceber: TfrmDetReceber
  Caption = 'Detalhes da Duplicata / Recebimentos'
  ClientHeight = 383
  ClientWidth = 803
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  ExplicitWidth = 809
  ExplicitHeight = 412
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 55
    Height = 13
    Caption = 'Vencimento'
    FocusControl = dbVencimento
  end
  object Label2: TLabel [1]
    Left = 87
    Top = 8
    Width = 33
    Height = 13
    Caption = 'Cliente'
    FocusControl = dbCliente
  end
  object Label3: TLabel [2]
    Left = 589
    Top = 8
    Width = 13
    Height = 13
    Caption = 'NF'
    FocusControl = dbNF
  end
  object Label4: TLabel [3]
    Left = 680
    Top = 8
    Width = 24
    Height = 13
    Caption = 'S'#233'rie'
    FocusControl = dbSerie
  end
  object Label5: TLabel [4]
    Left = 720
    Top = 8
    Width = 34
    Height = 13
    Caption = 'Modelo'
    FocusControl = dbModelo
  end
  object Label6: TLabel [5]
    Left = 8
    Top = 54
    Width = 38
    Height = 13
    Caption = 'Emiss'#227'o'
    FocusControl = dbEmissao
  end
  object Label7: TLabel [6]
    Left = 760
    Top = 8
    Width = 35
    Height = 13
    Caption = 'Parcela'
    FocusControl = dbParcela
  end
  object Label8: TLabel [7]
    Left = 286
    Top = 54
    Width = 53
    Height = 13
    Caption = 'Chave NFe'
    FocusControl = dbChave
    Visible = False
  end
  object Label9: TLabel [8]
    Left = 8
    Top = 335
    Width = 24
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Valor'
    FocusControl = dbValor
    ExplicitTop = 359
  end
  object Label10: TLabel [9]
    Left = 105
    Top = 335
    Width = 48
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Acr'#233'scimo'
    FocusControl = dbAcrescimo
    ExplicitTop = 359
  end
  object Label11: TLabel [10]
    Left = 202
    Top = 335
    Width = 45
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Desconto'
    FocusControl = dbDesconto
    ExplicitTop = 359
  end
  object Label12: TLabel [11]
    Left = 299
    Top = 335
    Width = 24
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Pago'
    FocusControl = dbPago
    ExplicitTop = 359
  end
  object Label13: TLabel [12]
    Left = 396
    Top = 335
    Width = 26
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Saldo'
    FocusControl = dbSaldo
    ExplicitTop = 359
  end
  object Label14: TLabel [13]
    Left = 87
    Top = 54
    Width = 31
    Height = 13
    Caption = 'Status'
    FocusControl = dbStatus
  end
  object Label15: TLabel [14]
    Left = 8
    Top = 100
    Width = 111
    Height = 13
    Caption = 'Pagamentos efetuados'
  end
  inherited btFechar: TBitBtn
    Left = 690
    Top = 350
    ExplicitLeft = 690
    ExplicitTop = 350
  end
  object dbVencimento: TDBEdit
    Left = 8
    Top = 27
    Width = 73
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'rec_vencimento'
    DataSource = dsDetalhes
    ReadOnly = True
    TabOrder = 1
  end
  object dbCliente: TDBEdit
    Left = 87
    Top = 27
    Width = 496
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'pes_nome'
    DataSource = dsDetalhes
    ReadOnly = True
    TabOrder = 2
  end
  object dbNF: TDBEdit
    Left = 589
    Top = 27
    Width = 85
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'rec_numero'
    DataSource = dsDetalhes
    ReadOnly = True
    TabOrder = 3
  end
  object dbSerie: TDBEdit
    Left = 680
    Top = 27
    Width = 34
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'rec_serie'
    DataSource = dsDetalhes
    ReadOnly = True
    TabOrder = 4
  end
  object dbModelo: TDBEdit
    Left = 720
    Top = 27
    Width = 34
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'mdc_codigo'
    DataSource = dsDetalhes
    ReadOnly = True
    TabOrder = 5
  end
  object dbEmissao: TDBEdit
    Left = 8
    Top = 73
    Width = 73
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'rec_emissao'
    DataSource = dsDetalhes
    ReadOnly = True
    TabOrder = 6
  end
  object dbParcela: TDBEdit
    Left = 760
    Top = 27
    Width = 35
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'rec_parcela'
    DataSource = dsDetalhes
    ReadOnly = True
    TabOrder = 7
  end
  object dbChave: TDBEdit
    Left = 286
    Top = 73
    Width = 306
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 8
    Visible = False
  end
  object dbValor: TDBEdit
    Left = 8
    Top = 354
    Width = 91
    Height = 21
    TabStop = False
    Anchors = [akRight, akBottom]
    Color = clBtnFace
    DataField = 'rec_valor'
    DataSource = dsDetalhes
    ReadOnly = True
    TabOrder = 9
  end
  object dbAcrescimo: TDBEdit
    Left = 105
    Top = 354
    Width = 91
    Height = 21
    TabStop = False
    Anchors = [akRight, akBottom]
    Color = clBtnFace
    DataField = 'rec_acrescimo'
    DataSource = dsDetalhes
    ReadOnly = True
    TabOrder = 10
  end
  object dbDesconto: TDBEdit
    Left = 202
    Top = 354
    Width = 91
    Height = 21
    TabStop = False
    Anchors = [akRight, akBottom]
    Color = clBtnFace
    DataField = 'rec_desconto'
    DataSource = dsDetalhes
    ReadOnly = True
    TabOrder = 11
  end
  object dbPago: TDBEdit
    Left = 299
    Top = 354
    Width = 91
    Height = 21
    TabStop = False
    Anchors = [akRight, akBottom]
    Color = clBtnFace
    DataField = 'rec_pago'
    DataSource = dsDetalhes
    ReadOnly = True
    TabOrder = 12
  end
  object dbSaldo: TDBEdit
    Left = 396
    Top = 354
    Width = 91
    Height = 21
    TabStop = False
    Anchors = [akRight, akBottom]
    Color = clBtnFace
    DataField = 'rec_saldo'
    DataSource = dsDetalhes
    ReadOnly = True
    TabOrder = 13
  end
  object dbStatus: TDBEdit
    Left = 87
    Top = 73
    Width = 193
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'STA_DESCRICAO'
    DataSource = dsDetalhes
    ReadOnly = True
    TabOrder = 14
  end
  object JvDBGrid1: TJvDBGrid
    Left = 8
    Top = 119
    Width = 787
    Height = 210
    TabStop = False
    DataSource = dsConsCaixa
    ReadOnly = True
    TabOrder = 15
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    ScrollBars = ssVertical
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'cai_data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cai_codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'con_descricao'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'plc_descricao'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cai_numdoc'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cai_valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usu_nome'
        Visible = True
      end>
  end
  object dsDetalhes: TDataSource
    DataSet = dmConsultas.qyConsReceber
    Left = 280
  end
  object dsConsCaixa: TDataSource
    DataSet = dmConsultas.qyConsRecCaixa
    Left = 464
    Top = 8
  end
end
