unit TestUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls;

type Ans = array[1..5] of string;
type Quest = record
  Question, RAnswer, UAnswer: string;
  Answers: Ans;
  end;

type
  TTest = class(TForm)
    BackGround: TImage;
    QuestionMemo: TMemo;
    AnswerCheckBox1: TCheckBox;
    AnswerCheckBox2: TCheckBox;
    AnswerCheckBox3: TCheckBox;
    AnswerCheckBox4: TCheckBox;
    AnswerCheckBox5: TCheckBox;
    AnswerLabel1: TLabel;
    AnswerLabel2: TLabel;
    AnswerLabel3: TLabel;
    AnswerLabel4: TLabel;
    AnswerLabel5: TLabel;
    NextButton: TImage;
    TTimer: TTimer;
    TimeLabel: TLabel;
    BackButton: TImage;
    procedure Stop;
    procedure Clear;
    procedure Next;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure AnswerCheckBox1Click(Sender: TObject);
    procedure AnswerCheckBox2Click(Sender: TObject);
    procedure AnswerCheckBox3Click(Sender: TObject);
    procedure AnswerCheckBox4Click(Sender: TObject);
    procedure AnswerCheckBox5Click(Sender: TObject);
    procedure NextButtonClick(Sender: TObject);
    procedure TTimerTimer(Sender: TObject);
    procedure BackButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
  TimerCheck, LimitCheck, ShMessage: boolean;
  Timer, Limit, Number, Index, Right: integer;
  AssignedFile: string;
  Questions, SQuestions: array[1..1000] of Quest;
  Time: longint;
  end;
var
  Test: TTest;
  QuestionsSet, AnswersSet: set of byte;

implementation

uses MainMenu, ScoreUnit, OptionsUnit, ThemeUnit;

{$R *.dfm}

procedure TTest.Next;
begin
  if Index > 0 then
    begin
      // Checking CheckBox1
      if (Test.AnswerCheckBox1.Checked) and (Test.AnswerLabel1.Caption = SQuestions[Index].RAnswer) then
        begin
          if ShMessage then MessageDlg('You are right', mtInformation, [mbOK], 0);
          SQuestions[Index].UAnswer:=Test.AnswerLabel1.Caption;
          inc(Right);
        end;
      if (Test.AnswerCheckBox1.Checked) and (Test.AnswerLabel1.Caption <> SQuestions[Index].RAnswer) then
        begin
          if ShMessage then MessageDlg('Your answer: ' + Test.AnswerLabel1.Caption + #13#10 + 'Right Answer: ' + SQuestions[Index].RAnswer, mtError, [mbOK], 0);
          SQuestions[Index].UAnswer:=Test.AnswerLabel1.Caption;
        end;
      // Checking CheckBox2
      if (Test.AnswerCheckBox2.Checked) and (Test.AnswerLabel2.Caption = SQuestions[Index].RAnswer) then
        begin
          if ShMessage then MessageDlg('You are right', mtInformation, [mbOK], 0);
          SQuestions[Index].UAnswer:=Test.AnswerLabel2.Caption;
          inc(Right);
        end;
      if (Test.AnswerCheckBox2.Checked) and (Test.AnswerLabel2.Caption <> SQuestions[Index].RAnswer) then
        begin
          if ShMessage then MessageDlg('Your answer: ' + Test.AnswerLabel2.Caption + #13#10 + 'Right Answer: ' + SQuestions[Index].RAnswer, mtError, [mbOK], 0);
          SQuestions[Index].UAnswer:=Test.AnswerLabel2.Caption;
        end;
      // Checking CheckBox3
      if (Test.AnswerCheckBox3.Checked) and (Test.AnswerLabel3.Caption = SQuestions[Index].RAnswer) then
        begin
          if ShMessage then MessageDlg('You are right', mtInformation, [mbOK], 0);
          SQuestions[Index].UAnswer:=Test.AnswerLabel3.Caption;
          inc(Right);
        end;
      if (Test.AnswerCheckBox3.Checked) and (Test.AnswerLabel3.Caption <> SQuestions[Index].RAnswer) then
        begin
          if ShMessage then MessageDlg('Your answer: ' + Test.AnswerLabel3.Caption + #13#10 + 'Right Answer: ' + SQuestions[Index].RAnswer, mtError, [mbOK], 0);
          SQuestions[Index].UAnswer:=Test.AnswerLabel3.Caption;
        end;
      // Checking CheckBox4
      if (Test.AnswerCheckBox4.Checked) and (Test.AnswerLabel4.Caption = SQuestions[Index].RAnswer) then
        begin
          if ShMessage then MessageDlg('You are right', mtInformation, [mbOK], 0);
          SQuestions[Index].UAnswer:=Test.AnswerLabel4.Caption;
          inc(Right);
        end;
      if (Test.AnswerCheckBox4.Checked) and (Test.AnswerLabel4.Caption <> SQuestions[Index].RAnswer) then
        begin
          if ShMessage then MessageDlg('Your answer: ' + Test.AnswerLabel4.Caption + #13#10 + 'Right Answer: ' + SQuestions[Index].RAnswer, mtError, [mbOK], 0);
          SQuestions[Index].UAnswer:=Test.AnswerLabel4.Caption;
        end;
      // Checking CheckBox5
      if (Test.AnswerCheckBox5.Checked) and (Test.AnswerLabel5.Caption = SQuestions[Index].RAnswer) then
        begin
          if ShMessage then MessageDlg('You are right', mtInformation, [mbOK], 0);
          SQuestions[Index].UAnswer:=Test.AnswerLabel5.Caption;
          inc(Right);
        end;
      if (Test.AnswerCheckBox5.Checked) and (Test.AnswerLabel5.Caption <> SQuestions[Index].RAnswer) then
        begin
          if ShMessage then MessageDlg('Your answer: ' + Test.AnswerLabel5.Caption + #13#10 + 'Right Answer: ' + SQuestions[Index].RAnswer, mtError, [mbOK], 0);
          SQuestions[Index].UAnswer:=Test.AnswerLabel5.Caption;
        end;
      if (Index = Number) or ((Index = Limit) and (LimitCheck)) then
        begin
          Test.Stop;
          dec(Index);
          Score.ToScore;
          Score.Visible:=true;
          Test.Visible:=false;
        end;
      Test.QuestionMemo.Lines.Clear;
    end;
  // Clearing CheckBoxes
  Test.AnswerCheckBox1.Checked:=false;
  Test.AnswerCheckBox2.Checked:=false;
  Test.AnswerCheckBox3.Checked:=false;
  Test.AnswerCheckBox4.Checked:=false;
  Test.AnswerCheckBox5.Checked:=false;
  inc(Index);
  Test.QuestionMemo.Lines.Add(SQuestions[Index].Question);
  Test.AnswerLabel1.Caption:=SQuestions[Index].Answers[1];
  Test.AnswerLabel2.Caption:=SQuestions[Index].Answers[2];
  Test.AnswerLabel3.Caption:=SQuestions[Index].Answers[3];
  Test.AnswerLabel4.Caption:=SQuestions[Index].Answers[4];
  Test.AnswerLabel5.Caption:=SQuestions[Index].Answers[5];
end;
procedure TTest.Clear;
var i, j, k: integer;
    a: Ans;
begin
Test.QuestionMemo.Lines.Clear;
Test.TTimer.Enabled:=TimerCheck;
Test.TimeLabel.Visible:=TimerCheck;
Test.TimeLabel.Caption:='Time: ' + IntToStr(Timer);
Time:=0;
Number:=1;
Index:=0;
Right:=0;
// Sorting Algorithm
AssignFile(input,AssignedFile);
Reset(input);
While not Eof(input) do
begin
  readln(Questions[Number].Question);
  readln(Questions[Number].Answers[1]);
  readln(Questions[Number].Answers[2]);
  readln(Questions[Number].Answers[3]);
  readln(Questions[Number].Answers[4]);
  readln(Questions[Number].Answers[5]);
  readln(Questions[Number].RAnswer);
  inc(Number);
end;
dec(Number);
i:=1;
while i <= Number do
begin
  j:=Random(Number) + 1;
  if not(j in QuestionsSet) then
    begin
      SQuestions[i]:=Questions[j];
      QuestionsSet:=QuestionsSet + [j];
      inc(i);
    end;
end;
for i:=1 to Number do
begin
k:=1;
AnswersSet:=[];
  while k <= 5 do
  begin
    j:=Random(5) + 1;
    if not(j in AnswersSet) then
      begin
        a[k]:=SQuestions[i].Answers[j];
        AnswersSet:=AnswersSet + [j];
        inc(k);
      end;
  end;
  SQuestions[i].Answers:=a;
end;
QuestionsSet:=[];
AnswersSet:=[];
end;
procedure TTest.Stop;
begin
Test.TTimer.Enabled:=false;
end;
procedure TTest.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
Test.Stop;
Main.Visible:=true;
Test.Visible:=false;
end;

procedure TTest.FormCreate(Sender: TObject);
begin
Randomize;
end;

procedure TTest.AnswerCheckBox1Click(Sender: TObject);
begin
Test.AnswerCheckBox2.Checked:=false;
Test.AnswerCheckBox3.Checked:=false;
Test.AnswerCheckBox4.Checked:=false;
Test.AnswerCheckBox5.Checked:=false;
end;

procedure TTest.AnswerCheckBox2Click(Sender: TObject);
begin
Test.AnswerCheckBox1.Checked:=false;
Test.AnswerCheckBox3.Checked:=false;
Test.AnswerCheckBox4.Checked:=false;
Test.AnswerCheckBox5.Checked:=false;
end;

procedure TTest.AnswerCheckBox3Click(Sender: TObject);
begin
Test.AnswerCheckBox1.Checked:=false;
Test.AnswerCheckBox2.Checked:=false;
Test.AnswerCheckBox4.Checked:=false;
Test.AnswerCheckBox5.Checked:=false;
end;

procedure TTest.AnswerCheckBox4Click(Sender: TObject);
begin
Test.AnswerCheckBox1.Checked:=false;
Test.AnswerCheckBox2.Checked:=false;
Test.AnswerCheckBox3.Checked:=false;
Test.AnswerCheckBox5.Checked:=false;
end;

procedure TTest.AnswerCheckBox5Click(Sender: TObject);
begin
Test.AnswerCheckBox1.Checked:=false;
Test.AnswerCheckBox2.Checked:=false;
Test.AnswerCheckBox3.Checked:=false;
Test.AnswerCheckBox4.Checked:=false;
end;

procedure TTest.NextButtonClick(Sender: TObject);
begin
Test.Next;
end;

procedure TTest.TTimerTimer(Sender: TObject);
begin
inc(Time);
Test.TimeLabel.Caption:='Time: ' + IntToStr(Timer - Time);
if Time = Timer then
  begin
    Test.Stop;
    Score.ToScore;
    Score.Visible:=true;
    Test.Visible:=false;
  end;
end;

procedure TTest.BackButtonClick(Sender: TObject);
begin
Test.Stop;
Main.Visible:=true;
Test.Visible:=false;
end;

end.
