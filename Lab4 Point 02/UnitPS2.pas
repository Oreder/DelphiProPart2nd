unit UnitPS2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    PointBox: TListBox;
    Panel1: TPanel;
    Image1: TImage;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    EditX: TEdit;
    EditY: TEdit;
    GroupBox1: TGroupBox;
    SetA: TRadioButton;
    SetB: TRadioButton;
    Button1: TButton;
    Panel3: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Button2: TButton;
    Button3: TButton;
    Label6: TLabel;
    Label7: TLabel;
    NB: TEdit;
    Solution: TButton;
    Label8: TLabel;
    Label1: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button2Click(Sender: TObject);
    procedure Draw;
    procedure ShowPoint(Sender: TObject);
    procedure DeletePoint;
    procedure Button3Click(Sender: TObject);
    procedure SolutionClick(Sender: TObject);
    procedure NBChange(Sender: TObject);
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
    PX: LongInt;
    PY: LongInt;
    S : Char;
  end;

var
  Zed, AZ, BZ: array of TPoint;         // array saving coordinate of points

   (* show statusbar *)
procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  StatusBar1.Panels[0].Text := Format('X: %d; Y: %d', [X,Y]);
end;

  (* create first performance *)
procedure TForm1.FormCreate(Sender: TObject);
begin
  Image1.Canvas.Pen.Width := 2;
  Image1.Canvas.Pen.Color := clBlack;
  Image1.Canvas.Rectangle(0, 0, 451, 400);
end;


  (* get default string from number *)
function F(N: Integer): string;
var
  S: string;
begin
  Str(N, S);
  F := S;
  if N < 10 then
    F := '    ' + S;
  if (10 <= N) and (N < 100) then
    F := '  ' + S;
end;


procedure TForm1.Draw;
var
  I: Integer;
begin
  Image1.Canvas.Pen.Color := clWhite;
  Image1.Canvas.Rectangle(3,3,447,397);
  Image1.Canvas.Pen.Width := 3;
  for I := 0 to High(Zed) do
    with Image1.Canvas do
      begin
        if Zed[I].S = 'A' then
          Pen.Color := clRed
        else
          Pen.Color := clGreen;
        Ellipse(Zed[I].PX-1, Zed[I].PY-1, Zed[I].PX+1, Zed[I].PY+1);
      end;
end;


  (* procedure point-addition *)
procedure TForm1.Button1Click(Sender: TObject);
var
  X, Y: Integer;          // coordinates of point
begin
  if (EditX.Text = '') or (EditY.Text = '') then
    ShowMessage('ERROR: Invalid input!')
  else
  begin
    X := StrToInt(EditX.Text);
    Y := StrToInt(EditY.Text);
    if (X >= 450) or (Y >= 400) or (X < 0) or (Y < 0) then
      ShowMessage('ERROR: (X;Y) may be out of range or invalid!')
    else
    begin
      SetLength(Zed, Length(Zed) + 1);
      with Zed[High(Zed)] do
        begin
          PX := X; PY := Y;
          if SetA.Checked then
          begin
            S := 'A'; Image1.Canvas.Pen.Color := clRed;
          end
          else
          begin
            S := 'B'; Image1.Canvas.Pen.Color := clGreen;
          end;
        end;
      PointBox.Items.Add(F(Length(Zed)) + ^I + F(X) + ^I + F(Y)
                                        + ^I + Zed[High(Zed)].S);
      EditX.Clear; EditY.Clear;
      Draw;
    end;
  end;
end;


  (* add point throught picture *)
procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  I, N: Integer;                  // N - index selected point
  Sec : Boolean;                  // selection point
begin
  EditX.Clear; EditY.Clear;
  if Button = mbRight then
  begin
    Sec := False;
    for I := 0 to High(Zed) do
      if (Zed[I].PX-3 <= X) and (X <= Zed[I].PX+3) and
         (Zed[I].PY-3 <= Y) and (Y <= Zed[I].PY+3) then
        begin
          N := I; Sec := True; break;
        end;
    if Sec then
    begin
      FormCreate(Sender); Draw;
      PointBox.Selected[N] := True;
      Image1.Canvas.Pen.Width := 3;
      Image1.Canvas.Pen.Color := clBlack;
      Image1.Canvas.Ellipse(Zed[N].PX-2, Zed[N].PY-2, Zed[N].PX+2, Zed[N].PY+2);
    end
    else
      ShowMessage('NO POINT APPEARING!');
  end;
  if Button = mbLeft then
  begin
    SetLength(Zed, Length(Zed) + 1);
    with Zed[Length(Zed)-1] do
      begin
        PX := X; PY := Y;
        if SetA.Checked then
          S := 'A';
        if SetB.Checked then
          S := 'B';
      end;
    PointBox.Items.Add(F(Length(Zed)) + ^I + F(X) + ^I + F(Y)
                                        + ^I + Zed[Length(Zed)-1].S);
    Draw;
  end;
end;


  (* show point after clicking elements in box *)
procedure TForm1.ShowPoint(Sender: TObject);
var
  N: Integer;
begin
  FormCreate(Sender);
  Draw;
  N := PointBox.ItemIndex;
  Image1.Canvas.Pen.Color := clBlack;
  Image1.Canvas.Ellipse(Zed[N].PX-2, Zed[N].PY-2, Zed[N].PX+2, Zed[N].PY+2);
end;


  (* delete selected point *)
procedure TForm1.DeletePoint;
var
  I, N: Integer;
begin
  N := PointBox.ItemIndex;
  with Image1.Canvas do
    begin
      Pen.Width := 3;
      Pen.Color := clWhite;
      Ellipse(Zed[N].PX-2, Zed[N].PY-2, Zed[N].PX+2, Zed[N].PY+2);
    end;

  for I := N to High(Zed) do
    Zed[I] := Zed[I+1];

  SetLength(Zed, Length(Zed)-1);

  PointBox.Clear;
  for I := 0 to High(Zed) do
    PointBox.Items.Add(F(I+1) + ^I + F(Zed[I].PX) + ^I + F(Zed[I].PY)
                                + ^I + Zed[I].S);
  Image1.Canvas.Pen.Width := 2;
  Image1.Canvas.Pen.Color := clBlack;
  Image1.Canvas.Rectangle(0, 0, 451, 400);
  Draw;
end;


  (* edit button "delete" *)
procedure TForm1.Button2Click(Sender: TObject);
begin
  if PointBox.ItemIndex < 0 then
    ShowMessage('NOTE: Choose point before pressing "Delete"')
  else
    DeletePoint;
end;


  (* clear data *)
procedure TForm1.Button3Click(Sender: TObject);
begin
  FormCreate(Sender);
  PointBox.Clear;
  SetLength(Zed, 0);
  NB.Clear;
end;


  (* sets saving *)
procedure SetSave;
var
	I: Integer;
begin
  SetLength(AZ, 0); SetLength(BZ, 0);
	for I := 0 to High(Zed) do 					// High(Z) = Length(Z)-1
		begin
			if Zed[I].S = 'A' then
			begin
				SetLength(AZ, Length(AZ)+1);
				AZ[High(AZ)] := Zed[I];
			end;
			if Zed[I].S = 'B' then
			begin
				SetLength(BZ, Length(BZ)+1);
				BZ[High(BZ)] := Zed[I];
			end;
		end;
end;


  (* Identify position point and line*)
function FP(B, C, M: TPoint): Real;
begin
  FP := M.PX * C.PY + C.PX * B.PY + B.PX * M.PY
      - M.PX * B.PY - B.PX * C.PY - C.PX * M.PY;
end;


   (* Identify point in triangle *)
function PointIn(A, B, C, M: TPoint): Boolean;
var
  F_MA, F_MB, F_MC: Real;
begin
  Result := False;
  F_MA := FP(B, C, M) * FP(B, C, A);
  F_MB := FP(C, A, M) * FP(C, A, B);
  F_MC := FP(A, B, M) * FP(A, B, C);
  if (F_MA > 0) and (F_MB > 0) and (F_MC > 0) then
    Result := True;
end;


  (* Choose 3 points *)
procedure Choose(var IA, JA, KA: Integer);
begin
  if KA < High(AZ) then
    Inc(KA)
  else
  begin
    if JA < High(AZ)-1 then
    begin
      Inc(JA);
      KA := JA + 1;
    end
    else
    begin
      Inc(IA);
      JA := IA + 1;
      KA := JA + 1;
    end;
  end;
end;


 (* solution *)
procedure TForm1.SolutionClick(Sender: TObject);
var
	Great: Boolean;                   // existance of triangle
	IA, JA, KA, I: Integer;           // index of point
	CoutA, CoutB, GP: Integer;        // number satisfied points found
begin
  Draw;
  SetSave;                          { default settings }
	IA := 0; JA := 1; KA := 1;
	Great := False;
	CoutA := 0; CoutB := 0;

  if NB.Text = '' then
    ShowMessage('Please input number points you want to find first')
  else
  begin
    GP := StrToInt(NB.Text);

    { main loop }
	  repeat
		  Choose(IA, JA, KA);

		  for I := 0 to High(AZ) do         { count points of set A }
			  if not (I in [IA, JA, KA]) then
				  if PointIn(AZ[IA], AZ[JA], AZ[KA], AZ[I]) then
					  Inc(CoutA);

		  for I := 0 to High(BZ) do         { count point of set B }
			  if PointIn(AZ[IA], AZ[JA], AZ[KA], BZ[I]) then
				  Inc(CoutB);

		  if (CoutA = CoutB) and (CoutA = GP) then
      begin
        Great := True;
        with Image1.Canvas do
				  begin
					  Pen.Color := clBlue;
					  Pen.Width := 1;
					  MoveTo(AZ[IA].PX, AZ[IA].PY);
					  LineTo(AZ[JA].PX, AZ[JA].PY);
					  LineTo(AZ[KA].PX, AZ[KA].PY);
            LineTo(AZ[IA].PX, AZ[IA].PY);

					  Pen.Color := clRed;
					  Pen.Width := 3;
					  Ellipse(AZ[IA].PX-1, AZ[IA].PY-1, AZ[IA].PX+1, AZ[IA].PY+1);
					  Ellipse(AZ[JA].PX-1, AZ[JA].PY-1, AZ[JA].PX+1, AZ[JA].PY+1);
					  Ellipse(AZ[KA].PX-1, AZ[KA].PY-1, AZ[KA].PX+1, AZ[KA].PY+1);
				  end;
        break;
      end;
      CoutA := 0; CoutB := 0;
	  until IA > High(AZ)-2;

    if not Great then
      ShowMessage('SOLUTION WAS NOT FOUND!');
  end;
end;


procedure TForm1.NBChange(Sender: TObject);
begin
  Draw;
end;

end.
