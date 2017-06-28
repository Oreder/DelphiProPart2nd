object Form1: TForm1
  Left = 766
  Top = 109
  Width = 592
  Height = 423
  Caption = 'ExamPro'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Times New Roman'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 19
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 417
    Height = 369
  end
  object Label1: TLabel
    Left = 440
    Top = 16
    Width = 96
    Height = 19
    Caption = 'Center of circle:'
  end
  object Label2: TLabel
    Left = 440
    Top = 48
    Width = 11
    Height = 19
    Caption = 'X'
  end
  object Label3: TLabel
    Left = 512
    Top = 48
    Width = 11
    Height = 19
    Caption = 'Y'
  end
  object Label5: TLabel
    Left = 436
    Top = 120
    Width = 83
    Height = 19
    Caption = 'Side'#39's triangle'
  end
  object Label6: TLabel
    Left = 440
    Top = 88
    Width = 41
    Height = 19
    Caption = 'Radius'
  end
  object Label7: TLabel
    Left = 440
    Top = 280
    Width = 35
    Height = 19
    Caption = 'Angle'
  end
  object Button1: TButton
    Left = 447
    Top = 152
    Width = 121
    Height = 33
    Caption = 'Show'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 456
    Top = 42
    Width = 41
    Height = 27
    TabOrder = 1
    Text = '200'
  end
  object Edit2: TEdit
    Left = 528
    Top = 42
    Width = 41
    Height = 27
    TabOrder = 2
    Text = '200'
  end
  object Edit3: TEdit
    Left = 504
    Top = 83
    Width = 65
    Height = 27
    TabOrder = 3
    Text = '100'
  end
  object Edit4: TEdit
    Left = 523
    Top = 117
    Width = 46
    Height = 27
    TabOrder = 4
    Text = '100'
  end
  object Edit5: TEdit
    Left = 488
    Top = 275
    Width = 65
    Height = 27
    TabOrder = 5
    Text = '0'
  end
  object Button2: TButton
    Left = 434
    Top = 311
    Width = 57
    Height = 49
    Caption = 'Move'
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 498
    Top = 311
    Width = 55
    Height = 49
    Caption = 'Pause'
    TabOrder = 7
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 448
    Top = 192
    Width = 121
    Height = 33
    Caption = 'Stop All'
    TabOrder = 8
    OnClick = Button4Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 20
    OnTimer = Timer1Timer
    Left = 464
    Top = 232
  end
  object Timer2: TTimer
    Interval = 50
    OnTimer = Timer2Timer
    Left = 504
    Top = 232
  end
end
