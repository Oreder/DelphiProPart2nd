unit UnitAP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
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
  Poit = record
    X,Y: Integer;
  end;

  AK = array[1..4] of Poit;


procedure TForm1.Button1Click(Sender: TObject);
procedure Flip(T: Real; Z: Poit; var P: AK);
var
  I, R: Integer;
begin
  for I := 1 to 4 do
    begin
      R := P[I].X;
      P[I].X := Z.X + Round((R-Z.X)*Cos(T) + (P[I].Y-Z.Y)*Sin(T));
      P[I].Y := Z.Y + Round((P[I].Y-Z.Y)*Cos(T) - (R-Z.X)*Sin(T));
    end;
end;

var
  I, J: Integer;
  Z, C: Poit;
  P, M, D: AK;
  T: array[1..30] of Real;
begin
  Z.X := 21; Z.Y := 280;
  C.X := 75; C.Y := 250;
  for J := 1 to 15 do
    T[J] := J*Pi/30 - Pi/3;
  for J := 16 to 30 do
    T[J] := T[31-J];

  I := 0; J := 1;
  repeat
  with Canvas do
  begin
    Z.X := 21+I; Z.Y := 280;
    C.X := 75+I; C.Y := 250;

    P[1].X := Z.X; P[1].Y := Z.Y - 19;
    P[2].X := Z.X; P[2].Y := Z.Y + 19;
    P[3].X := Z.X - 19; P[3].Y := Z.Y;
    P[4].X := Z.X + 19; P[4].Y := Z.Y;

    Pen.Width := 2; Pen.Color := clBlack;
    MoveTo(1, 301); LineTo(695, 301);
    // up

    D[1].X := C.X + 5; D[1].Y := C.Y + 3;
    D[2].X := C.X + 60; D[2].Y := C.Y - 60;
    D[3].X := C.X + 53; D[3].Y := C.Y - 70;
    D[4].X := C.X - 5; D[4].Y := C.Y - 10;


    Flip(T[J], C, D);

    MoveTo(D[1].X, D[1].Y); LineTo(D[2].X, D[2].Y);
    LineTo(D[3].X, D[3].Y); LineTo(D[4].X, D[4].Y);
    //LineTo(D[1].X, D[1].Y);

    Pen.Width := 2;
    Ellipse(30+I, 290, 120+I, 230);
    Brush.Color := clActiveCaption;
    Rectangle(30+I, 299, 125+I, 260);

    MoveTo(30+I, 260); LineTo(120+I, 260);
    Brush.Color := clGreen;
    FloodFill(40+I, 250, clBlack, fsBorder);

    // under
    Brush.Color := clActiveCaption;
    Ellipse(1+I, 260, 41+I, 300); Ellipse(111+I, 260, 151+I, 300);
    MoveTo(21+I, 300); LineTo(131+I, 300);
    MoveTo(21+I, 260); LineTo(131+I, 260);

    Pen.Width := 1;
    Flip(-J*Pi/12, Z, P);
    M[1].X := P[1].X + 110; M[1].Y := P[1].Y;
    M[2].X := P[2].X + 110; M[2].Y := P[2].Y;
    M[3].X := P[3].X + 110; M[3].Y := P[3].Y;
    M[4].X := P[4].X + 110; M[4].Y := P[4].Y;

    MoveTo(P[1].X, P[1].Y); LineTo(P[2].X, P[2].Y);
    MoveTo(P[3].X, P[3].Y); LineTo(P[4].X, P[4].Y);
    MoveTo(M[1].X, M[1].Y); LineTo(M[2].X, M[2].Y);
    MoveTo(M[3].X, M[3].Y); LineTo(M[4].X, M[4].Y);

    Pen.Color := clBlack;
    Brush.Color := clYellow; Ellipse(50+I, 275, 60+I, 285);
    Ellipse(70+I, 275, 80+I, 285); Ellipse(90+I, 275, 100+I, 285);
    Brush.Color := clLtGray;
    FloodFill(40+I, 290, clBlack, fsBorder);

    Sleep(50);
    I := I+5;
    Inc(J);
    if J = 30 then
      J := 1;

    Brush.Color := clActiveCaption;
    Rectangle(1, 1, 800, 700);
  end;
  until I > 750;
end;

end.
