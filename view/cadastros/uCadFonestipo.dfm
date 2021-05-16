inherited frmCadFonestipo: TfrmCadFonestipo
  Caption = 'Cadastro de Tipos de Telefone'
  ClientWidth = 405
  ExplicitWidth = 411
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
  object lbMascara: TLabel [2]
    Left = 8
    Top = 104
    Width = 41
    Height = 13
    Caption = 'M'#225'scara'
    FocusControl = dbMascara
  end
  object dbDescricao: TDBEdit [3]
    Left = 83
    Top = 77
    Width = 190
    Height = 21
    Hint = 'Descricao'
    DataField = 'TPF_DESCRICAO'
    DataSource = dsCadastro
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbMascara: TDBEdit [4]
    Left = 8
    Top = 123
    Width = 144
    Height = 21
    Hint = 'Mascara'
    DataField = 'TPF_MASCARA'
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
    TabStop = False
    Color = clBtnFace
    DataField = 'TPF_CODIGO'
    DataSource = dsCadastro
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
  end
  inherited pnBotoes: TPanel
    Left = 284
    TabOrder = 3
    ExplicitLeft = 424
  end
  inherited btFechar: TBitBtn
    Left = 292
    TabOrder = 5
    ExplicitLeft = 432
  end
  inherited ToolBar1: TToolBar
    Width = 405
    TabOrder = 4
    ExplicitWidth = 545
  end
  inherited panCaption: TPanel
    Width = 405
    TabOrder = 6
    ExplicitWidth = 545
  end
  inherited sbPrincipal: TStatusBar
    Width = 405
    ExplicitWidth = 545
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
    DataSet = dmDiversos.qyFonesTipo
  end
end
