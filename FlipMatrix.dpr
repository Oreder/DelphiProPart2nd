program FlipMatrix;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  Nmax = 20;

type
  Mat = array[1..Nmax, 1..Nmax] of Integer;

procedure TestMat(var A: Mat; var N: Integer);
var
  I, J, X: Integer;
begin
  Write('Input size of matrix: '); ReadLn(N);
  WriteLn;
  X := 0;
  for I := 1 to N do
    for J := 1 to N do
      begin
        Inc(X); A[I,J] := X;
      end;
end;


procedure Flip(A: Mat; N: Integer; var B: Mat);
var
  I, J: Integer;
begin
  for J := 1 to N do
    for I := 1 to N do
      B[I,J] := A[N+1-J, I];
end;


procedure Swap(var X, Y: Integer);
var Z: Integer;
begin
  Z := X; X := Y; Y := Z;
end;

procedure SelfFlip(var A: Mat; N: Integer);
var
  I, J: Integer;
begin
  for J := 1 to N do
    for I := 1 to N div 2 do
      Swap(A[I,J], A[N+1-I,J]);
  for J := 1 to N do
    for I := J+1 to N do
      Swap(A[I,J], A[J,I]);
end;

procedure Print(A: Mat; N: Integer);
var
  I, J: Integer;
begin
  for I := 1 to N do
    begin
      for J := 1 to N do
        Write(A[I,J]:3);
      WriteLn; WriteLn;
    end;
end;

var
  A, B: Mat;
  N: Integer;
begin
  TestMat(A, N); Print(A, N); WriteLn;
  {
  Flip(A, N, B); Print(B, N); WriteLn;
  Flip(B, N, A); Print(A, N); WriteLn;
  Flip(A, N, B); Print(B, N); WriteLn;
  Flip(B, N, A); Print(A, N); WriteLn;
  }

  SelfFlip(A, N); Print(A, N); WriteLn;
  SelfFlip(A, N); Print(A, N); WriteLn;
  SelfFlip(A, N); Print(A, N); WriteLn;
  SelfFlip(A, N); Print(A, N); WriteLn;

  ReadLn;
end.
