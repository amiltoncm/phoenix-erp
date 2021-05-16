inherited frmImpXMLPag: TfrmImpXMLPag
  Caption = 'Importar XML de Fornecedor (Contas '#224' pagar)'
  ClientHeight = 422
  ClientWidth = 994
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  ExplicitWidth = 1000
  ExplicitHeight = 451
  PixelsPerInch = 96
  TextHeight = 13
  inherited btFechar: TBitBtn
    Left = 881
    Top = 389
    TabOrder = 1
    ExplicitLeft = 881
    ExplicitTop = 389
  end
  object panelTopo: TPanel
    Left = 0
    Top = 0
    Width = 994
    Height = 57
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 91
      Height = 13
      Caption = 'Localiza'#231#227'o do XML'
    end
    object sbOpenXML: TSpeedButton
      Left = 689
      Top = 27
      Width = 23
      Height = 22
      Hint = 'Abrir XML'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF29ABD735B3DC23A9D7FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF29ABD7
        AFF6FC86EFFA49C2E449C2E449C2E434B4DD24AAD7FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF29ABD7A6E9F59EFFFF97FCFF99FBFF95F7FF8D
        F2FE83EAFA49C2E449C2E43AB8DFFF00FFFF00FFFF00FFFF00FFFF00FF29ABD7
        8BD7ECABFEFF90F8FF91F6FF90F5FF8FF5FF8FF4FF90F4FF95F6FF75DDF52DAF
        DBFF00FFFF00FFFF00FFFF00FF29ABD729ABD7AAF0FA91FAFF91F6FF90F5FF8E
        F4FF8DF2FE8BF1FE8CF1FF77DFF656CAEAFF00FFFF00FFFF00FFFF00FF29ABD7
        7BE5F429ABD79EFEFF8DF7FF8EF6FF8CF4FF8DF2FE8BF1FE8CF1FF72DDF579E1
        F62CB0DAFF00FFFF00FFFF00FF29ABD793F9FD29ABD7A8E9F5A8F0FAA4F1FBA1
        F7FF8CF3FF8AF1FE8CF1FF70DAF305740B58CDEAFF00FFFF00FFFF00FF29ABD7
        9DFEFF86F2FB29ABD729ABD729ABD729ABD7AFF2FB90F4FF88F2FF05740B5BE7
        8C05740B1FA8D6FF00FFFF00FF29ABD79AFCFF96FBFF95FBFF95FAFF90F7FF6C
        DEF329ABD79FE3F405740B50D77A45D26C31C14F05740BFF00FFFF00FF29ABD7
        9BFDFF94FAFF92F8FF91F6FF92F7FF93F9FF84EFFD29ABD729ABD7168C2330C1
        4C16982434AFDAFF00FFFF00FF29ABD7A4FFFF94FCFF92F9FF93F8FF8FEDFA90
        ECFA95EEFC96F1FD9AF4FF0C81161AAF2C088310FF00FFFF00FFFF00FF25A8D6
        29ABD79EF5FB9FF7FD86EAF82BAED925A8D628ABD72AACD832B0DA0C90170EA0
        1AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF29ABD730AED92CADD8FF00FFFF
        00FFFF00FFFF00FF0A89120EA11A08810FFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF05710A09790F0B89160A8C13067A0DFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = sbOpenXMLClick
    end
    object edXML: TEdit
      Left = 8
      Top = 27
      Width = 675
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
      Text = 'edXML'
    end
  end
  object panFornecedor: TPanel
    Left = 0
    Top = 57
    Width = 994
    Height = 146
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 3
    object Label2: TLabel
      Left = 8
      Top = 6
      Width = 59
      Height = 13
      Caption = 'Raz'#227'o social'
    end
    object Label3: TLabel
      Left = 8
      Top = 52
      Width = 25
      Height = 13
      Caption = 'CNPJ'
    end
    object Label4: TLabel
      Left = 505
      Top = 6
      Width = 69
      Height = 13
      Caption = 'Nome fantasia'
    end
    object Label5: TLabel
      Left = 127
      Top = 52
      Width = 68
      Height = 13
      Caption = 'Insc. Estadual'
    end
    object Label6: TLabel
      Left = 231
      Top = 52
      Width = 55
      Height = 13
      Caption = 'Logradouro'
    end
    object Label7: TLabel
      Left = 655
      Top = 52
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object Label8: TLabel
      Left = 718
      Top = 52
      Width = 28
      Height = 13
      Caption = 'Bairro'
    end
    object Label9: TLabel
      Left = 8
      Top = 98
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label10: TLabel
      Left = 407
      Top = 98
      Width = 59
      Height = 13
      Caption = 'C'#243'd. Cidade'
    end
    object Label11: TLabel
      Left = 472
      Top = 98
      Width = 13
      Height = 13
      Caption = 'UF'
    end
    object Label12: TLabel
      Left = 505
      Top = 98
      Width = 19
      Height = 13
      Caption = 'CEP'
    end
    object Label13: TLabel
      Left = 580
      Top = 98
      Width = 24
      Height = 13
      Caption = 'Fone'
    end
    object dbRazaoSocial: TDBEdit
      Left = 8
      Top = 25
      Width = 491
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'xNome'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 0
    end
    object dbFantasia: TDBEdit
      Left = 505
      Top = 25
      Width = 481
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'xFant'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 1
    end
    object dbCnpj: TDBEdit
      Left = 8
      Top = 71
      Width = 113
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'CNPJ'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 2
    end
    object dbIe: TDBEdit
      Left = 127
      Top = 71
      Width = 98
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'IE'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 3
    end
    object dbLogradouro: TDBEdit
      Left = 231
      Top = 71
      Width = 418
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'xLgr'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 4
    end
    object dbNumero: TDBEdit
      Left = 655
      Top = 71
      Width = 57
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'nro'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 5
    end
    object dbBairro: TDBEdit
      Left = 718
      Top = 71
      Width = 268
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'xBairro'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 6
    end
    object dbCidade: TDBEdit
      Left = 8
      Top = 117
      Width = 393
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'xMun'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 7
    end
    object dbCodCidade: TDBEdit
      Left = 407
      Top = 117
      Width = 59
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'cMun'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 8
    end
    object dbUf: TDBEdit
      Left = 472
      Top = 117
      Width = 27
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'UF'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 9
    end
    object dbCep: TDBEdit
      Left = 505
      Top = 117
      Width = 69
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'CEP'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 10
    end
    object dbFone: TDBEdit
      Left = 580
      Top = 117
      Width = 121
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'fone'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 11
    end
  end
  object panNF: TPanel
    Left = 0
    Top = 201
    Width = 994
    Height = 182
    BevelInner = bvLowered
    TabOrder = 4
    object Label14: TLabel
      Left = 8
      Top = 6
      Width = 39
      Height = 13
      Caption = 'C'#243'd. NF'
    end
    object Label15: TLabel
      Left = 105
      Top = 6
      Width = 53
      Height = 13
      Caption = 'N'#250'mero NF'
    end
    object Label16: TLabel
      Left = 202
      Top = 6
      Width = 34
      Height = 13
      Caption = 'Modelo'
    end
    object Label17: TLabel
      Left = 242
      Top = 6
      Width = 24
      Height = 13
      Caption = 'S'#233'rie'
    end
    object Label18: TLabel
      Left = 282
      Top = 6
      Width = 38
      Height = 13
      Caption = 'Emiss'#227'o'
    end
    object Label19: TLabel
      Left = 409
      Top = 6
      Width = 42
      Height = 13
      Caption = 'Nat. Op.'
    end
    object Label20: TLabel
      Left = 708
      Top = 6
      Width = 31
      Height = 13
      Caption = 'Chave'
    end
    object Label21: TLabel
      Left = 8
      Top = 52
      Width = 32
      Height = 13
      Caption = 'Fatura'
    end
    object Label22: TLabel
      Left = 105
      Top = 52
      Width = 43
      Height = 13
      Caption = 'Vlr. Total'
    end
    object Label23: TLabel
      Left = 202
      Top = 52
      Width = 64
      Height = 13
      Caption = 'Vlr. Desconto'
    end
    object Label24: TLabel
      Left = 299
      Top = 52
      Width = 52
      Height = 13
      Caption = 'Vlr. L'#237'quido'
    end
    object dbCodNf: TDBEdit
      Left = 8
      Top = 25
      Width = 91
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'cNF'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 0
    end
    object dbNumNF: TDBEdit
      Left = 105
      Top = 25
      Width = 91
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'nNF'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 1
    end
    object dbMod: TDBEdit
      Left = 202
      Top = 25
      Width = 34
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'mod'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 2
    end
    object dbSerie: TDBEdit
      Left = 242
      Top = 25
      Width = 34
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'serie'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 3
    end
    object dbEmissao: TDBEdit
      Left = 282
      Top = 25
      Width = 121
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'dhEmi'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 4
    end
    object dbNatOp: TDBEdit
      Left = 409
      Top = 25
      Width = 293
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'natOp'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 5
    end
    object dbChave: TDBEdit
      Left = 708
      Top = 25
      Width = 278
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'chNFe'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 6
    end
    object dbFatura: TDBEdit
      Left = 8
      Top = 71
      Width = 91
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'nFat'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 7
    end
    object dbVlrTotal: TDBEdit
      Left = 105
      Top = 71
      Width = 91
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'vOrig'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 8
    end
    object dbVlrDesc: TDBEdit
      Left = 202
      Top = 71
      Width = 91
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'vDesc'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 9
    end
    object dbVlrLiq: TDBEdit
      Left = 299
      Top = 71
      Width = 91
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'vLiq'
      DataSource = dsFornecedor
      ReadOnly = True
      TabOrder = 10
    end
    object DBGrid1: TDBGrid
      Left = 409
      Top = 52
      Width = 281
      Height = 120
      TabStop = False
      DataSource = dsDuplicatas
      ReadOnly = True
      TabOrder = 11
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'nDup'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dVenc'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vDup'
          Visible = True
        end>
    end
  end
  object btLancar: TBitBtn
    Left = 770
    Top = 389
    Width = 105
    Height = 25
    Hint = 'Lan'#231'a duplicata pelo XML'
    Caption = '&Lancar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB98385B98385B98385B983
      85B98385B98385B98385FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFB98385F6DDB7F4D7ACF3D3A1F1CF98F0CA8FB98385FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBA8E85F8E5C98A94D91E47
      F6888ECDF2D19CB98385FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFCB9A82FAEDD91E49F90033FF1E48F6F4D8ABB98385FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDCA887FCF5E98D9DED1E49
      FA8B97E0F6E0BDB98385FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFE3B18EFEFBF6FCF7EDFBF2E4FAEDDAF8E8CEB98385FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEDBD92FFFFFFFEFCFAFDF9
      F2B98384B98384BE8675B78183B78183B78183B78183B78183B78183B78183B7
      8183FF00FFEDBD92FFFFFFFFFFFFFEFDFCB98384D39769FF00FFB78183EED1B1
      E1B894E1B68CDFB180DCAB75EFC686B78183FF00FFEDBD92DCA887DCA887428A
      3EB98384FF00FFFF00FFB78183CA8F6B952B009A3401993401993300E4B57CB7
      8183FF00FFFF00FFFF00FF03750F44D27330AB4AFF00FFFF00FFBA8E85F8EEE5
      A14213972E00942900BD7649FDE5B3B78183FF00FFFF00FF01780949CC725CE7
      8E38C658138E21FF00FFCB9A82FFFFFFD5A992922600A04112ECCCAEFFEFC5B7
      8183FF00FF45812C1097262EA8483ECA6026AF3D199F290A7D12DCA887FFFFFF
      FCF7F5AE5B33CD9574FBF1DEDECBB4B78183FF00FFFF00FFFF00FF03700827B8
      400D8A18FF00FFFF00FFE3B18EFFFFFFFFFFFFEDDBD1F9F2EAB78183B78183B7
      8475FF00FFFF00FFFF00FF097B1114AB25098611FF00FFFF00FFEDBD92FFFFFF
      FFFFFFFFFFFFFDFFFFB78183DC9D64FF00FFFF00FFFF00FF0A88120C91160EA3
      1B077B0DFF00FFFF00FFEDBD92DCA887DCA887DCA887DCA887B78183FF00FFFF
      00FF07800F07800F0490120D9C1907800FFF00FFFF00FFFF00FF}
    TabOrder = 0
    OnClick = btLancarClick
  end
  object btItens: TBitBtn
    Left = 8
    Top = 389
    Width = 105
    Height = 25
    Hint = 'Entrada de itens no estoque'
    Caption = '&Itens'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF93460F93460F93460F93460FFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93460FEEBF82
      E98E3593460FFF00FF0000000000000000000000000000000000000000000000
      00000000000000FF00FF93460F5DD270F7DAB793460FFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93460F93460F
      93460F93460FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93460F93460F
      93460F93460FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF93460FEEBF82E98E3593460FFF00FF00000000000000
      0000000000000000000000000000000000000000000000FF00FF93460F5DD270
      F7DAB793460FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF93460F93460F93460F93460FFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF93460F93460F93460F93460FFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93460FEEBF82
      E98E3593460FFF00FF0000000000000000000000000000000000000000000000
      00000000000000FF00FF93460F5DD270F7DAB793460FFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93460F93460F
      93460F93460FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    TabOrder = 5
    OnClick = btItensClick
  end
  object odXML: TOpenDialog
    Filter = 'Arquivos XML|*.XML'
    Title = 'Carregar XML'
    Left = 16
    Top = 24
  end
  object xmlTPFornecedor: TXMLTransformProvider
    TransformRead.TransformationFile = 'C:\Comercial\lib\xml\ToDpFornecedor.xtr'
    CacheData = True
    Left = 208
    Top = 8
  end
  object xmlTPDuplicatas: TXMLTransformProvider
    TransformRead.TransformationFile = 'C:\Comercial\lib\xml\ToDpDuplicatas.xtr'
    CacheData = True
    Left = 208
    Top = 64
  end
  object XMLDocFornecedor: TXMLDocument
    Left = 320
    Top = 8
    DOMVendorDesc = 'MSXML'
  end
  object XMLDocDuplicatas: TXMLDocument
    Left = 320
    Top = 64
    DOMVendorDesc = 'MSXML'
  end
  object cdsFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'xmlTPFornecedor'
    Left = 432
    Top = 8
    object cdsFornecedorcNF: TStringField
      FieldName = 'cNF'
      ReadOnly = True
      Size = 8
    end
    object cdsFornecedornNF: TStringField
      FieldName = 'nNF'
      Size = 6
    end
    object cdsFornecedormod: TStringField
      FieldName = 'mod'
      Size = 2
    end
    object cdsFornecedorserie: TStringField
      FieldName = 'serie'
      Size = 2
    end
    object cdsFornecedordhEmi: TStringField
      FieldName = 'dhEmi'
      Size = 10
    end
    object cdsFornecedornatOp: TStringField
      FieldName = 'natOp'
      Size = 19
    end
    object cdsFornecedorchNFe: TStringField
      FieldName = 'chNFe'
      Size = 44
    end
    object cdsFornecedornFat: TStringField
      FieldName = 'nFat'
      Size = 12
    end
    object cdsFornecedorvOrig: TStringField
      FieldName = 'vOrig'
      Size = 12
    end
    object cdsFornecedorvDesc: TStringField
      FieldName = 'vDesc'
      Size = 12
    end
    object cdsFornecedorvLiq: TStringField
      FieldName = 'vLiq'
      Size = 12
    end
    object cdsFornecedorxNome: TStringField
      FieldName = 'xNome'
      Size = 50
    end
    object cdsFornecedorxFant: TStringField
      FieldName = 'xFant'
      Size = 50
    end
    object cdsFornecedorCNPJ: TStringField
      DisplayWidth = 14
      FieldName = 'CNPJ'
      Size = 14
    end
    object cdsFornecedorIE: TStringField
      FieldName = 'IE'
      Size = 12
      Transliterate = False
    end
    object cdsFornecedorxLgr: TStringField
      FieldName = 'xLgr'
      Size = 50
    end
    object cdsFornecedornro: TStringField
      FieldName = 'nro'
      Size = 7
    end
    object cdsFornecedorxBairro: TStringField
      FieldName = 'xBairro'
      Size = 35
    end
    object cdsFornecedorcMun: TStringField
      FieldName = 'cMun'
      Size = 7
    end
    object cdsFornecedorxMun: TStringField
      FieldName = 'xMun'
      Size = 50
    end
    object cdsFornecedorUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsFornecedorCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object cdsFornecedorfone: TStringField
      FieldName = 'fone'
      Size = 10
    end
  end
  object cdsDuplicatas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'xmlTPDuplicatas'
    Left = 432
    Top = 64
    object cdsDuplicatasnDup: TStringField
      DisplayLabel = 'Duplicata'
      DisplayWidth = 15
      FieldName = 'nDup'
      Size = 3
    end
    object cdsDuplicatasdVenc: TStringField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 12
      FieldName = 'dVenc'
      Size = 10
    end
    object cdsDuplicatasvDup: TStringField
      DisplayLabel = 'Valor'
      DisplayWidth = 12
      FieldName = 'vDup'
      Size = 4
    end
  end
  object dsFornecedor: TDataSource
    DataSet = cdsFornecedor
    Left = 520
    Top = 8
  end
  object dsDuplicatas: TDataSource
    DataSet = cdsDuplicatas
    Left = 528
    Top = 64
  end
  object xmlTPDestinatario: TXMLTransformProvider
    TransformRead.TransformationFile = 'C:\Comercial\lib\xml\ToDpDestinatario.xtr'
    CacheData = True
    Left = 208
    Top = 128
  end
  object XMLDocDestinatario: TXMLDocument
    Left = 320
    Top = 128
    DOMVendorDesc = 'MSXML'
  end
  object cdsDestinatario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'xmlTPDestinatario'
    Left = 432
    Top = 120
    object cdsDestinatarioCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
  end
  object dsDestinatario: TDataSource
    DataSet = cdsDestinatario
    Left = 528
    Top = 120
  end
  object xmlTPItens: TXMLTransformProvider
    TransformRead.TransformationFile = 'C:\Comercial\lib\xml\xtr\TodpItens.xtr'
    CacheData = True
    Left = 208
    Top = 184
  end
  object XMLDocItens: TXMLDocument
    Left = 320
    Top = 184
    DOMVendorDesc = 'MSXML'
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'xmlTPItens'
    Left = 440
    Top = 192
    object cdsItensnItem: TStringField
      FieldName = 'nItem'
      Size = 2
    end
    object cdsItenscProd: TStringField
      FieldName = 'cProd'
      Size = 11
    end
    object cdsItenscEAN: TStringField
      FieldName = 'cEAN'
      Size = 13
    end
    object cdsItensxProd: TStringField
      FieldName = 'xProd'
      Size = 69
    end
    object cdsItensNCM: TStringField
      FieldName = 'NCM'
      Size = 8
    end
    object cdsItensCEST: TStringField
      FieldName = 'CEST'
      Size = 7
    end
    object cdsItensEXTIPI: TStringField
      FieldName = 'EXTIPI'
      Size = 3
    end
    object cdsItensCFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object cdsItensuCom: TStringField
      FieldName = 'uCom'
      Size = 2
    end
    object cdsItensqCom: TStringField
      FieldName = 'qCom'
      Size = 8
    end
    object cdsItensvUnCom: TStringField
      FieldName = 'vUnCom'
      Size = 14
    end
    object cdsItensvProd: TStringField
      FieldName = 'vProd'
      Size = 7
    end
    object cdsItenscEANTrib: TStringField
      FieldName = 'cEANTrib'
      Size = 13
    end
    object cdsItensuTrib: TStringField
      FieldName = 'uTrib'
      Size = 2
    end
    object cdsItensqTrib: TStringField
      FieldName = 'qTrib'
      Size = 8
    end
    object cdsItensvUnTrib: TStringField
      FieldName = 'vUnTrib'
      Size = 14
    end
    object cdsItensindTot: TStringField
      FieldName = 'indTot'
      Size = 1
    end
    object cdsItensxPed: TStringField
      FieldName = 'xPed'
      Size = 5
    end
    object cdsItensnFCI: TStringField
      FieldName = 'nFCI'
      Size = 36
    end
    object cdsItensorig: TStringField
      FieldName = 'orig'
      Size = 1
    end
    object cdsItensICMS10_CST: TStringField
      FieldName = 'ICMS10_CST'
      Size = 2
    end
    object cdsItensmodBC: TStringField
      FieldName = 'modBC'
      Size = 1
    end
    object cdsItensICMS10_vBC: TStringField
      FieldName = 'ICMS10_vBC'
      Size = 7
    end
    object cdsItenspICMS: TStringField
      FieldName = 'pICMS'
      Size = 5
    end
    object cdsItensvICMS: TStringField
      FieldName = 'vICMS'
      Size = 6
    end
    object cdsItensmodBCST: TStringField
      FieldName = 'modBCST'
      Size = 1
    end
    object cdsItenspMVAST: TStringField
      FieldName = 'pMVAST'
      Size = 5
    end
    object cdsItensvBCST: TStringField
      FieldName = 'vBCST'
      Size = 7
    end
    object cdsItenspICMSST: TStringField
      FieldName = 'pICMSST'
      Size = 5
    end
    object cdsItensvICMSST: TStringField
      FieldName = 'vICMSST'
      Size = 6
    end
    object cdsItensIPITrib_CST: TStringField
      FieldName = 'IPITrib_CST'
      Size = 2
    end
    object cdsItensIPITrib_vBC: TStringField
      FieldName = 'IPITrib_vBC'
      Size = 7
    end
    object cdsItenspIPI: TStringField
      FieldName = 'pIPI'
      Size = 5
    end
    object cdsItensvIPI: TStringField
      FieldName = 'vIPI'
      Size = 6
    end
    object cdsItensPISAliq_CST: TStringField
      FieldName = 'PISAliq_CST'
      Size = 2
    end
    object cdsItensPISAliq_vBC: TStringField
      FieldName = 'PISAliq_vBC'
      Size = 7
    end
    object cdsItenspPIS: TStringField
      FieldName = 'pPIS'
      Size = 4
    end
    object cdsItensvPIS: TStringField
      FieldName = 'vPIS'
      Size = 5
    end
    object cdsItensCOFINSAliq_CST: TStringField
      FieldName = 'COFINSAliq_CST'
      Size = 2
    end
    object cdsItensCOFINSAliq_vBC: TStringField
      FieldName = 'COFINSAliq_vBC'
      Size = 7
    end
    object cdsItenspCOFINS: TStringField
      FieldName = 'pCOFINS'
      Size = 4
    end
    object cdsItensvCOFINS: TStringField
      FieldName = 'vCOFINS'
      Size = 6
    end
  end
  object dsItens: TDataSource
    DataSet = cdsItens
    Left = 536
    Top = 192
  end
end
