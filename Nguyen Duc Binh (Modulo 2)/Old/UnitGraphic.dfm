object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Graphic'
  ClientHeight = 386
  ClientWidth = 516
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
    Left = 17
    Top = 324
    Width = 22
    Height = 13
    Caption = 'Xmin'
    Visible = False
  end
  object Label2: TLabel
    Left = 96
    Top = 324
    Width = 26
    Height = 13
    Caption = 'Xmax'
    Visible = False
  end
  object Label3: TLabel
    Left = 186
    Top = 324
    Width = 41
    Height = 13
    Caption = 'Function'
    Visible = False
  end
  object Button1: TButton
    Left = 335
    Top = 328
    Width = 89
    Height = 48
    Caption = 'Show Graphic'
    TabOrder = 0
    Visible = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 430
    Top = 328
    Width = 75
    Height = 48
    Caption = 'Exit'
    TabOrder = 1
    Visible = False
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 16
    Top = 344
    Width = 64
    Height = 21
    TabOrder = 2
    Visible = False
  end
  object Edit2: TEdit
    Left = 96
    Top = 343
    Width = 65
    Height = 21
    TabOrder = 3
    Visible = False
  end
  object Radio1: TRadioButton
    Left = 185
    Top = 343
    Width = 113
    Height = 17
    Caption = 'F(X) = X*sin(X)'
    Checked = True
    TabOrder = 4
    TabStop = True
    Visible = False
  end
  object Radio2: TRadioButton
    Left = 185
    Top = 366
    Width = 144
    Height = 17
    Caption = 'F(X) = 2*X*X - 3*X + 1'
    TabOrder = 5
    Visible = False
  end
  object MainMenu1: TMainMenu
    Left = 520
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
    Left = 560
  end
  object SaveDialog1: TSaveDialog
    Left = 600
  end
end
