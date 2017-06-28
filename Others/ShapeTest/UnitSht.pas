unit UnitSht;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Shape1: TShape;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
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
  XPos, XMult: Integer;

procedure TForm1.FormCreate(Sender: TObject);
begin
  XPos := 0; Xmult := 1;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if XPos > Form1.Width - 2*Shape1.Width then
    XMult := -1;
  if XPos < 1 then
    XMult := 1;
  XPos := XPos + XMult * 20;
  Shape1.Brush.Color := clGreen;
  Shape1.Left := XPos;
end;

end.
