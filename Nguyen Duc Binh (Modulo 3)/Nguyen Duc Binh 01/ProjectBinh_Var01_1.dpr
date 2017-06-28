program ProjectBinh_Var01_1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  Arr = array of Integer;

procedure ArrayIn(var A: Arr);
var
  I, N: Integer;
begin
  Write('Input number elements of array: '); ReadLn(N);
  if N <= 0 then
    WriteLn('ERROR: Number elements can NOT be smaller than 0!')
  else
    begin
      SetLength(A, N);
      Write('Input array: ');
      for I := 0 to High(A) do
        Read(A[I]);
      WriteLn;
    end;
end;


procedure ArrayOut(A: Arr);
var
  I: Integer;
begin
  for I := 0 to High(A) do
    Write(A[I]:3);
  WriteLn; WriteLn;
end;


procedure SortWithBinary(var A: Arr);
var
  I, J: Integer;
  Inf, Sup, Mid: Integer;
  Best: Integer;
begin
  for I := 1 to High(A) do
    begin
      Best := A[I];
      Inf := 0; Sup := I-1;

      repeat
        Mid := (Inf + Sup) div 2;

        if Best > A[Mid] then
          Sup := Mid - 1
        else
          Inf := Mid + 1;
      until Inf > Sup;

      for J := I-1 downto Inf do
        A[J+1] := A[J];

      A[Inf]:= Best;
    end;
end;

var
  A: Arr;

begin
  ArrayIn(A);
  SortWithBinary(A);

  Write('Output:'); ArrayOut(A);
  ReadLn; ReadLn;
end.
