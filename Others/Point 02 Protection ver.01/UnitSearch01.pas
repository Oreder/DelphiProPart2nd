unit UnitSearch01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TPoint = record
    X: LongInt;
    Y: LongInt;
  end;
  Hero = array of TPoint;

  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Edit1: TEdit;
    Label3: TLabel;
    Button4: TButton;

    procedure FormCreate(Sender: TObject);
    procedure New(Sender: TObject; var P, C: Hero);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Draw;
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

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
  EA = array of Boolean;

var
  P, C: Hero;
  Bin: EA;


procedure TForm1.FormCreate(Sender: TObject);
begin
  with Image1.Canvas do
  begin
    Pen.Width := 2;
    Pen.Color := clBlack;
    Rectangle(0, 0, 400, 400);
  end;
  Edit1.Text := '25';
end;


procedure TForm1.New(Sender: TObject; var P, C: Hero);
begin
  FormCreate(Sender);
  SetLength(P, 0);
  SetLength(C, 0);
end;


procedure TForm1.Button4Click(Sender: TObject);
begin
  New(Sender, P, C);
end;


procedure TForm1.Draw;
var
  I, R: Integer;
begin
  R := StrToInt(Edit1.Text);
  with Image1.Canvas do
  begin
    Pen.Width := 1;
    for I := 0 to High(C) do
      Ellipse(C[I].X - R, C[I].Y - R, C[I].X + R, C[I].Y + R);

    Pen.Width := 3;
    for I := 0 to High(P) do
      Ellipse(P[I].X - 1, P[I].Y - 1, P[I].X + 1, P[I].Y + 1);
  end;
end;


procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Image1.Canvas.Pen.Width := 2;
  Image1.Canvas.Pen.Color := clBlack;

  if Button = mbLeft then
  begin
    SetLength(P, Length(P)+1);
    P[High(P)].X := X;
    P[High(P)].Y := Y;
  end;

  if Button = mbRight then
  begin
    SetLength(C, Length(C)+1);
    C[High(C)].X := X;
    C[High(C)].Y := Y;
  end;

  Draw;
end;


function Distance(A, B, M: TPoint): Real;
var
  Z: Real;
begin
  Z := M.X * B.Y + B.X * A.Y + A.X * M.Y - M.X * A.Y - A.X * B.Y - B.X * M.Y;
  Result := Abs(Z)/Sqrt( Sqr(A.X - B.X) + Sqr(A.Y - B.Y));
end;


function Test(M, A, B: TPoint; R: Integer): Boolean;
var
  MA, MB, AB, MH, HA, HB: Real;
begin
  MA := Sqr(M.X - A.X) + Sqr(M.Y - A.Y);
  MB := Sqr(M.X - B.X) + Sqr(M.Y - B.Y);
  AB := Sqr(A.X - B.X) + Sqr(A.Y - B.Y);
  MH := Sqr(Distance(A, B, M));

  Test := False;
  if MH <= R*R then
  begin
    HA := Sqrt(MA - MH); HB := Sqrt(MB - MH);
    if ((MA - R*R)*(MB - R*R) <= 0) or (Round(HA + HB - Sqrt(AB)) = 0) then
      Test := True;
  end;
end;


function Best(M: TPoint; R: Integer; Bin: EA): Integer;
var
  IP, IC, SP, Max, G: Integer;
begin
  Max := 0;
  for IP := 1 to High(P) do
    if Bin[IP] = False then
    begin
      SP := 0;
      for IC := 0 to High(C) do
        if Test(C[IC], M, P[IP], R) then
          Inc(SP);
      if SP > Max then
      begin
        Max := SP; G := IP;
      end;
    end;
  if Max = 0 then
    for IP := High(P) downto 1 do
      if not Bin[IP] then
        begin
          G := IP; break;
        end;
  Best := G;
end;


procedure TForm1.Button1Click(Sender: TObject);
var
  IP, R, I, Road, Cout: Integer;
  Bin : EA;
begin
  R := StrToInt(Edit1.Text);
  SetLength(Bin, Length(P));
  for I := 0 to High(Bin) do
    Bin[I] := False;
  Image1.Canvas.MoveTo(P[0].X, P[0].Y);
  Image1.Canvas.Pen.Width := 1;
  Image1.Canvas.Pen.Color := clBlue;

  IP := 0;
  Bin[0] := True;
  Cout := 1;
  repeat
    Road := Best(P[IP], R, Bin);
    Bin[Road] := True;
    Image1.Canvas.LineTo(P[Road].X, P[Road].Y);
    Inc(Cout);
  until Cout > High(P);
end;

end.
