program ProjectSht;

uses
  Forms,
  UnitSht in 'UnitSht.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
