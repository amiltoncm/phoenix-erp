inherited frmCadUnidades: TfrmCadUnidades
  Caption = 'Cadastro de Unidades'
  ClientWidth = 307
  ExplicitWidth = 313
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
    Width = 94
    Height = 21
    Hint = 'Descricao'
    DataField = 'UNI_DESCRICAO'
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
    DataField = 'UNI_CODIGO'
    DataSource = dsCadastro
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  inherited pnBotoes: TPanel
    Left = 186
    ExplicitLeft = 177
  end
  inherited btFechar: TBitBtn
    Left = 194
    ExplicitLeft = 185
  end
  inherited ToolBar1: TToolBar
    Width = 307
    ExplicitWidth = 298
  end
  inherited panCaption: TPanel
    Width = 307
    ExplicitWidth = 298
  end
  inherited sbPrincipal: TStatusBar
    Width = 307
    ExplicitWidth = 298
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
    DataSet = dmCadastros.qyUnidades
  end
end
