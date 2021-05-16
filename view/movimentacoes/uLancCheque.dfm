object frmLancCheque: TfrmLancCheque
  Left = 193
  Top = 130
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Cheques'
  ClientHeight = 360
  ClientWidth = 650
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  DesignSize = (
    650
    360)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 306
    Width = 51
    Height = 16
    Caption = 'Endosso'
  end
  object Label2: TLabel
    Left = 327
    Top = 306
    Width = 47
    Height = 16
    Caption = 'Telefone'
  end
  object edEndosso: TEdit
    Left = 8
    Top = 328
    Width = 313
    Height = 24
    Hint = 'Endosso (Cliente)'
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
  end
  object btGravar: TBitBtn
    Left = 537
    Top = 327
    Width = 105
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Gravar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
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
    ParentFont = False
    TabOrder = 3
    OnClick = btGravarClick
  end
  object edTelefone: TMaskEdit
    Left = 327
    Top = 328
    Width = 106
    Height = 24
    Hint = 'Telefone do cliente'
    EditMask = '(99) 99999-9999;1;_'
    MaxLength = 15
    TabOrder = 2
    Text = '(  )      -    '
  end
  object pnCheque: TPanel
    Left = 0
    Top = 0
    Width = 650
    Height = 300
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 0
    object lbValorExtenso: TLabel
      Left = 139
      Top = 95
      Width = 87
      Height = 16
      Caption = 'lbValorExtenso'
      Transparent = True
    end
    object lbDataExtenso: TLabel
      Left = 370
      Top = 173
      Width = 85
      Height = 16
      Caption = 'lbDataExtenso'
      Transparent = True
    end
    object ImgSobre: TImage
      Left = 12
      Top = 180
      Width = 80
      Height = 60
      Hint = 'Gest'#227'o para festas de igreja'
      Center = True
      ParentShowHint = False
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000500000
        003C0806000000F1273D8C000000017352474200AECE1CE90000000467414D41
        0000B18F0BFC6105000000097048597300000EC400000EC401952B0E1B000000
        0974455874436F6D6D656E740000892A8D06000009DB4944415478DAED9C0950
        54471AC7FF0CF77DC330A31C220A880614115410540CDEBB28A63CA25977B74C
        D4D55523A8311234C142115CBCAF588A09EAAA5109222B0A11F0404439543C90
        1B45B90F818199D9F79A084118617833C3D6D6FCAB28FABDE9EE37FDA38FEFFB
        BA1F0A892F128590ABCF5290036426394086920364A87E053882ED8A9CD25AE4
        BEA9435543336A1B5BC87D2D356568A92AC1DC4813B666BAE0EA6B2029EF667F
        B3EA56320538DECA1DA9B915B8945E447E724A6B7A55CE44470D339D06909FC9
        C3CC905672ABDF807D28990034557744F8D5C7B89C5E8CD7358D8CEA525751C4
        14070E964D1C020DAD173203254A520538D4D0055B2F66E048E273B4F225FF18
        2F7B36423E1B8977C2475285F4314905E028EE58EC887984B0D8C768686E957A
        233E73B544B09F138AEAD2A5FEAC0F257180E6DA23317B7702B28AAA65DA101D
        7565442D7787A676AE4C9F2B518042DE50CC8DF80D15F5CD326DC47BB1141410
        3CCF09AE7615327BA6C4003EC967E31F91A95299EBC4D5E7E306E1D05257A416
        A548FD591201985360862F8FDF91099CDE6ACE68739C5D3941EAF6237380D4B0
        F50E89470B5F204B3EBDD2963F8DC044C7DED99A7D15238003A905C325F04ABF
        CD79BDD1D9951E30312A905AFD7D06489B2A6E41B1C82E96ED6A2BAE68C33BE5
        DBA9A8E56749A5FE3E03FC2D530F811732FA154E6F35D6C618C10B35A452779F
        00DA1AB960F0D7BFA0BE49FA46B2A4747ED504181AE44BBCDE3E013C9BAC86FD
        F14FFB9B89581AC2D641F6F659B8559024D17AC50668A6E184611B2FFD4FD87B
        E26AFF1763606FF95AA2758A0DF05C8A3AF65ECBE96F1662CBB2B11CF3F87958
        6BAF8ED6B76FC1D2D08012DB0C1A6EE3A0EEEA86A4E2BB7DAA572C8096FA9670
        DF9A46829D7E2E1670A32667636D3534B7F25158DE80FF6497E25C6A21EA9A5A
        3E5A8FB9A126BE70B7C6B8212630D25645653D8F5ACDAB1099F212E9F9959DF2
        DA7174B184CA3BCAD210065A2AA86EE0E16E6E394E24E7E2E9ABDA1EBFB39F99
        004B6B1EC23AE182C83C2C3D3D187CB912BA8B9620A9483C8740EC1E985BCCA5
        1A34088A2C56B79F97D534627DD47D02A3CBC31400FFE90E08F2FD04AACA8A5D
        3E170A85389AF81CAB22EF81D72AC0F7731DB17EFA302829767D562B65B8875F
        7D828D67D3C11774DF847FF29F20ECE436282829A17C5708AA0EEDFB68DBD4C7
        7B801D128E94DAC7D20148C7F7D87AEA5D1AAD4093F9403B7ECD46C099CEE125
        3A76E73FC3A1C7F2D1E94524F0FA77AF213DE63D49F5C42587BAFABC5F952462
        4DE90D58A76583A5A545CA16CD9981E6ECEEED4125EE00708F9E8490C783A2A9
        2952AAB2250B90A3CB818D910D49B750BD6357EC231296CF2CAA869E86324652
        436CFDB461F0B0356D2FB3E6D43DEC8E7B42D2533FE1E2CAD7933A353CF4CA23
        320CE921BD78BC3536CE74E8D2DB0454EFA2E7DC03379E21B7AC0ED6A6DA58E6
        65835553ECC062B5C15C7A2405C76F7684B13CAB7270F0D94F604108EEC9D3D0
        701D4BEE571E39808A9DDBBBB44DC5D61EDC232720A8AF45E9B2A5646EA4CBDD
        CCEB79C5EE35C009D613C8EF57D5EF30332C01F7F3BA868CE870D2A6590ED836
        D7895C37B7F031D4FF220AA8F9F14EE0548C196C4CEE6FBB98892DE71F7629EF
        EB6C8EF3AB3D3BDD5B71E26EB726D3DF3C6D70E4AF6E245D505E0FABB517A85E
        06280B5A1193B90796CD6DDFCF706D0035BFAD20695E61010A26BB77AA47CDD9
        059C83C7D09C958957AB974350DBE63BB3C3F722DD5657B200E9613063D70D5C
        C928F9685EDA68F51D6D41D211540F0C8ECEC2AB3D7E64F8BD7C5347A08A3283
        2EAFF1C2CC910349FADECB728CF9EE0A01D39D52B6F8505E8609493B7E138D8C
        C22ACC28CF4058EEBFDBF368784E02F7F0F1F6EB82593EE0E5B4CD719A93BCC1
        DEBD0FF531D128DB1C404DAC1D8E818AAD1DF2C3374916602C056E5AE8F51EF3
        72F4D55112E147D27914B0850792718BEA81B47EBAF5128BA86B515A37D51EA1
        0B9C499ADE1258F7739AC8BCDBE73961C3CCE1243DE75F89B890568888E751F0
        A9ECD823A157D8417733DAE7CE8ABDBB511911061D5F3F987C1F82EA13C750BE
        2318DDFD952CE29370BB255F720003A961B7951A7EBD517EB82F2C8CB4487A3A
        053DE6F7F98F9EF7E8555A94168EB5C2A9AFDA8699FFE9FBD819237AC368F5A7
        76D8BD6834492F3E984C56FEC4073BC1E1750E6159C45E878A75DBFCDDF8301D
        0DD7E260B82E8080ABFEF1B0C8FA4D7745E081BDBEE400BEFF92BD51C2A629F0
        B46393F4FC7D3711B5C243EA004F25BF40D6BD20A808F99DF2D13D4D77DE7C92
        A6A7217AA8966DF247DDA5F31F6D8351C037C8F4B4650E90A5C082FB2077FC70
        29139BCF3DEC293B51E99EB930D36B8B802CD89F849F97BBF71B409D39F360BA
        3DB4FDBA3C6C07AA0EEEEDB10D1203488BEE813773CA30E187B81EF30EA64C8D
        E7A17F6EBF961540514358C566082C62E2DBAF1B12E289B9D293243A84879A0C
        055B9B4D2D0049D4429027BA426AAE8E0FF0C6C46166FD02F0C3454481F279CD
        F61E86E6788FF67BC29616BC1CEF0C415595C8BA95385C7023CFE0364F745BC5
        02F87E18D38780682057334BBBE451A3DCB39DF34761A577E76E2F4B807F3463
        583ABAE050268C9289299AB232A03D75467BD937819B501375AA7B780306C224
        2818699C9EB988E5CABD37A6699DA2BE6CF48322B281AE4B79228EE606947760
        0B3BAE5E9772B204F8DE90B6D666817B2C120A2A2A28F9CB4228EA1BC0FC526C
        7BD9C6B454142F98DBA54EE581E6E0502E5DEBDB32DC33E4490E20EDCA55D5E8
        C3C5DAA8C7BC7C8100D50D2D30D4569539405A9FBECBC5E5D025103635A164E9
        22F02BCAC9FD81177E859AC3089226BEB1DF6C3467762C8ACA568328AFE447D4
        9E3B43CC1C89BA72B4121EEA12FF732D65ECD267F8BA53565115569E4C259BDB
        B4BBD5C4E3C36B7B1C6E074E239FAF8F4AA3208A8E76D0C7D7AE6DF026E92587
        92299F59B4D9449F8939FDBB79E4B3231E71591DD34AE4083EDCCE84B5BB66B4
        34BD268173A8C32B697A9C4D7AA1F0DD3BE295187FBB1515E1A130DAB859F2C1
        045A5A2C07386F8981A1962AA63B72E146F9B67474860E3DE5BFAD27F1C084C7
        6510507F5D2B632DCA2F1E8EEB8F5EE1F49D7CACF1B123F7E88DA8AA06D14383
        F6A737CF1E0E4D55257CF74B061A797C917955955908F27524CF0FA2F27E18D6
        5AFCFA1636145C85123AF6ACCDF61F85D6E429EDD72DC545687D53069696362A
        F747C078E316A4D4F73E602C1640772B0F58524E7B514543AF1FD0DFB26B2885
        7F611CC6D5B6456BE855991D12064D6F1F28B058687EF61475D117A1686808DD
        059F4B3FA0FAFF12D257323585A28121D4473ACB2EA44F4BBEA9D459F26D4D86
        926FAC3394FC680743C90F173194FC781B43C90F583294FC882F43C90F993394
        FC35078692BF68C350F257BD184AFEB22143C95F776528F90BD70C257FE59FA1
        E4FF7482A1E400194A0E90A1E40019EABF19DA73DC6A8E44BC0000000049454E
        44AE426082}
      ShowHint = True
      Transparent = True
    end
    object Label14: TLabel
      Left = 8
      Top = 85
      Width = 117
      Height = 32
      Caption = 'Pague por este cheque a quantia de'
      WordWrap = True
    end
    object Label15: TLabel
      Left = 131
      Top = 99
      Width = 504
      Height = 16
      Caption = 
        '________________________________________________________________' +
        '________'
    end
    object Label16: TLabel
      Left = 12
      Top = 125
      Width = 623
      Height = 16
      Caption = 
        '________________________________________________________________' +
        '_________________________'
    end
    object Label17: TLabel
      Left = 12
      Top = 151
      Width = 624
      Height = 16
      Caption = 
        '  ______________________________________________________________' +
        '__________________________'
    end
    object Label18: TLabel
      Left = 12
      Top = 147
      Width = 7
      Height = 16
      Caption = 'a'
    end
    object lbEmpresa: TLabel
      Left = 25
      Top = 147
      Width = 62
      Height = 16
      Caption = 'lbEmpresa'
    end
    object Label19: TLabel
      Left = 293
      Top = 178
      Width = 343
      Height = 16
      Caption = '_________________________________________________'
    end
    object Label20: TLabel
      Left = 293
      Top = 208
      Width = 343
      Height = 16
      Caption = '_________________________________________________'
    end
    object Label21: TLabel
      Left = 252
      Top = 207
      Width = 35
      Height = 16
      Caption = 'Titular'
    end
    object Label22: TLabel
      Left = 236
      Top = 177
      Width = 51
      Height = 16
      Caption = 'Emiss'#227'o'
    end
    object Label23: TLabel
      Left = 216
      Top = 238
      Width = 71
      Height = 16
      Caption = 'CPF / CNPJ'
    end
    object lbBanco: TLabel
      Left = 12
      Top = 260
      Width = 47
      Height = 16
      Caption = 'lbBanco'
    end
    object edTitular: TEdit
      Left = 292
      Top = 199
      Width = 343
      Height = 24
      Hint = 'Titular'
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 10
    end
    object edDoc: TMaskEdit
      Left = 292
      Top = 230
      Width = 142
      Height = 24
      Hint = 'CPF/CNPJ'
      CharCase = ecUpperCase
      Color = clWhite
      EditMask = '999.999.999-99;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 11
      Text = '   .   .   -  '
      OnExit = edDocExit
    end
    object meBompara: TMaskEdit
      Left = 564
      Top = 230
      Width = 71
      Height = 24
      Hint = 'Vencimento'
      CharCase = ecUpperCase
      Color = clWhite
      EditMask = '!99/99/0000;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 12
      Text = '  /  /    '
    end
    object StaticText1: TStaticText
      Left = 490
      Top = 230
      Width = 64
      Height = 20
      Alignment = taCenter
      BorderStyle = sbsSingle
      Caption = 'Bom para:'
      Color = clYellow
      ParentColor = False
      TabOrder = 13
      Transparent = False
    end
    object pnComp: TPanel
      Left = 8
      Top = 10
      Width = 54
      Height = 53
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label3: TLabel
        Left = 8
        Top = 2
        Width = 34
        Height = 16
        Caption = 'Comp'
      end
      object Label4: TLabel
        Left = 14
        Top = 26
        Width = 21
        Height = 16
        Caption = '999'
      end
    end
    object pnValor: TPanel
      Left = 514
      Top = 10
      Width = 127
      Height = 53
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 7
      object Label5: TLabel
        Left = 8
        Top = 2
        Width = 16
        Height = 16
        Caption = 'R$'
      end
      object edValor: TEdit
        Left = 7
        Top = 21
        Width = 114
        Height = 24
        Hint = 'Valor'
        Alignment = taRightJustify
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        OnExit = edValorExit
        OnKeyPress = edValorKeyPress
      end
    end
    object pnBanco: TPanel
      Left = 64
      Top = 10
      Width = 57
      Height = 53
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Label6: TLabel
        Left = 8
        Top = 2
        Width = 37
        Height = 16
        Caption = 'Banco'
      end
      object edNBanco: TEdit
        Left = 8
        Top = 21
        Width = 37
        Height = 24
        Hint = 'N.'#186' do Banco'
        Alignment = taRightJustify
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 4
        NumbersOnly = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        OnExit = edNBancoExit
      end
    end
    object pnAgencia: TPanel
      Left = 123
      Top = 10
      Width = 70
      Height = 53
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object Label7: TLabel
        Left = 8
        Top = 2
        Width = 47
        Height = 16
        Caption = 'Ag'#234'ncia'
      end
      object edAgencia: TEdit
        Left = 8
        Top = 21
        Width = 47
        Height = 24
        Hint = 'N.'#186' da Ag'#234'ncia'
        Alignment = taRightJustify
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 4
        NumbersOnly = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
    end
    object pnC1: TPanel
      Left = 195
      Top = 10
      Width = 31
      Height = 53
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 3
      object Label9: TLabel
        Left = 11
        Top = 26
        Width = 7
        Height = 16
        Caption = '9'
      end
      object Label8: TLabel
        Left = 5
        Top = 2
        Width = 16
        Height = 16
        Caption = 'C1'
      end
    end
    object pnConta: TPanel
      Left = 228
      Top = 10
      Width = 120
      Height = 53
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 4
      object Label10: TLabel
        Left = 8
        Top = 2
        Width = 101
        Height = 16
        Caption = 'N'#250'mero da Conta'
      end
      object edConta: TEdit
        Left = 8
        Top = 21
        Width = 101
        Height = 24
        Hint = 'N.'#186' da Conta'
        Alignment = taRightJustify
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
    end
    object pnC2: TPanel
      Left = 350
      Top = 10
      Width = 31
      Height = 53
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 5
      object Label11: TLabel
        Left = 11
        Top = 26
        Width = 7
        Height = 16
        Caption = '0'
      end
      object Label12: TLabel
        Left = 5
        Top = 2
        Width = 16
        Height = 16
        Caption = 'C2'
      end
    end
    object pnNumCheq: TPanel
      Left = 383
      Top = 10
      Width = 129
      Height = 53
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 6
      object Label13: TLabel
        Left = 8
        Top = 2
        Width = 111
        Height = 16
        Caption = 'N'#250'mero do Cheque'
      end
      object edCheque: TEdit
        Left = 8
        Top = 21
        Width = 111
        Height = 24
        Hint = 'N.'#186' do Cheque'
        Alignment = taRightJustify
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
    end
    object meEmissao: TMaskEdit
      Left = 292
      Top = 169
      Width = 71
      Height = 24
      Hint = 'Emiss'#227'o do cheque'
      CharCase = ecUpperCase
      Color = clWhite
      EditMask = '!99/99/0000;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 9
      Text = '  /  /    '
      OnExit = meEmissaoExit
    end
    object rgPessoa: TRadioGroup
      Left = 123
      Top = 178
      Width = 87
      Height = 76
      Caption = 'Pessoa'
      ItemIndex = 0
      Items.Strings = (
        'F'#237'sica'
        'Jur'#237'dica')
      TabOrder = 8
      OnClick = rgPessoaClick
    end
  end
  object dsCaixa: TDataSource
    Left = 392
    Top = 296
  end
  object dsBanco: TDataSource
    Left = 440
    Top = 296
  end
  object dsCheques: TDataSource
    Left = 480
    Top = 296
  end
end
