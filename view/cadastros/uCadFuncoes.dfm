inherited frmCadFuncoes: TfrmCadFuncoes
  Caption = 'Cadastro de Fun'#231#245'es'
  ClientWidth = 364
  ExplicitWidth = 370
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 58
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel [1]
    Left = 83
    Top = 58
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  inherited pnBotoes: TPanel
    Left = 243
    ExplicitLeft = 234
  end
  inherited btFechar: TBitBtn
    Left = 251
    ExplicitLeft = 242
  end
  inherited ToolBar1: TToolBar
    Width = 364
    ExplicitWidth = 355
  end
  inherited panCaption: TPanel
    Width = 364
    ExplicitWidth = 355
  end
  inherited sbPrincipal: TStatusBar
    Width = 364
    ExplicitWidth = 355
  end
  object dbCodigo: TDBEdit [7]
    Left = 8
    Top = 77
    Width = 69
    Height = 21
    Hint = 'C'#243'digo'
    TabStop = False
    Color = clBtnFace
    DataField = 'FNC_CODIGO'
    DataSource = dsCadastro
    ReadOnly = True
    TabOrder = 5
  end
  object dbDescricao: TDBEdit [8]
    Left = 83
    Top = 77
    Width = 153
    Height = 21
    DataField = 'FNC_DESCRICAO'
    DataSource = dsCadastro
    TabOrder = 6
  end
  inherited ActionList: TActionList
    Left = 32
    Top = 136
    inherited actAtualizar: TAction
      OnExecute = actAtualizarExecute
    end
    inherited actProcurar: TAction
      OnExecute = actProcurarExecute
    end
  end
  inherited Imagens: TImageList
    Left = 104
    Top = 136
  end
  inherited dsCadastro: TDataSource
    DataSet = dmCadastros.qyFuncoes
  end
end
