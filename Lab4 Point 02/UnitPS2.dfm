object Form1: TForm1
  Left = 626
  Top = 115
  Width = 670
  Height = 478
  Caption = 'Point in Solution'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Times New Roman'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object Label8: TLabel
    Left = 459
    Top = 351
    Width = 95
    Height = 19
    Caption = 'Number points'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 458
    Top = 330
    Width = 192
    Height = 19
    Caption = '________________________'
  end
  object Label9: TLabel
    Left = 459
    Top = 389
    Width = 96
    Height = 19
    Caption = 'inside triangle:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 460
    Top = 370
    Width = 93
    Height = 19
    Caption = 'of each set are'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object PointBox: TListBox
    Left = 466
    Top = 30
    Width = 169
    Height = 183
    BiDiMode = bdLeftToRight
    ItemHeight = 19
    ParentBiDiMode = False
    TabOrder = 4
    TabWidth = 18
    OnClick = ShowPoint
    OnDblClick = Button2Click
  end
  object Panel1: TPanel
    Left = 2
    Top = 3
    Width = 452
    Height = 430
    TabOrder = 0
    object Image1: TImage
      Left = 1
      Top = 1
      Width = 450
      Height = 400
      OnMouseDown = Image1MouseDown
      OnMouseMove = Image1MouseMove
    end
    object StatusBar1: TStatusBar
      Left = 1
      Top = 400
      Width = 450
      Height = 29
      Panels = <
        item
          Width = 50
        end>
    end
  end
  object Panel2: TPanel
    Left = 458
    Top = 217
    Width = 193
    Height = 73
    TabOrder = 1
    object Label2: TLabel
      Left = 2
      Top = 13
      Width = 14
      Height = 19
      Caption = 'X:'
    end
    object Label3: TLabel
      Left = 2
      Top = 42
      Width = 13
      Height = 19
      Caption = 'Y:'
    end
    object EditX: TEdit
      Left = 19
      Top = 9
      Width = 49
      Height = 27
      TabOrder = 0
      OnChange = NBChange
    end
    object EditY: TEdit
      Left = 19
      Top = 39
      Width = 49
      Height = 27
      TabOrder = 1
      OnChange = NBChange
    end
    object GroupBox1: TGroupBox
      Left = 73
      Top = 5
      Width = 57
      Height = 60
      Caption = ' Set  '
      TabOrder = 2
      object SetA: TRadioButton
        Left = 10
        Top = 18
        Width = 39
        Height = 17
        Caption = 'A'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object SetB: TRadioButton
        Left = 10
        Top = 40
        Width = 33
        Height = 17
        Caption = 'B'
        TabOrder = 1
      end
    end
    object Button1: TButton
      Left = 136
      Top = 14
      Width = 49
      Height = 49
      Caption = 'Add'
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object Panel3: TPanel
    Left = 466
    Top = 5
    Width = 168
    Height = 25
    TabOrder = 2
    object Label4: TLabel
      Left = 15
      Top = 2
      Width = 12
      Height = 19
      Caption = 'N'
    end
    object Label5: TLabel
      Left = 53
      Top = 2
      Width = 11
      Height = 19
      Caption = 'X'
    end
    object Label6: TLabel
      Left = 92
      Top = 2
      Width = 11
      Height = 19
      Caption = 'Y'
    end
    object Label7: TLabel
      Left = 121
      Top = 2
      Width = 20
      Height = 19
      Caption = 'Set'
    end
  end
  object Button2: TButton
    Left = 456
    Top = 296
    Width = 97
    Height = 46
    Caption = 'Delete'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 560
    Top = 295
    Width = 91
    Height = 47
    Caption = 'Clear All'
    TabOrder = 5
    OnClick = Button3Click
  end
  object NB: TEdit
    Left = 458
    Top = 410
    Width = 95
    Height = 24
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    TabOrder = 6
    Text = '5'
    OnChange = NBChange
  end
  object Solution: TButton
    Left = 560
    Top = 352
    Width = 89
    Height = 81
    Caption = 'Solution'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 7
    OnClick = SolutionClick
  end
end
