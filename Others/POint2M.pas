{sort}

type 
	TPoint = record
		PX : Integer;
		PY : Integer;
	end;

var 
	Zed: array of TPoint;


procedure Choice(IA, JA, KA: Integer);
begin
	if KA < High(Zed) then 
		Inc(KA)
	else
	begin
		if JA < High(Zed) -1 then
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

function Center(A, B, C: TPoint): TPoint;
begin
	{type code here}
end;

function Distance(A, B: TPoint): Real;
begin
	Result := Sqrt(Sqr(A.PX - B.PX) + Sqr(A.PY - B.PY));
end;

procedure Selection;
var
	IA, JA, KA, I: Integer;
	M : TPoint;
	NumIn, NumOut : Integer;
	Goal : Boolean;
begin
	NumIn := 0; NumOut := 0;
	IA := 1; JA := 2; KA := 2;
	Goal := False;

	repeat
		Choice(IA, JA, KA);
		M := Center(Zed[IA], Zed[JA], Zed[KA]);

		for I := 0 to High(Zed) do 
			if not (I in [IA, JA, KA]) then
				if Distance(M, ZedX[I]) <= Distance(M, ZedX[IA]) then
					Inc(NumIn)
				else
					Inc(NumOut);
		if NumIn = NumOut then
			begin
				Goal := True;
				
				with Image1.Canvas do
				begin
					{draw circle}
				end;

				break;
			end;

	until IA >= High(ZedX)-1;

	if not Goal then
		ShowMessage('NO SATISFIED CIRCLE FOUND');
end;