unit JumpTo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BoulderDashData, StdCtrls, Quarry;

type
  TfrmJumpTo = class(TForm)
    lblLevel: TLabel;
    lstLevels: TListBox;
    cmdOK: TButton;
    cmdCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmJumpTo: TfrmJumpTo;

implementation

{$R *.dfm}

procedure TfrmJumpTo.FormShow(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to 23 do
  begin
    lstLevels.Items.Add(LevelType[i].LevelName);
  end;
  lstLevels.ItemIndex := frmQuarry.Level;
end;

procedure TfrmJumpTo.cmdOKClick(Sender: TObject);
begin
  frmQuarry.Level := lstLevels.ItemIndex;
  frmQuarry.Caption := 'Quarry v0.7 - ' + LevelType[frmQuarry.Level].LevelName;
  frmQuarry.GenerateTiles();
  frmQuarry.LoadStartXY();
  frmQuarry.LoadLevelData();
  frmQuarry.DrawLevelData();

  frmQuarry.DrawTileSelector();
end;

end.
