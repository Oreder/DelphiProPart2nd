unit UnitSearch02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Image1: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    //procedure TriDraw(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const R = 30;

type
  TPoint = record
    X: LongInt;
    Y: LongInt;
  end;

  Triangle = array[1..3] of TPoint;
  Cir = array of TPoint;
  Tri = array of Triangle;

var
  Tam: Tri;
  Cent: Cir;


procedure TForm1.FormCreate(Sender: TObject);
begin
  with Image1.Canvas do
  begin
    Pen.Color := clWhite;
    Rectangle(0,0,400,400);
  end;
  SetLength(Tam, 0);
  SetLength(Cent, 0);
end;


procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Image1.Canvas.Pen.Color := clBlack;

  if Button = mbLeft then
  begin
    SetLength(Cent, Length(Cent) + 1);
    Cent[High(Cent)].X := X;
    Cent[High(Cent)].Y := Y;

    Image1.Canvas.Ellipse(X-R, Y-R, X+R, Y+R);
  end;

  if Button = mbRight then
  begin
    SetLength(Tam, Length(Tam) + 1);
    Tam[High(Tam)][1].X := X-5; Tam[High(Tam)][1].Y := Y-5;
    Tam[High(Tam)][1].X := X+5; Tam[High(Tam)][1].Y := Y+5;
    Tam[High(Tam)][1].X := X-4; Tam[High(Tam)][1].Y := Y+6;

    with Image1.Canvas do
    begin
      MoveTo(X-5, Y-5);
      LineTo(X+5, Y+5);
      LineTo(X-4, Y+6);
      LineTo(X-5, Y-5);
    end;
  end;
end;


function Meet(C: TPoint; Tr: Triangle): Boolean;
  function F(C, P: TPoint): Real;
  begin
    F := Sqrt(Sqr(P.X - C.X) + Sqr(P.Y - C.Y));
  end;
begin
  Meet := True;
  if ((F(C, Tr[1]) < R) and (F(C, Tr[2]) < R) and (F(C, Tr[3]) < R))
  or ((F(C, Tr[1]) > R) and (F(C, Tr[2]) > R) and (F(C, Tr[3]) > R)) then
    Meet := False;
end;

function Cal(C: TPoint): Integer;
var
  S, I: Integer;
begin
  S := 0;
  for I := 0 to High(Tam) do
    if Meet(C, Tam[I]) then
      Inc(S);
  Cal := S;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  M: TPoint;
  I, Max, S: Integer;
begin
  M := Cent[0];
  Max := Cal(M);
  for I := 1 to High(Cent) do
    begin
      S := Cal(Cent[I]);
      if S > Max then
      begin
        Max := S;
        M := Cent[I];
      end;
    end;

  if Max = 0 then
    ShowMessage('NO TRIANGLE')
  else
  with Image1.Canvas do
  begin
    Pen.Width := 1;
    Pen.Color := clRed;
    Ellipse(M.X - R, M.Y - R, M.X + R, M.Y + R);
  end;
end;


procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  FormCreate(Sender);
end;

end.
