unit UnitGraphic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    Saveas1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Program1: TMenuItem;
    Execute1: TMenuItem;
    Help1: TMenuItem;
    Actor1: TMenuItem;
    FamilyName1: TMenuItem;
    Group1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Image: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Radio1: TRadioButton;
    Radio2: TRadioButton;
    procedure Exit1Click(Sender: TObject);
    procedure Saveas1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure FamilyName1Click(Sender: TObject);
    procedure Group1Click(Sender: TObject);
    procedure Execute1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

type
  Fun = function(X: Real): Real;

var
  Xmin, XMax: Real;
  F: Fun;


function F1(X: Real): Real;
begin
  F1 := X*sin(X);
end;

function F2(X: Real): Real;
begin
  F2 := 2*X*X - 3*X + 1;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Execute1Click(Sender: TObject);
begin
  Label1.Visible := True;
  Label2.Visible := True;
  Label3.Visible := True;
  Edit1.Visible := True;
  Edit2.Visible := True;
  Button1.Visible := True;
  Button2.Visible := True;
  Radio1.Visible := True;
  Radio2.Visible := True;
  with Image.Canvas do
    begin
      Pen.Width := 2;
      Pen.Color := clBlack;
      Rectangle(0, 0, 500, 300);
    end;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FamilyName1Click(Sender: TObject);
begin
  ShowMessage('Nguyen Duc Binh');
end;

procedure TForm1.Group1Click(Sender: TObject);
begin
  ShowMessage('IU 7-21');
end;

procedure TForm1.Open1Click(Sender: TObject);
begin
  OpenDialog1.Execute;
end;

procedure TForm1.Saveas1Click(Sender: TObject);
begin
  SaveDialog1.Execute;
end;

procedure MiMa(X1, X2: Real; var Min, D: Real);
var
  I: Integer;
  X, R, Z1, Z2: Real;
begin
  R := (X2 - X1)/200;
  Z1 := F(X1); Z2 := Z1;

  for I := 1 to 200 do
    begin
      X := X1 + I*R;
      if F(X) < Z1 then
        Z1 := F(X);
      if F(X) > Z2 then
        Z2 := F(X);
    end;
  Min := Z1; D := Z2 - Z1;
end;

procedure TForm1.Button1Click(Sender: TObject);
const
  X0 = 0;
var
  X1, X2, Min, D: Real;
  X, Y: Real;
  I: Integer;
begin
  with Image.Canvas do
    begin
      Pen.Color := clWhite;
      Rectangle(1, 1, 499, 299);
    end;
  X1 := StrToFloat(Edit1.Text);
  X2 := StrToFloat(Edit2.Text);
  if Radio1.Checked then
    F := F1
  else
    F := F2;
  Mima(X1, X2, Min, D);

  with Image.Canvas do
    begin
      Pen.Color := clMaroon;
      Pen.Width := 2;
      Y := (F(X1) - Min)/D;
      MoveTo(20, 275 - Round(Y*250));
      for I := 1 to 450 do
        begin
          X := X1 + I * (X2 - X1)/450;
          Y := (F(X) - Min)/D;
          LineTo(20 + I, 275 - Round(Y*250));
        end;
    end;
end;


end.
