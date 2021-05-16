inherited frmAgendaObs: TfrmAgendaObs
  Caption = 'Detalhes da agenda'
  ClientHeight = 419
  ClientWidth = 493
  OnKeyPress = FormKeyPress
  ExplicitWidth = 499
  ExplicitHeight = 448
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 10
    Top = 227
    Width = 63
    Height = 13
    Caption = 'Observa'#231#245'es'
  end
  object Label2: TLabel [1]
    Left = 10
    Top = 319
    Width = 86
    Height = 13
    Caption = 'Servi'#231'o agendado'
  end
  inherited btFechar: TBitBtn
    Left = 380
    Top = 386
    ExplicitLeft = 380
    ExplicitTop = 386
  end
  object wwDataInspector1: TwwDataInspector
    Left = 8
    Top = 8
    Width = 477
    Height = 212
    DisableThemes = False
    TabOrder = 1
    DataSource = dsAgenda
    Items = <
      item
        DataSource = dsAgenda
        DataField = 'agd_codigo'
        Caption = 'Agendamento'
        WordWrap = False
      end
      item
        DataSource = dsAgenda
        DataField = 'agd_atendimento'
        Caption = 'Pr'#233'-venda'
        WordWrap = False
      end
      item
        DataSource = dsAgenda
        Caption = 'Cliente'
        Expanded = True
        Items = <
          item
            DataSource = dsAgenda
            DataField = 'pes_nome'
            Caption = 'Nome'
            WordWrap = False
          end
          item
            DataSource = dsAgenda
            DataField = 'pes_codigo'
            Caption = 'C'#243'digo'
            WordWrap = False
          end
          item
            DataSource = dsAgenda
            DataField = 'pes_fone'
            Caption = 'Telefone'
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = dsAgenda
        Caption = 'Agenda'
        Expanded = True
        Items = <
          item
            DataSource = dsAgenda
            DataField = 'agd_dataag'
            Caption = 'Data'
            WordWrap = False
          end
          item
            DataSource = dsAgenda
            DataField = 'agd_horaag'
            Caption = 'Hora'
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = dsAgenda
        Caption = 'Log do agendamento'
        Expanded = True
        Items = <
          item
            DataSource = dsAgenda
            DataField = 'usu_codigo'
            Caption = 'Usu'#225'rio'
            WordWrap = False
          end
          item
            DataSource = dsAgenda
            DataField = 'agd_datalanc'
            Caption = 'Data'
            WordWrap = False
          end
          item
            DataSource = dsAgenda
            DataField = 'agd_horalanc'
            Caption = 'Hora'
            WordWrap = False
          end>
        WordWrap = False
      end>
    CaptionWidth = 122
    Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
  end
  object memObs: TDBMemo
    Left = 8
    Top = 246
    Width = 477
    Height = 67
    TabStop = False
    DataField = 'agd_obs'
    DataSource = dsAgenda
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object GridServ: TDBGrid
    Left = 10
    Top = 338
    Width = 475
    Height = 40
    TabStop = False
    DataSource = dsAgeItens
    ReadOnly = True
    TabOrder = 3
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
  object dsAgenda: TDataSource
    DataSet = dmGestao.qyAgenda
    Left = 136
    Top = 16
  end
  object dsAgeItens: TDataSource
    DataSet = dmGestao.qyAgeItens
    Left = 272
    Top = 328
  end
end
