object Form1: TForm1
  Left = 754
  Top = 128
  Width = 603
  Height = 240
  Caption = 'Chick'
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
  object Shape1: TShape
    Left = 88
    Top = 24
    Width = 73
    Height = 73
    Shape = stRoundSquare
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 152
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Items.Strings = (
      'Ored'
      'Chick')
  end
  object Timer1: TTimer
    Interval = 30
    OnTimer = Timer1Timer
    Left = 8
    Top = 16
  end
end
