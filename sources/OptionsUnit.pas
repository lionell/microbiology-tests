unit OptionsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Spin;

type
  TOptions = class(TForm)
    BackGround: TImage;
    OptionsLabel: TLabel;
    TimerCheckBox: TCheckBox;
    TimerLabel: TLabel;
    TimerSpinEdit: TSpinEdit;
    LimitCheckBox: TCheckBox;
    LimitLabel: TLabel;
    LimitSpinEdit: TSpinEdit;
    BackButton: TImage;
    MessageCheckBox: TCheckBox;
    MessageLabel: TLabel;
    procedure TimerCheckBoxClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure LimitCheckBoxClick(Sender: TObject);
    procedure BackButtonClick(Sender: TObject);
    procedure Exit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Options: TOptions;

implementation

uses MainMenu, TestUnit, ScoreUnit, ThemeUnit;

{$R *.dfm}

procedure TOptions.Exit;
begin
Main.Visible:=true;
Options.Visible:=false;
end;

procedure TOptions.TimerCheckBoxClick(Sender: TObject);
begin
Options.TimerSpinEdit.Enabled:=TimerCheckBox.Checked;
end;

procedure TOptions.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
Options.Exit;
end;

procedure TOptions.LimitCheckBoxClick(Sender: TObject);
begin
Options.LimitSpinEdit.Enabled:=LimitCheckBox.Checked;
end;

procedure TOptions.BackButtonClick(Sender: TObject);
begin
Test.TimerCheck:=Options.TimerCheckBox.Checked;
Test.LimitCheck:=Options.LimitCheckBox.Checked;
Test.ShMessage:=Options.MessageCheckBox.Checked;
Test.Timer:=Options.TimerSpinEdit.Value * 60;
Test.Limit:=Options.LimitSpinEdit.Value;
Options.Exit;
end;

end.
