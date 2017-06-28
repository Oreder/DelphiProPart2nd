unit UnitAnime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ExtCtrls;

type
  TAnime = class(TForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Draw;
    procedure Car(Sender: TObject; X, Y: Integer);
    procedure BalloonFly(Sender: TObject; X, Y: Integer);
    procedure Explosion(X, Y: Integer);
    procedure Fall(Sender: TObject; X, Y: Integer);
    procedure GPN(Sender: TObject; X, Y: Integer);
    procedure Flip(Sender: TObject; X, Y: Integer);
    procedure BallNoFlip(Sender: TObject; X, Y: Integer);
    procedure RedCrow(Sender: TObject; X, Y: Integer);
    procedure First(Sender: TObject);
    procedure Second(X, Y: Integer);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Anime: TAnime;

implementation

{$R *.dfm}



type
  TPoint = record
    X, Y: Integer;
  end;


procedure TAnime.Draw;
begin
  with Canvas do
  begin

  end;
end;


  (* car *)
procedure TAnime.Car(Sender: TObject; X, Y: Integer);    // Y = 530;
begin
  with Canvas do
  begin
    Pen.Width := 1; Pen.Color := clBlack;
    Brush.Color := clTeal;
    Ellipse(10+X, Y, 35+X, Y-25); Ellipse(60+X, Y, 85+X, Y-25);

    MoveTo(2+X, Y-50); LineTo(2+X, Y-70);
    MoveTo(94+X, Y-50); LineTo(94+X, Y-70);

    Rectangle(2+X, Y-50, 95+X, Y-25);
    Brush.Color := clRed;
    FloodFill(3+X, Y-30, clBlack, fsBorder);
  end;
end;



(* balloon *)
procedure TAnime.BalloonFly(Sender: TObject; X, Y: Integer);
begin
  with Canvas do
  begin
    Pen.Width := 2; Pen.Color := clBlack;
    ARC(35+X, 205-Y, 100+X, 320-Y, 100+X, 315-Y, 35+X, 315-Y);
    MoveTo(90+X, 302-Y); LineTo(43+X, 302-Y);

    Pen.Width := 1;
    MoveTo(67+X, 350-Y); LineTo(45+X, 302-Y);
    MoveTo(67+X, 350-Y); LineTo(60+X, 302-Y);
    MoveTo(67+X, 350-Y); LineTo(74+X, 302-Y);
    MoveTo(67+X, 350-Y); LineTo(88+X, 302-Y);

    Brush.Color := clGreen;
    FloodFill(75+X, 290-Y, clBlack, fsBorder);

    Brush.Color := clMaroon;
    Rectangle(52+X, 350-Y, 82+X, 380-Y);
  end;
end;


(* explosion *)
procedure TAnime.Explosion(X, Y: Integer);		 // balloon:   X := 70; Y := 180;
begin
  with Canvas do
    begin
      Pen.Color := clBlue; Pen.Width := 1;
      MoveTo(100+X, 120+Y); LineTo(120+X, 080+Y);
      LineTo(060+X, 060+Y); LineTo(110+X, 055+Y);
      LineTo(100+X, 040+Y); LineTo(145+X, 050+Y);
      LineTo(160+X, 020+Y); LineTo(160+X, 050+Y);
      LineTo(190+X, 055+Y); LineTo(170+X, 076+Y);
      LineTo(185+X, 130+Y); LineTo(140+X, 095+Y);
      LineTo(100+X, 120+Y);

      Brush.Color := clYellow;
      FloodFill(140+X, 80+Y, clBlue, fsBorder);
    end;
end;



procedure TAnime.Fall(Sender: TObject; X, Y: Integer); 		// fall from X := 70; Y := 180;
begin
  with Canvas do
    begin
      Pen.Width := 1; Pen.Color := clBlack;
      MoveTo(67+X, 350-Y); LineTo(50+X, 302-Y);
      MoveTo(67+X, 350-Y); LineTo(61+X, 295-Y);
      MoveTo(67+X, 350-Y); LineTo(74+X, 310-Y);
      MoveTo(67+X, 350-Y); LineTo(83+X, 311-Y);

      Brush.Color := clMaroon;
      Rectangle(52+X, 350-Y, 82+X, 380-Y);
    end;
end;


{ BallNoFlip: 291, 343 }

  (* don bay *)
procedure TAnime.GPN(Sender: TObject; X, Y: Integer);			// X: 91; Y: 52
begin
  with Canvas do
  begin
    Pen.Width := 3; Pen.Color := clBlack;
    MoveTo(X, 400-Y); LineTo(200+X, 420-Y); LineTo(222+X, 413-Y);

    Pen.Width := 2;
    Brush.Color := clMaroon; MoveTo(110+X, 410-Y);
    LineTo(90+X, 420-Y); LineTo(130+X, 420-Y); LineTo(110+X, 410-Y);
    FloodFill(110+X, 415-Y, clBlack, fsBorder);

    MoveTo(X-20, 421-Y); LineTo(250+X, 421-Y);
  end;
end;



procedure TAnime.FormCreate(Sender: TObject);
begin
  with Canvas do
  begin
    Brush.Color := clSkyBlue;
    Rectangle(0, 0, 800, 600);
    Pen.Width := 2; Pen.Color := clBlack;
    MoveTo(1, 530); LineTo(850, 530);
  end;
end;



  (* flip *)
procedure TAnime.Flip(Sender: TObject; X, Y: Integer);
var
  Angle: Real;
  I, R: Integer;
  P: array[1..4] of TPoint;
begin
  with Canvas do
    begin
      P[1].X := X; P[1].Y := Y-25;
      P[2].X := X; P[2].Y := Y+25;
      P[3].X := X-25; P[3].Y := Y;
      P[4].X := X+25; P[4].Y := Y;

      Angle := - Pi/4;
      Pen.Width := 1; Pen.Color := clBlack;
      Brush.Color := clGreen; Ellipse(X-25, Y-25, X+25, Y+25);

        { Flip }
      for I := 1 to 4 do
        begin
          R := P[I].X;
          P[I].X := X + Round((R - X)*Cos(Angle) + (P[I].Y - Y)*Sin(Angle));
          P[I].Y := Y + Round((P[I].Y - Y)*Cos(Angle) - (R - X)*Sin(Angle));
        end;

      Pen.Width := 2;
      MoveTo(P[1].X, P[1].Y); LineTo(P[2].X, P[2].Y);     // main points
      MoveTo(P[3].X, P[3].Y); LineTo(P[4].X, P[4].Y);

      Brush.Color := clYellow; Ellipse(X-10, Y-10, X+10, Y+10);
    end;
end;


	(* first time: X = 300; Y = 214 *)
procedure TAnime.BallNoFlip(Sender: TObject; X, Y: Integer);
begin
  with Canvas do
    begin
      Pen.Width := 1; Pen.Color := clBlack;
      Brush.Color := clGreen; Ellipse(X-25, Y-25, X+25, Y+25);

      Pen.Width := 2;
      MoveTo(X-25, Y); LineTo(X+25, Y);    
      MoveTo(X, Y-25); LineTo(X, Y+25);

      Brush.Color := clYellow; Ellipse(X-10, Y-10, X+10, Y+10);
    end;
end;



procedure TAnime.RedCrow(Sender: TObject; X, Y: Integer);
begin
  with Canvas do
    begin
      Pen.Width := 1; Pen.Color := clBlack;
      MoveTo(X, Y); LineTo(X+50, Y-15);
      LineTo(X+30, Y-3); LineTo(X+120, Y-3);
      LineTo(X+125, Y-5); LineTo(X+123, Y);
      LineTo(X+125, Y+5); LineTo(X+120, Y+2);
      LineTo(X+30, Y+2); LineTo(X+50, Y+15);
      LineTo(X, Y);

      Brush.Color := clRed;
      if X > 200 then
        FloodFill(X+3, Y, clBlack, fsBorder)
      else
        FloodFill(X+122, Y, clBlack, fsBorder);
    end;
end;


procedure TAnime.First(Sender: TObject);
begin
  GPN(Sender, 91, 52);
  BallNoFlip(Sender, 291, 343);
end;


procedure TAnime.Second(X, Y: Integer);			// X: 91; Y: 52
begin
  with Canvas do
  begin
    Pen.Width := 3; Pen.Color := clBlack;
    MoveTo(X-20, 420-Y); LineTo(200+X, 400-Y); LineTo(218+X, 396-Y);

    Pen.Width := 2;
    Brush.Color := clMaroon; MoveTo(110+X, 410-Y);
    LineTo(90+X, 420-Y); LineTo(130+X, 420-Y); LineTo(110+X, 410-Y);
    FloodFill(110+X, 415-Y, clBlack, fsBorder);
    MoveTo(X-20, 421-Y); LineTo(250+X, 421-Y);

    Pen.Width := 1; MoveTo(X-10, 418-Y);
    LineTo(X-12, 393-Y); LineTo(X+18, 390-Y); LineTo(X+20, 416-Y);
    Brush.Color := clMaroon;
    FloodFill(X+1, 410-Y, clBlack, fsBorder);
  end;
end;


procedure TAnime.Button1Click(Sender: TObject);
var
  XB, YB, XC, YC, XR, YR, YF, XN, YN: Integer;
begin
  XB := 10; YB := 0;
  XC := 10; YC := 530;
  XR := 500; YR := 50;
  repeat
    BalloonFly(Sender, XB, YB);
    Car(Sender, XC, YC);
    RedCrow(Sender, XR, YR);
    First(Sender);
    Sleep(100);
    FormCreate(Sender);

    XB := XB + 1; YB := YB + 7;
    XC := XC + 5;
    XR := XR - 13;
  until (XR < 100);

  First(Sender);
  BalloonFly(Sender, XB, YB);
  RedCrow(Sender, XR, YR);
  Explosion(10, -25);
  Explosion(10, -25);
  XC := XC + 5; Car(Sender, XC, YC);

  First(Sender);
  BalloonFly(Sender, XB, YB);
  RedCrow(Sender, XR, YR);
  Explosion(10, -25);
  XC := XC + 5; Car(Sender, XC, YC);   // XB: 41

  YF := YB;
  repeat
    XC := XC + 5; Car(Sender, XC, YC);
    Fall(Sender, XB, YF);
    First(Sender);
    Sleep(100);
    FormCreate(Sender);
    YF := YF - 6;
  until YF < 27;                      // XC: 375  YF: 337;

  XN := 295; YN := 320;
  repeat
    Second(91, 52);
    XC := XC + 5; Car(Sender, XC, YC);
    BallNoFlip(Sender, XN, YN);
    Sleep(30); Flip(Sender, XN, YN);
    Sleep(100);
    FormCreate(Sender);
    XN := XN + 5; YN := YN - 2;
  until XN > 375;

  Inc(XN); BallNoFlip(Sender, XN, YN);
  Sleep(30); Flip(Sender, XN, YN);

  repeat
    Second(91, 52);
    XC := XC + 5; Car(Sender, XC, YC);
    BallNoFlip(Sender, XN, YN);
    Sleep(30); Flip(Sender, XN, YN);

    Sleep(100);
    FormCreate(Sender);
    XN := XN + 4; YN := YN + 1;
  until XC > 700;

  repeat
    Second(91, 52);
    XC := XC - 3; Car(Sender, XC, YC);
    BallNoFlip(Sender, XN, YN);
    Sleep(30); Flip(Sender, XN, YN);
    Sleep(100);
    FormCreate(Sender);
    XN := XN + 2; YN := YN + 4;
  until XC < 636;

  repeat
    Second(91, 52);
    XC := XC - 2; Car(Sender, XC, YC);
    BallNoFlip(Sender, XN, YN);
    Sleep(30); Flip(Sender, XN, YN);
    Sleep(100);
    FormCreate(Sender);
    XN := XN + 2; YN := YN + 6;
  until XC < 629;

  repeat
    Second(91, 52);
    XC := XC - 2; Car(Sender, XC, YC);
    BallNoFlip(Sender, XN, YN);
    Flip(Sender, XN, YN);
    Sleep(100);
    FormCreate(Sender);
  until XC < 625;

  Second(91, 52);
  Car(Sender, XC, YC);
  BallNoFlip(Sender, XN, YN);
end;

end.
