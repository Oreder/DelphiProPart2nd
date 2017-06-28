  (* Method Better Combination *)
procedure Combination(Left, Right: Real; var Root: Real; var Time: Integer);
	begin
		Time := 0;                            // Time: loop counting
		if F(Left)*F(Right) = 0 then
			begin
				if F(Left) = 0 then              (* optimize method *)
					Root := Left
				else
					Root := Right;
			end
		else
			if F(Left)*F(Right) < 0 then                   // main algorithm
				begin
					if F(Left) < 0 then
						while Abs(Left - Right) > Eps do
							begin
								Left := Left - F(Left) * (Right - Left)/(F(Right) - F(Left));
								Right := Right - F(Right)/DF(Right);
								Root := (Left + Right)/2;
								Inc(Time);
                if Time > T0 then break;
							end
					else
						while Abs(Left - Right) > Eps do
							begin
								Right := Right - F(Right) * (Right - Left)/(F(Right) - F(Left));
								Left := Left - F(Left)/DF(Left);
								Root := (Left + Right)/2;
								Inc(Time);
                if Time > T0 then break;             // condition of break time
							end;
				end;
	end;
  // NE: in case of other functions, CHECK DF(X)!!!!!!!!
	