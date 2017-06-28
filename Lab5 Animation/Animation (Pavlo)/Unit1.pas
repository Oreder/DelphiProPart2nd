unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  DrawObject = record
    X: Integer;
    Y: Integer;
  end;
  TForm1 = class(TForm)
    Image1: TImage;
    btnStart: TButton;
    Timer1: TTimer;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure btnStartClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure MouseCoor(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  PartX, PartY: Integer;
  RoadLine: DrawObject;
  Car1, Car2: DrawObject;
  Distance: DrawObject;
  I: Integer;
  J: Integer;
  K: Integer;
  L: Integer;
  MX,MY: Integer;
  Car2Color: TColor;
  TurnOver, EnableMouse: Boolean;

implementation

{$R *.dfm}

procedure TForm1.btnStartClick(Sender: TObject);
begin
  timer1.Enabled := true;
end;

procedure Compute;
begin
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if (Turnover) and (K<>12) then
  begin
    K := K+1;
    L := L+1;
  end
  else
  if (not Turnover) and (K<>0) then
  begin
    K := K-1;
    L := L-1;
  end;
  I := I + 1;
  if I mod 6 = 0 then
    I := 0;
  J := J + 1;
  if (J mod 50 = 0) or (Car2Color = (RGB(0,0,0))) then
  begin
    J := 0;
    Car2Color := RGB(128,Random(128)+50,Random(50)+50);
  end;
  Image1.Picture := nil;
  with Image1.Canvas do
  begin
    PartX := Image1.Width div 20;
    PartY := Image1.Height div 20;
    Moveto(4*PartX, 0);
    Lineto(4*PartX, Height);
    Moveto(16*PartX, 0);
    Lineto(16*PartX, Height);
    Brush.Color := clgreen;
    FloodFill(2*PartX, 1, clwhite, fssurface);
    FloodFill(18*PartX, 1, clwhite, fssurface);
    brush.Color := clgray;
    FloodFill(14*PartX, 1, clwhite, fssurface);

    RoadLine.X := 10*PartX;
    RoadLine.Y := 3*PartY+50*I;
    brush.color := clyellow;
    pen.color := clolive;
    Rectangle(RoadLine.X-5, RoadLine.Y-60, RoadLine.X+5, RoadLine.Y+60);
    RoadLine.X := 10*PartX;
    RoadLine.Y := 17*PartY+50*I;
    Rectangle(RoadLine.X-5, RoadLine.Y-60, RoadLine.X+5, RoadLine.Y+60);
    RoadLine.X := 10*PartX;
    RoadLine.Y := -11*PartY+50*I;
    Rectangle(RoadLine.X-5, RoadLine.Y-60, RoadLine.X+5, RoadLine.Y+60);

    Distance.X := Abs(Car1.X - Car2.X);
    Distance.Y := Abs(Car2.Y - Car1.Y);
    if ((Distance.X < 80) and (Distance.Y < 140)) and (not ((Car1.X = 0) and (Car1.Y = 0))) then
    begin
      Timer1.Enabled := false;
      Brush.Color := clWhite;
      Pen.Color := clBlack;
      ShowMessage('Crashed!');
      EnableMouse := false;
      Timer1.Enabled := True;
    end;

    Car1.X := 14*PartX+Sqr(K)+Round(Sqrt(2*K+1)+Sin(L));
    Car1.Y := 14*PartY + Round(Pi*Sqrt(2*K+1)/4*Sin(I))-8*K;
    if EnableMouse then
    begin
      Car1.X := MX;
      Car1.Y := MY;
    end;

    brush.color := RGB(20,205,45);
    pen.color := clblack;
    Rectangle(Car1.X-40, Car1.Y-70, Car1.X+40, Car1.Y+70);
    brush.color := clBlue;
    pen.color := clblack;
    Rectangle(Car1.X-36, Car1.Y+30, Car1.X+36, Car1.Y+40);
    Rectangle(Car1.X-40, Car1.Y-15, Car1.X+40, Car1.Y-40);
    brush.color := clRed;
    Rectangle(Car1.X-40, Car1.Y+65, Car1.X-15, Car1.Y+70);
    Rectangle(Car1.X+40, Car1.Y+65, Car1.X+15, Car1.Y+70);

    Car2.X := 6*PartX;
    Car2.Y := -9*PartY + 100*J;
    brush.color := Car2Color;
    pen.color := clblack;
    Rectangle(Car2.X-40, Car2.Y-70, Car2.X+40, Car2.Y+70);
    brush.color := clBlue;
    pen.color := clblack;
    Rectangle(Car2.X-36, Car2.Y-30, Car2.X+36, Car2.Y-40);
    Rectangle(Car2.X-40, Car2.Y+15, Car2.X+40, Car2.Y+40);
    brush.color := clYellow;
    Rectangle(Car2.X-40, Car2.Y+65, Car2.X-15, Car2.Y+70);
    Rectangle(Car2.X+40, Car2.Y+65, Car2.X+15, Car2.Y+70);
  end;
  Distance.X := Abs(Car1.X - Car2.X);
  Distance.Y := Abs(Car2.Y - Car1.Y);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  timer1.Enabled := false;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if Turnover = False then
    Turnover := True
  else
    Turnover := False;
end;

procedure TForm1.MouseCoor(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (X > 5*PartX) and (X < 15*PartX) then
    MX := X;
  MY := Y;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if not EnableMouse then
    EnableMouse := True
  else
    EnableMouse := False;
end;

end.
