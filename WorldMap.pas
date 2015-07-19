unit WorldMap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GR32,GR32_Image, BoulderDashData, GR32_Layers,StdCtrls;

type
  TfrmWorldMapEditor = class(TForm)
    imgWorldMap: TImage32;
    imgPatternTable: TImage32;
    cmdOK: TButton;
    cmdCancel: TButton;
    chkGridlines: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
    procedure imgPatternTableMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldMapMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldMapMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure chkGridlinesClick(Sender: TObject);
  private
    { Private declarations }
    TileX, TileY : Integer;
    WorldMapData: Array [0..29, 0..31] of byte;
    AttributeData : Array [0..15,0..15] of Byte;
    procedure LoadWorldMapData;
    procedure DrawNESTile(pOffset: Integer; pBitmap: TBitmap32; pX, pY,
      pPal: Integer);
    procedure DrawPatternTable;
    procedure DrawWorldMap;
    procedure LoadAttributeData;
    procedure SaveAttributeData;
    procedure SaveWorldMap;
  public
    { Public declarations }
  end;

var
  frmWorldMapEditor: TfrmWorldMapEditor;

implementation

{$R *.dfm}

procedure TfrmWorldMapEditor.SaveWorldMap();
var
  i,x : Integer;
begin
  for i := 0 to 29 do
    for x := 0 to 31 do
      ROM[WorldMapLoc + (I * 32) + X] := WorldMapData[i,x];

end;

procedure TfrmWorldMapEditor.SaveAttributeData();
var
  i, x : Integer;
begin
  for i:= 0 to 7 do
    for x := 0 to 7 do
    begin

      ROM[WorldMapAttLoc+(i*8)+x] := (AttributeData[i*2+1, x*2+1] shl 6) + (AttributeData[i*2+1,x*2] shl 4) + (AttributeData[i*2,x*2+1] shl 2) + (AttributeData[i*2,x*2]);
    end;

end;

procedure TfrmWorldMapEditor.LoadWorldMapData();
var
  i,x : Integer;
begin
  for i := 0 to 29 do
    for x := 0 to 31 do
      WorldMapData[i,x] := ROM[WorldMapLoc + (I * 32) + X]
end;

procedure TfrmWorldMapEditor.LoadAttributeData();
var
  i, x : Integer;
begin
  for i:= 0 to 7 do
    for x := 0 to 7 do
    begin

      AttributeData[i*2+1,x*2+1] := ROM[WorldMapAttLoc+(i*8)+x] shr 6;
      AttributeData[i*2+1,x*2] := (ROM[WorldMapAttLoc+(i*8)+x] shr 4) and 3;
      AttributeData[i*2,x*2+1] := (ROM[WorldMapAttLoc+(i*8)+x] shr 2) and 3;
      AttributeData[i*2,x*2] := ROM[WorldMapAttLoc+(i*8)+x] and 3;
    end;

end;

procedure TfrmWorldMapEditor.DrawPatternTable();
var
  TempBitmap : TBitmap32;
  i,x : Integer;
begin
  TempBitmap := TBitmap32.Create;
  try

    TempBitmap.Width := 128;
    TempBitmap.Height := 128;
    For X := 0 To 15 do
      For I := 0 To 15 do

        DrawNESTile(WorldMapPatLoc + (x*256 + (i * 16)),tempbitmap,i*8,x*8 ,0);
    // Draw the box around the currently selected TSA block
    tempbitmap.FrameRectS(TileX,TileY,TileX+8,TileY + 8,clRed32);
    imgPatternTable.Bitmap := TempBitmap;

  finally
    FreeAndNil(TempBitmap);
  end;

end;

// This function draws 2BPP tiles to a Bitmap32
// very speedily. Hopefully!
procedure TfrmWorldMapEditor.DrawNESTile(pOffset : Integer; pBitmap : TBitmap32; pX,pY: Integer; pPal : Integer);
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

      pBitmap.Pixel[pX + x,py+y] := NESPal[ROM[WorldMapPalLoc+(pPal*4)] + Temp4];

{      TempBin := ByteToBin(Tile1[y]);
      CurBit := TempBin[x + 1];
      TempBin := ByteToBin(Tile1[y + 8]);
      CurBit2 := TempBin[x + 1];

      TempBin := CurBit + CurBit2;

      if TempBin = '00' Then
        pBitmap.Pixel[pX + x,py+y] := NESPal[ROM[WorldMapPalLoc+(pPal*4)]]
      else if TempBin = '10' Then
        pBitmap.Pixel[pX + x,py+y] := NESPal[ROM[WorldMapPalLoc+(pPal*4)+1]]
      else if TempBin = '01' Then
        pBitmap.Pixel[pX + x,py+y] := NESPal[ROM[WorldMapPalLoc+(pPal*4)+2]]
      else if TempBin = '11' Then
        pBitmap.Pixel[pX + x,py+y] := NESPal[ROM[WorldMapPalLoc+(pPal*4)+3]];}
    end;
  end;
end;

procedure TfrmWorldMapEditor.DrawWorldMap();
var
  TempBitmap : TBitmap32;
  i,x : Integer;
begin
  TempBitmap := TBitmap32.Create;
  try
    TempBitmap.Width := 256;
    TempBitmap.Height := 240;

    for i := 0 to 29 do
      for x := 0 to 31 do
        DrawNESTile(WorldMapPatLoc + (WorldMapData[i,x]*16),tempbitmap,x*8,i*8,AttributeData[(i div 2),(x div 2)]);

    if chkGridlines.Checked = true then
    begin

      for i := 1 to 31 do
        TempBitmap.Line(i*8,0,i*8,TempBitmap.Height,GridlineColours[CurGridLineColour]);
      for i := 1 to 29 do
        TempBitmap.Line(0,i*8,TempBitmap.Width,i*8,GridlineColours[CurGridLineColour]);
    end;
    imgworldmap.Bitmap := TempBitmap;
  finally
    FreeAndNil(TempBitmap);
  end;
end;

procedure TfrmWorldMapEditor.FormShow(Sender: TObject);
begin
  DrawPatternTable();
  LoadWorldMapData();
  LoadAttributeData();
  DrawWorldMap();

end;

procedure TfrmWorldMapEditor.cmdOKClick(Sender: TObject);
begin
  SaveWorldMap();
  SaveAttributeData();
end;

procedure TfrmWorldMapEditor.imgPatternTableMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  TileX := (X div 16) * 8;
  TileY := (y div 16) * 8;

  DrawPatternTable();
end;

procedure TfrmWorldMapEditor.imgWorldMapMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
{  if Button = mbLeft then
  begin
    WorldMapData[y div 16,  x div 16] := ( (TileY div 8) * 16) + (TileX div 8)
  end
  else if Button = mbRight then
  begin
{    if Attributes[y div 32, (x div 32) + 1] = 3 then
      Attributes[y div 32, (x div 32) + 1] := 0
    else
      inc(Attributes[y div 32, (x div 32) + 1]);}
  {end;
  DrawWorldMap();}
end;

procedure TfrmWorldMapEditor.imgWorldMapMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if Button = mbLeft then
  begin
    WorldMapData[y div 16,  x div 16] := ( (TileY div 8) * 16) + (TileX div 8)
  end
  else if Button = mbRight then
  begin
    if AttributeData[y div 32, (x div 32)] = 3 then
      AttributeData[y div 32, (x div 32)] := 0
    else
      inc(AttributeData[y div 32, (x div 32)]);
  end;
  DrawWorldMap();

end;

procedure TfrmWorldMapEditor.chkGridlinesClick(Sender: TObject);
begin
  DrawWorldMap();
end;

end.
