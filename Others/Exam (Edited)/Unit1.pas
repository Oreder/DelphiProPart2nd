unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Image1: TImage;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit4: TEdit;
    Label7: TLabel;
    Edit5: TEdit;
    Button2: TButton;
    Timer1: TTimer;
    Timer2: TTimer;
    Button3: TButton;
    Button4: TButton;
    procedure Draw(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
  TPoint = record
    X: Integer;
    Y: Integer;
  end;

var
  M: array[0..3] of TPoint;
  C: TPoint;
  I, L, R: Integer;

procedure TForm1.Draw(Sender: TObject);
var
  P: TPoint;
begin
  with Image1.Canvas do
  begin
    Brush.Color := clWhite;
    Rectangle(0, 0, 500, 500);
    
    Pen.Width := 2; Pen.Color := clBlue;
    Ellipse(C.X - R, C.Y - R, C.X + R, C.Y + R);

    Pen.Color := clBlack;
    MoveTo(M[1].X, M[1].Y); LineTo(M[2].X, M[2].Y);
    LineTo(M[3].X, M[3].Y); LineTo(M[1].X, M[1].Y);
    LineTo(M[0].X, M[0].Y); LineTo(M[2].X, M[2].Y);
    MoveTo(M[0].X, M[0].Y); LineTo(M[3].X, M[3].Y);

    P.X := Round((M[0].X + M[1].X + M[2].X)/3);
    P.Y := Round((M[0].Y + M[1].Y + M[2].Y)/3);
    Brush.Color := clRed;
    FloodFill(P.X, P.Y, clBlack, fsBorder);

    P.X := Round((M[0].X + M[2].X + M[3].X)/3);
    P.Y := Round((M[0].Y + M[2].Y + M[3].Y)/3);
    Brush.Color := clGreen;
    FloodFill(P.X, P.Y, clBlack, fsBorder);

    P.X := Round((M[0].X + M[3].X + M[1].X)/3);
    P.Y := Round((M[0].Y + M[3].Y + M[1].Y)/3);
    Brush.Color := clYellow;
    FloodFill(P.X, P.Y, clBlack, fsBorder);
  end;
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
  C.X := StrToInt(Edit1.Text);
  C.Y := StrToInt(Edit2.Text);
  R := StrToInt(Edit3.Text);
  L := StrToInt(Edit4.Text);

  M[0].X := C.X - R; M[0].Y := C.Y;
  M[1].X := M[0].X + Round(L / sqrt(3)) ; M[1].Y := M[0].Y;
  M[2].X := M[0].X - Round(L / sqrt(12)); M[2].Y := M[0].Y - Round(L/2);
  M[3].X := M[0].X - Round(L / sqrt(12)); M[3].Y := M[0].Y + Round(L/2);

  Timer1.Enabled := True;
  Timer2.Enabled := False;
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
  Timer2.Enabled := True;
end;


procedure TForm1.Timer1Timer(Sender: TObject);
var
  T: Real;
  A: Integer;
begin
  T := - Pi/10;
  for I := 0 to 3 do
    begin
      A := M[I].X;
      M[I].X := C.X + Round((A-C.X)*Cos(T) + (M[I].Y-C.Y)*Sin(T));
      M[I].Y := C.Y + Round((M[I].Y-C.Y)*Cos(T) - (A-C.X)*Sin(T));
    end;
  Draw(Sender);
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var
  T: Real;
  A: Integer;
begin
  T := StrToFloat(Edit5.Text);
  for I := 1 to 3 do
    begin
      A := M[I].X;
      M[I].X := M[0].X + Round((A-M[0].X)*Cos(T) + (M[I].Y-M[0].Y)*Sin(T));
      M[I].Y := M[0].Y + Round((M[I].Y-M[0].Y)*Cos(T) - (A-M[0].X)*Sin(T));
    end;
  Draw(Sender);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Timer1.Enabled := False;
  Timer2.Enabled := False;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Timer2.Enabled := False;
end;

end.
