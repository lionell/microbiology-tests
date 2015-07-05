unit ScoreUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ValEdit, jpeg, ExtCtrls, StdCtrls;

type
  TScore = class(TForm)
    BackGround: TImage;
    ScoreLabel: TLabel;
    Right: TLabel;
    Wrong: TLabel;
    Scores: TLabel;
    ScoreGrid: TStringGrid;
    Time: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Exit;
    procedure ToScore;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Score: TScore;

implementation

uses MainMenu, TestUnit, OptionsUnit, ThemeUnit;

{$R *.dfm}

procedure TScore.Exit;
begin
Main.Visible:=true;
Score.Visible:=false;
end;

procedure TScore.ToScore;
var i: integer;
begin
Score.ScoreGrid.Cells[0, 0]:='¹';
Score.ScoreGrid.Cells[1, 0]:='Question';
Score.ScoreGrid.Cells[2, 0]:='Your answer';
Score.ScoreGrid.Cells[3, 0]:='Right answer';
if Test.LimitCheck then Score.ScoreGrid.RowCount:=Test.Limit + 1
else Score.ScoreGrid.RowCount:=Test.Number + 1;
for i:=1 to Test.Index + 1 do
  begin
    Score.ScoreGrid.Cells[0, i]:=IntToStr(i);
    Score.ScoreGrid.Cells[1, i]:=Test.SQuestions[i].Question;
    Score.ScoreGrid.Cells[2, i]:=Test.SQuestions[i].UAnswer;
    Score.ScoreGrid.Cells[3, i]:=Test.SQuestions[i].RAnswer;
  end;
Score.Right.Caption:='Right: ' + IntToStr(Test.Right);
if Test.LimitCheck then Score.Wrong.Caption:='Wrong: ' + IntToStr(Test.Limit - Test.Right)
else Score.Wrong.Caption:='Wrong: ' + IntToStr(Test.Number - Test.Right);
Score.Scores.Caption:='Score: '+ IntToStr(round(Test.Right / (Test.Index + 1) * 100)) + '%';
Score.Time.Visible:=Test.TimerCheck;
Score.Time.Caption:='Time: ' + IntToStr(Test.Time);
end;

procedure TScore.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
Score.Exit;
end;

end.
