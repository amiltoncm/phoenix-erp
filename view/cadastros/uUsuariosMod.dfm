inherited frmUsuariosMod: TfrmUsuariosMod
  Caption = 'M'#243'dulos'
  ClientHeight = 154
  ClientWidth = 234
  OnClose = FormClose
  ExplicitWidth = 240
  ExplicitHeight = 183
  PixelsPerInch = 96
  TextHeight = 13
  object DBText1: TDBText [0]
    Left = 111
    Top = 8
    Width = 115
    Height = 17
    DataField = 'usu_nome'
    DataSource = frmCadUsuarios.dsCadastro
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 8
    Width = 53
    Height = 16
    Caption = 'Usu'#225'rio:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBText2: TDBText [2]
    Left = 67
    Top = 8
    Width = 38
    Height = 17
    Alignment = taRightJustify
    DataField = 'usu_codigo'
    DataSource = frmCadUsuarios.dsCadastro
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited btFechar: TBitBtn
    Left = 121
    Top = 121
  end
  object DBCheckBox1: TDBCheckBox
    Left = 8
    Top = 30
    Width = 97
    Height = 17
    Caption = 'ERP'
    DataField = 'usm_erp'
    DataSource = dsUsuariosMod
    TabOrder = 1
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object DBCheckBox2: TDBCheckBox
    Left = 8
    Top = 54
    Width = 97
    Height = 17
    Caption = 'Comandas'
    DataField = 'usm_comandas'
    DataSource = dsUsuariosMod
    TabOrder = 2
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object DBCheckBox3: TDBCheckBox
    Left = 8
    Top = 77
    Width = 97
    Height = 17
    Caption = 'Delivery'
    DataField = 'usm_delivery'
    DataSource = dsUsuariosMod
    TabOrder = 3
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object dsUsuariosMod: TDataSource
    DataSet = dmCadastros.qyUsuariosMod
    Left = 152
    Top = 24
  end
end
