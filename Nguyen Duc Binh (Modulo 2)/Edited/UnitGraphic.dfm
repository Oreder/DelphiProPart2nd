object Form1: TForm1
  Left = 660
  Top = 76
  Width = 657
  Height = 436
  Caption = 'Graphic'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image: TImage
    Left = 5
    Top = 8
    Width = 500
    Height = 300
  end
  object Label1: TLabel
    Left = 10
    Top = 322
    Width = 22
    Height = 13
    Caption = 'Xmin'
    Visible = False
  end
  object Label2: TLabel
    Left = 89
    Top = 322
    Width = 26
    Height = 13
    Caption = 'Xmax'
    Visible = False
  end
  object Label3: TLabel
    Left = 189
    Top = 315
    Width = 41
    Height = 13
    Caption = 'Function'
    Visible = False
  end
  object Label4: TLabel
    Left = 512
    Top = 8
    Width = 108
    Height = 13
    Caption = 'Place to work with file:'
  end
  object Button1: TButton
    Left = 331
    Top = 323
    Width = 89
    Height = 48
    Caption = 'Show Graphic'
    TabOrder = 0
    Visible = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 430
    Top = 323
    Width = 75
    Height = 48
    Caption = 'Exit'
    TabOrder = 1
    Visible = False
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 9
    Top = 342
    Width = 64
    Height = 21
    TabOrder = 2
    Text = '0'
    Visible = False
  end
  object Edit2: TEdit
    Left = 89
    Top = 341
    Width = 65
    Height = 21
    TabOrder = 3
    Text = '5'
    Visible = False
  end
  object Radio1: TRadioButton
    Left = 188
    Top = 334
    Width = 113
    Height = 17
    Caption = 'F(X) = X*sin(X)'
    Checked = True
    TabOrder = 4
    TabStop = True
    Visible = False
  end
  object Radio2: TRadioButton
    Left = 188
    Top = 357
    Width = 144
    Height = 17
    Caption = 'F(X) = 2*X*X - 3*X + 1'
    TabOrder = 5
    Visible = False
  end
  object Memo: TMemo
    Left = 509
    Top = 24
    Width = 124
    Height = 281
    Lines.Strings = (
      'Memo')
    TabOrder = 6
  end
  object MainMenu1: TMainMenu
    Left = 512
    Top = 328
    object File1: TMenuItem
      Caption = 'File'
      object Open1: TMenuItem
        Caption = 'Open'
        ShortCut = 113
        OnClick = Open1Click
      end
      object Saveas1: TMenuItem
        Caption = 'Save as'
        ShortCut = 114
        OnClick = Saveas1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        ShortCut = 32856
        OnClick = Exit1Click
      end
    end
    object Program1: TMenuItem
      Caption = 'Program'
      object Execute1: TMenuItem
        Caption = 'Execute'
        OnClick = Execute1Click
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object Actor1: TMenuItem
        Caption = 'Actor'
        object FamilyName1: TMenuItem
          Caption = 'Family Name'
          OnClick = FamilyName1Click
        end
        object Group1: TMenuItem
          Caption = 'Group'
          OnClick = Group1Click
        end
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 552
    Top = 328
  end
  object SaveDialog1: TSaveDialog
    Left = 592
    Top = 328
  end
end
