unit Variant_18_1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TForm22 = class(TForm)
    Tab: TStringGrid;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
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
  Eps = 1E-3;

var
  A, B, H, R, Rup: Real;

function F(X: Real): Real;
  begin
    F := Sin(X);
  end;

function DF(X: Real): Real;
  begin
    DF := Cos(X);
  end;

procedure Kat(A, B: Real; var R: Real);
  begin
    if F(A)*F(B) = 0 then
      begin
        if F(A) = 0 then
          R := A
        else
          R := B
      end
    else
      if F(A)*F(B) < 0 then
        begin
          if F(A) < 0 then
            while Abs(F(A)) > Eps do
              begin
                A := A - F(A) / DF(A);
                R := A;
              end
          else
            while Abs(F(B)) > Eps do
              begin
                B := B - F(B) / DF(B);
                R := B;
              end;
        end;
  end;


procedure TForm22.Button1Click(Sender: TObject);
var
  I: Integer;
begin
  A  := StrToFloat(Edit1.Text);
  B := StrToFloat(Edit2.Text);
  H  := StrToFloat(Edit3.Text);

  with Tab do
    begin
      Cells[0,0] := 'N';
      Cells[1,0] := 'Section';
      Cells[2,0] := 'Root';
    end;

  I := 1;
  Rup := 5;

  with Tab do
    repeat
      Kat(A,A + H, R);
      if (Round(R-Rup) <> 0) and ((A-R)*(H+A-R) <= 0) then
        begin
          Cells[0,I] := IntToStr(I);
          Cells[1,I] := FloatToStrF(A, ffNumber, 4, 2) + ' .. '
                        + FloatToStrF(A+H, ffNumber, 4, 2);
          Cells[2,I] := FloatToStrF(R, ffNumber, 12, 9);

          Inc(I);
        end;
      Rup := R;
      A := A + H;
   until A >= B;

end;


procedure TForm22.Button2Click(Sender: TObject);
var
  J: Integer;
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;

  for J := 1 to Tab.RowCount do
    begin
      Tab.Cells[0,J] := '';
      Tab.Cells[1,J] := '';
      Tab.Cells[2,J] := '';
    end;
end;

end.
