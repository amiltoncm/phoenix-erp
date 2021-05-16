inherited frmCadMesas: TfrmCadMesas
  Caption = 'Cadastro de Mesas'
  ClientWidth = 492
  ExplicitWidth = 498
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
    Left = 371
    TabOrder = 3
    ExplicitLeft = 371
  end
  inherited btFechar: TBitBtn
    Left = 379
    TabOrder = 5
    ExplicitLeft = 379
  end
  inherited ToolBar1: TToolBar
    Width = 492
    TabOrder = 4
    ExplicitWidth = 492
  end
  inherited panCaption: TPanel
    Width = 492
    TabOrder = 6
    ExplicitWidth = 492
  end
  inherited sbPrincipal: TStatusBar
    Width = 492
    ExplicitWidth = 492
  end
  object dbCodigo: TDBEdit [8]
    Left = 8
    Top = 77
    Width = 69
    Height = 21
    Hint = 'Codigo'
    TabStop = False
    Color = clSkyBlue
    DataField = 'mes_codigo'
    DataSource = dsCadastro
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
  end
  object dbDescricao: TDBEdit [9]
    Left = 83
    Top = 77
    Width = 278
    Height = 21
    Hint = 'Descricao'
    DataField = 'mes_descricao'
    DataSource = dsCadastro
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
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
    DataField = 'mes_ativa'
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
    DataSet = dmGestao.qyMesas
  end
end
