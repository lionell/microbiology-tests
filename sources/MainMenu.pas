unit MainMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, ShellAPI;

type
  TMain = class(TForm)
    MainImage: TImage;
    ExitButton: TImage;
    HelpButton: TImage;
    OptionsButton: TImage;
    StartButton: TImage;
    procedure ExitButtonClick(Sender: TObject);
    procedure Exit;
    procedure OptionsButtonClick(Sender: TObject);
    procedure StartButtonClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

uses ScoreUnit, TestUnit, OptionsUnit, ThemeUnit;

{$R *.dfm}

procedure TMain.Exit;
begin
Main.Close;
Options.Close;
end;
procedure TMain.ExitButtonClick(Sender: TObject);
begin
Main.Exit;
end;

procedure TMain.OptionsButtonClick(Sender: TObject);
begin
Options.Visible:=true;
Main.Visible:=false;
end;

procedure TMain.StartButtonClick(Sender: TObject);
begin
Theme.Visible:=true;
Main.Visible:=false;
end;

procedure TMain.HelpButtonClick(Sender: TObject);
begin
ShellExecute(Handle,nil,pchar('Help.chm'),'','',SW_SHOWNORMAL);
end;

end.
