program RootSolution;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  Eps = 1E-10;


function F(X: Real): Real;
  begin
    F := X*X - X - 1;
  end;

function DF(X: Real): Real;     // Derivative of function [Code tested]
  begin
    DF := (F(X+Eps) - F(X))/Eps;
  end;

function D2F(X: Real): Real;   // Second derivative of function [tested]
  begin
    D2F := (F(X+2*Eps) - 2*F(X+Eps) + F(X))/(X*X);
  end;





  (* Method using continuity of function *)
procedure Contis(X0,X1: Real; var Root: Real; var Time: Integer);
  var Z: Real;
  begin
    Time := 1;

    while Abs(X0 - X1) > Eps do
      begin
        Z := (X0 + X1)/2; Inc(Time);

        if F(X0)*F(Z) > 0 then
          X0 := Z
        else
          X1 := Z;
      end;

    Root := (X0 + X1)/2;

    WriteLn('-----[Method Contis] ', Root:12:8, Time:6); WriteLn;
  end;



  (* Newton's method *)
procedure Newton(X: Real; var Root: Real; var Time: Integer);
  begin
    Time := 1;

    while Abs(F(X)) > Eps do
      begin
        X := X - F(X)/DF(X); Inc(Time);
      end;

    Root := X;

    WriteLn('-----[Method Newton] ', Root:12:8, Time:6); WriteLn;
  end;




  (* Horn's method, case: up-counting *)
procedure HornUp(A,B: Real; var Root: Real; var Time: Integer);
  begin
    Time := 1;

    while Abs(F(B)) > Eps do
      begin
        B := B - F(B)*(B-A)/(F(B) - F(A)); Inc(Time);
      end;

    Root := B;

    WriteLn('-----[Method HornUp] ', Root:12:8, Time:6); WriteLn;
  end;



  (* Horn's method, case: down-counting *)
procedure HornDown(A,B: Real; var Root: Real; var Time: Integer);
  begin
    Time := 1;

    while Abs(F(A)) > Eps do
      begin
        A := A - F(A)*(B-A)/(F(B) - F(A)); Inc(Time);
      end;

    Root := A;

    WriteLn('-----[Met. HornDown] ', Root:12:8, Time:6); WriteLn;
  end;


   (* Normal Combination's method *)
procedure NormalComb(A,B: Real; var Root: Real; var Time: Integer);
  var D: Real;
  begin
    Time := 1; D := B;

    while Abs(A-D)> Eps do
      begin
        A := A - F(A)*(B-A)/(F(B)-F(A));
		D := D - F(D)/DF(D);
        Inc(Time);
      end;

    Root := (A+D)/2;
	
	WriteLn('-----[Normal Comb''s] ', Root:12:8, Time:6); WriteLn;
  end;
  
  
  
  (* Better Combination's method *)
procedure Combine(A,B: Real; var Root: Real; var Time: Integer);
  begin
    Time := 1;

    while Abs(A-B)> Eps do
      begin
        A := A - F(A)*(B-A)/(F(B) - F(A));
        B := B - F(B)/DF(B);
        Inc(Time);
      end;

    Root := (A+B)/2;

    WriteLn('-----[Combination''s] ', Root:12:8, Time:6); WriteLn;
  end;



  (* Stephenson's method, choose beginning value bigger than predicted root *)
procedure Stephenson(X: Real; var Root: Real; var Time: Integer);
  begin
    Time := 1;

    while Abs(F(X)) > Eps do
      begin
        X := X - F(X)*F(X)/(F(X + F(X)) - F(X)); Inc(Time);
      end;

    Root := X;

    WriteLn('-----[Stephenson''s ] ', Root:12:8, Time:6); WriteLn;
  end;


{
  (* Method of iteration: F(x) = x *)

 [...]

}



  (* Chebyshev's method *)
procedure Chebyshev(X: Real; var Root: Real; var Time: Integer);
  begin
    Time := 1;

    while Abs(F(X)) > Eps do
      begin
        X := X - F(X)/DF(X) - D2F(X)*F(X)*F(X)/(2*DF(X)*DF(X)*DF(X));
        Inc(Time);
      end;

    Root := X;

    WriteLn('-----[Met Chebyshev] ', Root:12:8, Time:6); WriteLn;
  end;

  
  

  (* Method Iteration *)					  // Edited
procedure Iteration(A: Real; var Root: Real; var Time: Integer);
  begin
    Time := 0;

    while Abs(DF(A)*F(A)) > Eps do            // loop counting
      begin
        if Abs(DF(A)) < 1 then
          A := F(A)-A;                        // |F'(X)| < 1

        if Abs(DF(A)) > 1 then                // |F'(X)| > 1
          begin
            if DF(A) < 0 then
              A := A + 1/DF(A)*F(A)
            else
              A := A - 1/DF(A)*F(A);
          end;

        Inc(Time);
        if Time > T0 then break;              // condition break time
      end;

    Root := A;
	WriteLn('-----[Met Iteration] ', Root:12:8, Time:6); WriteLn;
  end;
  
  


  (* Main *)

var R: Real;
    T: Integer;

begin
  WriteLn('Result of tested methods: '); WriteLn;
  WriteLn(' ':21, '     Root      Time'); WriteLn;

  Contis(-5,5,R,T);
  Newton(-5,R,T);
  HornUp(-5,5,R,T);
  HornDown(-5,5,R,T);
  NormalComb(-5,5,R,T);
  Combine(-5,5,R,T);
  Stephenson(5,R,T);
  Chebyshev(5,R,T);
  Iteration(5,R,T);

  ReadLn;


end.
