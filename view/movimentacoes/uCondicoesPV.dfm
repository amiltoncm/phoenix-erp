inherited frmCondicoesPV: TfrmCondicoesPV
  Caption = 'Condi'#231#245'es comerciais'
  ClientHeight = 379
  ClientWidth = 1014
  OnActivate = FormActivate
  ExplicitWidth = 1020
  ExplicitHeight = 408
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 99
    Height = 13
    Caption = 'Prazo de pagamento'
  end
  object Label16: TLabel [1]
    Left = 266
    Top = 8
    Width = 102
    Height = 13
    Caption = 'Forma de Pagamento'
  end
  object Label17: TLabel [2]
    Left = 524
    Top = 8
    Width = 26
    Height = 13
    Caption = 'Frete'
  end
  object Label18: TLabel [3]
    Left = 649
    Top = 8
    Width = 38
    Height = 13
    Caption = 'Entrega'
  end
  inherited btFechar: TBitBtn
    Left = 8
    Top = 346
    TabOrder = 5
    Visible = False
    ExplicitLeft = 8
    ExplicitTop = 346
  end
  object cbPrazo: TwwDBLookupCombo
    Left = 8
    Top = 27
    Width = 252
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'PRZ_DESCRICAO'#9'30'#9'Descri'#231#227'o'#9#9
      'PRZ_PARCELAS'#9'10'#9'Parcelas'#9#9
      'PRZ_JUROS'#9'10'#9'Juros'#9#9
      'PRZ_CODIGO'#9'10'#9'C'#243'digo'#9#9)
    DataField = 'prz_descricao'
    DataSource = dsPreVenda
    LookupTable = dmLookups.qyLkPrazos
    LookupField = 'PRZ_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 0
    AutoDropDown = True
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
    OnExit = cbPrazoExit
  end
  object cbForma: TwwDBLookupCombo
    Left = 266
    Top = 27
    Width = 252
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'frp_descricao'#9'20'#9'Forma de pagamento'#9#9
      'frp_codigo'#9'10'#9'C'#243'digo'#9#9)
    DataField = 'frp_descricao'
    DataSource = dsPreVenda
    LookupTable = dmLookups.qyLkPrazosFrp
    LookupField = 'frp_descricao'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 1
    AutoDropDown = True
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
    OnExit = cbFormaExit
  end
  object cbFrete: TwwDBLookupCombo
    Left = 524
    Top = 27
    Width = 119
    Height = 21
    DropDownAlignment = taLeftJustify
    DataField = 'MDF_DESCRICAO'
    DataSource = dsPreVenda
    LookupTable = dmLookups.qyLkModFrete
    LookupField = 'MDF_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 2
    AutoDropDown = True
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
    OnExit = cbFreteExit
  end
  object cbEntrega: TwwDBLookupCombo
    Left = 649
    Top = 27
    Width = 152
    Height = 21
    DropDownAlignment = taLeftJustify
    DataField = 'ENT_DESCRICAO'
    DataSource = dsPreVenda
    LookupTable = dmLookups.qyLkEntrega
    LookupField = 'ENT_DESCRICAO'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 3
    AutoDropDown = True
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
    OnExit = cbEntregaExit
  end
  object btGravar: TBitBtn
    Left = 901
    Top = 346
    Width = 105
    Height = 25
    Hint = 'Fecha a janela'
    Anchors = [akRight, akBottom]
    Caption = '&Gravar'
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
    ShowHint = True
    TabOrder = 4
    OnClick = btGravarClick
  end
  object pnEndEntrega: TPanel
    Left = 8
    Top = 54
    Width = 998
    Height = 283
    BevelInner = bvLowered
    TabOrder = 6
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 101
      Height = 13
      Caption = 'Endere'#231'o de entrega'
    end
    object Label3: TLabel
      Left = 8
      Top = 235
      Width = 108
      Height = 13
      Caption = 'Endere'#231'o selecionado:'
    end
    object sbEndPrincipal: TSpeedButton
      Left = 843
      Top = 254
      Width = 23
      Height = 22
      Hint = 'Usar endere'#231'o principal'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FF8F8E8D9D9C9B9D9C9BFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9D9C9BBDBCBCEBEBEBD2
        D2D19D9C9B9D9C9B9D9C9BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF9D9C9BC4C4C4FFFFFFFAFAFAEDEDEDF2EDEA72B1721483143483348090
        7F9D9C9BFF00FFFF00FFFF00FFFF00FF9D9C9BD1D0D0FFFFFFFFFFFFFBFBFBF0
        F0F0F7F1EE75B4750482040482049DBC9DC7C3C19D9C9B797978FF00FF9D9C9B
        E0E0E0FFFFFFFFFFFFFFFFFFFDFDFDF6F6F6FDF7F478B778048204048204A1C1
        A1DBD8D6C3C3C3777776FF00FF9D9C9BFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFC
        FCFCFFFEFB7BBA7B048204048204A6C5A6DEDBDAC4C4C3777776FF00FF9D9C9B
        FFFEFFFFFFFFB2C6B17FA17FD2DDD2FFFFFFFFFFFF7EBD7E048204048204ABCA
        ABE5E2E1C8C9C87B787AFF00FF9D9C9BEBEEEA6790650B7112006B05166015CB
        D9CBFFFFFFDDEDDD7EBD7E4EA54EBED5BEE9E7E6D8D2D84F674FFF00FF9D9C9B
        256A2517922843DE6637CD530373071A5F19CCD9CDFFFFFFFFFFFFF9F8F7EEEF
        EEF2F0F2D0D0D0245824FF00FF2177293BCA5D54EE7E47DF6A3DD75C2DC24505
        7109175E16CBD8CBFFFFFFFDFDFDFFFFFFC5D0C52F6D2F005800FF00FF0E7E14
        65FF9750E87946DE693CD45A34CE4E25BA37006E021B5F1ACEDBCEFFFFFF99B4
        990B560B005C00FF00FFFF00FF0E7E144AD96E53ED7E46DE693CD45A32CB4C28
        C23C1DB12B006E032065205B875B005100006300FF00FFFF00FFFF00FFFF00FF
        0E7E1447DB6C48E26D3CD45A33CB4C37CE5353ED7C13A91C0070000053000065
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0E7E143FD25E3ED85C36CF5153
        ED7C53ED7C0BA210057E08FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0E7E1435C85035CE4F0E7E140B97100687080E7E14FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0E7E140E7E14FF
        00FF035E040E7E14FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = sbEndPrincipalClick
    end
    object sbNovoEnd: TSpeedButton
      Left = 872
      Top = 254
      Width = 23
      Height = 22
      Hint = 'Cadastrar novo endere'#231'o'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF03
        5D05035D05FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF035D055BF791058C0D035D05FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF035D055B
        F79105950E035D05FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF035D055BF79105920D035D05FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF035D055B
        F79106950F035D05FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        035D05035D05035D05035D05035D055BF7910C9C18035D05035D05035D05035D
        05035D05FF00FFFF00FFFF00FF035D055BF7913BDA6930CF572AC64D21B83C17
        A62B119F210D9E1C0A9A1506920E05930D058B0D035D05FF00FFFF00FF035D05
        5BF7915BF7915BF7915BF7915BF7915BF79118A92F5BF7915BF7915BF7915BF7
        915BF791035D05FF00FFFF00FFFF00FF035D05035D05035D05035D05035D055B
        F79125BC42035D05035D05035D05035D05035D05FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF035D055BF79130CE57035D05FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF035D055B
        F7913BD968035D05FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF035D055BF79148EB7F035D05FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF035D055B
        F7915BF791035D05FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF035D05035D05FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = sbNovoEndClick
    end
    object GridEnderecos: TJvDBGrid
      Left = 8
      Top = 27
      Width = 982
      Height = 202
      DataSource = dsEnderecos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GridEnderecosDblClick
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 17
      TitleRowHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'TPE_DESCRICAO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'END_LOGRADOURO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'END_NUMERO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'END_COMPLEMENTO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'END_BAIRRO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'END_PTREFERENCIA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CID_MUNICIPIO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UF_SIGLA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'END_CEP'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'END_CODIGO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PES_CODIGO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TPE_CODIGO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TPL_CODIGO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CID_CODIGO'
          Visible = True
        end>
    end
    object edLogradouro: TEdit
      Left = 63
      Top = 254
      Width = 330
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
      Text = 'edLogradouro'
    end
    object edNumero: TEdit
      Left = 399
      Top = 254
      Width = 66
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
      Text = 'edNumero'
    end
    object edBairro: TEdit
      Left = 471
      Top = 254
      Width = 164
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
      Text = 'edBairro'
    end
    object edCidade: TEdit
      Left = 641
      Top = 254
      Width = 161
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
      Text = 'edCidade'
    end
    object edUf: TEdit
      Left = 808
      Top = 254
      Width = 29
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
      Text = 'edUf'
    end
    object edCodEnd: TEdit
      Left = 8
      Top = 254
      Width = 49
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 6
      Text = 'edCodEnd'
    end
  end
  object dsPreVenda: TDataSource
    DataSet = dmOrcamentos.qyPrevendas
    Left = 248
    Top = 152
  end
  object dsEnderecos: TDataSource
    DataSet = dmPessoas.qyEnderecos
    Left = 328
    Top = 80
  end
end
