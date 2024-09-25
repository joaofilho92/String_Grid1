object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 442
  ClientWidth = 512
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object StringGrid1: TStringGrid
    Left = 0
    Top = 73
    Width = 512
    Height = 369
    Align = alBottom
    TabOrder = 0
  end
  object btn_Configurar: TButton
    Left = 429
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Configurar'
    TabOrder = 1
    OnClick = btn_ConfigurarClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=atlantis'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 8
  end
end
