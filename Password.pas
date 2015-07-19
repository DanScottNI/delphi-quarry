unit Password;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, BoulderDashData;

type
  TfrmPasswordEditor = class(TForm)
    lblWorld2: TLabel;
    lblWorld3: TLabel;
    lblWorld4: TLabel;
    lblWorld5: TLabel;
    lblWorld6: TLabel;
    txtWorld2: TEdit;
    txtWorld3: TEdit;
    txtWorld4: TEdit;
    txtWorld5: TEdit;
    txtWorld6: TEdit;
    cmdOK: TButton;
    cmdCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure LoadPassword;
    procedure SavePassword;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPasswordEditor: TfrmPasswordEditor;

implementation

{$R *.dfm}

procedure TfrmPasswordEditor.LoadPassword();
var
  i : Integer;
begin

  txtWorld2.Text := '';
  // Load the second world password
  for i := 0 to 5 do
    txtWorld2.Text := txtWorld2.Text + IntToStr(ROM[Passwords[0]+i]);

  txtWorld3.Text := '';
  // Load the third world password
  for i := 0 to 5 do
    txtWorld3.Text := txtWorld3.Text + IntToStr(ROM[Passwords[1]+i]);

  txtWorld4.Text := '';
  // Load the fourth world password
  for i := 0 to 5 do
    txtWorld4.Text := txtWorld4.Text + IntToStr(ROM[Passwords[2]+i]);

  txtWorld5.Text := '';
  // Load the fifth world password
  for i := 0 to 5 do
    txtWorld5.Text := txtWorld5.Text + IntToStr(ROM[Passwords[3]+i]);

  txtWorld6.Text := '';
  // Load the sixth world password
  for i := 0 to 5 do
    txtWorld6.Text := txtWorld6.Text + IntToStr(ROM[Passwords[4]+i]);

end;

procedure TfrmPasswordEditor.SavePassword();
var
  i : Integer;
begin

  // First pad out the textboxes
  If Length(txtWorld2.Text) = 0 then txtWorld2.Text := '000000';
  If Length(txtWorld2.Text) = 1 then txtWorld2.Text := '00000' + txtWorld2.Text;
  If Length(txtWorld2.Text) = 2 then txtWorld2.Text := '0000' + txtWorld2.Text;
  If Length(txtWorld2.Text) = 3 then txtWorld2.Text := '000' + txtWorld2.Text;
  If Length(txtWorld2.Text) = 4 then txtWorld2.Text := '00' + txtWorld2.Text;
  If Length(txtWorld2.Text) = 5 then txtWorld2.Text := '0' + txtWorld2.Text;

  // First pad out the textboxes
  If Length(txtWorld3.Text) = 0 then txtWorld3.Text := '000000';
  If Length(txtWorld3.Text) = 1 then txtWorld3.Text := '00000' + txtWorld3.Text;
  If Length(txtWorld3.Text) = 2 then txtWorld3.Text := '0000' + txtWorld3.Text;
  If Length(txtWorld3.Text) = 3 then txtWorld3.Text := '000' + txtWorld3.Text;
  If Length(txtWorld3.Text) = 4 then txtWorld3.Text := '00' + txtWorld3.Text;
  If Length(txtWorld3.Text) = 5 then txtWorld3.Text := '0' + txtWorld3.Text;

  // First pad out the textboxes
  If Length(txtWorld4.Text) = 0 then txtWorld4.Text := '000000';
  If Length(txtWorld4.Text) = 1 then txtWorld4.Text := '00000' + txtWorld4.Text;
  If Length(txtWorld4.Text) = 2 then txtWorld4.Text := '0000' + txtWorld4.Text;
  If Length(txtWorld4.Text) = 3 then txtWorld4.Text := '000' + txtWorld4.Text;
  If Length(txtWorld4.Text) = 4 then txtWorld4.Text := '00' + txtWorld4.Text;
  If Length(txtWorld4.Text) = 5 then txtWorld4.Text := '0' + txtWorld4.Text;

  // First pad out the textboxes
  If Length(txtWorld5.Text) = 0 then txtWorld5.Text := '000000';
  If Length(txtWorld5.Text) = 1 then txtWorld5.Text := '00000' + txtWorld5.Text;
  If Length(txtWorld5.Text) = 2 then txtWorld5.Text := '0000' + txtWorld5.Text;
  If Length(txtWorld5.Text) = 3 then txtWorld5.Text := '000' + txtWorld5.Text;
  If Length(txtWorld5.Text) = 4 then txtWorld5.Text := '00' + txtWorld5.Text;
  If Length(txtWorld5.Text) = 5 then txtWorld5.Text := '0' + txtWorld5.Text;

  // First pad out the textboxes
  If Length(txtWorld6.Text) = 0 then txtWorld6.Text := '000000';
  If Length(txtWorld6.Text) = 1 then txtWorld6.Text := '00000' + txtWorld6.Text;
  If Length(txtWorld6.Text) = 2 then txtWorld6.Text := '0000' + txtWorld6.Text;
  If Length(txtWorld6.Text) = 3 then txtWorld6.Text := '000' + txtWorld6.Text;
  If Length(txtWorld6.Text) = 4 then txtWorld6.Text := '00' + txtWorld6.Text;
  If Length(txtWorld6.Text) = 5 then txtWorld6.Text := '0' + txtWorld6.Text;

  // Now save the passwords
  for i := 0 to 5 do
    ROM[Passwords[0] + i] := StrToInt(txtWorld2.Text[i+1]);
  for i := 0 to 5 do
    ROM[Passwords[1] + i] := StrToInt(txtWorld3.Text[i+1]);
  for i := 0 to 5 do
    ROM[Passwords[2] + i] := StrToInt(txtWorld4.Text[i+1]);
  for i := 0 to 5 do
    ROM[Passwords[3] + i] := StrToInt(txtWorld5.Text[i+1]);
  for i := 0 to 5 do
    ROM[Passwords[4] + i] := StrToInt(txtWorld6.Text[i+1]);
end;

procedure TfrmPasswordEditor.FormShow(Sender: TObject);
begin
  LoadPassword();
end;

procedure TfrmPasswordEditor.cmdOKClick(Sender: TObject);
begin
  SavePassword();
end;

procedure TfrmPasswordEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmPasswordEditor := nil;
end;

end.
