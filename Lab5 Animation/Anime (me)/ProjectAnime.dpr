program ProjectAnime;

uses
  Forms,
  UnitAnime in 'UnitAnime.pas' {Anime};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TAnime, Anime);
  Application.Run;
end.
