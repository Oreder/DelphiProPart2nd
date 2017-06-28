object Form1: TForm1
  Left = 902
  Top = 133
  Width = 273
  Height = 233
  Caption = 'Calculator'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 3
    Top = 115
    Width = 36
    Height = 36
    Caption = '1'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 43
    Top = 115
    Width = 36
    Height = 36
    Caption = '2'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 83
    Top = 115
    Width = 36
    Height = 36
    Caption = '3'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 3
    Top = 75
    Width = 36
    Height = 36
    Caption = '4'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 43
    Top = 75
    Width = 36
    Height = 36
    Caption = '5'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 83
    Top = 75
    Width = 36
    Height = 36
    Caption = '6'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 3
    Top = 35
    Width = 36
    Height = 36
    Caption = '7'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 43
    Top = 35
    Width = 36
    Height = 36
    Caption = '8'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 83
    Top = 35
    Width = 36
    Height = 36
    Caption = '9'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 3
    Top = 155
    Width = 36
    Height = 36
    Caption = '0'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = Button10Click
  end
  object Button11: TButton
    Left = 43
    Top = 155
    Width = 36
    Height = 36
    Caption = '.'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnClick = Button11Click
  end
  object Button12: TButton
    Left = 139
    Top = 115
    Width = 36
    Height = 36
    Caption = '+'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = Button12Click
  end
  object Button13: TButton
    Left = 139
    Top = 75
    Width = 36
    Height = 36
    Caption = '-'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    OnClick = Button13Click
  end
  object Button14: TButton
    Left = 179
    Top = 115
    Width = 36
    Height = 36
    Caption = '/'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    OnClick = Button14Click
  end
  object Button15: TButton
    Left = 179
    Top = 155
    Width = 36
    Height = 36
    Caption = 'div'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    OnClick = Button15Click
  end
  object Button16: TButton
    Left = 179
    Top = 35
    Width = 75
    Height = 36
    Caption = 'Cube root'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    OnClick = Button16Click
  end
  object Button17: TButton
    Left = 139
    Top = 35
    Width = 36
    Height = 36
    Caption = 'Pi'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 16
    OnClick = Button17Click
  end
  object Button18: TButton
    Left = 219
    Top = 115
    Width = 35
    Height = 75
    Caption = '='
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 17
    OnClick = Button18Click
  end
  object Edit1: TEdit
    Left = 4
    Top = 3
    Width = 249
    Height = 29
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 18
  end
  object Button19: TButton
    Left = 139
    Top = 155
    Width = 36
    Height = 36
    Caption = '+/-'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 19
    OnClick = Button19Click
  end
  object Button20: TButton
    Left = 179
    Top = 75
    Width = 75
    Height = 36
    Caption = 'Clear'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 20
    OnClick = Button20Click
  end
end
