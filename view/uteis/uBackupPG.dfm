inherited frmBackupPG: TfrmBackupPG
  Caption = 'Backup SGDB PostgreSQL'
  ClientHeight = 511
  ClientWidth = 1074
  ExplicitLeft = -291
  ExplicitTop = -95
  ExplicitWidth = 1080
  ExplicitHeight = 540
  PixelsPerInch = 96
  TextHeight = 13
  inherited btFechar: TBitBtn
    Left = 961
    Top = 478
    ExplicitLeft = 961
    ExplicitTop = 736
  end
  object MemoBackup: TMemo
    Left = 8
    Top = 8
    Width = 947
    Height = 495
    TabStop = False
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'MemoBackup')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object btBackup: TBitBtn
    Left = 961
    Top = 422
    Width = 105
    Height = 25
    Hint = 'Efetua o backup'
    Anchors = [akRight, akBottom]
    Caption = '&Backup'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FF26B7FF26B7FF26B7FF26B7FF26B7FF26B7FF26B7FF029B100099000599
      10FF00FFFF00FFFF00FFFF00FFFF00FF26B7FF22B4FF34BDFF64D4FF77DCFF6E
      DCFF61DDFF67E1FF00990025B22800990026B7FFFF00FFFF00FFFF00FFFF00FF
      26B7FF4EC8FF64D4FF9EE8FFB8F0FFA5EEFF8CECFF90EEFF00990044C0460099
      0026B7FFFF00FFFF00FFFF00FFFF00FF26B7FF73D6FF61D3FF9AE6FFB5EFFF0A
      9E1000990000990000990061CE62009900009900009900009900FF00FFFF00FF
      26B7FF8CDEFF5ED3FF96E5FFB0EDFF009900AAECABADEEADA0ED9F80E57F61D0
      6037B63718A618009900FF00FFFF00FF26B7FFA5E5FF59D2FF91E4FFABEAFF09
      9E100099000099000099009EEB9F009900009900009900009900FF00FFFF00FF
      26B7FFBEECFF5ED4FF8CE3FFA6EAFF85E1FF59D7FF58D6FF009900A6EBA60099
      0026B7FFFF00FFFF00FFFF00FFFF00FF26B7FF96DBFFC2EDFFD2F4FFD5F5FFD4
      F5FFD2F4FFD2F4FF0099009CE79E00990026B7FFFF00FFFF00FFFF00FFFF00FF
      26B7FF22B2FF2FBDFF4ACBFF58D3FF56D5FF51D8FF57DCFF059D10009900039B
      1026B7FFFF00FFFF00FFFF00FFFF00FF26B7FF47C4FF62D3FF9DE8FFB9F0FFA6
      EEFF8EECFF92EFFF8FEDFF71E2FF33C3FF26B7FFFF00FFFF00FFFF00FFFF00FF
      26B7FF70D5FF60D3FF9AE6FFB6EFFFA0ECFF83E7FF85E9FF82E8FF68DEFF32C1
      FF26B7FFFF00FFFF00FFFF00FFFF00FF26B7FF88DCFF5DD2FF96E5FFB1EDFF99
      E9FF77E2FF76E3FF74E2FF5ED9FF2EBEFF26B7FFFF00FFFF00FFFF00FFFF00FF
      26B7FFA1E4FF59D2FF91E3FFACEBFF90E5FF69DDFF68DDFF67DDFF53D3FF29BA
      FF26B7FFFF00FFFF00FFFF00FFFF00FF26B7FFBAEBFF54D2FF8CE3FFA7E9FF88
      E2FF5CD7FF5AD7FF58D7FF48CEFF39C0FF26B7FFFF00FFFF00FFFF00FFFF00FF
      26B7FFAAE5FFC6F0FFC1F0FFCBF3FFC1F0FFB3ECFFB2ECFFB1ECFFBDEEFF9FE4
      FF26B7FFFF00FFFF00FFFF00FFFF00FFFF00FF26B7FF26B7FF26B7FF26B7FF26
      B7FF26B7FF26B7FF26B7FF26B7FF26B7FFFF00FFFF00FFFF00FF}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btBackupClick
    ExplicitTop = 680
  end
end
