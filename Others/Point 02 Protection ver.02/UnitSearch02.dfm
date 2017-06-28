object Form1: TForm1
  Left = 786
  Top = 134
  Width = 545
  Height = 480
  Caption = 'Form1'
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
    Left = 8
    Top = 8
    Width = 400
    Height = 400
    OnMouseDown = Image1MouseDown
  end
  object BitBtn1: TBitBtn
    Left = 424
    Top = 104
    Width = 89
    Height = 49
    Caption = 'Solution'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 424
    Top = 176
    Width = 89
    Height = 41
    Caption = 'Reset'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
end
