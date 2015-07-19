unit TSAEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GR32_Image, GR32, BoulderDashData, Quarry, GR32_Layers;

type
  TfrmTSAEditor = class(TForm)
    imgTSABlocks: TImage32;
    procedure FormShow(Sender: TObject);
    procedure imgTSABlocksMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    TSAGFX : TBitmap32;
    TileX, TileY : Integer;
    procedure DrawNESTile(pOffset: Integer; pBitmap: TBitmap32; pX
      : Integer; pPal: GamePalettesStr; BlockNumber: byte);
    procedure DrawTileSelector;
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmTSAEditor: TfrmTSAEditor;

implementation

{$R *.dfm}

procedure TfrmTSAEditor.FormShow(Sender: TObject);
var
  i: Integer;
begin
  TSAGFX := TBitmap32.Create;
  try
    TSAGFX.Width := 1024;
    TSAGFX.Height :=  8;
  except
    FreeAndNil(TSAGFX);
  end;
  frmQuarry.CurTSABlock := 0;
  if TSAGFX <> nil then
  begin
    for i := 0 to 127 do
      DrawNESTile(ROMGFXLoc[0]+ (i*16),TSAGFX,i*8,ROMData.GamePalettes[0],i);
    DrawTileSelector();
  end;
end;

procedure TfrmTSAEditor.DrawTileSelector();
var
  TempBitmap : TBitmap32;
  i,x : Integer;
begin
  TempBitmap := TBitmap32.Create;
  try

    TempBitmap.Width := 128;
    TempBitmap.Height := 64;
    For X := 0 To 7 do
      For I := 0 To 15 do
        TempBitmap.Draw(bounds(i*8,x*8,8,8), bounds((I + (X * 16)) * 8,0,8,8),TSAGFX);

    // Draw the box around the currently selected TSA block
    tempbitmap.FrameRectS(TileX,TileY,TileX+8,TileY + 8,clRed32);
    imgTSABlocks.Bitmap := TempBitmap;

  finally
    FreeAndNil(TempBitmap);
  end;
end;

// This function draws 2BPP tiles to a Bitmap32
// very speedily. Hopefully!
procedure TfrmTSAEditor.DrawNESTile(pOffset : Integer; pBitmap : TBitmap32; pX: Integer; pPal : GamePalettesStr; BlockNumber : byte);
var
  x,y : Integer;
  curBit, curBit2 : Char;
  TempBin : String;
  Tile1 : Array [0..15] of Byte;
  Temp2, Temp3,Temp4 : Byte;
  size : Integer;
begin
  For y := 0 To 15 do
    Tile1[y] := ROM[pOffset+y];
  size := 7;
  for y := 0 to size do
  begin
    for x := 0  to size do
    begin
      Temp2 := ((Tile1[y] and ($80 shr x)) shr (size -x));
      Temp3 := ((Tile1[y + 8] and ($80 shr x)) shr (size -x));

      Temp4 := (Temp3 shl 1) + Temp2;

      if Temp4 = 0 then
      begin
        pBitmap.Pixel[pX + x,y] := NESPal[pPal.Color1];
      end
      else if Temp4 = 1 then
      begin
        pBitmap.Pixel[pX + x,y] := NESPal[pPal.Color2];
      end
      else if Temp4 = 2 then
      begin
        pBitmap.Pixel[pX + x,y] := NESPal[pPal.Color3];
      end
      else if Temp4 = 3 then
      begin
        pBitmap.Pixel[pX + x,y] := NESPal[pPal.Color4];
      end;
{      TempBin := ByteToBin(Tile1[y]);
      CurBit := TempBin[x + 1];
      TempBin := ByteToBin(Tile1[y + 8]);
      CurBit2 := TempBin[x + 1];

      TempBin := CurBit + CurBit2;

      if TempBin = '00' Then
        pBitmap.Pixel[pX + x,y] := NESPal[pPal.Color1]
      else if TempBin = '10' Then
        pBitmap.Pixel[pX + x,y] := NESPal[pPal.Color2]
      else if TempBin = '01' Then
        pBitmap.Pixel[pX + x,y] := NESPal[pPal.Color3]
      else if TempBin = '11' Then
        pBitmap.Pixel[pX + x,y] := NESPal[pPal.Color4];}
    end;
  end;
end;
procedure TfrmTSAEditor.imgTSABlocksMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
var
Tile : Integer;
begin

  Tile := ((y div 16) * 16 * 16) + ((X div 16) * 16);
  TileX := (X div 16) * 8;
  TileY := (y div 16) * 8;
  //showmessage(IntToStr(Y));
  frmQuarry.CurTSABlock := Tile div 16;

  DrawTileSelector();
end;

procedure TfrmTSAEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmQuarry.CurTSABlock :=-1;
  TileX := 0;
  TileY := 0;
  FreeAndNil(TSAGfx);

  Action := caFree;

end;

end.
