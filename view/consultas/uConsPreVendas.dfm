inherited frmConsPreVendas: TfrmConsPreVendas
  Caption = 'Consulta Pr'#233'-vendas'
  ClientHeight = 472
  ClientWidth = 994
  OnKeyDown = FormKeyDown
  ExplicitWidth = 1000
  ExplicitHeight = 501
  PixelsPerInch = 96
  TextHeight = 13
  object dbtReferente: TDBText [3]
    Left = 8
    Top = 439
    Width = 553
    Height = 17
    DataField = 'prv_referente'
    DataSource = dsConsultas
  end
  inherited btFechar: TBitBtn
    Left = 881
    Top = 439
    ExplicitLeft = 881
    ExplicitTop = 439
  end
  inherited btFiltrar: TBitBtn
    OnClick = btFiltrarClick
  end
  inherited btLimpar: TBitBtn
    OnClick = btLimparClick
  end
  inherited btSelecionar: TBitBtn
    Left = 770
    Top = 439
    OnClick = btSelecionarClick
    ExplicitLeft = 770
    ExplicitTop = 439
  end
  inherited cbCampo: TwwDBComboBox
    MapList = True
    Items.Strings = (
      'CLIENTE'#9'P.CLI_NOME'
      'N'#218'MERO DA PR'#201'-VENDA'#9'P.PRV_NUMERO')
    OnExit = cbCampoExit
  end
  inherited cbFiltro: TwwDBComboBox
    MapList = True
    Items.Strings = (
      'IGUAL'#9'='
      'CONTENHA'#9'%%'
      'COME'#199'ANDO COM'#9'%')
  end
  inherited edParametro: TEdit
    Top = 25
    ExplicitTop = 25
  end
  inherited GridConsultas: TJvDBGrid
    Width = 978
    Height = 373
    OnDblClick = GridConsultasDblClick
    OnKeyDown = GridConsultasKeyDown
    ScrollBars = ssBoth
    Columns = <
      item
        Expanded = False
        FieldName = 'prv_data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pes_nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prv_vlrtotal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prv_numero'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sto_descricao'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fun_nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prv_referente'
        Visible = True
      end>
  end
  inherited dsConsultas: TDataSource
    DataSet = dmOrcamentos.qyPrevendas
    Left = 56
    Top = 224
  end
end
