object Form1: TForm1
  Left = 272
  Top = 98
  BorderStyle = bsDialog
  Caption = '11 Sep'
  ClientHeight = 600
  ClientWidth = 800
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
    Left = 0
    Top = 0
    Width = 800
    Height = 600
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer1Timer
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer2Timer
    Left = 32
  end
  object Timer3: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer3Timer
    Left = 64
  end
  object Timer4: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer4Timer
    Top = 32
  end
  object Timer5: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer5Timer
    Left = 32
    Top = 32
  end
  object Timer6: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer6Timer
    Left = 64
    Top = 32
  end
  object Timer7: TTimer
    Interval = 1
    OnTimer = Timer7Timer
    Top = 64
  end
  object Timer8: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer8Timer
    Left = 32
    Top = 64
  end
end
