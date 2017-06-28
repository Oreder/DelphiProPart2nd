unit UnitPP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Image1: TImage;
    Box: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Enter;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var
  Z: array of Integer;

function Fix(N: Integer): string;
var
  S: string;
begin
  Str(N,S);
  Fix := S;
  if N < 10 then
    Fix := '    ' + S;
  if (10 <= N) and (N < 100) then
    Fix := '  ' + S;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Image1.Canvas.Pen.Width := 2;
  Image1.Canvas.Pen.Color := clBlack;
  Image1.Canvas.Rectangle(0, 0, 394, 346);
  SetLength(Z, 0);
end;

procedure TForm1.Enter;
var
  S, SX: string;
  F, I, X, Y: Integer;
begin
  S := Edit1.Text;
  while S[1] = #32 do
    S := Copy(S, 2, Length(S)-1);
  F := Pos(' ', S);
  SX := Copy(S, 1, F);
  Val(SX, X, I);
  Delete(S,1, Length(SX));
  Val(S, Y, I);

  with Image1.Canvas do
    begin
      Pen.Width := 3;
      Pen.Color := clRed;
      Ellipse(X-1, Y-1, X+1, Y+1);
    end;

  SetLength(Z, Length(Z) + 1);
  Box.Items.Add(Fix(Length(Z)) + ^I + Fix(X) + ^I + Fix(Y));
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      Enter;
      Edit1.Clear;
    end;
end;

end.
