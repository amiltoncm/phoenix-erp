inherited frmCadLocalizacao: TfrmCadLocalizacao
  Caption = 'Cadastro de Localizacao'
  ClientWidth = 402
  ExplicitWidth = 408
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
  object dbDescricao: TDBEdit [2]
    Left = 83
    Top = 77
    Width = 190
    Height = 21
    Hint = 'Descricao'
    DataField = 'LOC_DESCRICAO'
    DataSource = dsCadastro
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object dbCodigo: TDBEdit [3]
    Left = 8
    Top = 77
    Width = 69
    Height = 21
    Hint = 'Codigo'
    TabStop = False
    Color = clBtnFace
    DataField = 'LOC_CODIGO'
    DataSource = dsCadastro
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 5
  end
  inherited pnBotoes: TPanel
    Left = 281
    ExplicitLeft = 272
  end
  inherited btFechar: TBitBtn
    Left = 289
    ExplicitLeft = 280
  end
  inherited ToolBar1: TToolBar
    Width = 402
    ExplicitWidth = 393
  end
  inherited panCaption: TPanel
    Width = 402
    ExplicitWidth = 393
  end
  inherited sbPrincipal: TStatusBar
    Width = 402
    ExplicitWidth = 393
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
    DataSet = dmCadastros.qyLocalizacao
  end
end
