program ProjectBinh_Var01_2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  NMax = 20;

type
  Arr = array[1..NMax] of Integer;

procedure TestArray(var A: Arr; var N: Integer);
var
  I: Integer;
begin
  Write('Input number elements of array: '); ReadLn(N);
  for I := 1 to N do
    A[I] := Random(100);
end;


procedure ArrayOut(A: Arr; N: Integer);
var
  I: Integer;
begin
  for I := 1 to N do
    Write(A[I]:4);
  WriteLn; WriteLn;
end;


procedure ShellSort(var A: Arr; N: Integer);
var
  I, J, K: Integer;
  Temp: Integer;
begin
  K := N div 2;
  while K > 0 do
    begin
      for I := K + 1 to N do
        begin
          Temp := A[I];
          J := I-K;
          while (J > 0) and (A[J] < Temp) do
            begin
              A[J+K] := A[J];
              J := J-K;
            end;
          A[J+K] := Temp;
        end;
      K := K div 2;
    end;
end;


var
  A: Arr;
  N: Integer;

begin
  TestArray(A, N);
  Write('Input :'); ArrayOut(A, N);

  ShellSort(A, N);

  Write('Output:'); ArrayOut(A, N);
  ReadLn;
end.
