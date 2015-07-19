unit GFXEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GR32, GR32_Image, StdCtrls, BoulderDashData;

type
  TfrmGFXEditor = class(TForm)
    imgTileSet: TImage32;
    imgTile: TImage32;
    cmdOK: TButton;
    cmdCancel: TButton;
    ScrollBar1: TScrollBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    procedure DrawTiles;
    procedure DrawNESTile(pOffset: Integer; pBitmap: TBitmap32; pX,
      pY: Integer; pPal: GamePalettesStr);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGFXEditor: TfrmGFXEditor;

implementation

{$R *.dfm}

procedure TfrmGFXEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmGFXEditor := nil;
end;

procedure TfrmGFXEditor.DrawTiles();
var
  Tiles : TBitmap32;
  i,x : Integer;
begin
  Tiles := Tbitmap32.Create;
  Tiles.Width := 128;
  Tiles.Height := 8*8;
  for x := 0 to 7 do
  begin
    for i :=0 to 15 do
    begin
      DrawNESTile(TileEditorStart + ((x*16 + i)*16),Tiles,i*8,x*8,GamePalettes[15]);
    end;
  end;
  imgTileSet.Bitmap := Tiles;
  Tiles.Free;
end;

// This function draws 2BPP tiles to a Bitmap32
// very speedily. Hopefully!
procedure TfrmGFXEditor.DrawNESTile(pOffset : Integer; pBitmap : TBitmap32; pX,pY: Integer; pPal : GamePalettesStr);
var
  x,y : Integer;
  curBit, curBit2 : Char;
  TempBin : String;
  Tile1 : Array [0..15] of Byte;
begin
  For y := 0 To 15 do
    Tile1[y] := ROM[pOffset+y];

  for y := 0 to 7 do
  begin
    for x := 0  to 7 do
    begin
      TempBin := ByteToBin(Tile1[y]);
      CurBit := TempBin[x + 1];
      TempBin := ByteToBin(Tile1[y + 8]);
      CurBit2 := TempBin[x + 1];

      TempBin := CurBit + CurBit2;

      if TempBin = '00' Then
        pBitmap.Pixel[pX + x,pY+y] := NESPal[pPal.Color1]
      else if TempBin = '10' Then
        pBitmap.Pixel[pX + x,pY+y] := NESPal[pPal.Color2]
      else if TempBin = '01' Then
        pBitmap.Pixel[pX + x,pY+y] := NESPal[pPal.Color3]
      else if TempBin = '11' Then
        pBitmap.Pixel[pX + x,pY+y] := NESPal[pPal.Color4];
    end;
  end;
end;

procedure TfrmGFXEditor.FormShow(Sender: TObject);
begin
  DrawTiles();
end;

end.
