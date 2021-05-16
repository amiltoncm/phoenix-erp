inherited frmCadQuadras: TfrmCadQuadras
  Caption = 'Cadastro de Quadras'
  ClientWidth = 484
  OnActivate = FormActivate
  ExplicitWidth = 490
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
  object Label1: TLabel [2]
    Left = 8
    Top = 104
    Width = 87
    Height = 13
    Caption = 'C'#243'digo do Servi'#231'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  inherited pnBotoes: TPanel
    Left = 363
    TabOrder = 2
    ExplicitLeft = 363
  end
  inherited btFechar: TBitBtn
    Left = 371
    TabOrder = 5
    ExplicitLeft = 371
  end
  inherited ToolBar1: TToolBar
    Width = 484
    TabOrder = 4
    ExplicitWidth = 484
  end
  inherited panCaption: TPanel
    Width = 484
    TabOrder = 6
    ExplicitWidth = 484
  end
  inherited sbPrincipal: TStatusBar
    Width = 484
    ExplicitWidth = 484
  end
  object dbCodigo: TDBEdit [8]
    Left = 8
    Top = 77
    Width = 69
    Height = 21
    Hint = 'Codigo'
    TabStop = False
    Color = clBtnFace
    DataField = 'qda_codigo'
    DataSource = dsCadastro
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
  end
  object dbDescricao: TDBEdit [9]
    Left = 83
    Top = 77
    Width = 274
    Height = 21
    Hint = 'Descricao'
    DataField = 'qda_descricao'
    DataSource = dsCadastro
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbCodProduto: TDBEdit [10]
    Left = 8
    Top = 123
    Width = 87
    Height = 21
    Hint = 'Digite o c'#243'digo do Produto para vincular'
    DataField = 'pro_codigo'
    DataSource = dsCadastro
    TabOrder = 3
  end
  inherited ActionList: TActionList
    Left = 320
    inherited actAtualizar: TAction
      OnExecute = actAtualizarExecute
    end
    inherited actProcurar: TAction
      OnExecute = actProcurarExecute
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmGestao.qyQuadras
  end
end
