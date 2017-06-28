object Form1: TForm1
  Left = 462
  Top = 125
  Width = 762
  Height = 504
  Caption = 'POint Protection 3'
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
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 529
    Height = 385
    OnMouseDown = Image1MouseDown
  end
  object Label1: TLabel
    Left = 30
    Top = 405
    Width = 126
    Height = 19
    Caption = 'Number Green Point'
  end
  object Label2: TLabel
    Left = 32
    Top = 437
    Width = 124
    Height = 19
    Caption = 'Number Black Point'
  end
  object Label5: TLabel
    Left = 552
    Top = 144
    Width = 148
    Height = 19
    Caption = 'Line is given by 2 points:'
  end
  object Label6: TLabel
    Left = 552
    Top = 176
    Width = 73
    Height = 19
    Caption = 'Point1     X:'
  end
  object Label7: TLabel
    Left = 681
    Top = 176
    Width = 13
    Height = 19
    Caption = 'Y:'
  end
  object Label8: TLabel
    Left = 552
    Top = 208
    Width = 73
    Height = 19
    Caption = 'Point2     X:'
  end
  object Label9: TLabel
    Left = 682
    Top = 206
    Width = 13
    Height = 19
    Caption = 'Y:'
  end
  object Clear: TBitBtn
    Left = 400
    Top = 400
    Width = 89
    Height = 57
    Caption = 'Clear'
    TabOrder = 0
    OnClick = ClearClick
  end
  object Solution: TBitBtn
    Left = 280
    Top = 400
    Width = 89
    Height = 57
    Caption = 'Solution'
    TabOrder = 1
    OnClick = SolutionClick
  end
  object Edit1: TEdit
    Left = 168
    Top = 400
    Width = 65
    Height = 27
    ReadOnly = True
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 168
    Top = 432
    Width = 65
    Height = 27
    ReadOnly = True
    TabOrder = 3
  end
  object GroupBox1: TGroupBox
    Left = 552
    Top = 16
    Width = 185
    Height = 97
    Caption = ' Input points '
    TabOrder = 4
    object Label3: TLabel
      Left = 16
      Top = 32
      Width = 14
      Height = 19
      Caption = 'X:'
    end
    object Label4: TLabel
      Left = 16
      Top = 64
      Width = 13
      Height = 19
      Caption = 'Y:'
    end
    object PX: TEdit
      Left = 40
      Top = 24
      Width = 65
      Height = 27
      TabOrder = 0
      Text = '300'
    end
    object PY: TEdit
      Left = 40
      Top = 56
      Width = 65
      Height = 27
      TabOrder = 1
      Text = '150'
    end
    object Add: TButton
      Left = 112
      Top = 16
      Width = 67
      Height = 57
      Caption = 'Add'
      TabOrder = 2
      OnClick = AddClick
    end
  end
  object AX: TEdit
    Left = 629
    Top = 171
    Width = 44
    Height = 27
    TabOrder = 5
    Text = '200'
    OnChange = ChangeLine
  end
  object AY: TEdit
    Left = 697
    Top = 170
    Width = 43
    Height = 27
    TabOrder = 6
    Text = '100'
    OnChange = ChangeLine
  end
  object BX: TEdit
    Left = 629
    Top = 201
    Width = 44
    Height = 27
    TabOrder = 7
    Text = '200'
    OnChange = ChangeLine
  end
  object BY: TEdit
    Left = 697
    Top = 201
    Width = 43
    Height = 27
    TabOrder = 8
    Text = '150'
    OnChange = ChangeLine
  end
  object Showline: TButton
    Left = 592
    Top = 248
    Width = 105
    Height = 49
    Caption = 'Show line'
    TabOrder = 9
    OnClick = ShowlineClick
  end
end
