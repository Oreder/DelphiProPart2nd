program ProjectSP2;

uses
  Forms,
  UnitSearch02 in 'UnitSearch02.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
