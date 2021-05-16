inherited frmCadUf: TfrmCadUf
  Caption = 'Cadastro de Uf'
  ClientWidth = 556
  ExplicitWidth = 562
  PixelsPerInch = 96
  TextHeight = 13
  object lbSigla: TLabel [0]
    Left = 8
    Top = 58
    Width = 23
    Height = 13
    Caption = 'Sigla'
    FocusControl = dbSigla
  end
  object lbEstado: TLabel [1]
    Left = 60
    Top = 58
    Width = 33
    Height = 13
    Caption = 'Estado'
    FocusControl = dbEstado
  end
  object lbCodigo: TLabel [2]
    Left = 358
    Top = 58
    Width = 33
    Height = 13
    Caption = 'Codigo'
    FocusControl = dbCodigo
  end
  object Label1: TLabel [3]
    Left = 8
    Top = 104
    Width = 20
    Height = 13
    Caption = 'Pais'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [4]
    Left = 358
    Top = 104
    Width = 47
    Height = 13
    Caption = 'C'#243'd. Pa'#237's'
    FocusControl = dbCodPais
  end
  object Label3: TLabel [5]
    Left = 8
    Top = 150
    Width = 44
    Height = 13
    Hint = 'ICMS Interno'
    Caption = 'ICMS Int.'
  end
  object dbEstado: TDBEdit [6]
    Left = 60
    Top = 77
    Width = 292
    Height = 21
    Hint = 'Estado'
    DataField = 'UF_ESTADO'
    DataSource = dsCadastro
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbCodigo: TDBEdit [7]
    Left = 358
    Top = 77
    Width = 69
    Height = 21
    Hint = 'Codigo'
    DataField = 'UF_CODIGO'
    DataSource = dsCadastro
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbSigla: TDBEdit [8]
    Left = 8
    Top = 77
    Width = 46
    Height = 21
    Hint = 'Sigla'
    DataField = 'UF_SIGLA'
    DataSource = dsCadastro
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  inherited pnBotoes: TPanel
    Left = 435
    TabOrder = 6
    ExplicitLeft = 429
  end
  inherited btFechar: TBitBtn
    Left = 443
    TabOrder = 8
    ExplicitLeft = 437
  end
  inherited ToolBar1: TToolBar
    Width = 556
    TabOrder = 7
    ExplicitWidth = 550
  end
  inherited panCaption: TPanel
    Width = 556
    TabOrder = 9
    ExplicitWidth = 550
  end
  inherited sbPrincipal: TStatusBar
    Width = 556
    ExplicitWidth = 550
  end
  object cbPais: TwwDBLookupCombo [14]
    Left = 8
    Top = 123
    Width = 344
    Height = 21
    DropDownAlignment = taLeftJustify
    DataField = 'PAI_PAIS'
    DataSource = dsCadastro
    LookupTable = dmLookups.qyLkPais
    LookupField = 'PAI_PAIS'
    TabOrder = 3
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = cbPaisExit
  end
  object dbCodPais: TDBEdit [15]
    Left = 358
    Top = 123
    Width = 69
    Height = 21
    DataField = 'PAI_CODIGO'
    DataSource = dsCadastro
    TabOrder = 4
  end
  object dbICMSInt: TDBEdit [16]
    Left = 8
    Top = 169
    Width = 54
    Height = 21
    DataField = 'uf_icmsint'
    DataSource = dsCadastro
    TabOrder = 5
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
    DataSet = dmDiversos.qyUf
  end
end
