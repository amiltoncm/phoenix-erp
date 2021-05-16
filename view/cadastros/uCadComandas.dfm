inherited frmCadComandas: TfrmCadComandas
  Caption = 'Cadastro de Comandas'
  ClientWidth = 491
  ExplicitWidth = 497
  PixelsPerInch = 96
  TextHeight = 13
  object lbCodigo: TLabel [0]
    Left = 8
    Top = 58
    Width = 33
    Height = 13
    Caption = 'Codigo'
    FocusControl = dbCodigo
  end
  object lbDescricao: TLabel [1]
    Left = 83
    Top = 58
    Width = 48
    Height = 13
    Caption = 'Descricao'
    FocusControl = dbDescricao
  end
  object Label1: TLabel [2]
    Left = 8
    Top = 104
    Width = 24
    Height = 13
    Caption = 'Ativa'
  end
  inherited pnBotoes: TPanel
    Left = 370
    TabOrder = 3
    ExplicitLeft = 370
  end
  inherited btFechar: TBitBtn
    Left = 378
    TabOrder = 5
    ExplicitLeft = 378
  end
  inherited ToolBar1: TToolBar
    Width = 491
    TabOrder = 4
    ExplicitWidth = 491
  end
  inherited panCaption: TPanel
    Width = 491
    TabOrder = 6
    ExplicitWidth = 491
  end
  inherited sbPrincipal: TStatusBar
    Width = 491
    ExplicitWidth = 491
  end
  object dbDescricao: TDBEdit [8]
    Left = 83
    Top = 77
    Width = 278
    Height = 21
    Hint = 'Descricao'
    DataField = 'cma_descricao'
    DataSource = dsCadastro
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbCodigo: TDBEdit [9]
    Left = 8
    Top = 77
    Width = 69
    Height = 21
    Hint = 'Codigo'
    DataField = 'cma_codigo'
    DataSource = dsCadastro
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object cbAtiva: TwwDBComboBox [10]
    Left = 8
    Top = 123
    Width = 69
    Height = 21
    Hint = 'Selecione o status'
    ShowButton = True
    Style = csDropDown
    MapList = True
    AllowClearKey = False
    AutoDropDown = True
    ShowMatchText = True
    DataField = 'cma_ativa'
    DataSource = dsCadastro
    DropDownCount = 8
    ItemHeight = 0
    Items.Strings = (
      'N'#227'o'#9'0'
      'Sim'#9'1')
    Sorted = False
    TabOrder = 2
    UnboundDataType = wwDefault
  end
  inherited ActionList: TActionList
    inherited actAtualizar: TAction
      OnExecute = actAtualizarExecute
    end
    inherited actProcurar: TAction
      OnExecute = actProcurarExecute
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmGestao.qyComandas
  end
end
