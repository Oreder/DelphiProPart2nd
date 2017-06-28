object Form2: TForm2
  Left = 800
  Top = 174
  Width = 388
  Height = 157
  Caption = 'ERROR INFORMATION'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1
    Top = 1
    Width = 368
    Height = 113
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 86
      Height = 19
      Caption = '#0 : No error.'
    end
    object Label2: TLabel
      Left = 16
      Top = 48
      Width = 340
      Height = 19
      Caption = '#1 : Section has root but it is OUT of section'#39's range.'
    end
    object Label3: TLabel
      Left = 16
      Top = 72
      Width = 284
      Height = 19
      Caption = '#2 : Time excuting is bigger than allowance.'
    end
  end
end
