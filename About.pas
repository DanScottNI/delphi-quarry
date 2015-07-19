unit About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmAbout = class(TForm)
    lblQuarry: TLabel;
    lblDescription: TLabel;
    cmdOK: TButton;
    lblDESHomepage: TLabel;
    Label1: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cmdOKClick(Sender: TObject);
  private
    EasterEggBuffer : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;
const
  CrLF : String = Chr(13) + Chr(10);

implementation

{$R *.dfm}

procedure TfrmAbout.FormKeyPress(Sender: TObject; var Key: Char);
begin
  EasterEggBuffer := EasterEggBuffer + Key;

  // Now check for the possible choices
  If EasterEggBuffer = 'RIMMER' then
  begin
    showmessage('If you''re in trouble, he will save the day'+
    CrLF+'He''s brave and he''s fearless, come what may'+
    CrLF+'Without him, the mission would go astray.' +
    CrLF+'He''s Arnold, Arnold, Arnold Rimmer'+
    CrLF+'Without him, life would be much grimmer'+
    CrLF+'He''s handsome, trim, and no one''s slimmer'+
    CrLF+'He will never need a Zimmer'+
    CrLF+
    CrLF+'He''s Arnold, Arnold, Arnold Rimmer'+
    CrLF+'More reliable than a garden Strimmer'+
    CrLF+'He''s never been mistaken for Yul Brynner'+
    CrLF+'He''s not bald and his head doesn''t glimmer'+
    CrLF+
    CrLF+'Master of the wit and the repartee'+
    CrLF+'His command of space directives is uncanny'+
    CrLF+'How come he''s such a genius? Don''t ask me'+
    CrLF+
    CrLF+'Ask Arnold, Arnold, Arnold Rimmer'+
    CrLF+'He''s also a fantastic swimmer'+
    CrLF+'And if you play your cards right, then he just might come round for dinner'+
    CrLF+
    CrLF+'My Tribute To Arnold Rimmer!');
    EasterEggBuffer := '';
  end;

  If (EasterEggBuffer = 'SKIFFLES') or (EasterEggBuffer = 'SETZER') then
  begin
    ShowMessage('Skiffles... stfu');
    EasterEggBuffer := '';
  end;

  If (EasterEggBuffer = '#ROMHACKING') then
  begin
    ShowMessage('Hey guys! How''s it hanging?');
    EasterEggBuffer := '';
  end;

  If (EasterEggBuffer = 'DEMOLITION') then
  begin
    ShowMessage('Yes, Demolition will be a Wrecking Crew editor'+ CrLf + 'Written by me. Wrecking Crew Roxors');
    EasterEggBuffer := '';
  end;

end;

procedure TfrmAbout.cmdOKClick(Sender: TObject);
begin
  EasterEggBuffer :='';
end;


end.
