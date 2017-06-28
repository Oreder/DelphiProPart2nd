object Form1: TForm1
  Left = 581
  Top = 55
  Width = 736
  Height = 600
  Caption = 'Root Calculation'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 544
    Top = 201
    Width = 44
    Height = 19
    Caption = 'Epsilon'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 544
    Top = 232
    Width = 61
    Height = 19
    Caption = 'Section:  ['
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 658
    Top = 239
    Width = 3
    Height = 19
    Caption = #39
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 708
    Top = 232
    Width = 5
    Height = 19
    Caption = ']'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 544
    Top = 272
    Width = 71
    Height = 19
    Caption = 'Loop'#39's step'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 544
    Top = 306
    Width = 63
    Height = 19
    Caption = 'Max times'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 544
    Top = 8
    Width = 169
    Height = 81
    Caption = 'Functions '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object RadioButton1: TRadioButton
      Left = 16
      Top = 24
      Width = 145
      Height = 17
      Caption = 'F(x) = x^2 - 1'
      TabOrder = 0
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 16
      Top = 48
      Width = 113
      Height = 17
      Caption = 'F(x) = sin(x)'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = RadioButton2Click
    end
  end
  object Button1: TButton
    Left = 552
    Top = 336
    Width = 153
    Height = 49
    Caption = 'Show Table'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object GroupBox2: TGroupBox
    Left = 544
    Top = 104
    Width = 169
    Height = 81
    Caption = 'Algorithms '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object RadioButton3: TRadioButton
      Left = 16
      Top = 24
      Width = 113
      Height = 17
      Caption = 'Combination'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton3Click
    end
    object RadioButton4: TRadioButton
      Left = 16
      Top = 48
      Width = 113
      Height = 17
      Caption = 'Iteration'
      TabOrder = 1
      OnClick = RadioButton4Click
    end
  end
  object Edit1: TEdit
    Left = 604
    Top = 195
    Width = 101
    Height = 27
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = '1E-3'
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 608
    Top = 229
    Width = 49
    Height = 27
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = '0'
    OnChange = Edit2Change
  end
  object Edit3: TEdit
    Left = 662
    Top = 228
    Width = 45
    Height = 27
    TabStop = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Text = '10'
    OnChange = Edit3Change
  end
  object Edit4: TEdit
    Left = 623
    Top = 266
    Width = 90
    Height = 27
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Text = '2'
    OnChange = Edit4Change
  end
  object Edit5: TEdit
    Left = 623
    Top = 304
    Width = 90
    Height = 27
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Text = '100'
    OnChange = Edit5Change
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 347
    Width = 529
    Height = 209
    ColCount = 6
    DefaultColWidth = 45
    RowCount = 100
    TabOrder = 8
    ColWidths = (
      45
      101
      103
      101
      95
      56)
  end
  object Button2: TButton
    Left = 552
    Top = 448
    Width = 153
    Height = 49
    Caption = 'Show Graphic'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = Button2Click
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 5
    Width = 529
    Height = 337
    Caption = ' Graphic '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    object Image1: TImage
      Left = 16
      Top = 24
      Width = 500
      Height = 300
    end
  end
  object Button3: TButton
    Left = 552
    Top = 392
    Width = 153
    Height = 49
    Caption = 'Clear Data'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 552
    Top = 504
    Width = 153
    Height = 49
    Caption = 'Error information'
    TabOrder = 12
    OnClick = Button4Click
  end
end
