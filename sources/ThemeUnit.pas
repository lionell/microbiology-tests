unit ThemeUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TTheme = class(TForm)
    BackGround: TImage;
    ThemeBox: TComboBox;
    ThemeLabel: TLabel;
    NextButton: TImage;
    procedure NextButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Theme: TTheme;

implementation

uses MainMenu, OptionsUnit, TestUnit, ScoreUnit;

{$R *.dfm}

procedure TTheme.NextButtonClick(Sender: TObject);
begin
if Theme.ThemeBox.SelText = 'Stomatology. Module 1' then Test.AssignedFile:='StomMod1.txt';
if Theme.ThemeBox.SelText = 'Stomatology. Module 2' then Test.AssignedFile:='StomMod2.txt';
if Theme.ThemeBox.SelText = 'Stomatology. Module 3' then Test.AssignedFile:='StomMod3.txt';
if Theme.ThemeBox.SelText = 'Medical. Module 1' then Test.AssignedFile:='MedMod1.txt';
if Theme.ThemeBox.SelText = 'Medical. Module 2' then Test.AssignedFile:='MedMod2.txt';
if Theme.ThemeBox.SelText = 'Medical. Module 3' then Test.AssignedFile:='MedMod3.txt';
if Theme.ThemeBox.SelText = 'Pharmaceutical. Module 1' then Test.AssignedFile:='FarmMod1.txt';
if Theme.ThemeBox.SelText = 'Pharmaceutical. Module 2' then Test.AssignedFile:='FarmMod2.txt';
if Theme.ThemeBox.SelText = 'Pharmaceutical. Module 3' then Test.AssignedFile:='FarmMod3.txt';
Test.Visible:=true;
Theme.Visible:=false;
Test.Clear;
Test.Next;
end;

end.
