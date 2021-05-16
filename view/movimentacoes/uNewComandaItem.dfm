inherited frmNewComandaItem: TfrmNewComandaItem
  Caption = 'Novo item'
  ClientHeight = 208
  ClientWidth = 699
  Font.Height = -13
  OnKeyPress = FormKeyPress
  ExplicitWidth = 705
  ExplicitHeight = 237
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 54
    Height = 16
    Caption = 'Comanda'
  end
  object Label2: TLabel [1]
    Left = 111
    Top = 8
    Width = 30
    Height = 16
    Caption = 'Mesa'
  end
  object Label5: TLabel [2]
    Left = 8
    Top = 60
    Width = 65
    Height = 16
    Caption = 'Quantidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel [3]
    Left = 87
    Top = 60
    Width = 89
    Height = 16
    Caption = 'C'#243'digo / Barras'
  end
  object Label7: TLabel [4]
    Left = 214
    Top = 60
    Width = 55
    Height = 16
    Caption = 'Descri'#231#227'o'
  end
  object Label8: TLabel [5]
    Left = 8
    Top = 112
    Width = 68
    Height = 16
    Caption = 'Vlr. Unit'#225'rio'
  end
  object Label9: TLabel [6]
    Left = 111
    Top = 112
    Width = 52
    Height = 16
    Caption = 'Desconto'
  end
  object Label10: TLabel [7]
    Left = 214
    Top = 112
    Width = 47
    Height = 16
    Caption = 'Desc. %'
  end
  object Label11: TLabel [8]
    Left = 279
    Top = 112
    Width = 74
    Height = 16
    Caption = 'Vlr. Unit. Liq.'
  end
  object Label12: TLabel [9]
    Left = 382
    Top = 112
    Width = 53
    Height = 16
    Caption = 'Vlr. Total'
  end
  inherited btFechar: TBitBtn
    Left = 571
    Top = 171
    Width = 120
    Height = 29
    Caption = '&Cancelar - ESC'
    TabOrder = 11
    ExplicitLeft = 571
    ExplicitTop = 171
    ExplicitWidth = 120
    ExplicitHeight = 29
  end
  object btConfirmar: TBitBtn
    Left = 445
    Top = 171
    Width = 120
    Height = 29
    Hint = 'Fecha a janela'
    Anchors = [akRight, akBottom]
    Caption = '&Inserir - F10'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FF0955A10857A60557AA0655A70954A00954A0FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0872DD0362C3006CDB0877E711
      7DEA0877E70069DD005DC70654A50654A5FF00FFFF00FFFF00FFFF00FFFF00FF
      0F6BC90872DD3E99F591C4F9D6E9FDEEF7FFE4F1FFB0D4FB59A5F50570E5035A
      B70B5095FF00FFFF00FFFF00FF1278E0127CE870B4F9F6FAFEFFFFFFEEF6FDD3
      E6FBE2EEFDFFFFFFFFFFFFAED2FA0E78ED025AB60653A2FF00FFFF00FF1278E0
      6DB2F9FEFEFFF4F9FE77B6F63391F0B5D5F91B7FEA4693EEC9E0FAFFFFFFB0D5
      FA0970E60653A2FF00FF0B70D53695F4E8F3FEFFFFFF4FA3F61F88F2D4E7FCFF
      FFFF489BEF0065E60E74E8C9E1FAFFFFFF58A5F5005EC70858AB137AE371B5FB
      FFFFFFB2D7FC469FF7DEEEFDFDFEFEE0EEFDA1CCF80173E9006AE74294EDFFFF
      FFB3D7FB016BDE0858AB1F85ECA2CFFDFFFFFF71B7FDACD4FDFAFCFF66AFF83F
      9AF5E2EFFD2D8EF00075EB0575E9E2EEFCE6F3FF0E7BE9065AB02F8FF1B7DAFD
      FFFFFF6BB4FF3C9DFE4FA5FB1D8AF81484F5A0CDFB84BDF8067AEF0374EBD4E8
      FBF0F8FF1A82EC055CB53693F0B8DAFEFFFFFF8EC6FF2391FF2E95FE2B93FC21
      8CF92D92F79ACAFB1D86F21D86F0F3F8FED9EBFE117DE9095CB22689EDAFD6FD
      FFFFFFE1F0FF3499FF2F96FF3399FF2E94FD218CF950A4F9419BF77DBBF8FFFF
      FF99C9FA0773E10958ABFF00FF3994F0F1F8FFFFFFFFADD6FF3499FF2592FF28
      93FF238FFC1788FA6FB4FAF4FAFFF5FAFE49A0F7076ACEFF00FFFF00FF3994F0
      CDE6FFF6FAFFFFFFFFE0EFFF8DC6FF6EB6FE79BBFFB6DAFEFFFFFFFFFFFF78B9
      F9137BE6076ACEFF00FFFF00FFFF00FF64ACF6D4EAFFF9FCFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFE7F3FE77B8FA1D85ED0D6DD0FF00FFFF00FFFF00FFFF00FF
      FF00FF459AF0A7D2FCD8ECFFE2F1FFE4F1FED1E7FE9DCDFD4DA2F7177FE8177F
      E8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3B94F061ABF665
      ADF7489EF42286EC127AE4FF00FFFF00FFFF00FFFF00FFFF00FF}
    ParentShowHint = False
    ShowHint = False
    TabOrder = 10
    OnClick = btConfirmarClick
  end
  object edComanda: TEdit
    Left = 8
    Top = 30
    Width = 97
    Height = 24
    TabStop = False
    Alignment = taRightJustify
    Color = clSkyBlue
    ReadOnly = True
    TabOrder = 0
    Text = 'edComanda'
  end
  object edMesa: TEdit
    Left = 111
    Top = 30
    Width = 97
    Height = 24
    TabStop = False
    Alignment = taRightJustify
    Color = clSkyBlue
    ReadOnly = True
    TabOrder = 1
    Text = 'edMesa'
  end
  object edQuantidade: TEdit
    Left = 8
    Top = 82
    Width = 73
    Height = 24
    Hint = 'Digite a quantidade'
    Alignment = taRightJustify
    NumbersOnly = True
    TabOrder = 2
    Text = 'edQuantidade'
  end
  object edCodigo: TEdit
    Left = 87
    Top = 82
    Width = 121
    Height = 24
    Hint = 'Digite o c'#243'digo ou c'#243'digo de barras'
    Alignment = taRightJustify
    MaxLength = 14
    NumbersOnly = True
    TabOrder = 3
    Text = 'edCodigo'
    OnKeyPress = edCodigoKeyPress
  end
  object cbProduto: TwwDBLookupCombo
    Left = 214
    Top = 82
    Width = 477
    Height = 24
    Hint = 'Digite a descri'#231#227'o do produto'
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'pro_descricao'#9'100'#9'Produtos / Servi'#231'os'#9#9
      'pro_codigo'#9'10'#9'C'#243'digo'#9#9
      'uni_codigo'#9'2'#9'UN'#9#9)
    LookupTable = dmLookups.qyLkProdutosVenda
    LookupField = 'pro_descricao'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 4
    AutoDropDown = True
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = cbProdutoExit
    OnKeyPress = cbProdutoKeyPress
  end
  object edVlrUnit: TEdit
    Left = 8
    Top = 134
    Width = 97
    Height = 24
    Hint = 'Valor unit'#225'rio'
    TabStop = False
    Alignment = taRightJustify
    Color = clSkyBlue
    ReadOnly = True
    TabOrder = 5
    Text = 'edVlrUnit'
  end
  object edVlrDesc: TEdit
    Left = 111
    Top = 134
    Width = 97
    Height = 24
    Hint = 'Desconto em reais'
    Alignment = taRightJustify
    TabOrder = 6
    Text = 'edVlrDesc'
    OnExit = edVlrDescExit
    OnKeyPress = edVlrDescKeyPress
  end
  object edPDesc: TEdit
    Left = 214
    Top = 134
    Width = 59
    Height = 24
    Hint = 'Desconto percentual'
    Alignment = taRightJustify
    TabOrder = 7
    Text = 'edPDesc'
    OnExit = edPDescExit
    OnKeyPress = edPDescKeyPress
  end
  object edVlrLiq: TEdit
    Left = 279
    Top = 134
    Width = 97
    Height = 24
    Hint = 'Valor unit'#225'rio l'#237'quido'
    TabStop = False
    Alignment = taRightJustify
    Color = clSkyBlue
    ReadOnly = True
    TabOrder = 8
    Text = 'edVlrLiq'
  end
  object edVlrTot: TEdit
    Left = 382
    Top = 134
    Width = 97
    Height = 24
    Hint = 'Valor total'
    TabStop = False
    Alignment = taRightJustify
    Color = clSkyBlue
    ReadOnly = True
    TabOrder = 9
    Text = 'edVlrTot'
  end
  object ActionList: TActionList
    Left = 328
    Top = 16
    object actInserir: TAction
      Caption = 'actInserir'
      Hint = 'Inserir item'
      ShortCut = 121
      OnExecute = actInserirExecute
    end
  end
end
