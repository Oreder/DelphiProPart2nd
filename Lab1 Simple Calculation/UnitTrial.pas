unit UnitTrial;

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
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Edit3Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);

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
    E     : Boolean;        // check errors
    S1, S2: string;         // get strings from 2 edit.text
    N1, N2: Real;           // floated numbers


  (* procedure checks error of 2 input numbers *)
procedure Errorchecker(S1,S2: string; var Error: Boolean; var N1,N2: Real);
  var E1,E2: Integer;
  begin
    Error := False;

    Val(S1,N1,E1);         // E1, E2: number errors
    Val(S2,N2,E2);

    if (E1 > 0) or (E2 > 0) then
      begin
        ShowMessage('ERROR: You have typed a WRONG character (letter or '
                  + 'undigit value). Please check it and try again!');
        Error := True;
      end;
  end;


  (* procedure checks value of 2nd number for division *)
procedure Zerochecker(var Error: Boolean; N2: Real);
  begin
    Error := False;

    if N2 = 0 then
      begin
        ShowMessage('MATH ERROR: CAN NOT DIVIDE "0". Try again!');
        Error := True;
      end;
  end;


  (* procedure clears 3rd edit *)
procedure TForm1.Edit3Change(Sender: TObject);
  begin
    Edit3.Clear;
    Label4.Caption := '';
  end;


  (* ADDITION procedure *)
procedure TForm1.Button1Click(Sender: TObject);
  begin
    S1 := Edit1.Text; S2 := Edit2.Text;
    Errorchecker(S1,S2,E,N1,N2);
    if not E then
      begin
        Label4.Caption := '  +';
        Edit3.Text := FloatToStr(N1 + N2);
      end;
  end;


  (* SUBTRACTION procedure *)
procedure TForm1.Button2Click(Sender: TObject);
  begin
    S1 := Edit1.Text; S2 := Edit2.Text;
    Errorchecker(S1,S2,E,N1,N2);
    if not E then
      begin
        Label4.Caption := '   -';
        Edit3.Text := FloatToStr(N1 - N2);
      end;
  end;


  (* DIVISION procedure *)
procedure TForm1.Button3Click(Sender: TObject);
  begin
    S1 := Edit1.Text; S2 := Edit2.Text;
    Errorchecker(S1,S2,E,N1,N2);
    if not E then
      begin
        Zerochecker(E,N2);
        if not E then
          begin
            Label4.Caption := '   /';
            Edit3.Text := FloatToStr(N1 / N2);
          end;
      end;
  end;


  (* DIV procedure *)
procedure TForm1.Button4Click(Sender: TObject);
  begin
    S1 := Edit1.Text; S2 := Edit2.Text;
    Errorchecker(S1,S2,E,N1,N2);
    if not E then
      if (N1 > Trunc(N1)) or (N2 > Trunc(N2)) then
        ShowMessage('MATH ERROR: "Div" is used for only INTEGER value!')
      else
        begin
          Zerochecker(E,N2);
          if not E then
            begin
              Label4.Caption := 'DIV';
              Edit3.Text := FloatToStr(Trunc(N1) div Trunc(N2));
            end;
        end;
  end;

end.
