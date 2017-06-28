unit Variant_18_2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm22 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form22: TForm22;

implementation

{$R *.dfm}
const
  Eps = 1E-5;

var
  A, B, R: Real;

function F(X: Real): Real;
  begin
    F := X*X - 4;
  end;

function DF(X: Real): Real;
  begin
    DF := 2*X;
  end;

procedure Combo(A,B: Real; var R: Real);
  var X: Real;
  begin
    while Abs(A-B) > Eps do
      begin
        B := B - F(B) * (B-A) / (F(B) - F(A));
        A := A - F(A) / DF(A);
        R := (A + B)/2;
      end;
  end;



procedure TForm22.Button1Click(Sender: TObject);
begin
  Combo(-3, 0, R);
  Edit1.Text := FloatToStr(R);
end;

procedure TForm22.Button2Click(Sender: TObject);
begin
  Combo(-3, 0, R);
  Edit1.Text := FormatFloat('0E+0', F(R));
end;

end.
