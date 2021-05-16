inherited frmCadPais: TfrmCadPais
  Caption = 'Cadastro de Pa'#237'ses'
  ClientWidth = 616
  ExplicitWidth = 622
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
  object lbPais: TLabel [1]
    Left = 83
    Top = 58
    Width = 20
    Height = 13
    Caption = 'Pais'
    FocusControl = dbPais
  end
  object lbAlpha3: TLabel [2]
    Left = 8
    Top = 104
    Width = 33
    Height = 13
    Caption = 'Alpha3'
    FocusControl = dbAlpha3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object dbPais: TDBEdit [3]
    Left = 83
    Top = 77
    Width = 406
    Height = 21
    Hint = 'Pais'
    DataField = 'PAI_PAIS'
    DataSource = dsCadastro
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbAlpha3: TDBEdit [4]
    Left = 8
    Top = 123
    Width = 69
    Height = 21
    Hint = 'Alpha3'
    DataField = 'PAI_ALPHA3'
    DataSource = dsCadastro
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbCodigo: TDBEdit [5]
    Left = 8
    Top = 77
    Width = 69
    Height = 21
    Hint = 'Codigo'
    DataField = 'PAI_CODIGO'
    DataSource = dsCadastro
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  inherited pnBotoes: TPanel
    Left = 495
    TabOrder = 3
    ExplicitLeft = 495
  end
  inherited btFechar: TBitBtn
    Left = 503
    TabOrder = 5
    ExplicitLeft = 503
  end
  inherited ToolBar1: TToolBar
    Width = 616
    TabOrder = 4
    ExplicitWidth = 616
  end
  inherited panCaption: TPanel
    Width = 616
    TabOrder = 6
    ExplicitWidth = 616
  end
  inherited sbPrincipal: TStatusBar
    Width = 616
    ExplicitWidth = 616
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
    DataSet = dmDiversos.qyPais
  end
end
