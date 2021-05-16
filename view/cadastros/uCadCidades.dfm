inherited frmCadCidades: TfrmCadCidades
  Caption = 'Cadastro de Cidades'
  ClientWidth = 656
  ExplicitWidth = 662
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
  object lbMunicipio: TLabel [1]
    Left = 83
    Top = 58
    Width = 45
    Height = 13
    Caption = 'Municipio'
    FocusControl = dbMunicipio
  end
  object lbSigla: TLabel [2]
    Left = 409
    Top = 104
    Width = 23
    Height = 13
    Caption = 'Sigla'
    FocusControl = dbSigla
  end
  object lbCeppadrao: TLabel [3]
    Left = 457
    Top = 104
    Width = 55
    Height = 13
    Caption = 'Cep padr'#227'o'
    FocusControl = dbCeppadrao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel [4]
    Left = 8
    Top = 104
    Width = 33
    Height = 13
    Caption = 'Estado'
  end
  object dbMunicipio: TDBEdit [5]
    Left = 83
    Top = 77
    Width = 443
    Height = 21
    Hint = 'Municipio'
    DataField = 'CID_MUNICIPIO'
    DataSource = dsCadastro
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbSigla: TDBEdit [6]
    Left = 409
    Top = 123
    Width = 42
    Height = 21
    Hint = 'Sigla'
    TabStop = False
    Color = clBtnFace
    DataField = 'UF_SIGLA'
    DataSource = dsCadastro
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 3
  end
  object dbCeppadrao: TDBEdit [7]
    Left = 457
    Top = 123
    Width = 69
    Height = 21
    Hint = 'Ceppadrao'
    DataField = 'CID_CEPPADRAO'
    DataSource = dsCadastro
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object dbCodigo: TDBEdit [8]
    Left = 8
    Top = 77
    Width = 69
    Height = 21
    Hint = 'Codigo'
    DataField = 'CID_CODIGO'
    DataSource = dsCadastro
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  inherited pnBotoes: TPanel
    Left = 535
    TabOrder = 5
    ExplicitLeft = 524
  end
  inherited btFechar: TBitBtn
    Left = 543
    TabOrder = 7
    ExplicitLeft = 532
  end
  inherited ToolBar1: TToolBar
    Width = 656
    TabOrder = 6
    ExplicitWidth = 645
  end
  inherited panCaption: TPanel
    Width = 656
    TabOrder = 9
    ExplicitWidth = 645
  end
  inherited sbPrincipal: TStatusBar
    Width = 656
    ExplicitWidth = 645
  end
  object cbEstado: TwwDBLookupCombo [14]
    Left = 8
    Top = 123
    Width = 395
    Height = 21
    DropDownAlignment = taLeftJustify
    LookupTable = dmCadastros.qyCidades
    LookupField = 'UF_ESTADO'
    TabOrder = 2
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = cbEstadoExit
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
    DataSet = dmCadastros.qyCidades
  end
end
