object Form1: TForm1
  Left = 108
  Top = 177
  Width = 729
  Height = 521
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 700
    Height = 400
    OnMouseMove = MouseCoor
  end
  object btnStart: TButton
    Left = 8
    Top = 424
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = btnStartClick
  end
  object Button1: TButton
    Left = 152
    Top = 424
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 264
    Top = 424
    Width = 75
    Height = 25
    Caption = 'Turn over'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 360
    Top = 424
    Width = 97
    Height = 25
    Caption = 'Enable Mouse'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 30
    OnTimer = Timer1Timer
    Left = 112
    Top = 424
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 5
    OnTimer = Compute
    Left = 480
    Top = 424
  end
end
