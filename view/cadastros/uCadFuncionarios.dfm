inherited frmCadFuncionarios: TfrmCadFuncionarios
  Caption = 'Cadastro de Funcionarios'
  ClientWidth = 608
  ExplicitWidth = 614
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
  object lbNome: TLabel [1]
    Left = 83
    Top = 58
    Width = 28
    Height = 13
    Caption = 'Nome'
    FocusControl = dbDescricao
  end
  object lbTelefone: TLabel [2]
    Left = 8
    Top = 104
    Width = 42
    Height = 13
    Caption = 'Telefone'
    FocusControl = dbTelefone
  end
  object lbAtivo: TLabel [3]
    Left = 407
    Top = 104
    Width = 24
    Height = 13
    Caption = 'Ativo'
  end
  object Label1: TLabel [4]
    Left = 137
    Top = 104
    Width = 36
    Height = 13
    Caption = 'Fun'#231#227'o'
  end
  object dbDescricao: TDBEdit [5]
    Left = 83
    Top = 77
    Width = 395
    Height = 21
    Hint = 'Nome'
    DataField = 'FUN_NOME'
    DataSource = dsCadastro
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbTelefone: TDBEdit [6]
    Left = 8
    Top = 123
    Width = 123
    Height = 21
    Hint = 'Telefone'
    DataField = 'FUN_TELEFONE'
    DataSource = dsCadastro
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbCodigo: TDBEdit [7]
    Left = 8
    Top = 77
    Width = 69
    Height = 21
    Hint = 'Codigo'
    TabStop = False
    Color = clBtnFace
    DataField = 'FUN_CODIGO'
    DataSource = dsCadastro
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
  end
  inherited pnBotoes: TPanel
    Left = 487
    TabOrder = 5
    ExplicitLeft = 475
  end
  inherited btFechar: TBitBtn
    Left = 495
    TabOrder = 7
    ExplicitLeft = 483
  end
  inherited ToolBar1: TToolBar
    Width = 608
    TabOrder = 6
    ExplicitWidth = 596
  end
  inherited panCaption: TPanel
    Width = 608
    TabOrder = 8
    ExplicitWidth = 596
  end
  inherited sbPrincipal: TStatusBar
    Width = 608
    ExplicitWidth = 596
  end
  object cbFuncao: TwwDBLookupCombo [13]
    Left = 137
    Top = 123
    Width = 263
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'FNC_DESCRICAO'#9'20'#9'Descri'#231#227'o'#9#9
      'FNC_CODIGO'#9'10'#9'C'#243'digo'#9#9)
    DataField = 'FNC_DESCRICAO'
    DataSource = dsCadastro
    LookupTable = dmLookups.qyLkFuncoes
    LookupField = 'FNC_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 3
    AutoDropDown = True
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
    OnExit = cbFuncaoExit
  end
  object cbAtivo: TwwDBComboBox [14]
    Left = 407
    Top = 123
    Width = 71
    Height = 21
    ShowButton = True
    Style = csDropDown
    MapList = True
    AllowClearKey = False
    DataField = 'FUN_ATIVO'
    DataSource = dsCadastro
    DropDownCount = 8
    ItemHeight = 0
    Items.Strings = (
      'Sim'#9'S'
      'N'#227'o'#9'N')
    Sorted = False
    TabOrder = 4
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
    DataSet = dmCadastros.qyFuncionarios
  end
end
