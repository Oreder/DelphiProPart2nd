object Form22: TForm22
  Left = 0
  Top = 0
  Caption = 'Form22'
  ClientHeight = 204
  ClientWidth = 448
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
    Top = 8
    Width = 84
    Height = 13
    Caption = 'Equation sinX = 0'
  end
  object TLabel
    Left = 120
    Top = 8
    Width = 42
    Height = 13
    Caption = 'Section: '
  end
  object Label2: TLabel
    Left = 168
    Top = 8
    Width = 28
    Height = 13
    Caption = 'From:'
  end
  object Label3: TLabel
    Left = 256
    Top = 8
    Width = 14
    Height = 13
    Caption = 'to:'
  end
  object Label4: TLabel
    Left = 352
    Top = 8
    Width = 29
    Height = 13
    Caption = 'Step: '
  end
  object Tab: TStringGrid
    Left = 8
    Top = 43
    Width = 329
    Height = 153
    ColCount = 3
    RowCount = 100
    TabOrder = 0
    ColWidths = (
      64
      120
      120)
  end
  object Edit1: TEdit
    Left = 198
    Top = 5
    Width = 52
    Height = 21
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 276
    Top = 5
    Width = 53
    Height = 21
    TabOrder = 2
  end
  object Edit3: TEdit
    Left = 387
    Top = 8
    Width = 54
    Height = 21
    TabOrder = 3
    Text = '0,5'
  end
  object Button1: TButton
    Left = 352
    Top = 56
    Width = 88
    Height = 57
    Caption = 'Show Table'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 352
    Top = 136
    Width = 88
    Height = 33
    Caption = 'Clear All'
    TabOrder = 5
    OnClick = Button2Click
  end
end
