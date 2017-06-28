program ProjectPS2;

uses
  Forms,
  UnitPS2 in 'UnitPS2.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
