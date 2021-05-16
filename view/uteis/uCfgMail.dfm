inherited frmCfgMail: TfrmCfgMail
  Caption = 'Configura'#231#227'o de e-mail  (Envio autom'#225'tico)'
  ClientHeight = 272
  ClientWidth = 634
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  ExplicitWidth = 640
  ExplicitHeight = 301
  PixelsPerInch = 96
  TextHeight = 13
  object sbDefault: TSpeedButton [0]
    Left = 17
    Top = 242
    Width = 23
    Height = 22
    Hint = 'Buscar configura'#231#245'es do e-mail principal'
    Flat = True
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFB88989B88989B88989B88989B88989B88989B88989B889
      89B88989B88989FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB88989FEFEFDFE
      FEFEFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDB88989FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFB88989FEFBF8B27E73B27E73B27E73B27E73B27E73B27E
      73FEFBF8B88989FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB88989FEF8F3FE
      FAF6FEF8F3FEF8F3FEF8F3FEF8F3FEF8F3FEF8F3B88989FF00FFB88989B88989
      B88989B88989B88989B88989FEF6EDB27E73B27E73B27E73B27E73B27E73B27E
      73FEF6EDB88989FF00FFB88989FEFEFDFEFEFEFEFEFDFEFEFDB88989FEF3E8FF
      F4EAFEF3E8FEF3E8FEF3E8FEF3E8FEF3E8FEF3E8B88989FF00FFB88989FEFBF8
      B27E73B27E73B27E73B88989FFF0E3B27E73B27E73B27E73B27E73B27E73B27E
      73FFF0E3B88989FF00FFB88989FEF8F3FEFAF6FEF8F3FEF8F3B88989FFEDDDFF
      EDDDFFEDDDFFEDDDFFEDDDE9D5C9E7D6C9D7C5BAB88989FF00FFB88989FEF6ED
      B27E73B27E73B27E73B88989FFEBD8FFEAD7FFEBD8FFEBD8FFEBD8C4AAA7C5AB
      A8CDB5B0CD9999FF00FFB88989FEF3E8FFF4EAFEF3E8FEF3E8B88989FFE8D2FF
      E8D2FFE8D2FFE8D2FBE4CFC6ACA9FEFEFECD9999FF00FFFF00FFB88989FFF0E3
      B27E73B27E73B27E73B88989FFE6CFFFE6CFFFE6CFFFE6CFE9CFBFD2BAB4CD99
      99FF00FFFF00FFFF00FFB88989FFEDDDFFEDDDFFEDDDFFEDDDB88989B88989B8
      8989B88989B88989B88989CD9999FF00FFFF00FFFF00FFFF00FFB88989FFEBD8
      FFEAD7FFEBD8FFEBD8FFEBD8C4AAA7C5ABA8CDB5B0CD9999FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFB88989FFE8D2FFE8D2FFE8D2FFE8D2FBE4CFC6ACA9FE
      FEFECD9999FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB88989FFE6CF
      FFE6CFFFE6CFFFE6CFE9CFBFD2BAB4CD9999FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFB88989B88989B88989B88989B88989B88989CD9999FF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    OnClick = sbDefaultClick
  end
  inherited btFechar: TBitBtn
    Left = 521
    Top = 239
    TabOrder = 3
    ExplicitLeft = 521
    ExplicitTop = 239
  end
  object GroupBox1: TGroupBox
    Left = 9
    Top = 8
    Width = 617
    Height = 145
    Caption = ' Dados da conta (smtp) '
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 22
      Height = 13
      Caption = 'Host'
    end
    object Label2: TLabel
      Left = 312
      Top = 15
      Width = 209
      Height = 13
      Caption = 'Nome da conta (usu'#225'rio da conta de e-mail)'
    end
    object Label3: TLabel
      Left = 8
      Top = 59
      Width = 30
      Height = 13
      Caption = 'Senha'
    end
    object Label4: TLabel
      Left = 312
      Top = 57
      Width = 226
      Height = 13
      Caption = 'Nome do usu'#225'rio (nome que aparece no e-mail)'
    end
    object Label5: TLabel
      Left = 8
      Top = 99
      Width = 75
      Height = 13
      Caption = 'Conta de e-mail'
    end
    object Label6: TLabel
      Left = 312
      Top = 99
      Width = 60
      Height = 13
      Caption = 'Porta (smtp)'
    end
    object dbHost: TDBEdit
      Left = 8
      Top = 32
      Width = 298
      Height = 21
      DataField = 'MAI_HOST'
      DataSource = dsUsuMails
      TabOrder = 0
    end
    object dbUserName: TDBEdit
      Left = 312
      Top = 30
      Width = 299
      Height = 21
      DataField = 'MAI_USERNAME'
      DataSource = dsUsuMails
      TabOrder = 1
    end
    object dbSenha: TDBEdit
      Left = 8
      Top = 72
      Width = 298
      Height = 21
      DataField = 'MAI_PASSWORD'
      DataSource = dsUsuMails
      PasswordChar = '*'
      TabOrder = 2
    end
    object dbName: TDBEdit
      Left = 312
      Top = 72
      Width = 299
      Height = 21
      DataField = 'MAI_NAMEFROM'
      DataSource = dsUsuMails
      TabOrder = 3
    end
    object dbAdress: TDBEdit
      Left = 8
      Top = 118
      Width = 298
      Height = 21
      DataField = 'MAI_ADRESSFROM'
      DataSource = dsUsuMails
      TabOrder = 4
    end
    object cbDoor: TwwDBComboBox
      Left = 312
      Top = 118
      Width = 121
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      ShowMatchText = True
      DataField = 'MAI_PORTA'
      DataSource = dsUsuMails
      DropDownCount = 8
      ItemHeight = 0
      Items.Strings = (
        '25'#9'25'
        '465'#9'465'
        '587'#9'587')
      Sorted = False
      TabOrder = 5
      UnboundDataType = wwDefault
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 159
    Width = 617
    Height = 66
    Caption = ' Dados do provedor '
    TabOrder = 1
    object Label7: TLabel
      Left = 9
      Top = 16
      Width = 100
      Height = 13
      Caption = 'Tipo de autentica'#231#227'o'
    end
    object Label8: TLabel
      Left = 131
      Top = 16
      Width = 56
      Height = 13
      Caption = 'M'#233'todo SSL'
    end
    object Label9: TLabel
      Left = 253
      Top = 16
      Width = 46
      Height = 13
      Caption = 'Modo SSL'
    end
    object Label10: TLabel
      Left = 375
      Top = 16
      Width = 38
      Height = 13
      Caption = 'Use TLS'
    end
    object cbAuthType: TwwDBComboBox
      Left = 9
      Top = 35
      Width = 116
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      AutoDropDown = True
      ShowMatchText = True
      DataField = 'MAI_AUTHTYPE'
      DataSource = dsUsuMails
      DropDownCount = 8
      ItemHeight = 0
      Items.Strings = (
        'None'#9'0'
        'Default'#9'1'
        'SASL'#9'2')
      Sorted = False
      TabOrder = 0
      UnboundDataType = wwDefault
    end
    object cbSSLMethod: TwwDBComboBox
      Left = 131
      Top = 35
      Width = 116
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      AutoDropDown = True
      ShowMatchText = True
      DataField = 'MAI_SSLMETHOD'
      DataSource = dsUsuMails
      DropDownCount = 8
      ItemHeight = 0
      Items.Strings = (
        'SSLv2'#9'0'
        'SSLv23'#9'1'
        'SSLv3'#9'2'
        'TLSv1'#9'3')
      Sorted = False
      TabOrder = 1
      UnboundDataType = wwDefault
    end
    object cbSSLMode: TwwDBComboBox
      Left = 253
      Top = 35
      Width = 116
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      AutoDropDown = True
      ShowMatchText = True
      DataField = 'MAI_SSLMODE'
      DataSource = dsUsuMails
      DropDownCount = 8
      ItemHeight = 0
      Items.Strings = (
        'Unassigned'#9'0'
        'Client'#9'1'
        'Server'#9'2'
        'Both'#9'3')
      Sorted = False
      TabOrder = 2
      UnboundDataType = wwDefault
    end
    object cbUseTLS: TwwDBComboBox
      Left = 375
      Top = 35
      Width = 116
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      AutoDropDown = True
      ShowMatchText = True
      DataField = 'MAI_USETLS'
      DataSource = dsUsuMails
      DropDownCount = 8
      ItemHeight = 0
      Items.Strings = (
        'No TLS Suport'#9'0'
        'Use Implicit TLS'#9'1'
        'Use Require TLS'#9'2'
        'Use Explicit TLS'#9'3')
      Sorted = False
      TabOrder = 3
      UnboundDataType = wwDefault
    end
  end
  object btAlterar: TBitBtn
    Left = 410
    Top = 239
    Width = 105
    Height = 25
    Hint = 'Grava as altera'#231#245'es executa o testa'
    Anchors = [akRight, akBottom]
    Caption = '&Confirmar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF902B03B14301952E02FF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF8A2703B64701B849008F2A02FF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF8A2702AF4101B849008F2A02FF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8A2702
      AB4103C45101912C02FF00FFFF00FF8E2903973002973002973002973002972F
      02972F029730028C2802FF00FF983305D7690E9F3703FF00FFFF00FFFF00FFA4
      3901C14F00BF4C00BF4D00BD4C00BD4C00BF4D00B646008C2802872301C76016
      CA6213872302FF00FFFF00FFFF00FF902B02993102983102962F029F3502C04E
      00C14F00B546008C28028F2A03ED8E2CAB470DFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF882603B44401BA4900AB3E01B747008B2802932E05F09530
      A13E0BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8A2703AF4101C25000962E
      02A03601BA49008B2802902C04F09630B75213801E00FF00FFFF00FFFF00FFFF
      00FF8A2702B14201C551009E3502842303A33801BA49008B2802862201D47320
      F2952F953005832001832001832001963004C05407C45301A03501FF00FFFF00
      FFA33801BA49008B2802FF00FF952F05EE912DF79C33BB5514B04B10CA671AEF
      8A23D06711953003FF00FFFF00FFFF00FFA43801BA49008B2802FF00FFFF00FF
      932E04C15F18ED8C2CF69631E98A2BB852128E2903FF00FFFF00FFFF00FFFF00
      FFA13701B848008B2802FF00FFFF00FFFF00FF882502922D049A3607912D0486
      2301FF00FFFF00FFFF00FFFF00FFFF00FF8F2A03952E028B2802FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btAlterarClick
  end
  object dsUsuMails: TDataSource
    DataSet = dmCadastros.qyUsuMails
    Left = 472
    Top = 104
  end
end
