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

begin
  for I := 1 to N do
    Z[I] := I;              

  repeat
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
  until I = 0;                     

end.