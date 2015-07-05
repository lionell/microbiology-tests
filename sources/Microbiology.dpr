program Microbiology;

uses
  Forms,
  MainMenu in 'MainMenu.pas' {Main},
  OptionsUnit in 'OptionsUnit.pas' {Options},
  TestUnit in 'TestUnit.pas' {Test},
  ScoreUnit in 'ScoreUnit.pas' {Score},
  ThemeUnit in 'ThemeUnit.pas' {Theme};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TOptions, Options);
  Application.CreateForm(TTest, Test);
  Application.CreateForm(TScore, Score);
  Application.CreateForm(TTheme, Theme);
  Application.Run;
end.
