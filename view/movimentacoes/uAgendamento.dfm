inherited frmAgendamento: TfrmAgendamento
  Caption = 'Agendamento'
  ClientHeight = 362
  ClientWidth = 516
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  ExplicitWidth = 522
  ExplicitHeight = 391
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 63
    Width = 33
    Height = 13
    Caption = 'Cliente'
  end
  object Label3: TLabel [1]
    Left = 8
    Top = 157
    Width = 19
    Height = 13
    Caption = 'Obs'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel [2]
    Left = 8
    Top = 232
    Width = 191
    Height = 13
    Caption = 'Servi'#231'o (Quadra ou servvi'#231'o agendado)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object sbServ: TSpeedButton [3]
    Left = 428
    Top = 250
    Width = 23
    Height = 22
    Hint = 'Adicionar servi'#231'o'
    Flat = True
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08
      780E08780EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF08780E76F9A70DA31B08780EFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08780E76
      F9A70EAA1D08780EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF08780E76F9A70EA81C08780EFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08780E76
      F9A710AA1F08780EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      08780E08780E08780E08780E08780E76F9A719B02C08780E08780E08780E0878
      0E08780EFF00FFFF00FFFF00FF08780E76F9A755E38349DA7242D36837C8562A
      B94322B3371CB23016AF270FA81D0EA91B0DA21B08780EFF00FFFF00FF08780E
      76F9A776F9A776F9A776F9A776F9A776F9A72CBB4876F9A776F9A776F9A776F9
      A776F9A708780EFF00FFFF00FFFF00FF08780E08780E08780E08780E08780E76
      F9A73CCB5D08780E08780E08780E08780E08780EFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF08780E76F9A749D97208780EFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08780E76
      F9A755E28208780EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF08780E76F9A763F09708780EFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08780E76
      F9A776F9A708780EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF08780E08780EFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    OnClick = sbServClick
  end
  object Label2: TLabel [4]
    Left = 8
    Top = 111
    Width = 36
    Height = 13
    Caption = 'Quadra'
  end
  inherited btFechar: TBitBtn
    Left = 403
    Top = 329
    TabOrder = 6
    ExplicitLeft = 403
    ExplicitTop = 329
  end
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 516
    Height = 57
    Align = alTop
    Color = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 7
  end
  object cbPessoas: TwwDBLookupCombo
    Left = 8
    Top = 82
    Width = 500
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'PES_NOME'#9'50'#9'Nome'#9#9
      'PES_NOMEFANTASIA'#9'50'#9'Nome Fantasia'#9#9
      'PES_DOCUMENTO'#9'18'#9'Documento'#9#9
      'PES_CODIGO'#9'10'#9'C'#243'digo'#9#9
      'PES_LOGRADOURO'#9'50'#9'Logradouro'#9#9)
    LookupTable = dmLookups.qyLkClientes
    LookupField = 'PES_NOME'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 0
    AutoDropDown = True
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
  end
  object memObs: TMemo
    Left = 8
    Top = 176
    Width = 500
    Height = 50
    Lines.Strings = (
      'memObs')
    TabOrder = 2
  end
  object cbServicos: TwwDBLookupCombo
    Left = 8
    Top = 251
    Width = 414
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'pro_descricao'#9'50'#9'Servi'#231'o'#9#9
      'pro_codigo'#9'10'#9'C'#243'digo'#9#9
      'uni_codigo'#9'2'#9'Un.'#9#9)
    LookupTable = dmLookups.qyLkServicos
    LookupField = 'pro_descricao'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 3
    AutoDropDown = True
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
  end
  object GridServ: TDBGrid
    Left = 8
    Top = 278
    Width = 443
    Height = 39
    TabStop = False
    DataSource = dsServicos
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'pro_codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pro_descricao'
        Width = 344
        Visible = True
      end>
  end
  object btAgendar: TBitBtn
    Left = 292
    Top = 329
    Width = 105
    Height = 25
    Hint = 'Agendar servi'#231'o'
    Anchors = [akRight, akBottom]
    Caption = '&Agendar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0066001EB2311FB13300
      6600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF00660031C24F22B7381AB02D21B437006600FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF00660047D36D3BCB5E25A83B0066001B
      A92E1DB132006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600
      4FD67953DE7F31B54D006600FF00FF006600179D271EAE31006600FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF00660041C563006600FF00FFFF00FFFF
      00FFFF00FF00660019AA2B006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600149D210066
      00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    TabOrder = 5
    OnClick = btAgendarClick
  end
  object edQuadra: TEdit
    Left = 8
    Top = 130
    Width = 500
    Height = 21
    TabStop = False
    Color = clSkyBlue
    ReadOnly = True
    TabOrder = 1
    Text = 'edQuadra'
  end
  object dsServicos: TDataSource
    DataSet = dmTemp.mdServico
    Left = 104
    Top = 152
  end
end
