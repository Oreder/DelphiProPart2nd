program ProjectPP01;

uses
  Forms,
  UnitPP in 'UnitPP.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
