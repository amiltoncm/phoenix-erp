inherited frmCadBancos: TfrmCadBancos
  Caption = 'Cadastro de Bancos'
  ClientWidth = 591
  ExplicitWidth = 597
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
    Width = 381
    Height = 21
    Hint = 'Descricao'
    DataField = 'BAN_DESCRICAO'
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
    DataField = 'BAN_CODIGO'
    DataSource = dsCadastro
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  inherited pnBotoes: TPanel
    Left = 470
    TabOrder = 2
  end
  inherited btFechar: TBitBtn
    Left = 478
    TabOrder = 4
  end
  inherited ToolBar1: TToolBar
    Width = 591
    TabOrder = 3
  end
  inherited panCaption: TPanel
    Width = 591
    TabOrder = 5
  end
  inherited sbPrincipal: TStatusBar
    Width = 591
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
    DataSet = dmCadastros.qyBancos
  end
end
