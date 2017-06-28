object Form1: TForm1
  Left = 506
  Top = 132
  Width = 587
  Height = 441
  Caption = 'Point Protection'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 7
    Top = 8
    Width = 393
    Height = 345
  end
  object Label1: TLabel
    Left = 449
    Top = 21
    Width = 9
    Height = 15
    Caption = 'N'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 475
    Top = 21
    Width = 9
    Height = 15
    Caption = 'X'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 504
    Top = 21
    Width = 8
    Height = 15
    Caption = 'Y'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 39
    Top = 376
    Width = 49
    Height = 15
    Caption = 'Position:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 233
    Top = 376
    Width = 163
    Height = 15
    Caption = 'Press "ENTER" to show result'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 95
    Top = 372
    Width = 103
    Height = 21
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Box: TListBox
    Left = 437
    Top = 40
    Width = 105
    Height = 177
    ItemHeight = 13
    TabOrder = 1
    TabWidth = 18
  end
end
