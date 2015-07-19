unit Palette;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GR32_Image, GR32, BoulderDashData, Quarry, StdCtrls, GR32_Layers,spin;

type
  TfrmPaletteEditor = class(TForm)
    imgWorldPal11: TImage32;
    imgWorldPal12: TImage32;
    imgWorldPal13: TImage32;
    imgWorldPal14: TImage32;
    imgWorldPal21: TImage32;
    imgWorldPal22: TImage32;
    imgWorldPal23: TImage32;
    imgWorldPal24: TImage32;
    imgWorldPal31: TImage32;
    imgWorldPal32: TImage32;
    imgWorldPal33: TImage32;
    imgWorldPal34: TImage32;
    imgWorldPal41: TImage32;
    imgWorldPal42: TImage32;
    imgWorldPal43: TImage32;
    imgWorldPal44: TImage32;
    imgWorldPal51: TImage32;
    imgWorldPal52: TImage32;
    imgWorldPal53: TImage32;
    imgWorldPal54: TImage32;
    imgWorldPal61: TImage32;
    imgWorldPal62: TImage32;
    imgWorldPal63: TImage32;
    imgWorldPal64: TImage32;
    imgWorldPal71: TImage32;
    imgWorldPal72: TImage32;
    imgWorldPal73: TImage32;
    imgWorldPal74: TImage32;
    imgWorldPal81: TImage32;
    imgWorldPal82: TImage32;
    imgWorldPal83: TImage32;
    imgWorldPal84: TImage32;
    imgNESColours: TImage32;
    lbl000F: TLabel;
    lbl101F: TLabel;
    lbl202F: TLabel;
    lbl303F: TLabel;
    cmdOK: TButton;
    cmdCancel: TButton;
    grpBlockPaletteAttributes: TGroupBox;
    lblBlockNumber1: TLabel;
    lblBlockNumber2: TLabel;
    lblBlockNumber3: TLabel;
    lblBlockNumber4: TLabel;
    lblBlockNumber5: TLabel;
    lblBlockNumber6: TLabel;
    lblBlockNumber7: TLabel;
    lblBlockNumber8: TLabel;
    lblBlockNumber9: TLabel;
    lblBlockNumber10: TLabel;
    lblBlockNumber11: TLabel;
    lblBlockNumber12: TLabel;
    lblBlockNumber13: TLabel;
    lblBlockNumber14: TLabel;
    lblBlockNumber15: TLabel;
    lblBlockNumber16: TLabel;
    txtBlkPalAtt0: TSpinEdit;
    txtBlkPalAtt1: TSpinEdit;
    txtBlkPalAtt2: TSpinEdit;
    txtBlkPalAtt3: TSpinEdit;
    txtBlkPalAtt4: TSpinEdit;
    txtBlkPalAtt5: TSpinEdit;
    txtBlkPalAtt6: TSpinEdit;
    txtBlkPalAtt7: TSpinEdit;
    txtBlkPalAtt8: TSpinEdit;
    txtBlkPalAtt9: TSpinEdit;
    txtBlkPalAtt10: TSpinEdit;
    txtBlkPalAtt11: TSpinEdit;
    txtBlkPalAtt12: TSpinEdit;
    txtBlkPalAtt13: TSpinEdit;
    txtBlkPalAtt14: TSpinEdit;
    txtBlkPalAtt15: TSpinEdit;
    lblWorldPalettes: TLabel;
    lblCurrentPalette: TLabel;
    procedure FormShow(Sender: TObject);
    procedure cmdCancelClick(Sender: TObject);
    procedure imgNESColoursMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal11MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal12MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal13MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal14MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal21MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal22MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal23MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal24MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal31MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal32MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal33MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal34MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal41MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal42MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal43MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal44MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal51MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal52MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal53MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal61MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal62MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal63MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal71MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal72MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal73MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal81MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal82MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal83MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal54MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal64MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal74MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWorldPal84MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure cmdOKClick(Sender: TObject);
    procedure txtBlkPalAtt0Change(Sender: TObject);
    procedure txtBlkPalAtt1Change(Sender: TObject);
    procedure txtBlkPalAtt2Change(Sender: TObject);
    procedure txtBlkPalAtt3Change(Sender: TObject);
    procedure txtBlkPalAtt4Change(Sender: TObject);
    procedure txtBlkPalAtt5Change(Sender: TObject);
    procedure txtBlkPalAtt6Change(Sender: TObject);
    procedure txtBlkPalAtt7Change(Sender: TObject);
    procedure txtBlkPalAtt8Change(Sender: TObject);
    procedure txtBlkPalAtt10Change(Sender: TObject);
    procedure txtBlkPalAtt11Change(Sender: TObject);
    procedure txtBlkPalAtt12Change(Sender: TObject);
    procedure txtBlkPalAtt13Change(Sender: TObject);
    procedure txtBlkPalAtt14Change(Sender: TObject);
    procedure txtBlkPalAtt15Change(Sender: TObject);
    procedure txtBlkPalAtt9Change(Sender: TObject);
    procedure imgNESColoursMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer; Layer: TCustomLayer);
  private
    CurColour : Integer;
    TileX, TileY : Integer;
    procedure DrawNESColours;
    procedure DisplayPalette(pWorld: Integer);
    procedure LoadBlockAttributes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPaletteEditor: TfrmPaletteEditor;

implementation

{$R *.dfm}



procedure TfrmPaletteEditor.FormShow(Sender: TObject);
begin
  DrawNESColours();
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  LoadBlockAttributes();
end;

procedure TfrmPaletteEditor.DisplayPalette(pWorld : Integer);
var
  TempBitmap : TBitmap32;
begin
  TempBitmap := TBitmap32.Create;
  try
    with TempBitmap do
    begin
      Width := 25;
      Height := 25;
{      for i := 0 to frmPaletteEditor.ControlCount - 1 do
      begin
        if frmPaletteEditor.Controls[i] is TImage32 then
        begin
          if StrLIComp(PChar('imgWorldPal'),PChar(frmPaletteEditor.Controls[i].Name),11) =0 then
          begin
            TempIndex := StrToInt(frmPaletteEditor.Controls[i].Name[12]);
            TempColour := StrToInt(frmPaletteEditor.Controls[i].Name[13]);
            if TempColour = 1 then
            begin
              FillRect(0,0,25,25, NESPal[GamePalettes[WorldPalette[pWorld,TempIndex]].Color1]);
              frmPaletteEditor.Controls[i].Hint := '$' + IntToHex(GamePalettes[WorldPalette[pWorld,TempIndex]].Color1,2);
            end
            else if TempColour = 2 then
            begin
              FillRect(0,0,25,25, NESPal[GamePalettes[WorldPalette[pWorld,TempIndex]].Color2]);
              frmPaletteEditor.Controls[i].Hint := '$' + IntToHex(GamePalettes[WorldPalette[pWorld,TempIndex]].Color2,2);
            end
            else if TempColour = 3 then
            begin
              FillRect(0,0,25,25, NESPal[GamePalettes[WorldPalette[pWorld,TempIndex]].Color3]);
              frmPaletteEditor.Controls[i].Hint := '$' + IntToHex(GamePalettes[WorldPalette[pWorld,TempIndex]].Color3,2);
            end
            else if TempColour = 4 then
            begin
              FillRect(0,0,25,25, NESPal[GamePalettes[WorldPalette[pWorld,TempIndex]].Color4]);
              frmPaletteEditor.Controls[i].Hint := '$' + IntToHex(GamePalettes[WorldPalette[pWorld,TempIndex]].Color4,2);
            end;
            FrameRectS(0,0,25,25,clBlack32);
//            with frmPaletteEditor.Controls[i] as TBitmap32 do
            (frmPaletteEditor.Controls[i] as TBitmap32).Bitmap := TempBitmap;
          end;

        end;
      end;}
      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,0]].Color1]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal11.Bitmap := TempBitmap;
      imgWorldPal11.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,0]].Color1,2);

      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,0]].Color2]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal12.Bitmap := TempBitmap;
      imgWorldPal12.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,0]].Color2,2);

      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,0]].Color3]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal13.Bitmap := TempBitmap;
      imgWorldPal13.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,0]].Color3,2);

      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,0]].Color4]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal14.Bitmap := TempBitmap;
      imgWorldPal14.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,0]].Color4,2);

      // The second palette
      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,1]].Color1]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal21.Bitmap := TempBitmap;
      imgWorldPal21.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,1]].Color1,2);

      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,1]].Color2]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal22.Bitmap := TempBitmap;
      imgWorldPal22.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,1]].Color2,2);

      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,1]].Color3]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal23.Bitmap := TempBitmap;
      imgWorldPal23.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,1]].Color3,2);

      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,1]].Color4]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal24.Bitmap := TempBitmap;
      imgWorldPal24.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,1]].Color4,2);

      // The third palette
      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,2]].Color1]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal31.Bitmap := TempBitmap;
      imgWorldPal31.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,2]].Color1,2);

      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,2]].Color2]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal32.Bitmap := TempBitmap;
      imgWorldPal32.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,2]].Color2,2);

      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,2]].Color3]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal33.Bitmap := TempBitmap;
      imgWorldPal33.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,2]].Color3,2);

      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,2]].Color4]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal34.Bitmap := TempBitmap;
      imgWorldPal34.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,2]].Color4,2);

      // The fourth palette
      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,3]].Color1]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal41.Bitmap := TempBitmap;
      imgWorldPal41.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,3]].Color1,2);

      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,3]].Color2]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal42.Bitmap := TempBitmap;
      imgWorldPal42.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,3]].Color2,2);

      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,3]].Color3]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal43.Bitmap := TempBitmap;
      imgWorldPal43.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,3]].Color3,2);

      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,3]].Color4]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal44.Bitmap := TempBitmap;
      imgWorldPal44.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,3]].Color4,2);

      // The fifth palette
      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,4]].Color1]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal51.Bitmap := TempBitmap;
      imgWorldPal51.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,4]].Color1,2);

      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,4]].Color2]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal52.Bitmap := TempBitmap;
      imgWorldPal52.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,4]].Color2,2);

      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,4]].Color3]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal53.Bitmap := TempBitmap;
      imgWorldPal53.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,4]].Color3,2);

      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,4]].Color4]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal54.Bitmap := TempBitmap;
      imgWorldPal54.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,4]].Color4,2);

      // The sixth palette
      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,5]].Color1]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal61.Bitmap := TempBitmap;
      imgWorldPal61.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,5]].Color1,2);

      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,5]].Color2]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal62.Bitmap := TempBitmap;
      imgWorldPal62.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,5]].Color2,2);

      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,5]].Color3]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal63.Bitmap := TempBitmap;
      imgWorldPal63.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,5]].Color3,2);

      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,5]].Color4]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal64.Bitmap := TempBitmap;
      imgWorldPal64.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,5]].Color4,2);

      // The seventh palette
      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,6]].Color1]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal71.Bitmap := TempBitmap;
      imgWorldPal71.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,6]].Color1,2);

      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,6]].Color2]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal72.Bitmap := TempBitmap;
      imgWorldPal72.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,6]].Color2,2);

      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,6]].Color3]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal73.Bitmap := TempBitmap;
      imgWorldPal73.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,6]].Color3,2);

      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,6]].Color4]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal74.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,6]].Color4,2);
      imgWorldPal74.Bitmap := TempBitmap;

      // The eighth palette
      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,7]].Color1]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal81.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,7]].Color1,2);
      imgWorldPal81.Bitmap := TempBitmap;

      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,7]].Color2]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal82.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,7]].Color2,2);
      imgWorldPal82.Bitmap := TempBitmap;

      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,7]].Color3]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal83.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,7]].Color3,2);
      imgWorldPal83.Bitmap := TempBitmap;

      FillRect(0,0,25,25, NESPal[ROMData.GamePalettes[ROMData.WorldPalette[pWorld,7]].Color4]);
      FrameRectS(0,0,25,25,clBlack32);
      imgWorldPal84.Hint := '$' + IntToHex(ROMData.GamePalettes[ROMData.WorldPalette[pWorld,7]].Color4,2);
      imgWorldPal84.Bitmap := TempBitmap;
    end;
  finally
    FreeAndNil(TempBitmap);
  end;
end;

procedure TfrmPaletteEditor.LoadBlockAttributes();
begin
  with ROMData do
  begin
    txtBlkPalAtt0.Value := BlockPalettes[0];
    txtBlkPalAtt1.Value := BlockPalettes[1];
    txtBlkPalAtt2.Value := BlockPalettes[2];
    txtBlkPalAtt3.Value := BlockPalettes[3];
    txtBlkPalAtt4.Value := BlockPalettes[4];
    txtBlkPalAtt5.Value := BlockPalettes[5];
    txtBlkPalAtt6.Value := BlockPalettes[6];
    txtBlkPalAtt7.Value := BlockPalettes[7];
    txtBlkPalAtt8.Value := BlockPalettes[8];
    txtBlkPalAtt9.Value := BlockPalettes[9];
    txtBlkPalAtt10.Value := BlockPalettes[10];
    txtBlkPalAtt11.Value := BlockPalettes[11];
    txtBlkPalAtt12.Value := BlockPalettes[12];
    txtBlkPalAtt13.Value := BlockPalettes[13];
    txtBlkPalAtt14.Value := BlockPalettes[14];
    txtBlkPalAtt15.Value := BlockPalettes[15];
  end;
end;

procedure TfrmPaletteEditor.cmdCancelClick(Sender: TObject);
begin
  LoadBlockPalettes();
  LoadGamePalettes();
end;

procedure TfrmPaletteEditor.DrawNESColours();
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

procedure TfrmPaletteEditor.imgNESColoursMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  // Test
  CurColour := ((X div 18) + (Y div 18) * 16);
  TileX := (X div 18) * 18;
  TileY := (y div 18) * 18;
  DrawNESColours();
//  showmessage(IntToStr(CurColour));
end;

procedure TfrmPaletteEditor.imgNESColoursMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
begin
  lblCurrentPalette.Caption := 'Current Palette Colour: $' + IntToHex(((X div 18) + (Y div 18) * 16),2);
end;

procedure TfrmPaletteEditor.imgWorldPal11MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,0]].Color1 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(0);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal12MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,0]].Color2 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(0);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal13MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,0]].Color3 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(0);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal14MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,0]].Color4 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(0);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal21MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,1]].Color1 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(1);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal22MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,1]].Color2 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(1);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal23MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,1]].Color3 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(1);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal24MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,1]].Color4 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(1);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal31MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,2]].Color1 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(2);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal32MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,2]].Color2 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(2);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal33MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,2]].Color3 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(2);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal34MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,2]].Color4 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(2);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal41MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,3]].Color1 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(3);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal42MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,3]].Color2 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(3);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal43MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,3]].Color3 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(3);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal44MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,3]].Color4 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(3);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal51MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,4]].Color1 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(4);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal52MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,4]].Color2 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(4);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal53MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,4]].Color3 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(4);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal61MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,5]].Color1 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(5);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal62MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,5]].Color2 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(5);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal63MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,5]].Color3 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(5);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal71MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,6]].Color1 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(6);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal72MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,6]].Color2 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(6);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal73MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,6]].Color3 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(6);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal81MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,7]].Color1 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(7);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal82MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,7]].Color2 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(7);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal83MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ROMData.GamePalettes[ROMData.WorldPalette[LevelType[frmQuarry.Level].LevelTileset,7]].Color3 := CurColour;
  DisplayPalette(LevelType[frmQuarry.Level].LevelTileset);
  frmQuarry.GeneratePalTiles(7);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.imgWorldPal54MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  Messagebox(Handle,'This colour cannot be edited. It is only displayed.',PChar(Application.Title),0);
end;

procedure TfrmPaletteEditor.imgWorldPal64MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  Messagebox(Handle,'This colour cannot be edited. It is only displayed.',PChar(Application.Title),0);
end;

procedure TfrmPaletteEditor.imgWorldPal74MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  Messagebox(Handle,'This colour cannot be edited. It is only displayed.',PChar(Application.Title),0);
end;

procedure TfrmPaletteEditor.imgWorldPal84MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  Messagebox(Handle,'This colour cannot be edited. It is only displayed.',PChar(Application.Title),0);
end;

procedure TfrmPaletteEditor.cmdOKClick(Sender: TObject);
begin

  SaveGamePalettes();
  SaveBlockPalettes();
  frmQuarry.GenerateTiles();
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.txtBlkPalAtt0Change(Sender: TObject);
begin
  if txtBlkPalAtt0.Value < 0 then
    txtBlkPalAtt0.Value :=0;
  if txtBlkPalAtt0.Value > 7 then
    txtBlkPalAtt0.Value :=7;
  ROMData.BlockPalettes[0] :=txtBlkPalAtt0.Value;
  frmQuarry.GeneratePalTile(0);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.txtBlkPalAtt1Change(Sender: TObject);
begin
  if txtBlkPalAtt1.Value < 0 then
    txtBlkPalAtt1.Value :=0;
  if txtBlkPalAtt1.Value > 7 then
    txtBlkPalAtt1.Value :=7;

  ROMData.BlockPalettes[1] :=txtBlkPalAtt1.Value;
  frmQuarry.GeneratePalTile(1);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.txtBlkPalAtt2Change(Sender: TObject);
begin
  if txtBlkPalAtt2.Value < 0 then
    txtBlkPalAtt2.Value :=0;
  if txtBlkPalAtt2.Value > 7 then
    txtBlkPalAtt2.Value :=7;

  ROMData.BlockPalettes[2] :=txtBlkPalAtt2.Value;
  frmQuarry.GeneratePalTile(2);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.txtBlkPalAtt3Change(Sender: TObject);
begin
  if txtBlkPalAtt3.Value < 0 then
    txtBlkPalAtt3.Value :=0;
  if txtBlkPalAtt3.Value > 7 then
    txtBlkPalAtt3.Value :=7;

  ROMData.BlockPalettes[3] :=txtBlkPalAtt3.Value;
  frmQuarry.GeneratePalTile(3);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.txtBlkPalAtt4Change(Sender: TObject);
begin
  if txtBlkPalAtt4.Value < 0 then
    txtBlkPalAtt4.Value :=0;
  if txtBlkPalAtt4.Value > 7 then
    txtBlkPalAtt4.Value :=7;

  ROMData.BlockPalettes[4] :=txtBlkPalAtt4.Value;
  frmQuarry.GeneratePalTile(4);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.txtBlkPalAtt5Change(Sender: TObject);
begin
  if txtBlkPalAtt5.Value < 0 then
    txtBlkPalAtt5.Value :=0;
  if txtBlkPalAtt5.Value > 7 then
    txtBlkPalAtt5.Value :=7;

  ROMData.BlockPalettes[5] :=txtBlkPalAtt5.Value;
  frmQuarry.GeneratePalTile(5);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.txtBlkPalAtt6Change(Sender: TObject);
begin
  if txtBlkPalAtt6.Value < 0 then
    txtBlkPalAtt6.Value :=0;
  if txtBlkPalAtt6.Value > 7 then
    txtBlkPalAtt6.Value :=7;

  ROMData.BlockPalettes[6] :=txtBlkPalAtt6.Value;
  frmQuarry.GeneratePalTile(6);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.txtBlkPalAtt7Change(Sender: TObject);
begin
  if txtBlkPalAtt7.Value < 0 then
    txtBlkPalAtt7.Value :=0;
  if txtBlkPalAtt7.Value > 7 then
    txtBlkPalAtt7.Value :=7;

  ROMData.BlockPalettes[7] :=txtBlkPalAtt7.Value;
  frmQuarry.GeneratePalTile(7);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.txtBlkPalAtt8Change(Sender: TObject);
begin
  if txtBlkPalAtt8.Value < 0 then
    txtBlkPalAtt8.Value :=0;
  if txtBlkPalAtt8.Value > 7 then
    txtBlkPalAtt8.Value :=7;

  ROMData.BlockPalettes[8] :=txtBlkPalAtt8.Value;
  frmQuarry.GeneratePalTile(8);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.txtBlkPalAtt10Change(Sender: TObject);
begin
  if txtBlkPalAtt10.Value < 0 then
    txtBlkPalAtt10.Value :=0;
  if txtBlkPalAtt10.Value > 7 then
    txtBlkPalAtt10.Value :=7;

  ROMData.BlockPalettes[10] :=txtBlkPalAtt10.Value;
  frmQuarry.GeneratePalTile(10);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.txtBlkPalAtt11Change(Sender: TObject);
begin
  if txtBlkPalAtt11.Value < 0 then
    txtBlkPalAtt11.Value :=0;
  if txtBlkPalAtt11.Value > 7 then
    txtBlkPalAtt11.Value :=7;

  ROMData.BlockPalettes[11] :=txtBlkPalAtt11.Value;
  frmQuarry.GeneratePalTile(11);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.txtBlkPalAtt12Change(Sender: TObject);
begin
  if txtBlkPalAtt12.Value < 0 then
    txtBlkPalAtt12.Value :=0;
  if txtBlkPalAtt12.Value > 7 then
    txtBlkPalAtt12.Value :=7;

  ROMData.BlockPalettes[12] :=txtBlkPalAtt12.Value;
  frmQuarry.GeneratePalTile(12);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.txtBlkPalAtt13Change(Sender: TObject);
begin
  if txtBlkPalAtt13.Value < 0 then
    txtBlkPalAtt13.Value :=0;
  if txtBlkPalAtt13.Value > 7 then
    txtBlkPalAtt13.Value :=7;

  ROMData.BlockPalettes[13] :=txtBlkPalAtt13.Value;
  frmQuarry.GeneratePalTile(13);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.txtBlkPalAtt14Change(Sender: TObject);
begin
  if txtBlkPalAtt14.Value < 0 then
    txtBlkPalAtt14.Value :=0;
  if txtBlkPalAtt14.Value > 7 then
    txtBlkPalAtt14.Value :=7;

  ROMData.BlockPalettes[14] :=txtBlkPalAtt14.Value;
  frmQuarry.GeneratePalTile(14);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.txtBlkPalAtt15Change(Sender: TObject);
begin
  if txtBlkPalAtt15.Value < 0 then
    txtBlkPalAtt15.Value :=0;
  if txtBlkPalAtt15.Value > 7 then
    txtBlkPalAtt15.Value :=7;

  ROMData.BlockPalettes[15] :=txtBlkPalAtt15.Value;
  frmQuarry.GeneratePalTile(15);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;

procedure TfrmPaletteEditor.txtBlkPalAtt9Change(Sender: TObject);
begin
  if txtBlkPalAtt9.Value < 0 then
    txtBlkPalAtt9.Value :=0;
  if txtBlkPalAtt9.Value > 7 then
    txtBlkPalAtt9.Value :=7;

  ROMData.BlockPalettes[9] :=txtBlkPalAtt9.Value;
  frmQuarry.GeneratePalTile(9);
  frmQuarry.DrawLevelData();
  frmQuarry.DrawTileSelector();
end;



end.
