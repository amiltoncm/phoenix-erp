inherited frmCadEndeletrotipo: TfrmCadEndeletrotipo
  Caption = 'Cadastro de Tipos de Endere'#231'o Eletr'#244'nico'
  ClientWidth = 390
  ExplicitWidth = 396
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
    Width = 182
    Height = 21
    Hint = 'Descricao'
    DataField = 'TPN_DESCRICAO'
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
    DataField = 'TPN_CODIGO'
    DataSource = dsCadastro
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
  end
  inherited pnBotoes: TPanel
    Left = 269
    TabOrder = 2
    ExplicitLeft = 268
  end
  inherited btFechar: TBitBtn
    Left = 277
    TabOrder = 4
    ExplicitLeft = 276
  end
  inherited ToolBar1: TToolBar
    Width = 390
    TabOrder = 3
    ExplicitWidth = 389
  end
  inherited panCaption: TPanel
    Width = 390
    TabOrder = 5
    ExplicitWidth = 389
  end
  inherited sbPrincipal: TStatusBar
    Width = 390
    ExplicitWidth = 389
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
    DataSet = dmDiversos.qyEndEletroTipo
    Left = 32
  end
end
