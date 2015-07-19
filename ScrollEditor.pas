unit ScrollEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GR32_Image, GR32, StdCtrls, Quarry, BoulderDashData;

type
  TfrmScrollEditor = class(TForm)
    lblStartXPosition: TLabel;
    imgLevel: TImage32;
    lblStartYPosition: TLabel;
    cmdOK: TButton;
    cmdCancel: TButton;
    cbScrollDir1: TComboBox;
    cbScrollDir2: TComboBox;
    lblScrollDirection1: TLabel;
    lblScrollDirection2: TLabel;
    txtStartXPosition: TEdit;
    txtStartYPosition: TEdit;
    lblScrollTo1: TLabel;
    lblScrollTo2: TLabel;
    txtScrollTo1: TEdit;
    txtScrollTo2: TEdit;
    lblPreview: TLabel;
    Bitmap32List: TBitmap32List;
    cmdUpdate: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure txtScrollTo2KeyPress(Sender: TObject; var Key: Char);
    procedure cmdUpdateClick(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Level : Byte;
    procedure DrawSmallLevelData;
    procedure DisplayScrollData;
    procedure LoadScrollData;
    procedure SaveScrollData;
    procedure SetScrollData;
    procedure ValidateFields;
    procedure GenerateTiles;
    { Private declarations }
  public

    constructor Create; overload;
    constructor Create(AOwner : TComponent; pLevel : Byte;pCurLevelGFX : TBitmap32);overload;
    { Public declarations }
  end;

type ScrollDataStr = record
  StartY : Byte;
  StartY1 : Byte;
  StartX : Byte;
  StartX1 : Byte;
  Scroll : Byte;
  ScrollD1 : Byte;
  ScrollD2 : Byte;
  ScrollD3 : Byte;
  ScrollD4 : Byte;
end;

var
  frmScrollEditor: TfrmScrollEditor;
  CurLevelGFX : TBitmap32;
  ScrollData : ScrollDataStr;

implementation

{$R *.dfm}

// Each block represents 8 pixels.
// A screen consists of 16 blocks widthwise
// and 15 heightwise

constructor TfrmScrollEditor.Create(AOwner : TComponent;
  pLevel : Byte;pCurLevelGFX : TBitmap32);
begin

  CurLevelGFX := TBitmap32.Create;
  try
    CurLevelGFX.Width := pCurLevelGFX.Width;
    CurLevelGFX.Height := pCurLevelGFX.Height;
    CurLevelGFX := pCurLevelGFX;
    Level := pLevel;
  except
    FreeAndNil(CurLevelGFX);
  end;

  inherited Create(Aowner);
end;

constructor TfrmScrollEditor.Create;
begin

end;

procedure TfrmScrollEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  Action := caFree;

end;

procedure TfrmScrollEditor.DrawSmallLevelData();
var
  LevelPix : TBitmap32;
  i, x : Integer;
  TempStartX, TempStartY, TempEndX, TempEndY : Integer;
begin
  LevelPix := TBitmap32.Create;
  try
    with LevelPix do
    begin
      Width := 768;
      Height := 384;

      // First draw the top two rows of blocks
      for i := 0 to 1 do
        for x := 0 to 47 do
          Draw(bounds(X *16,(i)*16,16,16),bounds(2 * 16,0,16,16),CurLevelGFX);

      // Now draw the left columns
      for i := 0 to 21 do
        for x :=0 to 3 do
          Draw(bounds(X *16,(i)*16+32,16,16),bounds(2 * 16,0,16,16),CurLevelGFX);

      // Now draw the right hand column
      for i := 0 to 21 do
        for x :=43 to 47 do
          Draw(bounds(X *16,(i)*16+32,16,16),bounds(2 * 16,0,16,16),CurLevelGFX);


      For I := 0 To 21 do
        For X := 0 To 39 do
          Draw(bounds(X *16 +64,(i)*16+32,16,16),bounds(frmQuarry.LevelData[i,x] * 16,0,16,16),CurLevelGFX);

      // Now draw the rectangles that represent the start and end positions
      if length(txtStartXPosition.Text) > 0 then
        TempStartX := StrToInt('$' + txtStartXPosition.Text)
      else
        TempStartX := 0;

      if length(txtStartYPosition.Text) > 0 then
        TempStartY := StrToInt('$' + txtStartYPosition.Text)
      else
        TempStartY := 0;

      Draw(TempStartX,TempStartY,Bitmap32List.Bitmaps[1].Bitmap);

      TempEndX := 0;
      TempEndY := 0;

      // Now work out the ending position
      if Length(txtScrollTo1.Text) > 0 then
      begin
        // Down and Up
        if (cbScrollDir1.ItemIndex = 0) or (cbScrollDir1.ItemIndex = 1) then
          TempEndY := StrToInt('$' + txtScrollTo1.Text)
        // Right and Left
        else if (cbScrollDir1.ItemIndex = 2) or (cbScrollDir1.ItemIndex = 3) then
          TempEndX := StrToInt('$' + txtScrollTo1.Text);
      end;
      if Length(txtScrollTo2.Text) > 0 then
      begin
        // Down and Up
        if (cbScrollDir2.ItemIndex = 0) or (cbScrollDir1.ItemIndex = 1) then
          TempEndY := StrToInt('$' + txtScrollTo2.Text)
        // Right and Left
        else if (cbScrollDir2.ItemIndex = 2) or (cbScrollDir1.ItemIndex = 3) then
          TempEndX := StrToInt('$' + txtScrollTo2.Text);
      end;

      Draw(TempEndX,TempEndY,Bitmap32List.Bitmaps[0].Bitmap);

      imgLevel.Bitmap := LevelPix;
    end;
  finally
    FreeAndNil(levelpix);
  end;
end;

procedure TfrmScrollEditor.DisplayScrollData();
var
  TempScroll : String;
begin
  with ScrollData do
  begin
    txtStartXPosition.Text := IntToHex(StartX1,2) + IntToHex(StartX,2);
    txtStartYPosition.Text := IntToHex(StartY1,2) + IntToHex(StartY,2);
    TempScroll := IntToHex(Scroll,2);
    cbScrollDir1.ItemIndex := StrToInt(TempScroll[1]);
    cbScrollDir2.ItemIndex := StrToInt(TempScroll[2]);
    txtScrollTo1.Text := IntToHex(ScrollD2,2) + IntToHex(ScrollD1,2);
    txtScrollTo2.Text := IntToHex(ScrollD4,2) + IntToHex(ScrollD3,2);
  end;
end;

procedure TfrmScrollEditor.LoadScrollData();
begin
  with ScrollData do
  begin
    StartY := ROM[LevelType[Level].LevelScrollDataOffset];
    StartY1 := ROM[LevelType[Level].LevelScrollDataOffset + 1];
    StartX := ROM[LevelType[Level].LevelScrollDataOffset + 2];
    StartX1 := ROM[LevelType[Level].LevelScrollDataOffset + 3];
    Scroll := ROM[LevelType[Level].LevelScrollDataOffset + 4];
    ScrollD1 := ROM[LevelType[Level].LevelScrollDataOffset + 5];
    ScrollD2 := ROM[LevelType[Level].LevelScrollDataOffset + 6];
    ScrollD3 := ROM[LevelType[Level].LevelScrollDataOffset + 7];
    ScrollD4 := ROM[LevelType[Level].LevelScrollDataOffset + 8];
  end;
end;

procedure TfrmScrollEditor.SaveScrollData();
begin
  with ScrollData do
  begin
    ROM[LevelType[Level].LevelScrollDataOffset] := StartY;
    ROM[LevelType[Level].LevelScrollDataOffset + 1] := StartY1;
    ROM[LevelType[Level].LevelScrollDataOffset + 2] := StartX;
    ROM[LevelType[Level].LevelScrollDataOffset + 3] := StartX1;
    ROM[LevelType[Level].LevelScrollDataOffset + 4] := Scroll;
    ROM[LevelType[Level].LevelScrollDataOffset + 5] := ScrollD1;
    ROM[LevelType[Level].LevelScrollDataOffset + 6] := ScrollD2;
    ROM[LevelType[Level].LevelScrollDataOffset + 7] := ScrollD3;
    ROM[LevelType[Level].LevelScrollDataOffset + 8] := ScrollD4;
  end;
end;

procedure TfrmScrollEditor.FormShow(Sender: TObject);
begin
  Level := frmQuarry.Level;
  LoadScrollData();
  DisplayScrollData();
  DrawSmallLevelData();
end;

procedure TfrmScrollEditor.txtScrollTo2KeyPress(Sender: TObject;
  var Key: Char);
begin
  DrawSmallLevelData();
end;

procedure TfrmScrollEditor.cmdUpdateClick(Sender: TObject);
begin
  ValidateFields();
  DrawSmallLevelData();
end;

procedure TfrmScrollEditor.SetScrollData();
begin
  with ScrollData do
  begin
    StartX1 := StrToInt('$' + txtStartXPosition.Text[1] + txtStartXPosition.Text[2]);
    StartX := StrToInt('$' + txtStartXPosition.Text[3] + txtStartXPosition.Text[4]);
    StartY1 := StrToInt('$' + txtStartYPosition.Text[1] + txtStartYPosition.Text[2]);
    StartY := StrToInt('$' + txtStartYPosition.Text[3] + txtStartYPosition.Text[4]);
    Scroll := StrToInt('$' + IntToHex(cbScrollDir1.ItemIndex,1) + IntToHex(cbScrollDir2.ItemIndex,1));
    ScrollD2 := StrToInt('$' + txtScrollTo1.Text[1] + txtScrollTo1.Text[2]);
    ScrollD1 := StrToInt('$' + txtScrollTo1.Text[3] + txtScrollTo1.Text[4]);
    ScrollD4 := StrToInt('$' + txtScrollTo2.Text[1] + txtScrollTo2.Text[2]);
    ScrollD3 := StrToInt('$' + txtScrollTo2.Text[3] + txtScrollTo2.Text[4]);
  end;

end;

procedure TfrmScrollEditor.ValidateFields();
begin
  if length(txtStartXPosition.Text) = 3 then
    txtStartXPosition.Text := '0' + txtStartXPosition.Text
  else if length(txtStartXPosition.Text) = 2 then
    txtStartXPosition.Text := '00' + txtStartXPosition.Text
  else if length(txtStartXPosition.Text) = 1 then
    txtStartXPosition.Text := '000' + txtStartXPosition.Text
  else if length(txtStartXPosition.Text) = 0 then
    txtStartXPosition.Text := '0000';

  if length(txtStartYPosition.Text) = 3 then
    txtStartYPosition.Text := '0' + txtStartYPosition.Text
  else if length(txtStartYPosition.Text) = 2 then
    txtStartYPosition.Text := '00' + txtStartYPosition.Text
  else if length(txtStartYPosition.Text) = 1 then
    txtStartYPosition.Text := '000' + txtStartYPosition.Text
  else if length(txtStartYPosition.Text) = 0 then
    txtStartYPosition.Text := '0000';

  if length(txtScrollTo1.Text) = 3 then
    txtScrollTo1.Text := '0' + txtScrollTo1.Text
  else if length(txtScrollTo1.Text) = 2 then
    txtScrollTo1.Text := '00' + txtScrollTo1.Text
  else if length(txtScrollTo1.Text) = 1 then
    txtScrollTo1.Text := '000' + txtScrollTo1.Text
  else if length(txtScrollTo1.Text) = 0 then
    txtScrollTo1.Text := '0000';

  if length(txtScrollTo2.Text) = 3 then
    txtScrollTo2.Text := '0' + txtScrollTo2.Text
  else if length(txtScrollTo2.Text) = 2 then
    txtScrollTo2.Text := '00' + txtScrollTo2.Text
  else if length(txtScrollTo2.Text) = 1 then
    txtScrollTo2.Text := '000' + txtScrollTo2.Text
  else if length(txtScrollTo2.Text) = 0 then
    txtScrollTo2.Text := '0000';

end;

procedure TfrmScrollEditor.cmdOKClick(Sender: TObject);
begin

  SetScrollData();
  SaveScrollData();
end;

procedure TfrmScrollEditor.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CurLevelGFX);
end;

procedure TfrmScrollEditor.FormCreate(Sender: TObject);
begin
{  CurLevelGFX := TBitmap32.Create;
  try
    CurLevelGFX := frmQuarry.LevelGFX[0];
  except
    FreeAndNil(CurLevelGFX);
  end;}
  GenerateTiles();
end;

procedure TfrmScrollEditor.GenerateTiles();
var
  i : Integer;

begin

  if CurLevelGFX = nil then
  begin
    CurLevelGFX := TBitmap32.Create;
    try
      // Set up the width and the height of the
      // bitmap.
      CurLevelGFX.Width := 256;
      CurLevelGFX.Height := 16;
    except
      FreeAndNil(CurLevelGFX);
    end;
  end;

  if CurLevelGFX <> nil then
    for i := 0 to 15 do
      frmQuarry.DrawNESTile(ROMGFXLoc[0],CurLevelGFX,i*16,0,ROMData.GamePalettes[ROMData.WorldPalette[LevelType[Level].LevelTileset, ROMData.BlockPalettes[I]]],LevelType[Level].LevelTileset,i);
end;

end.
