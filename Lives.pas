unit Lives;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,BoulderDashData,spin;

type
  TfrmStartingLivesEditor = class(TForm)
    lblStartingLives: TLabel;
    txtLives: TSpinEdit;
    cmdOK: TButton;
    cmdCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure LoadStartLives;
    procedure SaveStartLives;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStartingLivesEditor: TfrmStartingLivesEditor;

implementation

{$R *.dfm}

procedure TfrmStartingLivesEditor.LoadStartLives();
begin
  txtLives.Value := ROM[StartingLives];
end;

procedure TfrmStartingLivesEditor.SaveStartLives();
begin
  ROM[StartingLives] := txtLives.Value;
end;

procedure TfrmStartingLivesEditor.FormShow(Sender: TObject);
begin
  LoadStartLives();
end;

procedure TfrmStartingLivesEditor.cmdOKClick(Sender: TObject);
begin
  SaveStartLives();
end;

procedure TfrmStartingLivesEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmStartingLivesEditor := nil;
end;

end.
