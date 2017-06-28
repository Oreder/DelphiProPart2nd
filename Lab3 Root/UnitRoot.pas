unit UnitRoot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, Unit2;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button1: TButton;
    GroupBox2: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit4: TEdit;
    Label6: TLabel;
    Edit5: TEdit;
    StringGrid1: TStringGrid;
    Button2: TButton;
    GroupBox3: TGroupBox;
    Image1: TImage;
    Button3: TButton;
    Button4: TButton;
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);

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
  Fcn = function (X: Real): Real;

var
  Eps, X0,X1, Step, R: Real;            // Eps: epsilon
                                        // X0,X1: value of section
                                        // Step: loop's step
                                        // R: root

  P: string;                            // P: procedure choice
  F, DF: Fcn;                           // F: functions
                                        // DF: deverative of F(X)

  T0, T, FSe: Integer;                  // T0: Max times counting
                                        // T: real times counting
                                        // FSe: function selection
  //Et: Boolean;




function F1(X: Real): Real;             // First function F1(x)
  begin
    F1 := X*X - 1;
  end;

function DF1(X: Real): Real;            // Derative of F1(x)
  begin
    DF1 := 2*X;
  end;

function F2(X: Real): Real;            // Second function F2(x)
  begin
    F2 := Sin(X);
  end;

function DF2(X: Real): Real;           // Derative of F2(x)
  begin
    DF2 := cos(X);
  end;



  (* Function selection *)
procedure TForm1.RadioButton1Click(Sender: TObject);
  begin
    F := F1; DF := DF1; FSe := 1; Button3Click(Sender);
  end;

procedure TForm1.RadioButton2Click(Sender: TObject);
  begin
    F := F2; DF := DF2; FSe := 2; Button3Click(Sender);
  end;


  
  (* Algorithm selection *)
procedure TForm1.RadioButton3Click(Sender: TObject);
  begin
    P := 'Combination'; Button3Click(Sender);
  end;

procedure TForm1.RadioButton4Click(Sender: TObject);
  begin
    P := 'Iteration'; Button3Click(Sender);
  end;


  (* Show table *)
procedure TForm1.Button1Click(Sender: TObject);
    (* procedure gets input values *)
  procedure Checkin(var Eps,X0,X1,Step: Real; var T0: Integer);
    begin
      if (Edit1.Text = '') or (Edit2.Text = '') or (Edit3.Text = '')
      or (Edit4.Text = '') or (Edit5.Text = '') then
        ShowMessage('ERROR: Some box may be not input! Check and try again')
      else
        begin
          Eps  := StrToFloat(Edit1.Text);
          X0   := StrToFloat(Edit2.Text);
          X1   := StrToFloat(Edit3.Text);
          Step := StrToFloat(Edit4.Text);
          T0   := StrToInt(Edit5.Text);

            { check errors }
          if Eps <= 0 then
            ShowMessage('ERROR: Epsilon must be BIGGER than 0! Let input again!');

          if X0 >= X1 then
            ShowMessage('ERROR: Section is NOT existed! First number can not'
                      + ' bigger than second number! Please input again!');
          if (X1-X0) < Step then
            ShowMessage('ERROR: Invalid input! Step can NOT bigger than range of section');

          if Step <= 0 then
            ShowMessage('ERROR: Step must be BIGGER than 0! Let input again!');

          if Time <= 0 then
            ShowMessage('ERROR: Time input must be BIGGER than 0! Try again!');
        end;
      end;

  procedure Defa;
    begin
      with StringGrid1 do
        begin
          Cells[0,0] := 'N';
          Cells[1,0] := 'Section';
          Cells[2,0] := 'Root X';
          Cells[3,0] := 'F(X)';
          Cells[4,0] := 'Step';
          Cells[5,0] := 'Error';
        end;
    end;

    (* procedure accepts to print result into table *)
  procedure Accept(X0,Y,R,R0: Real; Error: string; var Ha: Integer);
    begin
      if (Y<=X1) and (Abs(R-R0)>Eps) then
        if Error = '#0' then
          with StringGrid1 do                 // set value of cells
          begin
            Cells[0,Ha] := IntToStr(Ha);

            if Y < X1 then
              Cells[1,Ha] := FormatFloat('0.00',X0) + ' .. '
                              + FormatFloat('0.00',Y)
            else
              Cells[1,Ha] := FormatFloat('0.00',X0) + ' .. '
                              + FormatFloat('0.00',X1);

            Cells[2,Ha] := FloatToStrF(R,ffNumber,10,8);
            Cells[3,Ha] := FormatFloat('0E-0',F(R));
            Cells[4,Ha] := IntToStr(T);
            Cells[5,Ha] := Error;

            Inc(Ha);
          end 
       else
          if (Error = '#1') or (Error = '#2') then
            with StringGrid1 do
              begin
                Cells[0,Ha] := IntToStr(Ha);

                if Y < X1 then
                  Cells[1,Ha] := FormatFloat('0.00',X0) + ' .. '
                              + FormatFloat('0.00',Y)
                else
                  Cells[1,Ha] := FormatFloat('0.00',X0) + ' .. '
                              + FormatFloat('0.00',X1);
                Cells[2,Ha] := '__';
                Cells[3,Ha] := '__';
                Cells[4,Ha] := '__';
                Cells[5,Ha] := Error;
              end;
    end;




  (* Method Better Combination *)
procedure Combination(Left, Right: Real; var Root: Real; var Time: Integer; var Error: string);
	var A, B: Real;
  begin
		Time := 0;                            // Time: loop counting
    Error := '';
    A := Left; B := Right;

		if F(Left)*F(Right) = 0 then
			begin
				Error := '#0';
        if F(Left) = 0 then              (* optimize method *)
					Root := Left
				else
					Root := Right;
			end
		else
			if F(Left)*F(Right) < 0 then                   // main algorithm
				begin
          Error := '#0';
          if F(Left) < 0 then
						while Abs(Left - Right) > Eps do
							begin
								Left := Left - F(Left) * (Right - Left)/(F(Right) - F(Left));
								Right := Right - F(Right)/DF(Right);
								Root := (Left + Right)/2;
								Inc(Time);
								if Time > T0 then
                  begin
                    Error := '#2'; break;
                  end;
							end
					else
						while Abs(Left - Right) > Eps do
							begin
								Right := Right - F(Right) * (Right - Left)/(F(Right) - F(Left));
								Left := Left - F(Left)/DF(Left);
								Root := (Left + Right)/2;
								Inc(Time);
								if Time > T0 then
                  begin
                    Error := '#2'; break;
                  end;             // condition of break time
              end;
				end;
    if (Root - A)*(Root - B) > 0 then
      Error := '#1';
	end;
  // NE: in case of other functions, CHECK DF(X)!!!!!!!!
  


    (* procedure print results of method combination *)
  procedure Table_Com;
    var Ha : Integer;
        Y  : Real;      // Y: partition of section
        B  : Boolean;   // loop's condition
		    R0 : Real;      // saved root
        E  : string;

    begin
      B := False;
	    Ha := 1;         // rows counting
      R := 1E2;

	    repeat
        R0 := R;
		    Y := X0 + Step;

        if (Y > X1) and (FSe = 1) then    // break loop in case 1
          begin
            Y := X1;
            B := True;
          end;

        if (X0 > X1) and (FSe = 2) then    // break loop in case 2
          B := True;

        Combination(X0,Y,R,T,E);
        Accept(X0,Y,R,R0,E, Ha);

        X0 := Y;
      until B;               // finish condition
    end;





  
  (* Method Iteration for second function - case 1 *)
procedure Iteration_F2_1(Left, Right: Real; var Root: Real; var Time: Integer; var Error: string);
  var X: Real;
  begin
    Time := 1;
    Error := '';
    X := (Left + Right)/2;

    while Abs(F(X)) > Eps do
      begin
        X := X + F(X);
        Inc(Time);
        if Time > T0 then
          begin
            Error := '#2'; break;
          end;
      end;

    Root := X;
    if (Root - Left)*(Root - Right) > 0 then
      Error := '#1'
    else
      Error := '#0';
  end;


  (* Method Iteration for second function - case 2 *)
procedure Iteration_F2_2(Left, Right: Real; var Root: Real; var Time: Integer; var Error: string);
  var X: Real;
  begin
    Time := 1;
    Error := '';
    X := (Left + Right)/2;

    while Abs(F(X)) > Eps do
      begin
        X := X - F(X);
        Inc(Time);
        if Time > T0 then
          begin
            Error := '#2'; break;
          end;
      end;

    Root := X;
    if (Root - Left)*(Root - Right) > 0 then
      Error := '#1'
    else
      Error := '#0';
  end;


  (* Method iteration for first function *)
procedure Iteration_F1(Left, Right: Real; var Root: Real; var Time: Integer; var Error: string);
	var X: Real;
	begin
		Time := 1;
    Error := '';
    X := (Left + Right)/2;
		while Abs(F(X)) > Eps do
			begin
				X := (X + 1/X)/2;
				Inc(Time);
        if Time > T0 then
          begin
            Error := '#2'; break;
          end;
			end;

		Root := X;
    if (Root - Left)*(Root - Right) > 0 then
      Error := '#1'
    else
      Error := '#0';
	end;




    (* procedure print results of method iteration *)
  procedure Table_Ite;
    var Ha : Integer;
        Y  : Real;      // Y: partition of section
        B  : Boolean;   // loop's condition
        R0 : Real;
        E  : string;

    begin
      B  := False;
      Ha := 1;          // rows counting
      R  := 1E2;

      repeat
        R0 := R;
        Y := X0 + Step;

        if (Y > X1) then     // break loop in case 1
          begin
            Y := X1;
            B := True;
          end;

        if F(X0)*F(Y) <= 0 then
          begin
		        if FSe = 1 then
			        begin
				        Iteration_F1(X0,Y,R,T,E); Accept(X0,Y,R,R0,E, Ha);
			        end;

            if FSe = 2 then
		  	      begin
                Iteration_F2_1(X0,Y,R,T,E); Accept(X0,Y,R,R0,E, Ha);
                R0 := R;

                if Round(R0) = 0 then
                  begin
                    X0 := Step;
                    Y := X0 + Step;
                  end;

                if StringGrid1.Cells[1,Ha-1] <> (FormatFloat('0.00',X0)
                                  + ' .. ' + FormatFloat('0.00',Y)) then
                  begin
                    Iteration_F2_2(X0,Y,R,T,E); Accept(X0,Y,R,R0,E, Ha);
                    if Round(R) = 0 then
                      begin
                        X0 := Step;
                        Y := X0 + Step;
                      end;
                  end;
              end;
          end;

        X0 := Y;
      until B;               // break condition
    end;


    (* Main *)
  begin
    Checkin(Eps,X0,X1,Step,T0);
    Defa;

    if P = 'Combination' then Table_Com;
    if P = 'Iteration'   then Table_Ite;

    if StringGrid1.Cells[0,1] = '' then
      ShowMessage('ERROR: Can not find root in this section! May be there has '
                + 'no root or your input step is too big. Try again!');

    with Image1.Canvas do         // default graphic
      begin
        //Brush.Color := clBlue;
        FrameRect(Rect(0,0,500,300));
      end;
  end;






  (* Show graphic *)
procedure TForm1.Button2Click(Sender: TObject);
  const X0 = 0;               // default value of graphic
        Y0 = 150;

  var P1,P2,D,Min: Real;      // P1, P2: section
                              // D: distance of max and min value of function
                              //    in that section [P1, P2]
                              // Min: min value of F(X)

      X,Y: Real;              // (X,Y): coordinates


    (* Set default graphic *)
  procedure Cover;
    begin
      with Image1.Canvas do
        begin
          Pen.Color := clBlue;
          Pen.Width := 3;
          Rectangle(0,0,500,300);

          Pen.Style := psDot;
          Pen.Color := clTeal;
          Pen.Width := 1;

          MoveTo(0,25) ; LineTo(500,25);
          MoveTo(0,83) ; LineTo(500,83);
          MoveTo(0,150); LineTo(500,150);
          MoveTo(0,217); LineTo(500,217);
          MoveTo(0,275); LineTo(500,275);

          MoveTo(20,0) ; LineTo(20 ,300);
          MoveTo(110,0); LineTo(110,300);
          MoveTo(200,0); LineTo(200,300);
          MoveTo(290,0); LineTo(290,300);
          MoveTo(380,0); LineTo(380,300);
          MoveTo(470,0); LineTo(470,300);
        end;
    end;


    (* procedure finds max and min value of function *)
  procedure MiMa(P1,P2: Real; var D, Min: Real);
    var Z, Max: Real;
    begin
      if FSe = 1 then         // funtion 1 is selected
        begin
          if F(P1) < F(P2) then
            begin
              Min := F(P1); Max := F(P2);
            end
          else
            begin
              Min := F(P2); Max := F(P1);
            end;

          Z := 0;
          if (P1<Z) and (Z<P2) then
            Min := -1;

          D := Max - Min;    // set default distance
        end;

      if FSe = 2 then        // function 2 is selected
        begin
          D := 2; Min := -1;
        end;
    end;


    (* graphic of first function *)
  procedure Draw1;
    var I: Integer;         // I: point-loop counting

    begin
      with Image1.Canvas do
        begin
          Pen.Color := clMaroon;
          Pen.Width := 2;

          Y := (F(P1) - Min)/D;
          MoveTo(20, 275 - Round(Y*250));    // beginning point

          for I := 1 to 450 do               // connect points
            begin
              X := P1 + I * (P2-P1)/450;
              Y := (F(X) - Min)/D;
              LineTo(X0 + 20 + I, 275 - Round(Y*250));
            end;
        end;
    end;


    (* graphic of second funtion *)
  procedure Draw2;
    var I: Integer;
    begin
      with Image1.Canvas do
        begin
          Pen.Color := clGreen;
          Pen.Width := 2;

          MoveTo(20, Y0 - Round(F(P1)*125));  // beginning point

          for I := 1 to 450 do               // connect points
            begin
              X := (P1 + I * (P2-P1)/450);
              Y := F(X);
              LineTo(X0 + 20 + I, Y0 - Round(Y*125));
            end;
        end;
    end;


    (* Text insertion *)
  procedure FillText;
    var Z: Real;
    begin
      with Image1.Canvas do
        begin
          Z := (P2 - P1)/5;
          TextOut( 25, 285, FloatToStrF(P1 + 0*Z, ffNumber,3,2));
          TextOut(115, 285, FloatToStrF(P1 + 1*Z, ffNumber,3,2));
          TextOut(205, 285, FloatToStrF(P1 + 2*Z, ffNumber,3,2));
          TextOut(295, 285, FloatToStrF(P1 + 3*Z, ffNumber,3,2));
          TextOut(385, 285, FloatToStrF(P1 + 4*Z, ffNumber,3,2));
          TextOut(475, 285, FloatToStrF(P1 + 5*Z, ffNumber,3,2));

          Z := D/4;
          TextOut(3, 15 , FloatToStrF(Min + 4*Z, ffNumber, 3, 2));
          TextOut(3, 73 , FloatToStrF(Min + 3*Z, ffNumber, 3, 2));
          TextOut(3, 140, FloatToStrF(Min + 2*Z, ffNumber, 3, 2));
          TextOut(3, 207, FloatToStrF(Min + 1*Z, ffNumber, 3, 2));
          TextOut(3, 265, FloatToStrF(Min + 0*Z, ffNumber, 3, 2));
        end;
    end;


    (* Main *)
  begin
    Cover;

    P1 := StrToFloat(Edit2.Text);
    P2 := StrToFloat(Edit3.Text);

    MiMa(P1,P2,D,Min);

    if FSe = 1 then Draw1;
    if FSe = 2 then Draw2;

    FillText;
  end;



  (* procedure clear table and graphic *)
procedure TForm1.Button3Click(Sender: TObject);
  var I,J: Integer;
  begin
    with StringGrid1 do
      begin
        for I := 0 to 6 do
          for J := 1 to 100 do
            Cells[I,J] := '';
      end;
  end;


  (* Show error informations *)
procedure TForm1.Button4Click(Sender: TObject);
  begin
    Form2.Show;
  end;


  (* clear data *)
procedure TForm1.Edit1Change(Sender: TObject);
  begin
    Button3Click(Sender);
  end;

procedure TForm1.Edit4Change(Sender: TObject);
  begin
    Button3Click(Sender);
  end;

procedure TForm1.Edit2Change(Sender: TObject);
  begin
    Button3Click(Sender);
  end;

procedure TForm1.Edit3Change(Sender: TObject);
  begin
    Button3Click(Sender);
  end;

procedure TForm1.Edit5Change(Sender: TObject);
  begin
    Button3Click(Sender);
  end;

end.
