unit TitleLogo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GR32, GR32_Image,GR32_Layers, BoulderDashData, StdCtrls;

type
  TfrmTitleLogo = class(TForm)
    imgPatternTable: TImage32;
    imgTitleLogo: TImage32;
    chkGridlines: TCheckBox;
    cmdOK: TButton;
    cmdCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure imgPatternTableMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgTitleLogoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure chkGridlinesClick(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
    procedure imgTitleLogoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer; Layer: TCustomLayer);
    procedure imgTitleLogoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
  private
    TileX, TileY : Integer;
    TitleLogo : Array [0..9,0..19] of Byte;
    Attributes : Array [0..5,0..11] of Byte;
    procedure DrawNESTile(pOffset: Integer; pBitmap: TBitmap32;
      pX,pY: Integer; pPal: Integer);
    procedure DrawPatternTable;
    procedure DrawTitleLogo;
    procedure LoadAttributeData;
    procedure LoadTitleLogo;
    procedure SaveAttributes;
    procedure SaveTitleLogo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTitleLogo: TfrmTitleLogo;

implementation

{$R *.dfm}

procedure TfrmTitleLogo.DrawPatternTable();

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
//        TempBitmap.Draw(bounds(i*8,x*8,8,8), bounds((I + (X * 16)) * 8,0,8,8),TSAGFX);
        DrawNESTile(TitleLogoPat + (x*256 + (i * 16)),tempbitmap,i*8,x*8 ,0);
    // Draw the box around the currently selected TSA block
    tempbitmap.FrameRectS(TileX,TileY,TileX+8,TileY + 8,clRed32);
    imgPatternTable.Bitmap := TempBitmap;

  finally
    FreeAndNil(TempBitmap);
  end;

end;

// This function draws 2BPP tiles to a Bitmap32
// very speedily. Hopefully!
procedure TfrmTitleLogo.DrawNESTile(pOffset : Integer; pBitmap : TBitmap32; pX,pY: Integer; pPal : Integer);
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

      pBitmap.Pixel[pX + x,py+y] := NESPal[ROM[TitleLogoPal+(pPal*4)] + Temp4];

{      TempBin := ByteToBin(Tile1[y]);
      CurBit := TempBin[x + 1];
      TempBin := ByteToBin(Tile1[y + 8]);
      CurBit2 := TempBin[x + 1];

      TempBin := CurBit + CurBit2;

      if TempBin = '00' Then
        pBitmap.Pixel[pX + x,py+y] := NESPal[ROM[TitleLogoPal+(pPal*4)]]
      else if TempBin = '10' Then
        pBitmap.Pixel[pX + x,py+y] := NESPal[ROM[TitleLogoPal+(pPal*4)+1]]
      else if TempBin = '01' Then
        pBitmap.Pixel[pX + x,py+y] := NESPal[ROM[TitleLogoPal+(pPal*4)+2]]
      else if TempBin = '11' Then
        pBitmap.Pixel[pX + x,py+y] := NESPal[ROM[TitleLogoPal+(pPal*4)+3]];}
    end;
  end;
end;

procedure TfrmTitleLogo.FormShow(Sender: TObject);
//var
//  tick : Cardinal;
begin
//  tick := GetTickCount();
  DrawPatternTable();
  LoadAttributeData();
  LoadTitleLogo();
  DrawTitleLogo();
//  showmessage(IntToStr(GetTickCount() - tick));
end;

procedure TfrmTitleLogo.DrawTitleLogo();
var
  TempBitmap : TBitmap32;
  i,x : Integer;
begin
  TempBitmap := TBitmap32.Create;
  try

    TempBitmap.Width := 160;
    TempBitmap.Height := 80;

    For X := 0 To 9 do
      For I := 0 To 19 do
        DrawNESTile(TitleLogoPat + (TitleLogo[x,i]*16),tempbitmap,i*8,x*8 ,attributes[(x div 2),(i div 2)+1]);

    if chkGridlines.Checked = true then
    begin
      for i := 1 to 19 do
        TempBitmap.Line(i*8,0,i*8,TempBitmap.Height,GridlineColours[CurGridLineColour]);
      for i := 1 to 9 do
        TempBitmap.Line(0,i*8,TempBitmap.Width,i*8,GridlineColours[CurGridLineColour]);
    end;

    imgTitleLogo.Bitmap := TempBitmap;

  finally
    FreeAndNil(TempBitmap);
  end;

end;

procedure TfrmTitleLogo.imgPatternTableMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  TileX := (X div 16) * 8;
  TileY := (y div 16) * 8;

  DrawPatternTable();
end;

procedure TfrmTitleLogo.imgTitleLogoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if Button = mbLeft then
  begin
    TitleLogo[y div 16,  x div 16] := ( (TileY div 8) * 16) + (TileX div 8)
  end
  else if Button = mbRight then
  begin
{    if Attributes[y div 32, (x div 32) + 1] = 3 then
      Attributes[y div 32, (x div 32) + 1] := 0
    else
      inc(Attributes[y div 32, (x div 32) + 1]);}
  end;
  DrawTitleLogo();
end;

procedure TfrmTitleLogo.chkGridlinesClick(Sender: TObject);
begin
  DrawTitleLogo();
end;

procedure TfrmTitleLogo.LoadTitleLogo();
var
  i,x : Integer;
begin
    For X := 0 To 9 do
    begin
      For I := 0 To 19 do
      begin
//        if i mod 2 = 0 then inc(atti);
        TitleLogo[x,i] := ROM[(TitleLogoData+(x*20)+i)];
//        DrawNESTile(TitleLogoPat + (ROM[(TitleLogoData+(x*20)+i)]*16),tempbitmap,i*8,x*8 ,attributes[(x div 2),(i div 2)+1]);

      end;
//      if atti = 11 then atti := 1;
//      if x mod 2 =1 then inc(attx);
    end;
end;

procedure TfrmTitleLogo.LoadAttributeData();
var
  i, x : Integer;
//  TempBin : String;
begin
  for i:= 0 to 2 do
    for x := 0 to 5 do
    begin
//      TempBin := ByteToBin(ROM[TitleLogoAtt+(i*6)+x]);
      Attributes[i*2+1,x*2+1] := ROM[TitleLogoAtt+(i*8)+x] shr 6;
      Attributes[i*2+1,x*2] := (ROM[TitleLogoAtt+(i*8)+x] shr 4) and 3;
      Attributes[i*2,x*2+1] := (ROM[TitleLogoAtt+(i*8)+x] shr 2) and 3;
      Attributes[i*2,x*2] := ROM[TitleLogoAtt+(i*8)+x] and 3;
    end;
//  showmessage('testing');
end;

procedure TfrmTitleLogo.SaveTitleLogo();
var
  i,x : Integer;
begin
  For X := 0 To 9 do
    For I := 0 To 19 do
      ROM[(TitleLogoData+(x*20)+i)] := TitleLogo[x,i];

end;

procedure TfrmTitleLogo.SaveAttributes();
var
  i, x : Integer;
begin
  for i:= 0 to 2 do
    for x := 0 to 5 do
    begin
//      Attributes[i*2+1,x*2+1] := ROM[TitleLogoAtt+(i*8)+x] shr 6;
//      Attributes[i*2+1,x*2] := (ROM[TitleLogoAtt+(i*8)+x] shr 4) and 3;
//      Attributes[i*2,x*2+1] := (ROM[TitleLogoAtt+(i*8)+x] shr 2) and 3;
//      Attributes[i*2,x*2] := ROM[TitleLogoAtt+(i*8)+x] and 3;
      ROM[TitleLogoAtt+(i*8)+x] := (Attributes[i*2+1, x*2+1] shl 6) + (Attributes[i*2+1,x*2] shl 4) + (Attributes[i*2,x*2+1] shl 2) + (Attributes[i*2,x*2]);
    end;


end;

procedure TfrmTitleLogo.cmdOKClick(Sender: TObject);
begin
  SaveAttributes();
  SaveTitleLogo();
end;

procedure TfrmTitleLogo.imgTitleLogoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
begin
  if ssLeft in Shift then
  begin
    TitleLogo[y div 16,  x div 16] := ( (TileY div 8) * 16) + (TileX div 8)
  end;
{  else if ssRight in Shift then
  begin
    if Attributes[y div 32, (x div 32) + 1] = 3 then
      Attributes[y div 32, (x div 32) + 1] := 0
    else
      inc(Attributes[y div 32, (x div 32) + 1]);
  end;}
  DrawTitleLogo();
end;

procedure TfrmTitleLogo.imgTitleLogoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if Button = mbLeft then
  begin
    TitleLogo[y div 16,  x div 16] := ( (TileY div 8) * 16) + (TileX div 8)
  end
  else if Button = mbRight then
  begin
    if Attributes[y div 32, (x div 32) + 1] = 3 then
      Attributes[y div 32, (x div 32) + 1] := 0
    else
      inc(Attributes[y div 32, (x div 32) + 1]);
  end;
  DrawTitleLogo();
end;

end.
