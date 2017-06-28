unit UnitPS2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    PointBox: TListBox;
    Panel1: TPanel;
    Image1: TImage;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    EditX: TEdit;
    EditY: TEdit;
    GroupBox1: TGroupBox;
    SetA: TRadioButton;
    SetB: TRadioButton;
    Button1: TButton;
    Panel3: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Button2: TButton;
    Button3: TButton;
    Label6: TLabel;
    Label7: TLabel;
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button2Click(Sender: TObject);
    procedure Draw;
    procedure ShowPoint(Sender: TObject);
    procedure DeletePoint;
    procedure Button3Click(Sender: TObject);
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
  TPoint = record
    PX: LongInt;
    PY: LongInt;
    S : Char;
  end;

var
  Zed: array of TPoint;         // array saving coordinate of points

   (* show statusbar *)
procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  StatusBar1.Panels[0].Text := Format('X: %d; Y: %d', [X,Y]);
end;

  (* create first performance *)
procedure TForm1.FormCreate(Sender: TObject);
begin
  Image1.Canvas.Pen.Width := 2;
  Image1.Canvas.Pen.Color := clBlack;
  Image1.Canvas.Rectangle(0, 0, 451, 400);
end;


  (* get default string from number *)
function F(N: Integer): string;
var
  S: string;
begin
  Str(N, S);
  F := S;
  if N < 10 then
    F := '    ' + S;
  if (10 <= N) and (N < 100) then
    F := '  ' + S;
end;


  (* procedure point-addition *)
procedure TForm1.Button1Click(Sender: TObject);
var
  X, Y: Integer;          // coordinates of point
begin
  if (EditX.Text = '') or (EditY.Text = '') then
    ShowMessage('ERROR: Invalid input!')
  else
    begin
      X := StrToInt(EditX.Text);
      Y := StrToInt(EditY.Text);
      if (X >= 450) or (Y >= 400) or (X < 0) or (Y < 0) then
        ShowMessage('ERROR: (X;Y) may be out of range or invalid!')
      else
        begin
          SetLength(Zed, Length(Zed) + 1);
          with Zed[Length(Zed)-1] do
            begin
              PX := X; PY := Y;
              if SetA.Checked then
                begin
                  S := 'A'; Image1.Canvas.Pen.Color := clRed;
                end
              else
                begin
                  S := 'B'; Image1.Canvas.Pen.Color := clGreen;
                end;
            end;
          PointBox.Items.Add(F(Length(Zed)) + ^I + F(X) + ^I + F(Y)
                                        + ^I + Zed[Length(Zed)-1].S);

          EditX.Clear; EditY.Clear;

          Image1.Canvas.Pen.Width := 3;
          Image1.Canvas.Ellipse(X-1, Y-1, X+1, Y+1);
        end;
    end;
end;


  (* add point throught picture *)
procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  I, N: Integer;                  // N - index selected point
  Sec : Boolean;                  // selection point
begin
  EditX.Clear; EditY.Clear;
  if Button = mbRight then
    begin
      Sec := False;
      for I := 0 to Length(Zed) do
        if (Zed[I].PX-3 <= X) and (X <= Zed[I].PX+3) and
           (Zed[I].PY-3 <= Y) and (Y <= Zed[I].PY+3) then
          begin
            N := I; Sec := True; break;
          end;
      if Sec then
        begin
          FormCreate(Sender); Draw;
          PointBox.Selected[N] := True;
          Image1.Canvas.Pen.Width := 3;
          Image1.Canvas.Pen.Color := clBlack;
          Image1.Canvas.Ellipse(Zed[N].PX-2, Zed[N].PY-2, Zed[N].PX+2, Zed[N].PY+2);
        end
      else
        ShowMessage('NO POINT APPEARING!');
    end;
  if Button = mbLeft then
    begin
      SetLength(Zed, Length(Zed) + 1);
      with Zed[Length(Zed)-1] do
        begin
          PX := X; PY := Y;
          if SetA.Checked then
            S := 'A';
          if SetB.Checked then
            S := 'B';
        end;
      //PointBox.Items.Add(F(Length(Zed)) + '    ' + Format('(%d : %d)',[X, Y]));
      // NEW CHANGE: REMEMBER TO MAKE PERFORMANCE OF "LISTBOX"
      PointBox.Items.Add(F(Length(Zed)) + ^I + F(X) + ^I + F(Y)
                                        + ^I + Zed[Length(Zed)-1].S);

      Image1.Canvas.Pen.Width := 3;
      if SetA.Checked then
        Image1.Canvas.Pen.Color := clRed;
      if SetB.Checked then
        Image1.Canvas.Pen.Color := clGreen;
      Image1.Canvas.Ellipse(X-1, Y-1, X+1, Y+1);
    end;
end;


procedure TForm1.Draw;
var
  I: Integer;
begin
  Image1.Canvas.Pen.Width := 3;
  for I := 0 to High(Zed) do
    with Image1.Canvas do
      begin
        if Zed[I].S = 'A' then
          Pen.Color := clRed
        else
          Pen.Color := clGreen;
        Ellipse(Zed[I].PX-1, Zed[I].PY-1, Zed[I].PX+1, Zed[I].PY+1);
      end;
end;


  (* show point after clicking elements in box *)
procedure TForm1.ShowPoint(Sender: TObject);
var
  N: Integer;
begin
  FormCreate(Sender);
  Draw;
  N := PointBox.ItemIndex;
  if Zed[N].S = 'A' then
    Image1.Canvas.Pen.Color := clRed
  else
    Image1.Canvas.Pen.Color := clGreen;
  Image1.Canvas.Ellipse(Zed[N].PX-2, Zed[N].PY-2, Zed[N].PX+2, Zed[N].PY+2);
end;


  (* delete selected point *)
procedure TForm1.DeletePoint;
var
  I, N: Integer;
begin
  N := PointBox.ItemIndex;
  with Image1.Canvas do
    begin
      Pen.Width := 3;
      Pen.Color := clWhite;
      Ellipse(Zed[N].PX-2, Zed[N].PY-2, Zed[N].PX+2, Zed[N].PY+2);
    end;

  for I := N to Length(Zed)-1 do
    Zed[I] := Zed[I+1];
                  
  SetLength(Zed, Length(Zed)-1);

  PointBox.Clear;
  Image1.Canvas.Pen.Width := 2;
  Image1.Canvas.Pen.Color := clBlack;
  Image1.Canvas.Rectangle(0, 0, 451, 400);

  for I := 0 to Length(Zed)-1 do
    PointBox.Items.Add(F(I+1) + ^I + F(Zed[I].PX) + ^I + F(Zed[I].PY)
                                + ^I + Zed[I].S);
  Draw;
end;


  (* edit button "delete" *)
procedure TForm1.Button2Click(Sender: TObject);
begin
  if PointBox.ItemIndex < 0 then
    ShowMessage('NOTE: Choose point before pressing "Delete"')
  else
    DeletePoint;
end;


  (* clear data *)
procedure TForm1.Button3Click(Sender: TObject);
begin
  FormCreate(Sender);
  PointBox.Clear;
  SetLength(Zed, 0);
end;

end.
