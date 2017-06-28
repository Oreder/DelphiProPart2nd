object Form1: TForm1
  Left = 638
  Top = 146
  Width = 566
  Height = 454
  Caption = 'Search01'
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
    Left = 5
    Top = 6
    Width = 400
    Height = 400
    OnMouseDown = Image1MouseDown
  end
  object Label3: TLabel
    Left = 424
    Top = 29
    Width = 78
    Height = 13
    Caption = 'Radius of circles'
  end
  object Button1: TButton
    Left = 424
    Top = 112
    Width = 81
    Height = 41
    Caption = 'Solution'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 422
    Top = 48
    Width = 83
    Height = 21
    TabOrder = 1
    Text = '25'
  end
  object Button4: TButton
    Left = 424
    Top = 168
    Width = 81
    Height = 41
    Caption = 'Reset'
    TabOrder = 2
    OnClick = Button4Click
  end
end
