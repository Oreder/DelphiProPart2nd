program Permutation;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  Nmax = 12;

procedure Swap(var X, Y: Integer);
var
  Temp: Integer;
begin
  Temp := X; X:= Y; Y := Temp;
end;

var
  N, I, J, H, K: Integer;
  Z: array[1..Nmax] of Integer;
  Step: Int64;

begin
  Write('Input N: '); ReadLn(N); WriteLn;

  Step := 1;
  for I := 1 to N do
    Z[I] := I;               { beginning configuration }

  repeat
    for I := 1 to N do
      Write(Z[I]:4);
    WriteLn;

    I := N-1;                { I - next position's config }
    while (I > 0) and (Z[I] > Z[I+1]) do
      Dec(I);

    if I > 0 then
    begin
      K := N;                { K - position need to swap }
      while Z[I] > Z[K] do Dec(K);

      {
      A := I;
      B := K;

      while A < B do
      begin
        Swap(Z[A], Z[B]);
        Inc(A); Dec(B);
      end;
      }

      Swap(Z[I], Z[K]);             { swap Z[I] and Z[K] }

      for J := I+1 to N-1 do        { sort array from index I+1 to N }
        for H := N downto J + 1 do
          if Z[H] < Z[H-1] then
            Swap(Z[H], Z[H-1]);

      Inc(Step);                    { step counting }
    end;
  until I = 0;                      { end of configuration }

  WriteLn;
  WriteLn('-------- Total: ', Step, ' steps'); ReadLn; ReadLn;
end.
