unit EleventhOfSeptember;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    Timer4: TTimer;
    Timer5: TTimer;
    Timer6: TTimer;
    Timer7: TTimer;
    Timer8: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure Timer6Timer(Sender: TObject);
    procedure Timer7Timer(Sender: TObject);
    procedure Timer8Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  I1, I2, J1, J2, K, L: Integer;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  with Image1.Canvas do
    begin
      Pen.Color := clSkyBlue;
      Pen.Width := 1;
      Brush.Color := clSkyBlue;
      Brush.Style := bsSolid;
      Rectangle(0, 0, 800, 600);
      Pen.Color := clBlack;
      Brush.Color := clGray;
      Rectangle(275, 200, 375, 600);
      Rectangle(425, 200, 525, 600);
      Brush.Color := clWhite;
      I1 := -100;
      I2 := 900;
      J1 := 250;
      J2 := 350;
      K := 725;
      L := 100;
      Timer1.Enabled := True;
    end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Randomize;
  if I1 < 275 then
    with Image1.Canvas do
      begin
        Pen.Color := clSkyBlue;
        Pen.Width := 1;
        Brush.Color := clWhite;
        Rectangle(I1, 300, I1 + 75, 315);
        MoveTo(I1, 300);
        LineTo(I1, 275);
        LineTo(I1 + 12, 300);
        LineTo(I1, 300);
        MoveTo(I1 + 74, 314);
        LineTo(I1 + 99, 314);
        LineTo(I1 + 74, 300);
        LineTo(I1 + 74, 314);
        MoveTo(I1 + 25, 310);
        LineTo(I1 + 50, 310);
        LineTo(I1 + 25, 340);
        LineTo(I1 + 25, 310);
        I1 := I1 + 1;
        Pen.Color := clBlack;
        Rectangle(I1, 300, I1 + 75, 315);
        MoveTo(I1, 300);
        LineTo(I1, 275);
        LineTo(I1 + 12, 300);
        LineTo(I1, 300);
        MoveTo(I1 + 74, 314);
        LineTo(I1 + 99, 314);
        LineTo(I1 + 74, 300);
        LineTo(I1 + 74, 314);
        MoveTo(I1 + 25, 310);
        LineTo(I1 + 50, 310);
        LineTo(I1 + 25, 340);
        LineTo(I1 + 25, 310);
        FloodFill(I1 + 5, 290, clBlack, fsBorder);
        FloodFill(I1 +  26, 315, clBlack, fsBorder);
        FloodFill(I1 +  80, 310, clBlack, fsBorder);
        Pen.Color := clWhite;
        MoveTo(I1 + 26, 314);
        LineTo(I1 + 47, 314);
        if I1 = 175 then
          begin
            Timer2.Enabled := True;
            Timer3.Enabled := True;
          end;
        if I1 > 250 then
          begin
            Timer4.Enabled := True;
            if I1 = 251 then
              Pen.Color := clBlack
            else
              Pen.Color := clGray;
            MoveTo(I1 + 24, 315);
            LineTo(I1 + 24, 341);
          end;
      end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var
  Blast1, Blast2: Integer;
begin
  Randomize;
  with Image1.Canvas do
    begin
      Pen.Color := RGB(255, Random(256), 0);
      Pen.Width := 1;
      Brush.Color := RGB(255, Random(256), 0);
      Brush.Style := bsSolid;
      Blast1 := Random(99);
      Blast2 := Random(99);
      Ellipse(Blast1 + 275, Blast2 + 250, Blast1 + 280, Blast2 + 255);
    end;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
var
  Steam1, Steam2: Integer;
begin    
  Randomize;
  with Image1.Canvas do
    begin
      Pen.Color := clBlack;
      Pen.Width := 1;
      Brush.Color := clWhite;
      Brush.Style := bsClear;
      Steam1 := Random(49);
      Steam2 := 50 + Random(49);
      Ellipse(Steam1 + 250, J1, Steam1 + 300, J1 + 20);
      Ellipse(Steam2 + 250, J1, Steam2 + 300, J1 + 20);
      if J1 > 0 then
        J1 := J1 - 5
      else
        J1 := 250;
    end;
end;

procedure TForm1.Timer4Timer(Sender: TObject);
begin
  Randomize;
  if I2 > 525 then
    with Image1.Canvas do
      begin
        Pen.Color := clSkyBlue;
        Pen.Width := 1;
        Brush.Color := clWhite;
        Rectangle(I2, 400, I2 - 75, 415);
        MoveTo(I2 - 1, 400);
        LineTo(I2 - 1, 375);
        LineTo(I2 - 13, 400);
        LineTo(I2 - 1, 400);
        MoveTo(I2 - 75, 414);
        LineTo(I2 - 100, 414);
        LineTo(I2 - 75, 400);
        LineTo(I2 - 75, 414);
        MoveTo(I2 - 25, 410);
        LineTo(I2 - 50, 410);
        LineTo(I2 - 25, 440);
        LineTo(I2 - 25, 410);
        I2 := I2 - 1;
        Pen.Color := clBlack;
        Rectangle(I2, 400, I2 - 75, 415);
        MoveTo(I2 - 1, 400);
        LineTo(I2 - 1, 375);
        LineTo(I2 - 13, 400);
        LineTo(I2 - 1, 400);
        MoveTo(I2 - 75, 414);
        LineTo(I2 - 100, 414);
        LineTo(I2 - 75, 400);
        LineTo(I2 - 75, 414);
        MoveTo(I2 - 25, 410);
        LineTo(I2 - 50, 410);
        LineTo(I2 - 25, 440);
        LineTo(I2 - 25, 410);
        FloodFill(I2 - 5, 390, clBlack, fsBorder);
        FloodFill(I2 -  26, 415, clBlack, fsBorder);
        FloodFill(I2 -  80, 410, clBlack, fsBorder);
        Pen.Color := clWhite;
        MoveTo(I2 - 26, 414);
        LineTo(I2 - 47, 414);
        if I2 = 625 then
          begin
            Timer5.Enabled := True;
            Timer6.Enabled := True;
            Timer7.Enabled := False;
            Timer8.Enabled := True;
          end;
        if I2 < 549 then
          begin
            if I2 = 548 then
              Pen.Color := clBlack
            else
              Pen.Color := clGray;
            MoveTo(I2 - 24, 415);
            LineTo(I2 - 24, 441);
          end;
      end;
end;

procedure TForm1.Timer5Timer(Sender: TObject);
var
  Blast1, Blast2: Integer;
begin
  Randomize;
  with Image1.Canvas do
    begin
      Pen.Color := RGB(255, Random(256), 0);
      Pen.Width := 1;
      Brush.Color := RGB(255, Random(256), 0);
      Brush.Style := bsSolid;
      Blast1 := Random(99);
      Blast2 := Random(99);
      Ellipse(Blast1 + 425, Blast2 + 350, Blast1 + 430, Blast2 + 355);
    end;
end;

procedure TForm1.Timer6Timer(Sender: TObject);
var
  Steam1, Steam2: Integer;
begin    
  Randomize;
  with Image1.Canvas do
    begin
      Pen.Color := clBlack;
      Pen.Width := 1;
      Brush.Color := clWhite;
      Brush.Style := bsClear;
      Steam1 := Random(49);
      Steam2 := 50 + Random(49);
      Ellipse(Steam1 + 400, J2, Steam1 + 450, J2 + 20);
      Ellipse(Steam2 + 400, J2, Steam2 + 450, J2 + 20);
      if J2 > 0 then
        J2 := J2 - 5
      else
        J2 := 350;
    end;
end;

procedure Sun(X, Y: Integer);
begin
  with Form1.Image1.Canvas do
    begin
      Ellipse(X - 25, Y - 25, X + 25, Y + 25);
      MoveTo(X - 40, Y);
      LineTo(X - 60, Y);
      MoveTo(X + 40, Y);
      LineTo(X + 60, Y);
      MoveTo(X, Y - 40);
      LineTo(X, Y - 60);
      MoveTo(X, Y + 40);
      LineTo(X, Y + 60);
      MoveTo(X - 35, Y + 20);
      LineTo(X - 55, Y + 30);
      MoveTo(X + 35, Y + 20);
      LineTo(X + 55, Y + 30);
      MoveTo(X - 35, Y - 20);
      LineTo(X - 55, Y - 30);
      MoveTo(X + 35, Y - 20);
      LineTo(X + 55, Y - 30);
      MoveTo(X + 20, Y - 35);
      LineTo(X + 30, Y - 55);
      MoveTo(X - 20, Y + 35);
      LineTo(X - 30, Y + 55);
      MoveTo(X + 20, Y + 35);
      LineTo(X + 30, Y + 55);
      MoveTo(X - 20, Y - 35);
      LineTo(X - 30, Y - 55);
      Pen.Color := clBlack;
      Pen.Width := 4;
      MoveTo(X - 10, Y - 10);
      LineTo(X - 10, Y - 10);
      MoveTo(X + 10, Y - 10);
      LineTo(X + 10, Y - 10);    
      Pen.Width := 2;
      if I1 < 175 then
        Arc(X - 10, Y + 5, X + 10, Y + 15, X - 20, Y + 10, X + 20, Y + 10)
      else
        Arc(X - 10, Y + 5, X + 10, Y + 15, X + 20, Y + 10, X - 20, Y + 10);
    end;
end;

procedure TForm1.Timer7Timer(Sender: TObject);
begin
  with Image1.Canvas do
    begin
      if (K > 625) and (L = 100) then
        begin
          Pen.Color := clSkyBlue;
          Pen.Width := 1;
          Brush.Color := clSkyBlue;
          Brush.Style := bsSolid;
          Pen.Width := 5;
          Sun(K, L);
          K := K - 1;
          Pen.Color := clYellow;
          Pen.Width := 1;
          Brush.Color := clYellow;
          Brush.Style := bsSolid;
          Pen.Width := 5;
          Sun(K, L);
        end;
      if (L < 200) and (K = 625) then
        begin
          Pen.Color := clSkyBlue;
          Pen.Width := 1;
          Brush.Color := clSkyBlue;
          Brush.Style := bsSolid;
          Pen.Width := 5;
          Sun(K, L);
          L := L + 1;
          Pen.Color := clYellow;
          Pen.Width := 1;
          Brush.Color := clYellow;
          Brush.Style := bsSolid;
          Pen.Width := 5;
          Sun(K, L);
        end;
      if (K < 725) and (L = 200) then
        begin
          Pen.Color := clSkyBlue;
          Pen.Width := 1;
          Brush.Color := clSkyBlue;
          Brush.Style := bsSolid;
          Pen.Width := 5;
          Sun(K, L);
          K := K + 1;
          Pen.Color := clYellow;
          Pen.Width := 1;
          Brush.Color := clYellow;
          Brush.Style := bsSolid;
          Pen.Width := 5;
          Sun(K, L);
        end;    
      if (L > 100) and (K = 725) then
        begin
          Pen.Color := clSkyBlue;
          Pen.Width := 1;
          Brush.Color := clSkyBlue;
          Brush.Style := bsSolid;
          Pen.Width := 5;
          Sun(K, L);
          L := L - 1;
          Pen.Color := clYellow;
          Pen.Width := 1;
          Brush.Color := clYellow;
          Brush.Style := bsSolid;
          Pen.Width := 5;
          Sun(K, L);
        end;
    end;
end;

procedure TForm1.Timer8Timer(Sender: TObject);
begin
  with Image1.Canvas do
    begin   
      Pen.Color := clSkyBlue;
      Pen.Width := 1;
      Brush.Color := clSkyBlue;
      Brush.Style := bsSolid;
      Pen.Width := 5;
      Sun(K, L);
      K := K + 1;
      Pen.Color := clYellow;
      Pen.Width := 1;
      Brush.Color := clYellow;
      Brush.Style := bsSolid;
      Pen.Width := 5;
      Sun(K, L);
    end;
end;

end.


