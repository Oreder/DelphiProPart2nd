unit UnitCalculator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Edit1: TEdit;
    Button19: TButton;
    Button20: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var FNumber, SNumber: Real;    // input numbers
    Select: string;            // button's choice
    S: string;                 // edit1.text
    E: Boolean;                // identified error


  (* procedures translate all buttons *)
procedure TForm1.Button1Click(Sender: TObject);
begin
  Edit1.Text := Edit1.Text + '1';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit1.Text := Edit1.Text + '2';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Edit1.Text := Edit1.Text + '3';
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Edit1.Text := Edit1.Text + '4';
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Edit1.Text := Edit1.Text + '5';
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Edit1.Text := Edit1.Text + '6';
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  Edit1.Text := Edit1.Text + '7';
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  Edit1.Text := Edit1.Text + '8';
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  Edit1.Text := Edit1.Text + '9';
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  Edit1.Text := Edit1.Text + '0';
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  Edit1.Text := Edit1.Text + '.';
end;


  (* ADDITION procedure selection *)
procedure TForm1.Button12Click(Sender: TObject);
begin
  Select := 'add';
  if Edit1.Text = '' then
    ShowMessage('ERROR: No input number!')
  else
    FNumber := StrToFloat(Edit1.Text);   // get 1st number
  Edit1.Clear;
end;

  (* SUBTRACTION procedure selection *)
procedure TForm1.Button13Click(Sender: TObject);
begin
  Select := 'sub';
  if Edit1.Text = '' then
    ShowMessage('ERROR: No input number!')
  else
    FNumber := StrToFloat(Edit1.Text);
  Edit1.Clear;
end;


  (* DIVISION procedure selection *)
procedure TForm1.Button14Click(Sender: TObject);
begin
  Select := 'rdiv';
  if Edit1.Text = '' then
    ShowMessage('ERROR: No input number!')
  else
    FNumber := StrToFloat(Edit1.Text);
  Edit1.Clear;
end;

  (* DIV procedure selection *)
procedure TForm1.Button15Click(Sender: TObject);
begin
  Select := 'div';
  if Edit1.Text = '' then
    ShowMessage('ERROR: No input number!')
  else
    FNumber := StrToFloat(Edit1.Text);
  Edit1.Clear;
end;



  (* CUBE ROOT procedure *)
procedure TForm1.Button16Click(Sender: TObject);
  function CR(X: Real): Real;     // function identifies cube root
    begin
      if X = 0 then
        CR := 0
      else
        if X > 0 then
          CR := Exp(1/3 * Ln(X))
        else
          CR := - Exp(1/3 * Ln(-X));
    end;

  var S: string;        // input string
      N: Real;          // number's received from input string
      E: Integer;       // error count
  begin
    S := Edit1.Text;
    Val(S,N,E);

    if E > 0 then
      ShowMessage('ERROR: Invalid input!')      // error's existed
    else
      Edit1.Text := FloatToStr(CR(N));          // value of function
  end;



  (* NEGATIVE NUMBER procedure *)
procedure TForm1.Button19Click(Sender: TObject);
begin
  if Edit1.Text = '' then
    Edit1.Text := '-'
  else
    ShowMessage('ERROR: Invalid input! Button "+/-" is only allowed to input '
              + 'NEGATIVE number!');
end;


  (* PI value *)
procedure TForm1.Button17Click(Sender: TObject);
begin
  S := Edit1.Text;
  if (S = '') or (S = '-') then
    Edit1.Text := Edit1.Text + FloatToStr(Pi)
  else
    ShowMessage('ERROR: Invalid input! Clear screen and try again.');
end;


  (* check error of division procedure *)
procedure Zerochecker(S: string; var Error: Boolean);
  begin
    Error := False;

    if (S = '0') then
      begin
        Error := True;
        ShowMessage('MATH ERROR: CAN''T DIVIDE INTO "0"');
      end;

    if (S = '') then
      ShowMessage('ERROR: No number was inputed! Please input again!');
  end;


  (* MAIN *)
procedure TForm1.Button18Click(Sender: TObject);
begin
  if Select = 'add' then
    begin
      if Edit1.Text = '' then
        ShowMessage('ERROR: No input number! Try again!')
      else
        SNumber := StrToFloat(Edit1.Text);
      Edit1.Text := FloatToStr(FNumber + SNumber);
    end;

  if Select = 'sub' then
    begin
      if Edit1.Text = '' then
        ShowMessage('ERROR: No input number! Try again!')
      else
        SNumber := StrToFloat(Edit1.Text);
      Edit1.Text := FloatToStr(FNumber - SNumber);
    end;

  if Select = 'rdiv' then
    if Edit1.Text = '' then
      ShowMessage('ERROR: No input number! Try again!')
    else
      begin
        ZeroChecker(Edit1.Text,E);
        if not E then
          begin
            SNumber := StrToFloat(Edit1.Text);
            Edit1.Text := FloatToStr(FNumber / SNumber);
          end;
      end;

  if Select = 'div' then
    begin
      ZeroChecker(Edit1.Text,E);
      if not E then
        begin
          SNumber := StrToFloat(Edit1.Text);

          if (FNumber > Trunc(FNumber)) or (SNumber > Trunc(SNumber)) then
            ShowMessage('ERROR: "DIV" is only allowed to integer values.')
          else
            Edit1.Text := FloatToStr(Trunc(FNumber) div Trunc(SNumber));
        end;
    end;

end;


  (* Clear screen *)
procedure TForm1.Button20Click(Sender: TObject);
begin
  Edit1.Clear;
end;

end.
