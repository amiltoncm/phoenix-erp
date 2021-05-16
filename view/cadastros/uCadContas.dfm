inherited frmCadContas: TfrmCadContas
  Caption = 'Cadastro de Contas'
  ClientHeight = 359
  ClientWidth = 590
  ExplicitWidth = 596
  ExplicitHeight = 388
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
  object lbAtiva: TLabel [2]
    Left = 8
    Top = 150
    Width = 24
    Height = 13
    Caption = 'Ativa'
  end
  object Label1: TLabel [3]
    Left = 8
    Top = 104
    Width = 31
    Height = 13
    Caption = 'Banco'
  end
  object Label2: TLabel [4]
    Left = 395
    Top = 104
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object dbDescricao: TDBEdit [5]
    Left = 83
    Top = 77
    Width = 381
    Height = 21
    Hint = 'Descricao'
    DataField = 'CON_DESCRICAO'
    DataSource = dsCadastro
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbCodigo: TDBEdit [6]
    Left = 8
    Top = 77
    Width = 69
    Height = 21
    Hint = 'Codigo'
    TabStop = False
    Color = clBtnFace
    DataField = 'CON_CODIGO'
    DataSource = dsCadastro
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
  end
  inherited pnBotoes: TPanel
    Left = 469
    Height = 288
    TabOrder = 5
    ExplicitHeight = 288
  end
  inherited btFechar: TBitBtn
    Left = 477
    Top = 309
    TabOrder = 7
    ExplicitTop = 309
  end
  inherited ToolBar1: TToolBar
    Width = 590
    TabOrder = 6
  end
  inherited panCaption: TPanel
    Width = 590
    TabOrder = 9
  end
  inherited sbPrincipal: TStatusBar
    Top = 340
    Width = 590
    ExplicitTop = 340
  end
  object cbBanco: TwwDBLookupCombo [12]
    Left = 8
    Top = 123
    Width = 381
    Height = 21
    Hint = 'Selecione o banco'
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'BAN_DESCRICAO'#9'50'#9'Descri'#231#227'o'#9#9
      'BAN_CODIGO'#9'10'#9'C'#243'digo'#9#9)
    DataField = 'BAN_DESCRICAO'
    DataSource = dsCadastro
    LookupTable = dmLookups.qyLkBancos
    LookupField = 'BAN_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 2
    AutoDropDown = True
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
    OnExit = cbBancoExit
  end
  object dbCodBanco: TDBEdit [13]
    Left = 395
    Top = 123
    Width = 69
    Height = 21
    Hint = 'Codigo'
    TabStop = False
    Color = clBtnFace
    DataField = 'BAN_CODIGO'
    DataSource = dsCadastro
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 3
  end
  object cbAtivo: TwwDBComboBox [14]
    Left = 8
    Top = 169
    Width = 85
    Height = 21
    ShowButton = True
    Style = csDropDown
    MapList = True
    AllowClearKey = False
    DataField = 'CON_ATIVA'
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
    DataSet = dmCadastros.qyContas
  end
end
