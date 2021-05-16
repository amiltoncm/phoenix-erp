inherited frmCadSetor: TfrmCadSetor
  Caption = 'Cadastro de Setores'
  ClientWidth = 373
  ExplicitWidth = 379
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
    Width = 160
    Height = 21
    Hint = 'Descricao'
    DataField = 'SET_DESCRICAO'
    DataSource = dsCadastro
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbCodigo: TDBEdit [3]
    Left = 8
    Top = 77
    Width = 69
    Height = 21
    Hint = 'Codigo'
    TabStop = False
    Color = clBtnFace
    DataField = 'SET_CODIGO'
    DataSource = dsCadastro
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
  end
  inherited pnBotoes: TPanel
    Left = 252
    TabOrder = 2
    ExplicitLeft = 241
  end
  inherited btFechar: TBitBtn
    Left = 260
    TabOrder = 4
    ExplicitLeft = 249
  end
  inherited ToolBar1: TToolBar
    Width = 373
    TabOrder = 3
    ExplicitWidth = 362
  end
  inherited panCaption: TPanel
    Width = 373
    TabOrder = 5
    ExplicitWidth = 362
  end
  inherited sbPrincipal: TStatusBar
    Width = 373
    ExplicitWidth = 362
  end
  inherited ActionList: TActionList
    Left = 80
    inherited actAtualizar: TAction
      OnExecute = actAtualizarExecute
    end
    inherited actProcurar: TAction
      OnExecute = actProcurarExecute
    end
  end
  inherited Imagens: TImageList
    Left = 152
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDiversos.qySetor
  end
end
