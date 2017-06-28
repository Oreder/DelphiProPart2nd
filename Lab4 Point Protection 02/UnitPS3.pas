unit UnitPS3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Clear: TBitBtn;
    Solution: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    PX: TEdit;
    Label4: TLabel;
    PY: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    AX: TEdit;
    Label7: TLabel;
    AY: TEdit;
    Label8: TLabel;
    BX: TEdit;
    Label9: TLabel;
    BY: TEdit;
    Add: TButton;
    Showline: TButton;
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure ClearClick(Sender: TObject);
    procedure SolutionClick(Sender: TObject);
    procedure AddClick(Sender: TObject);
    procedure ShowlineClick(Sender: TObject);
    procedure ChangeLine(Sender: TObject);
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
  Z, D: array of TPoint;

procedure TForm1.FormCreate(Sender: TObject);
begin
  with Image1.Canvas do
  begin
    Pen.Width := 3;
    Rectangle(0, 0, 529, 385);
  end;
end;


procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Edit1.Clear; Edit2.Clear;

  if Button = mbLeft then
  begin
    SetLength(Z, Length(Z) + 1);
    Z[High(Z)].X := X;
    Z[High(Z)].Y := Y;
    Image1.Canvas.Pen.Width := 3;
    Image1.Canvas.Pen.Color := clBlack;
    Image1.Canvas.Ellipse(X-1, Y-1, X+1, Y+1);
  end;

  if (Button = mbRight) and (Length(D) < 2) then
  begin
    SetLength(D, Length(D) + 1);
    D[High(D)].X := X; D[High(D)].Y := Y;
    with Image1.Canvas do
    begin
      Pen.Color := clRed;
      Ellipse(X-1, Y-1, X+1, Y+1);
      if High(D) = 1 then
      begin
        Pen.Width := 1;
        MoveTo(D[0].X, D[0].Y);
        LineTo(D[1].X, D[1].Y);
      end;
    end;
  end;
end;


procedure TForm1.ClearClick(Sender: TObject);
begin
  FormCreate(Sender);
  SetLength(Z, 0);
  SetLength(D, 0);
  Edit1.Clear; Edit2.Clear;
end;


function F(M, A, B: TPoint): Real;
begin
  F := (M.X - A.X) * (B.Y - A.Y) - (M.Y - A.Y) * (B.X - A.X);
end;


procedure TForm1.SolutionClick(Sender: TObject);
var
  I, S: Integer;
begin
  Image1.Canvas.Pen.Color := clGreen;
  S := 0;

  for I := 0 to High(Z) do
  begin
    if F(Z[I], D[0], D[1]) < 0 then
    begin
      Inc(S);
      Image1.Canvas.Ellipse(Z[I].X-1, Z[I].Y-1, Z[I].X+1, Z[I].Y+1);
    end;
  end;

  Edit1.Text := IntToStr(S);
  Edit2.Text := IntToStr(Length(Z) - S);
end;


procedure TForm1.AddClick(Sender: TObject);
var
  X, Y: Integer;
begin
  X := StrToInt(PX.Text);
  Y := StrToInt(PY.Text);

  SetLength(Z, Length(Z) + 1);
  Z[High(Z)].X := X;
  Z[High(Z)].Y := Y;

  Image1.Canvas.Pen.Width := 3;
  Image1.Canvas.Pen.Color := clBlack;
  Image1.Canvas.Ellipse(X-1, Y-1, X+1, Y+1);

  PX.Clear; PY.Clear;
  Edit1.Clear; Edit2.Clear;
end;


procedure Cho(M, N, P, Q: TPoint; var A, B: TPoint);
  function FY(Y: Integer): Boolean;
  begin
    FY := False;
    if (Y >= 0) and (Y <= 385) then
      FY := True;
  end;

  function FX(X: Integer): Boolean;
  begin
    FX := False;
    if (X >= 0) and (X <= 529) then
      FX := True;
  end;

begin
  if FY(M.Y) and FX(P.X) then
  begin
    A := M; B := P;
  end;
  if FY(M.Y) and FX(Q.X) then
  begin
    A := M; B := Q;
  end;
  if FY(M.Y) and FY(N.Y) then
  begin
    A := M; B := N;
  end;

  if FY(N.Y) and FX(P.X) then
  begin
    A := P; B := N;
  end;
  if FY(N.Y) and FX(Q.X) then
  begin
    A := Q; B := N;
  end;

  if FX(P.X) and FX(Q.X) then
  begin
    A := P; B := Q;
  end;
end;


procedure TForm1.ShowlineClick(Sender: TObject);
var
  M, N, P, Q, M1, M2: Tpoint;
  I: Integer;
  K1, K2: Real;
begin
  Edit1.Clear; Edit2.Clear;
  SetLength(D, 2);
  D[0].X := StrToInt(AX.Text); D[0].Y := StrToInt(AY.Text);
  D[1].X := StrToInt(BX.Text); D[1].Y := StrToInt(BY.Text);

  with Image1.Canvas do
  begin
    Pen.Width := 3;
    Ellipse(D[0].X - 1, D[0].Y - 1, D[0].X + 1, D[0].Y + 1);
    Ellipse(D[1].X - 1, D[1].Y - 1, D[1].X + 1, D[1].Y + 1);
    Pen.Width := 2;
    Pen.Color := clRed;

    if D[0].X = D[1].X then
    begin
      M1.X := D[0].X; M1.Y := 0;
      M2.X := D[0].X; M2.Y := 385;
    end
    else
      if D[0].Y = D[1].Y then
      begin
        M1.X := 0; M1.Y := D[0].Y;
        M2.X := 529; M2.Y := D[0].Y;
      end
      else
      begin
        K1 := (D[1].Y - D[0].Y)/(D[1].X - D[0].X);
        K2 := D[0].Y - K1 * D[0].X;

        M.X :=   0; M.Y := Round(K2);
        N.X := 539; N.Y := Round(K1 * 539 + K2);

        P.X := Round(-K2/K1)       ; P.Y :=   0;
        Q.X := Round((385 - K2)/K1); Q.Y := 385;

        Cho(M, N, P, Q, M1, M2);
      end;

    MoveTo(M1.X, M1.Y);
    LineTo(M2.X, M2.Y);
  end;
end;


procedure TForm1.ChangeLine(Sender: TObject);
var
  I: Integer;
begin
  with Image1.Canvas do
  begin
    FormCreate(Sender);
    Pen.Width := 3;
    Pen.Color := clBlack;
    for I := 0 to High(Z) do
      Ellipse(Z[I].X - 1, Z[I].Y - 1, Z[I].X + 1, Z[I].Y + 1);
  end;
end;

end.
