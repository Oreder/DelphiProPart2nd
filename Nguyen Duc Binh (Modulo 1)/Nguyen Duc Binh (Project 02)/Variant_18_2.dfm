object Form22: TForm22
  Left = 0
  Top = 0
  Caption = 'Root_2'
  ClientHeight = 101
  ClientWidth = 251
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 32
    Width = 129
    Height = 13
    Caption = 'Method better combination'
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 99
    Height = 13
    Caption = 'Equation x*x - 4 = 0'
  end
  object Label3: TLabel
    Left = 160
    Top = 8
    Width = 70
    Height = 13
    Caption = 'Section: [-3,0]'
  end
  object Edit1: TEdit
    Left = 8
    Top = 66
    Width = 137
    Height = 25
    TabOrder = 0
  end
  object Button1: TButton
    Left = 160
    Top = 33
    Width = 75
    Height = 25
    Caption = 'Root X0'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 160
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Value F(X0)'
    TabOrder = 2
    OnClick = Button2Click
  end
end
