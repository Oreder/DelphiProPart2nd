type
	TPoint = record 
		X: Integer;
		Y: Integer;
	end;
	Triangle = array[1..3] of TPoint;


	// distance 2 points[A, B]
function Le(A, B: TPoint): Real;
begin
	Le := Sqrt(Sqr(A.X - B.X) + Sqr(A.Y - B.Y));
end;

	// in-out circle[M]
function IOC(M, C: TPoint; Ra: Real): Boolean;
begin
	IOC := False;
	if Le(M, C) <= Ra then IOC := True;
end;

	// distance point[M] and line[AB]
function DPL(M, A, B: TPoint): Real;
var
	S: Real;
begin
	S := Abs((M.X - A.X)*(B.Y - A.Y) - (M.Y - A.Y)*(B.X - A.X));
	DPL := S / Sqrt(Sqr(A.X - B.X) + Sqr(A.Y - B.Y));
end;


	// line(2 points [A,B]) meets circle[M]
function LMC(A, B, M: TPoint; Ra: Real): Boolean;
var
	XH, YH, R, T: Real;
begin
	LMC := False;
	
	if (IOC(M, A, Ra) and not IOC(M, B, Ra)) 
	or (IOC(M, B, Ra) and not IOC(M, A, Ra)) then
		LMC := True;

	if (DPL(M, A, B) <= Ra) and not IOC(M, A, Ra) and not IOC(M, B, Ra) then
	begin
		R := A.X * B.Y - A.Y * B.X;
		T := M.X * (B.X - A.X) + M.Y * (B.Y - A.Y);

		XH := (R*(B.Y - A.Y) + T*(B.X - A.X))/(Sqr(B.Y - A.Y) + Sqr(B.X - A.X));
		YH := (T*(B.Y - A.Y) - R*(B.X - A.X))/(Sqr(B.Y - A.Y) + Sqr(B.X - A.X));

		if (A.X - B.X)*(M.Y - B.Y) - (A.Y - B.Y)*(M.X - B.X) = 0 then
			LMC := True;
	end;
end;

	
	// triangle meets circle[M]
function TMC(T: Triangle; M: TPoint; Ra: Real): Boolean;
begin
	TMC := False;
	if LMC(T[1],T[2], M,Ra) or LMC(T[2],T[3], M,Ra) or LMC(T[3],T[1], M,Ra)
	then TMC := True;
end;


(* ----------------------------------------------------------- *)

	// choose 3 indexes [IZ, JZ, KZ]
procedure Choose(var IZ, JZ, KZ: Integer);
begin
	if KZ < High() then
		Inc(KZ)
	else
	begin
		if JZ < High()-1 then
			Inc(JZ)
		else
		begin
			Inc(IZ);
			JZ := IZ + 1;
		end;
		KZ := JZ + 1;
	end;
end;

(* ----------------------------------------------------------- *)
	(* choose N indexes *)

type
	Index = array[1..5] of Integer;

procedure DEF(var A: Index);
var
  I: Integer;
begin
  for I := 1 to 5 do
    A[I] := I;
end;

procedure Swap(var X, Y: Integer);
var
  Temp: Integer;
begin
  Temp := X; X:= Y; Y := Temp;
end;

procedure Choose(N: Integer; var Z: Index);
var
  I, J, H, K: Integer;
begin
  I := N-1;                
  while (I > 0) and (Z[I] > Z[I+1]) do
    Dec(I);

  if I > 0 then
  begin
    K := N;               
    while Z[I] > Z[K] do Dec(K);

    Swap(Z[I], Z[K]);             

    for J := I+1 to N-1 do        
      for H := N downto J + 1 do
        if Z[H] < Z[H-1] then
          Swap(Z[H], Z[H-1]);
  end;
end;

procedure Print(A: Index);
var
  I: Integer;
begin
  for I := 1 to 5 do
    Write((A[I]-1):3);
  WriteLn;
end;

var
  A: Index;
begin
  DEF(A);

  repeat
    Choose(5, A); Print(A);
    ReadLn;
  until 1=2;
end.

