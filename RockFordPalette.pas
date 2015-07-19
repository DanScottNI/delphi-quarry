unit RockFordPalette;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GR32, GR32_Layers,GR32_Image, StdCtrls, Boulderdashdata;

type
  TfrmRockFordsColours = class(TForm)
    lbl000F: TLabel;
    lbl101F: TLabel;
    lbl202F: TLabel;
    lbl303F: TLabel;
    lblCurrentPalette: TLabel;
    imgRockFordPal1: TImage32;
    imgRockFordPal2: TImage32;
    imgRockFordPal3: TImage32;
    imgRockFordPal4: TImage32;
    imgRockFordPal5: TImage32;
    imgRockFordPal6: TImage32;
    imgRockFordPal7: TImage32;
    imgRockFordPal8: TImage32;
    imgRockFordPal9: TImage32;
    imgRockFordPal10: TImage32;
    imgRockFordPal11: TImage32;
    imgRockFordPal12: TImage32;
    imgRockFordPal13: TImage32;
    chkDisableRockfordPalChange: TCheckBox;
    lblRockFordPalette: TLabel;
    imgNESColours: TImage32;
    cmdOK: TButton;
    cmdCancel: TButton;
    procedure imgNESColoursMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer; Layer: TCustomLayer);
    procedure FormShow(Sender: TObject);
    procedure imgNESColoursMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgRockFordPal1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgRockFordPal2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgRockFordPal3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgRockFordPal4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgRockFordPal5MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgRockFordPal6MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgRockFordPal7MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgRockFordPal8MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgRockFordPal9MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgRockFordPal10MouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);
    procedure imgRockFordPal11MouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);
    procedure imgRockFordPal12MouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);
    procedure imgRockFordPal13MouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);
    procedure cmdOKClick(Sender: TObject);
  private
    CurColour : Integer;
    RockPal : Array [0..12] of byte;
    TileX, TileY : Integer;  
    procedure DrawNESColours;
    procedure LoadRockFordPalette;
    procedure DisplayRockFordPalette;
    procedure SaveRockFordPalette;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRockFordsColours: TfrmRockFordsColours;

implementation

{$R *.dfm}

procedure TfrmRockFordsColours.imgNESColoursMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
begin
  lblCurrentPalette.Caption := 'Current Palette Colour: $' + IntToHex(((X div 18) + (Y div 18) * 16),2);
end;

procedure TfrmRockFordsColours.DrawNESColours();
var
  i,x : Integer;
  TempBitmap : TBitmap32;
begin
  TempBitmap := TBitmap32.Create;
  try
    TempBitmap.Width := 287;
    TempBitmap.Height := 74;

    for i := 0 to 3 do
      for x :=0 to 15 do
        TempBitmap.FillRect(x*18,i*18 + 1,(x*18)+17,i*18+18,NESPal[(i*16) + x]);


    tempbitmap.Line(0,0,0,74, clBlack32);


    if TileX = 0 then
      TempBitmap.FrameRectS(TileX,TileY,TileX+18,TileY+19,clRed32)

    else
      TempBitmap.FrameRectS(TileX-1,TileY,TileX+18,TileY+19,clRed32);

    imgNESColours.Bitmap := TempBitmap;
  finally
    FreeAndNil(TempBitmap);
  end;
end;

procedure TfrmRockFordsColours.FormShow(Sender: TObject);
begin
  DrawNESColours();
  LoadRockFordPalette();
  DisplayRockFordPalette();
end;

procedure TfrmRockFordsColours.imgNESColoursMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CurColour := ((X div 18) + (Y div 18) * 16);
  TileX := (X div 18) * 18;
  TileY := (y div 18) * 18;
  DrawNESColours();
end;

procedure TfrmRockFordsColours.DisplayRockFordPalette();
var
  TempBitmap : TBitmap32;
begin

  TempBitmap := TBitmap32.Create;
  try
    with TempBitmap do
    begin
      Width := 25;
      Height := 25;

      FillRect(0,0,25,25, NESPal[RockPal[0]]);
      FrameRectS(0,0,25,25,clBlack32);
      imgRockFordPal1.Bitmap := TempBitmap;
      imgRockFordPal1.Hint := '$' + IntToHex(RockPal[0],2);

      FillRect(0,0,25,25, NESPal[RockPal[1]]);
      FrameRectS(0,0,25,25,clBlack32);
      imgRockFordPal2.Bitmap := TempBitmap;
      imgRockFordPal2.Hint := '$' + IntToHex(RockPal[1],2);

      FillRect(0,0,25,25, NESPal[RockPal[2]]);
      FrameRectS(0,0,25,25,clBlack32);
      imgRockFordPal3.Bitmap := TempBitmap;
      imgRockFordPal3.Hint := '$' + IntToHex(RockPal[2],2);

      FillRect(0,0,25,25, NESPal[RockPal[3]]);
      FrameRectS(0,0,25,25,clBlack32);
      imgRockFordPal4.Bitmap := TempBitmap;
      imgRockFordPal4.Hint := '$' + IntToHex(RockPal[3],2);

      FillRect(0,0,25,25, NESPal[RockPal[4]]);
      FrameRectS(0,0,25,25,clBlack32);
      imgRockFordPal5.Bitmap := TempBitmap;
      imgRockFordPal5.Hint := '$' + IntToHex(RockPal[4],2);

      FillRect(0,0,25,25, NESPal[RockPal[5]]);
      FrameRectS(0,0,25,25,clBlack32);
      imgRockFordPal6.Bitmap := TempBitmap;
      imgRockFordPal6.Hint := '$' + IntToHex(RockPal[5],2);

      FillRect(0,0,25,25, NESPal[RockPal[6]]);
      FrameRectS(0,0,25,25,clBlack32);
      imgRockFordPal7.Bitmap := TempBitmap;
      imgRockFordPal7.Hint := '$' + IntToHex(RockPal[6],2);

      FillRect(0,0,25,25, NESPal[RockPal[7]]);
      FrameRectS(0,0,25,25,clBlack32);
      imgRockFordPal8.Bitmap := TempBitmap;
      imgRockFordPal8.Hint := '$' + IntToHex(RockPal[7],2);

      FillRect(0,0,25,25, NESPal[RockPal[8]]);
      FrameRectS(0,0,25,25,clBlack32);
      imgRockFordPal9.Bitmap := TempBitmap;
      imgRockFordPal9.Hint := '$' + IntToHex(RockPal[8],2);

      FillRect(0,0,25,25, NESPal[RockPal[9]]);
      FrameRectS(0,0,25,25,clBlack32);
      imgRockFordPal10.Bitmap := TempBitmap;
      imgRockFordPal10.Hint := '$' + IntToHex(RockPal[9],2);

      FillRect(0,0,25,25, NESPal[RockPal[10]]);
      FrameRectS(0,0,25,25,clBlack32);
      imgRockFordPal11.Bitmap := TempBitmap;
      imgRockFordPal11.Hint := '$' + IntToHex(RockPal[10],2);

      FillRect(0,0,25,25, NESPal[RockPal[11]]);
      FrameRectS(0,0,25,25,clBlack32);
      imgRockFordPal12.Bitmap := TempBitmap;
      imgRockFordPal12.Hint := '$' + IntToHex(RockPal[11],2);

      FillRect(0,0,25,25, NESPal[RockPal[12]]);
      FrameRectS(0,0,25,25,clBlack32);
      imgRockFordPal13.Bitmap := TempBitmap;
      imgRockFordPal13.Hint := '$' + IntToHex(RockPal[12],2);

    end;
  finally
    FreeAndNil(TempBitmap);
  end;
end;

procedure TfrmRockFordsColours.LoadRockFordPalette;
var
  i : Integer;
begin
  for i := 0 to 12 do
    RockPal[I] := ROM[RockFordPal+i];

end;

procedure TfrmRockFordsColours.SaveRockFordPalette;
var
  i : Integer;
begin
  for i := 0 to 12 do
    ROM[RockFordPal+i] := RockPal[I];

end;

procedure TfrmRockFordsColours.imgRockFordPal1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  RockPal[0] := CurColour;
  DisplayRockFordPalette();
end;

procedure TfrmRockFordsColours.imgRockFordPal2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  RockPal[1] := CurColour;
  DisplayRockFordPalette();
end;

procedure TfrmRockFordsColours.imgRockFordPal3MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  RockPal[2] := CurColour;
  DisplayRockFordPalette();
end;

procedure TfrmRockFordsColours.imgRockFordPal4MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  RockPal[3] := CurColour;
  DisplayRockFordPalette();
end;

procedure TfrmRockFordsColours.imgRockFordPal5MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  RockPal[4] := CurColour;
  DisplayRockFordPalette();
end;

procedure TfrmRockFordsColours.imgRockFordPal6MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  RockPal[5] := CurColour;
  DisplayRockFordPalette();
end;

procedure TfrmRockFordsColours.imgRockFordPal7MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  RockPal[6] := CurColour;
  DisplayRockFordPalette();
end;

procedure TfrmRockFordsColours.imgRockFordPal8MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  RockPal[7] := CurColour;
  DisplayRockFordPalette();
end;

procedure TfrmRockFordsColours.imgRockFordPal9MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  RockPal[8] := CurColour;
  DisplayRockFordPalette();
end;

procedure TfrmRockFordsColours.imgRockFordPal10MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  RockPal[9] := CurColour;
  DisplayRockFordPalette();
end;

procedure TfrmRockFordsColours.imgRockFordPal11MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  RockPal[10] := CurColour;
  DisplayRockFordPalette();
end;

procedure TfrmRockFordsColours.imgRockFordPal12MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  RockPal[11] := CurColour;
  DisplayRockFordPalette();
end;

procedure TfrmRockFordsColours.imgRockFordPal13MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  RockPal[12] := CurColour;
  DisplayRockFordPalette();
end;

procedure TfrmRockFordsColours.cmdOKClick(Sender: TObject);
begin
  SaveRockFordPalette();
end;

end.
