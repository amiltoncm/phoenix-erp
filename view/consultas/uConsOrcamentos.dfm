inherited frmConsOrcamentos: TfrmConsOrcamentos
  Caption = 'Consulta Or'#231'amentos'
  ClientHeight = 472
  ClientWidth = 917
  OnKeyDown = FormKeyDown
  ExplicitWidth = 923
  ExplicitHeight = 501
  PixelsPerInch = 96
  TextHeight = 13
  inherited btFechar: TBitBtn
    Left = 804
    Top = 439
    TabOrder = 7
    ExplicitLeft = 804
    ExplicitTop = 439
  end
  inherited btFiltrar: TBitBtn
    Left = 693
    OnClick = btFiltrarClick
    ExplicitLeft = 693
  end
  inherited btLimpar: TBitBtn
    Left = 804
    OnClick = btLimparClick
    ExplicitLeft = 804
  end
  inherited btSelecionar: TBitBtn
    Left = 693
    Top = 439
    TabOrder = 6
    OnClick = btSelecionarClick
    ExplicitLeft = 693
    ExplicitTop = 439
  end
  inherited cbCampo: TwwDBComboBox
    MapList = True
    Items.Strings = (
      'CLIENTE'#9'ORL_CLIENTE'
      'N'#218'MERO DO OR'#199'AMENTO'#9'ORL_NUMERO')
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
    Width = 386
    ExplicitWidth = 386
  end
  inherited GridConsultas: TJvDBGrid
    Top = 51
    Width = 901
    Height = 382
    TabOrder = 5
    ScrollBars = ssBoth
    Columns = <
      item
        Expanded = False
        FieldName = 'orc_data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pes_nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'orc_vlrtotal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'orc_referente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fun_nome'
        Visible = True
      end>
  end
  inherited dsConsultas: TDataSource
    DataSet = dmOrcamentos.qyOrcamentos
  end
end
