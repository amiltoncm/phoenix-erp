inherited frmReplicar: TfrmReplicar
  Caption = 'Replicar agendamento'
  ClientHeight = 571
  ClientWidth = 606
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  ExplicitTop = -152
  ExplicitWidth = 612
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 40
    Width = 84
    Height = 13
    Caption = 'Frequencia (Dias)'
  end
  object Label2: TLabel [1]
    Left = 98
    Top = 40
    Width = 72
    Height = 13
    Caption = 'Agendamentos'
  end
  inherited btFechar: TBitBtn
    Left = 493
    Top = 538
    TabOrder = 4
  end
  object pnQuadra: TPanel
    Left = 0
    Top = 0
    Width = 606
    Height = 33
    Align = alTop
    Caption = 'Replicar agendamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object edDias: TEdit
    Left = 8
    Top = 59
    Width = 84
    Height = 21
    Hint = 'Digite a quantidade de dias de cada agendamentos'
    Alignment = taRightJustify
    NumbersOnly = True
    TabOrder = 0
    Text = 'edDias'
  end
  object edAgendamentos: TEdit
    Left = 98
    Top = 59
    Width = 84
    Height = 21
    Hint = 'Digite a quantidade de agendamentos'
    Alignment = taRightJustify
    NumbersOnly = True
    TabOrder = 1
    Text = 'edAgendamentos'
  end
  object btSimular: TBitBtn
    Left = 188
    Top = 59
    Width = 105
    Height = 25
    Caption = 'Simular'
    Glyph.Data = {
      62020000424D6202000000000000620100002800000010000000100000000100
      08000000000000010000120B0000120B00004B0000004B000000FF00FF006633
      33006F372F0072382E00783C2B00793C2A00824225008C462000954A1C00A954
      12009F501600A55A210091512000B2590E00AB551100A8541200BC5E0800BC5F
      0800C3875100CC660000C6630300CF6E0C00CF8D4C00D7A97B00CE6B0400D274
      0D00D2760E00AD641300D7811800E1984000CE954E00EDB57200BC6F0C00D080
      1900D9871D00DA871E00DC8D2400DE912B00E9AD6200F8D29E00F2CFA100DE92
      2800E0982E00EEBA6D00F2C48300F5C88600F5C98900D7830000DA8B1000DD91
      1B00E19B2D00E29D3200EEB86500F1C27800F3C47C00F4C88200F4C88300F3C7
      8300F5CA8700F6CC8A00F6CC8B00F6CD8C00F8D09200F7CF9100F9D49A00FAD6
      9D00FAD69E00FCDAA500FDDDAB00FEDFAE00FEE0B100FEE1B200FFE2B400FFFF
      FF0000000000000000000000000007060402010101010000000000000000082F
      2F2F2F0C010000000000000000000A4848481E02000000000000000000000948
      483A2F1B030000000000000000000D481217342F030000000000000000001116
      0F0B2832200500231C0000000000141000000B362F062939351C000000001300
      00000B482F072A473D1C00000000000000000B4830083348401C000000000000
      00000B48310A333C432D24000000000000152748210E003346422B2500000000
      191F483B140000333845412D191919192E48481D1400000033374643403F3E44
      48482618000000000033333C484848482C1A1A000000000000000033332A2924
      220000000000}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btSimularClick
  end
  object btConfirmar: TBitBtn
    Left = 382
    Top = 538
    Width = 105
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Confirmar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6696BA6696BA6696BA669
      6BA6696BA6696BA6696BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFA6696BF3D3A4F0CB97EFC68AEDC180EBBB76A6696BFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7756BF6DDBA707BCE0F2E
      F36E75BFEEC484A6696BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFBC8268F8E7CE0F30F7001EFF0F2FF3F0CC96A6696BFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1926DFBF2E27486E70F30
      F8727FD7F3D7ABA6696BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFDA9D75FEFAF3FBF4E7FAEEDCF8E7CFF6E1C0A6696BFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE7AB79FFFFFFFEFBF8FCF7
      EEA6696AA6696AAC6C5AA46769A46769A46769A46769A46769A46769A46769A4
      6769FF00FFE7AB79FFFFFFFFFFFFFEFCFBA6696AC67F4EFF00FFA46769E9C49D
      D8A57BD8A373D59D66D1965AEAB66CA46769FF00FFE7AB79D1926DD1926DD192
      6DA6696AFF00FF005901A46769BB76507D1800821F00811F00811E00DCA162A4
      6769FF00FFFF00FF2D6718FF00FFFF00FFFF00FFFF00FF016405A7756BF6E9DD
      8A2A087F1A007B1600AB5B30FCDD9FA46769FF00FF005D03067F14FF00FFFF00
      FFFF00FF017707036506BC8268FFFFFFC99379791400892907E6BD99FFEAB5A4
      6769015A0630BD571A922F01550303600704780A05840C015804D1926DFFFFFF
      FBF4F299411EBF7D59FAEDD4D4BCA02A70272CC55841E07527BB4515A5280996
      13058C0D026606FF00FFDA9D75FFFFFFFFFFFFE7D0C4F7EEE3A46769A46769A4
      6A5A1C963122B63E149A2605700B036C07026005FF00FFFF00FFE7AB79FFFFFF
      FFFFFFFFFFFFFCFFFFA46769D18649FF00FFFF00FF0875110C8816FF00FFFF00
      FFFF00FFFF00FFFF00FFE7AB79D1926DD1926DD1926DD1926DA46769FF00FFFF
      00FFFF00FFFF00FF036307FF00FFFF00FFFF00FFFF00FFFF00FF}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btConfirmarClick
    ExplicitLeft = 486
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 90
    Width = 174
    Height = 443
    TabStop = False
    DataSource = dsTemp
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DataAg'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HoraAg'
        Width = 68
        Visible = True
      end>
  end
  object pnDados: TPanel
    Left = 188
    Top = 90
    Width = 410
    Height = 443
    BevelInner = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    object Label3: TLabel
      Left = 16
      Top = 16
      Width = 49
      Height = 16
      Caption = 'Cliente:'
    end
    object lbCliente: TLabel
      Left = 71
      Top = 16
      Width = 55
      Height = 16
      Caption = 'lbCliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 38
      Width = 52
      Height = 16
      Caption = 'Quadra:'
    end
    object lbQuadra: TLabel
      Left = 74
      Top = 38
      Width = 58
      Height = 16
      Caption = 'lbQuadra'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 60
      Width = 53
      Height = 16
      Caption = 'Hor'#225'rio:'
    end
    object lbHorario: TLabel
      Left = 74
      Top = 60
      Width = 59
      Height = 16
      Caption = 'lbHorario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object dsTemp: TDataSource
    DataSet = dmTemp.mdAgendaTemp
    Left = 120
    Top = 240
  end
end
