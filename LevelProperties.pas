unit LevelProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Quarry,BoulderDashData,spin;

type
  TfrmLevelProperties = class(TForm)
    grpCrystalsTime: TGroupBox;
    lblCrystals: TLabel;
    lblTime: TLabel;
    txtCrystals: TSpinEdit;
    txtTime: TSpinEdit;
    cmdOK: TButton;
    cmdCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
  private
    procedure LoadCrystals;
    procedure LoadTime;
    procedure SaveCrystals;
    procedure SaveTime;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLevelProperties: TfrmLevelProperties;
  Level : Byte;
implementation

{$R *.dfm}

procedure TfrmLevelProperties.LoadCrystals();
begin
  txtCrystals.Value := ROM[LevelType[Level].LevelCrystalOffset];
end;

procedure TfrmLevelProperties.SaveCrystals();
begin
  ROM[LevelType[Level].LevelCrystalOffset] := txtCrystals.Value;
end;

procedure TfrmLevelProperties.LoadTime();
begin
  txtTime.Value := ROM[LevelType[Level].LevelTimeOffset];
end;

procedure TfrmLevelProperties.SaveTime();
begin
  ROM[LevelType[Level].LevelTimeOffset] := txtTime.Value;
end;

procedure TfrmLevelProperties.FormShow(Sender: TObject);
begin
  Level := frmQuarry.Level;
  LoadTime();
  LoadCrystals();
end;

procedure TfrmLevelProperties.cmdOKClick(Sender: TObject);
begin
  SaveCrystals();
  SaveTime();
end;

end.
