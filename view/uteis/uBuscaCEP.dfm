inherited frmBuscaCEP: TfrmBuscaCEP
  Caption = 'Busca endere'#231'o pelo CEP (Web Service Correios)'
  ClientHeight = 291
  ClientWidth = 411
  OnActivate = FormActivate
  ExplicitWidth = 417
  ExplicitHeight = 320
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 19
    Height = 13
    Caption = 'CEP'
  end
  inherited btFechar: TBitBtn
    Left = 298
    Top = 258
    TabOrder = 3
    ExplicitLeft = 298
    ExplicitTop = 258
  end
  object meCep: TMaskEdit
    Left = 8
    Top = 27
    Width = 80
    Height = 21
    EditMask = '99999-999;1;_'
    MaxLength = 9
    TabOrder = 0
    Text = '     -   '
  end
  object btBuscar: TBitBtn
    Left = 94
    Top = 27
    Width = 105
    Height = 25
    Caption = '&Buscar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFB2B2B2949393FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFBDBEBE9495959B9B9BFF00FFFF00FF
      FF00FFFF00FFFF00FF815148876C5F8A8877948678FF00FFFF00FFFF00FFACAC
      AC999A9A9D9E9EFF00FFFF00FFFF00FFFF00FF662C166A392674493968715869
      8B717D9C8494AD9A9C95899C9999A0A0A09EA0A0FF00FFFF00FFFF00FFFF00FF
      75310B6C26006D270260421C63836D747B757F827F89908A8C908A9FA0A09593
      92FF00FFFF00FFFF00FFFF00FF8B410E8140044D611B50631A7582747B92798C
      B2898FAF8E95AD979A9F99918F90886C67FF00FFFF00FFFF00FFFF00FFA35405
      4B8223238514688C6076906C8DBB808BB57F89AE7F87A88189A98BA0A19D7864
      5FFF00FFFF00FFFF00FFA75A11B96B014699272A9D0D73816C92C57190C0768E
      BA778DB97C89B37F89AE8490A58B8A7B78603229FF00FFFF00FFB46C13CC8A0F
      60B2413BB11E7A8C6F97CE7095CE8093CA808FBE7B86C48A89B07A84A3778D87
      82452A13FF00FFFF00FFBE7E1FDBA62CD7B8486CD1707B8B77A0DD95BED894AF
      D493A9C6868CC1818BAE7387AA8381887B2C461BFF00FFFF00FFC4882EE8BC4F
      F0D075CCE19D87A2919CC68E9CDF999BDFA68FCE9692C2818FBD7894A18A4465
      3F2A3E15FF00FFFF00FFFF00FFEECA6AF7DF9AF4EEBFC8E6C389908B96C9959C
      D4818FD19182C9878BAF8B7E8D7A0E570EFF00FFFF00FFFF00FFFF00FF89B23F
      FAE3A9FEF1CAD9EDCBB5D7B087A2908F9C8895A48B8F9E8E6E936C2A73242460
      23FF00FFFF00FFFF00FFFF00FFFF00FF6EC44DCFE498C1DD89D4E0A148DA8B4B
      CE8558BC7346AE6C308E392C7B3AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF1AAB101DC221A1C759B4C9718DC0655FC47854BA82649670FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF58914748913A5B
      8733588F53FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    TabOrder = 1
    OnClick = btBuscarClick
  end
  object Panel1: TPanel
    Left = 8
    Top = 58
    Width = 395
    Height = 194
    BevelInner = bvLowered
    TabOrder = 4
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 55
      Height = 13
      Caption = 'Logradouro'
    end
    object Label3: TLabel
      Left = 8
      Top = 54
      Width = 28
      Height = 13
      Caption = 'Bairro'
    end
    object Label4: TLabel
      Left = 8
      Top = 100
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label5: TLabel
      Left = 319
      Top = 100
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label6: TLabel
      Left = 8
      Top = 146
      Width = 11
      Height = 13
      Caption = 'Uf'
    end
    object Label7: TLabel
      Left = 47
      Top = 146
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object edLogradouro: TEdit
      Left = 8
      Top = 27
      Width = 380
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
      Text = 'edLogradouro'
    end
    object edBairro: TEdit
      Left = 8
      Top = 73
      Width = 380
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
      Text = 'edBairro'
    end
    object edCidade: TEdit
      Left = 8
      Top = 119
      Width = 305
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
      Text = 'edCidade'
    end
    object edCodCidade: TEdit
      Left = 319
      Top = 119
      Width = 69
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
      Text = 'edCodCidade'
    end
    object edUf: TEdit
      Left = 8
      Top = 165
      Width = 33
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
      Text = 'edUf'
    end
    object edCodUf: TEdit
      Left = 47
      Top = 165
      Width = 33
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
      Text = 'edCodUf'
    end
  end
  object btConfirmar: TBitBtn
    Left = 197
    Top = 258
    Width = 95
    Height = 25
    Hint = 'Clique para selecionar o registro'
    Anchors = [akRight, akBottom]
    Caption = 'Selecionar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FF331400451B00572200572200471C00361600FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF491C00491C00803200A54100AA
      4200AA4200A74100843400511F00511F00FF00FFFF00FFFF00FFFF00FFFF00FF
      5923006E2B00AF4400B14500AA4200A54100AA4200AA4200AF4400B14500702C
      00361600FF00FFFF00FFFF00FF5923007B3000C54D00B84800AA4200A54100CA
      884FE6C6A7AF500BA74100AA4200B14500702C00511F00FF00FFFF00FF592300
      D45300CC5000BB4900AA4200C27738FAF4EEFFFFFFDEB48CA94200A74100AA42
      00B14500511F00FF00FF5F2500A03F00EB5C00CC5000B14500C67A3AFCF7F3FF
      FFFFFFFFFFFFFFFFD9A679A94200A74100AF4400843400451B005F2500D75400
      EB5C00D45300CC8242FCF8F4FEFEFCFCFAF6FEFEFCFEFBF8FFFFFFD5A070A944
      01AC43009E3E00451B00772E00F66000F86200F86200FEF2E7FFFFFFF2AD6FF7
      CFAAFFFFFFD19866F4E7DAFFFFFFD9A77AAA4200AA42004F1F00893500FF7813
      FF6A04FB6300FFEAD4FFBB7EFF6400FFD1A6FFFFFFBF6A25C07230FBF7F2E1BA
      95AC4300AA4200572200893500FF8829FF801EF05E00FB7410FB6703FB6300FC
      D3ABFFFFFFD77D31C54D00CA6011C65405B84800A541004B1D00893500FF801E
      FFAD67FF6400EE5D00FB6300FB6300FED3ABFFFFFFE18031CF5100CF5100C54D
      00BB4900953A004B1D00FF00FFE65A00FFC693FF9842E15800EB5C00FB6300FE
      D4ACFFFFFFE78332CF5100CA4F00C04B00C74E00752D00FF00FFFF00FFE65A00
      FF892BFFDAB7FF9741F86200E95B00FED5AFFFFFFFEB8431D95500D45300D754
      00B44600752D00FF00FFFF00FFFF00FFC54D00FF9842FFE2C6FFBB7FFF8728FF
      750FFF6B05FF6E08FF6E08FF6701CA4F00702C00FF00FFFF00FFFF00FFFF00FF
      FF00FFFF801EFF801EFFBA7DFFD5ADFFC591FFB574FFA558FF8323D75400D754
      00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE15800FF700AFF
      7D19FF7813FB6300B64700FF00FFFF00FFFF00FFFF00FFFF00FF}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btConfirmarClick
  end
end