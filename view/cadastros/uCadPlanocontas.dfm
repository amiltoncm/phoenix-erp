inherited frmCadPlanocontas: TfrmCadPlanocontas
  Caption = 'Cadastro de Plano de contas'
  ClientWidth = 504
  ExplicitWidth = 510
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
    Width = 21
    Height = 13
    Caption = 'Tipo'
  end
  object dbDescricao: TDBEdit [3]
    Left = 83
    Top = 77
    Width = 292
    Height = 21
    Hint = 'Descricao'
    DataField = 'PLC_DESCRICAO'
    DataSource = dsCadastro
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbCodigo: TDBEdit [4]
    Left = 8
    Top = 77
    Width = 69
    Height = 21
    Hint = 'Codigo'
    TabStop = False
    Color = clBtnFace
    DataField = 'PLC_CODIGO'
    DataSource = dsCadastro
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
  end
  inherited pnBotoes: TPanel
    Left = 383
    TabOrder = 3
  end
  inherited btFechar: TBitBtn
    Left = 391
    TabOrder = 5
  end
  inherited ToolBar1: TToolBar
    Width = 504
    TabOrder = 4
  end
  inherited panCaption: TPanel
    Width = 504
    TabOrder = 6
  end
  inherited sbPrincipal: TStatusBar
    Width = 504
  end
  object cbTipo: TwwDBComboBox [10]
    Left = 8
    Top = 123
    Width = 81
    Height = 21
    ShowButton = True
    Style = csDropDown
    MapList = True
    AllowClearKey = False
    DataField = 'PLC_TIPO'
    DataSource = dsCadastro
    DropDownCount = 8
    ItemHeight = 0
    Items.Strings = (
      'D'#233'bito'#9'D'
      'Cr'#233'dito'#9'C')
    ParentShowHint = False
    ShowHint = True
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
    DataSet = dmCadastros.qyPlanoContas
  end
end
