unit Quarry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,Graphics, Controls, Forms,
  Dialogs, Menus,ExtCtrls, GR32, GR32_Image, StdCtrls,GR32_Layers,
  ComCtrls, BoulderDashData,ImgList, ToolWin, ActnList, XPMan;
  
type

  TfrmQuarry = class(TForm)
    MainMenu: TMainMenu;
    mnuFile: TMenuItem;
    mnuOpenROM: TMenuItem;
    mnuSaveROM: TMenuItem;
    mnuCloseROM: TMenuItem;
    N1: TMenuItem;
    mnuOptions: TMenuItem;
    N2: TMenuItem;
    mnuExit: TMenuItem;
    mnuTools: TMenuItem;
    mnuPaletteEditor: TMenuItem;
    mnuTSAEditor: TMenuItem;
    mnuHelp: TMenuItem;
    imgLevel: TImage32;
    OpenDialog: TOpenDialog;
    mnuAbout: TMenuItem;
    imgTiles: TImage32;
    HorzScrollBar: TScrollBar;
    VertScrollBar: TScrollBar;
    mnuGFXEditor: TMenuItem;
    mnuLevelProperties: TMenuItem;
    StatusBar: TStatusBar;
    mnuStartingLivesEditor: TMenuItem;
    tlbToolbar: TToolBar;
    tlbOpenROM: TToolButton;
    tlbSaveROM: TToolButton;
    tlbCloseROM: TToolButton;
    tlbSep1: TToolButton;
    tlbJumpToLevel: TToolButton;
    tlbLevelProperties: TToolButton;
    tlbSep2: TToolButton;
    tlbTSAEditor: TToolButton;
    tlbPaletteEditor: TToolButton;
    tlbStartingLives: TToolButton;
    tlbWorldMap: TToolButton;
    ImageList: TImageList;
    imgStart: TImage32;
    mnuPasswordEditor: TMenuItem;
    tlbPasswordEditor: TToolButton;
    mnuScrollEditor: TMenuItem;
    mnuImportLevel: TMenuItem;
    mnuExportLevel: TMenuItem;
    tlbScrollEditor: TToolButton;
    N3: TMenuItem;
    mnuWorldMapEditor: TMenuItem;
    ToolButton1: TToolButton;
    tlbEraseLevel: TToolButton;
    tlbRandomLevel: TToolButton;
    Timer: TTimer;
    ActionList: TActionList;
    actCreateTSAEditor: TAction;
    actCreateSetup: TAction;
    actCreateOptions: TAction;
    actCreateAbout: TAction;
    actCreateJumpTo: TAction;
    actCreatePaletteEditor: TAction;
    actCreatePassword: TAction;
    actCreateProperties: TAction;
    actCreateStartingLives: TAction;
    actCreateScrollEditor: TAction;
    actCreateImport: TAction;
    actCreateExport: TAction;
    actSaveROM: TAction;
    actOpenROM: TAction;
    actCloseROM: TAction;
    actRefreshData: TAction;
    actRubLevel: TAction;
    actRandomLevel: TAction;
    tlbGridlines: TToolButton;
    tlbAnimate: TToolButton;
    actCreateRockFordsPalette: TAction;
    mnuRockfordPaletteEditor: TMenuItem;
    actCreateTitleLogo: TAction;
    mnuTitleLogoEditor: TMenuItem;
    actCreateWorldMap: TAction;
    procedure FormCreate(Sender: TObject);
    procedure imgLevelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure VertScrollBarChange(Sender: TObject);
    procedure VertScrollBarScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure HorzScrollBarChange(Sender: TObject);
    procedure HorzScrollBarScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure imgLevelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer; Layer: TCustomLayer);
    procedure imgLevelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure imgTilesMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure mnuGFXEditorClick(Sender: TObject);
    procedure mnuWorldMapEditorClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mnuExitClick(Sender: TObject);
    procedure actCreateTSAEditorExecute(Sender: TObject);
    procedure actCreateSetupExecute(Sender: TObject);
    procedure actCreateOptionsExecute(Sender: TObject);
    procedure actCreateAboutExecute(Sender: TObject);
    procedure actCreatePaletteEditorExecute(Sender: TObject);
    procedure actCreateJumpToExecute(Sender: TObject);
    procedure actCreatePasswordExecute(Sender: TObject);
    procedure actCreatePropertiesExecute(Sender: TObject);
    procedure actCreateScrollEditorExecute(Sender: TObject);
    procedure actCreateStartingLivesExecute(Sender: TObject);
    procedure actCreateImportExecute(Sender: TObject);
    procedure actCreateExportExecute(Sender: TObject);
    procedure actRefreshDataExecute(Sender: TObject);
    procedure actOpenROMExecute(Sender: TObject);
    procedure actRubLevelExecute(Sender: TObject);
    procedure actRandomLevelExecute(Sender: TObject);
    procedure actSaveROMExecute(Sender: TObject);
    procedure actCloseROMExecute(Sender: TObject);
    procedure tlbGridlinesClick(Sender: TObject);
    procedure tlbAnimateClick(Sender: TObject);
    procedure actCreateRockFordsPaletteExecute(Sender: TObject);
    procedure actCreateTitleLogoExecute(Sender: TObject);
    procedure actCreateWorldMapExecute(Sender: TObject);
  private
    TileX, TileY : Integer;
    Animate : Boolean;
    LevelPix : Array [0..3] of TBitmap32;
    FrameNumber : Byte;
    procedure LoadPaletteFile;
    { Private declarations }
  public
    TSA : TForm;
    CurTile : Byte;
    Level : Byte;
    CurPal : Byte;
    Changed : Boolean;
    CurTSABlock: ShortInt;
    LevelData : Array [0 .. 21, 0..39] of Byte;
    LevelGFX : Array [0..3] of TBitmap32;
    StartEditing : Boolean;
    StartX, StartY : Byte;
    { Public declarations }
    procedure LoadStartXY;
    procedure SaveStartXY;
    procedure GeneratePalTile(pTile: Integer);
    procedure LoadNESROM(pFilename: String);
    procedure LoadNESPalette();
    procedure LoadLevelData;
    procedure GenerateTiles;
    procedure GenerateTile;
    procedure GeneratePalTiles(pPalette: Integer);
    procedure DrawLevelData();
    procedure DrawTileSelector;
    procedure SaveLevelData;
    procedure SaveNESROM(pFilename: String);
    procedure DumpHexData;
    procedure DrawNESTile(pOffset: Integer; pBitmap: TBitmap32; pX,
      pY: Integer; pPal: GamePalettesStr; WorldNumber, BlockNumber: byte);
  end;

var
  frmQuarry: TfrmQuarry;
implementation

uses Options, TSAEditor, QuarrySetup, About,
  JumpTo, Palette, Password, Lives, LevelProperties, ScrollEditor,
    ImportLevel, ExportLevel, iNESHeaderChecks, RockFordPalette, TitleLogo, WorldMap;

{$R *.dfm}

procedure TfrmQuarry.SaveNESROM(pFilename : String);
var
  Mem : TMemoryStream;
  i : Integer;
begin

  Mem := TMemoryStream.Create;
  try
    Mem.SetSize(high(ROM));

    Mem.Position :=0;

    for i := 0 to mem.Size do
      Mem.Write(ROM[i],1);

    Mem.SaveToFile(pFilename);
  finally
    freeandnil(mem);
  end;
  
end;

procedure TfrmQuarry.LoadNESROM(pFilename : String);
var
  Mem : TMemoryStream;
  i : Integer;
begin

  Mem := TMemoryStream.Create;
  try
    Mem.LoadFromFile(pFilename);

    Mem.Position :=0;
    setlength(ROM, Mem.Size);
    for i := 0 to mem.Size do
      Mem.Read(ROM[i],1);
  finally
    FreeAndNil(Mem);
  end;
end;

procedure TfrmQuarry.LoadPaletteFile();
var
  i : Integer;
  FileStr : TFileStream;
  Red,Green, Blue : Byte;
begin
  FileStr := TFileStream.Create(CurPaletteStr,fmOpenRead);
  try
    for i := 0 to 63 do
    begin
      Red :=0;
      Green :=0;
      Blue :=0;

      FileStr.Read(Red,1);
      FileStr.Read(Green,1);
      FileStr.Read(Blue,1);
      NESPal[i] := WinColor(StringToColor('$' + IntToHex(Blue,2) + IntToHex(Green,2) + IntToHex(Red,2)));
    end;
  finally
    FreeAndNil(FileStr);
  end;
end;

procedure TfrmQuarry.LoadNESPalette();
begin
  NESPal[0] := WinColor(StringToColor('$808080'));
  NESPal[1] := WinColor(StringToColor('$A63D00'));
  NESPal[2] := WinColor(StringToColor('$B01200'));
  NESPal[3] := WinColor(StringToColor('$960044'));
  NESPal[4] := WinColor(StringToColor('$5E00A1'));
  NESPal[5] := WinColor(StringToColor('$2800C7'));
  NESPal[6] := WinColor(StringToColor('$0006BA'));
  NESPal[7] := WinColor(StringToColor('$00178C'));
  NESPal[8] := WinColor(StringToColor('$002F5C'));
  NESPal[9] := WinColor(StringToColor('$004510'));
  NESPal[10] := WinColor(StringToColor('$004A05'));
  NESPal[11] := WinColor(StringToColor('$2E4700'));
  NESPal[12] := WinColor(StringToColor('$664100'));
  NESPal[13] := WinColor(StringToColor('$000000'));
  NESPal[14] := WinColor(StringToColor('$050505'));
  NESPal[15] := WinColor(StringToColor('$050505'));
  NESPal[16] := WinColor(StringToColor('$C7C7C7'));
  NESPal[17] := WinColor(StringToColor('$FF7700'));
  NESPal[18] := WinColor(StringToColor('$FF5521'));
  NESPal[19] := WinColor(StringToColor('$FA3782'));
  NESPal[20] := WinColor(StringToColor('$B52FEB'));
  NESPal[21] := WinColor(StringToColor('$5029FF'));
  NESPal[22] := WinColor(StringToColor('$0022FF'));
  NESPal[23] := WinColor(StringToColor('$0032D6'));
  NESPal[24] := WinColor(StringToColor('$0062C4'));
  NESPal[25] := WinColor(StringToColor('$008035'));
  NESPal[26] := WinColor(StringToColor('$008F05'));
  NESPal[27] := WinColor(StringToColor('$558A00'));
  NESPal[28] := WinColor(StringToColor('$CC9900'));
  NESPal[29] := WinColor(StringToColor('$212121'));
  NESPal[30] := WinColor(StringToColor('$090909'));
  NESPal[31] := WinColor(StringToColor('$090909'));
  NESPal[32] := WinColor(StringToColor('$FFFFFF'));
  NESPal[33] := WinColor(StringToColor('$FFD70F'));
  NESPal[34] := WinColor(StringToColor('$FFA269'));
  NESPal[35] := WinColor(StringToColor('$FF80D4'));
  NESPal[36] := WinColor(StringToColor('$F345FF'));
  NESPal[37] := WinColor(StringToColor('$8B61FF'));
  NESPal[38] := WinColor(StringToColor('$3388FF'));
  NESPal[39] := WinColor(StringToColor('$129CFF'));
  NESPal[40] := WinColor(StringToColor('$20BCFA'));
  NESPal[41] := WinColor(StringToColor('$0EE39F'));
  NESPal[42] := WinColor(StringToColor('$35F02B'));
  NESPal[43] := WinColor(StringToColor('$A4F00C'));
  NESPal[44] := WinColor(StringToColor('$FFFB05'));
  NESPal[45] := WinColor(StringToColor('$5E5E5E'));
  NESPal[46] := WinColor(StringToColor('$0D0D0D'));
  NESPal[47] := WinColor(StringToColor('$0D0D0D'));
  NESPal[48] := WinColor(StringToColor('$FFFFFF'));
  NESPal[49] := WinColor(StringToColor('$FFFCA6'));
  NESPal[50] := WinColor(StringToColor('$FFECB3'));
  NESPal[51] := WinColor(StringToColor('$EBABDA'));
  NESPal[52] := WinColor(StringToColor('$F9A8FF'));
  NESPal[53] := WinColor(StringToColor('$B3ABFF'));
  NESPal[54] := WinColor(StringToColor('$B0D2FF'));
  NESPal[55] := WinColor(StringToColor('$A6EFFF'));
  NESPal[56] := WinColor(StringToColor('$9CF7FF'));
  NESPal[57] := WinColor(StringToColor('$95E8D7'));
  NESPal[58] := WinColor(StringToColor('$AFEDA6'));
  NESPal[59] := WinColor(StringToColor('$DAF2A2'));
  NESPal[60] := WinColor(StringToColor('$FCFF99'));
  NESPal[61] := WinColor(StringToColor('$DDDDDD'));
  NESPal[62] := WinColor(StringToColor('$111111'));
  NESPal[63] := WinColor(StringToColor('$111111'));
end;

procedure TfrmQuarry.FormCreate(Sender: TObject);
begin
  // If the data directory does not
  // exist, exit the program.
  If DirectoryExists(ExtractFileDir(ParamStr(0)) + '\Data') = False then
  begin
    messagebox(Handle,'The data directory does not exist. Quarry cannot run without it.',PChar(Application.Title),0);
    Application.Terminate;
  end;
  // If the palette directory does not exist, exit the program.
  if DirectoryExists(ExtractFileDir(ParamStr(0)) + '\Palettes') = False then
  begin
    messagebox(Handle,'The palette directory does not exist. Quarry cannot run without it.',PChar(Application.Title),0);
    Application.Terminate;
  end;

  // Now check for the Quarry command switches
  // None of these command switches are to be released
  // publicly. Some of these features will be enabled
  // by default in future versions of Quarry.
  // -decalldatafiles = Will decrypt all data files.
  // -encalldatafiles = Will encrypt all data files.
  // -autopal = Will delete the current palette listing, and attempt to
  //            create a new listing.
  // -autodat = Will delete the current datafile listing, and attempt to
  //            create a new listing.
  // -usedecdat = Will force Quarry to use decrypted data files, instead
  //              of the encrypted data file type.
  // -useworldmap = Will enable the world map editor
  // -useGBgfx = Will enable the reading of Gameboy ROM's GFX in the
  //             GFX editor.
  // -enablegfxeditor = Will enable the GFX editor.
{  for i :=0 to ParamCount do
  begin
    if ParamStr(i+1) = '

  end;}
  if FileExists(ExtractFileDir(ParamStr(0)) + '\options.ini') = false then
    actCreateSetup.Execute
  else
    LoadOptions();
  tlbGridlines.Down := EnableGridlinesDef;
      Animate := AnimationDef;
      tlbAnimate.Down := Animate;
  Timer.Interval := FrameTimeAnimation;
  LoadPaletteFile();
  CurTSABlock := -1;
  
end;

procedure TfrmQuarry.DumpHexData;
var
  Data : TStringList;
  i : Integer;
begin
  Data := TStringList.Create;
  try
    Data.Add('TSA Data: ' + IntToHex(TSALoc,2));
    Data.Add('Palette Data: ' + IntToHex(PalDataLoc,2));
    Data.Add('Block Attribute Data: ' + IntToHex(BlockPalAttLoc,2));
    Data.Add('Level GFX Data 1: ' + IntToHex(ROMGFXLoc[0],2));
    Data.Add('Level GFX Data 2: ' + IntToHex(ROMGFXLoc[1],2));
    Data.Add('Level GFX Data 3: ' + IntToHex(ROMGFXLoc[2],2));
    Data.Add('Level GFX Data 4: ' + IntToHex(ROMGFXLoc[3],2));
    Data.Add('Rockford Palette: ' + IntToHex(RockFordPal,2));
    Data.Add('World Map Data: ' + IntToHex(WorldMapLoc,2));
    Data.Add('World Map Palette: ' + IntToHex(WorldMapPalLoc,2));
    Data.Add('World Map Attribute Data: ' + IntToHex(WorldMapAttLoc,2));
    Data.Add('World Map Palette Data: ' + IntToHex(WorldMapPatLoc,2));
    Data.Add('Title Logo Data: ' + IntToHex(TitleLogoData,2));
    Data.Add('Title Logo Attribute Data: ' + IntToHex(TitleLogoAtt,2));
    Data.Add('Title Logo Palette: ' + IntToHex(TitleLogoPal,2));
    Data.Add('Starting Lives: ' + IntToHex(StartingLives,2));

    for i := 0 to 23 do
    begin
      Data.Add(LevelType[i].LevelName + ' Data: ' + IntToHex(LevelType[i].LevelOffset,2));
    end;
    for i := 0 to 23 do
    begin
      Data.Add(LevelType[i].LevelName + ' Scroll Data ' + IntToHex(LevelType[i].LevelScrollDataOffset,2));
    end;
    for i := 0 to 23 do
    begin
      Data.Add(LevelType[i].LevelName + ' Start Y ' + IntToHex(LevelType[i].LevelStartYOffset,2));
      Data.Add(LevelType[i].LevelName + ' Start X ' + IntToHex(LevelType[i].LevelStartXOffset,2));
      Data.Add(LevelType[i].LevelName + ' Crystal ' + IntToHex(LevelType[i].LevelCrystalOffset,2));
      Data.Add(LevelType[i].LevelName + ' Time ' + IntToHex(LevelType[i].LevelTimeOffset,2));
    end;

    Data.SaveToFile(ExtractFileDir(Application.ExeName) + '\hexdata.txt');
  finally
    FreeAndNil(Data);
  end;
end;

procedure TfrmQuarry.SaveLevelData();
var
  i, x : Integer;
  TempByte : Byte;
begin


  For I := 0 To 21 do
  begin
    For X := 0 To 19 do
    begin
      TempByte := StrToInt('$' + IntToHex(LevelData[I, (X * 2) + 1],1) + IntToHex(LevelData[I, X * 2],1));
      ROM[LevelType[Level].LevelOffset + (I * 20) + X] := TempByte;
    end;

  end;

end;

procedure TfrmQuarry.LoadLevelData();
var
  i, x : Integer;
  TempByte : Byte;
  TempHexVal : String;
  mem : TMemoryStream;

begin

  For I := 0 To 21 do
  begin

    For X := 0 To 19 do
    begin
      TempByte := ROM[LevelType[Level].LevelOffset + (I * 20) + X];
      TempHexVal := IntToHex(TempByte,2);
      LevelData[I, (X * 2) + 1] := StrToInt('$' + TempHexVal[1]);
      LevelData[I, (X * 2)] := StrToInt('$' + TempHexVal[2]);
      //Debug.Print LevelData(i, x * 2)
      //Debug.Print LevelData(i, (x * 2) + 1)
    end;

  end;

  mem := TMemoryStream.Create;
  try
    Mem.Size := 880;
    Mem.Write(LevelData[0],880);
    Mem.SaveToFile('c:\decomp.bin');
  finally
    FreeAndNil(Mem);
  end;

end;

procedure TfrmQuarry.GenerateTiles();
var
  i,x : Integer;

begin

  for x := 0 to 3 do
  begin
    if LevelGFX[x] = nil then
    begin
      LevelGFX[x] := TBitmap32.Create;
      try
        // Set up the width and the height of the
        // bitmap.
      LevelGFX[x].Width := 256;
      LevelGFX[x].Height := 16;
      except
        FreeAndNil(LevelGFX[x]);
      end;
    end;

    if LevelGFX[x] <> nil then
      for i := 0 to 15 do
        DrawNESTile(ROMGFXLoc[x],LevelGFX[x],i*16,0,ROMData.GamePalettes[ROMData.WorldPalette[LevelType[Level].LevelTileset, ROMData.BlockPalettes[I]]],LevelType[Level].LevelTileset,i);

  end;
end;

// This function draws 2BPP tiles to a Bitmap32
// very speedily. Hopefully!
procedure TfrmQuarry.DrawNESTile(pOffset : Integer; pBitmap : TBitmap32; pX, pY : Integer; pPal : GamePalettesStr; WorldNumber,BlockNumber : byte);
var
  x,y,size : Integer;
  curBit, curBit2 : Char;
  TempBin : String;
  Temp2,Temp3, Temp4 : Byte;
  Tile1 : Array [0..15] of Byte;
  Tile2 : Array [0..15] of Byte;
  Tile3 : Array [0..15] of Byte;
  Tile4 : Array [0..15] of Byte;
begin
  For y := 0 To 15 do
    Tile1[y] := ROM[pOffset + ((ROMData.Blocks[ROMData.WorldBlocks[WorldNumber, BlockNumber]].TopLeft) * 16) + y];

  For y := 0 To 15 do
    Tile2[y] := ROM[pOffset + ((ROMData.Blocks[ROMData.WorldBlocks[WorldNumber, BlockNumber]].TopRight) * 16) + y];

  For y := 0 To 15 do
    Tile3[y] := ROM[pOffset + ((ROMData.Blocks[ROMData.WorldBlocks[WorldNumber, BlockNumber]].BottomLeft) * 16) + y];

  For y := 0 To 15 do
    Tile4[y] := ROM[pOffset + ((ROMData.Blocks[ROMData.WorldBlocks[WorldNumber, BlockNumber]].BottomRight) * 16) + y];

  size := 7;

  for y := 0 to size do
  begin
    for x := 0  to size  do
    begin

      Temp2 := ((Tile1[y] and ($80 shr x)) shr (size -x));
      Temp3 := ((Tile1[y + 8] and ($80 shr x)) shr (size -x));

      Temp4 := (Temp3 shl 1) + Temp2;
      if Temp4 = 0 then
        pBitmap.Pixel[pX + x,py+y] := NESPal[pPal.Color1]
      else if Temp4 = 1 then
        pBitmap.Pixel[pX + x,py+y] := NESPal[pPal.Color2]
      else if Temp4 = 2 then
        pBitmap.Pixel[pX + x,py+y] := NESPal[pPal.Color3]
      else if Temp4 = 3 then
        pBitmap.Pixel[pX + x,py+y] := NESPal[pPal.Color4];

{      TempBin := ByteToBin(Tile1[y]);
      CurBit := TempBin[x + 1];
      TempBin := ByteToBin(Tile1[y + 8]);
      CurBit2 := TempBin[x + 1];

      TempBin := CurBit + CurBit2;



      if TempBin = '00' Then
        pBitmap.Pixel[pX + x,pY + y] := NESPal[pPal.Color1]
      else if TempBin = '10' Then
        pBitmap.Pixel[pX + x,pY + y] := NESPal[pPal.Color2]
      else if TempBin = '01' Then
        pBitmap.Pixel[pX + x,pY + y] := NESPal[pPal.Color3]
      else if TempBin = '11' Then
        pBitmap.Pixel[pX + x,pY + y] := NESPal[pPal.Color4];}
    end;
  end;
  // Draw the top right block
  for y := 0 to size do
  begin
    for x := 0  to size do
    begin
      Temp2 := ((Tile2[y] and ($80 shr x)) shr (size -x));
      Temp3 := ((Tile2[y + 8] and ($80 shr x)) shr (size -x));

      Temp4 := (Temp3 shl 1) + Temp2;
      if Temp4 = 0 then
        pBitmap.Pixel[pX + 8 + x,py+y] := NESPal[pPal.Color1]
      else if Temp4 = 1 then
        pBitmap.Pixel[pX + 8 + x,py+y] := NESPal[pPal.Color2]
      else if Temp4 = 2 then
        pBitmap.Pixel[pX + 8 + x,py+y] := NESPal[pPal.Color3]
      else if Temp4 = 3 then
        pBitmap.Pixel[pX + 8 + x,py+y] := NESPal[pPal.Color4];

{      TempBin := ByteToBin(Tile2[y]);
      CurBit := TempBin[x + 1];
      TempBin := ByteToBin(Tile2[y + 8]);
      CurBit2 := TempBin[x + 1];

      TempBin := CurBit + CurBit2;

      if TempBin = '00' Then
        pBitmap.Pixel[pX+8 + x,pY + y] := NESPal[pPal.Color1]
      else if TempBin = '10' Then
        pBitmap.Pixel[pX+8 + x,pY + y] := NESPal[pPal.Color2]
      else if TempBin = '01' Then
        pBitmap.Pixel[pX+8 + x,pY + y] := NESPal[pPal.Color3]
      else if TempBin = '11' Then
        pBitmap.Pixel[pX+8 + x,pY + y] := NESPal[pPal.Color4];}
    end;
  end;

  // Draw the bottom left block
  for y := 0 to size do
  begin
    for x := 0  to size do
    begin
      Temp2 := ((Tile3[y] and ($80 shr x)) shr (size -x));
      Temp3 := ((Tile3[y + 8] and ($80 shr x)) shr (size -x));

      Temp4 := (Temp3 shl 1) + Temp2;
      if Temp4 = 0 then
        pBitmap.Pixel[pX + x,py+8+y] := NESPal[pPal.Color1]
      else if Temp4 = 1 then
        pBitmap.Pixel[pX + x,py+8+y] := NESPal[pPal.Color2]
      else if Temp4 = 2 then
        pBitmap.Pixel[pX + x,py+8+y] := NESPal[pPal.Color3]
      else if Temp4 = 3 then
        pBitmap.Pixel[pX + x,py+8+y] := NESPal[pPal.Color4];
{      TempBin := ByteToBin(Tile3[y]);
      CurBit := TempBin[x + 1];
      TempBin := ByteToBin(Tile3[y + 8]);
      CurBit2 := TempBin[x + 1];

      TempBin := CurBit + CurBit2;

      if TempBin = '00' Then
        pBitmap.Pixel[pX + x,pY +8 + y] := NESPal[pPal.Color1]
      else if TempBin = '10' Then
        pBitmap.Pixel[pX + x,pY +8 + y] := NESPal[pPal.Color2]
      else if TempBin = '01' Then
        pBitmap.Pixel[pX + x,pY +8 + y] := NESPal[pPal.Color3]
      else if TempBin = '11' Then
        pBitmap.Pixel[pX + x,pY +8 + y] := NESPal[pPal.Color4];}
    end;
  end;

  // Draw the bottom right block
  for y := 0 to size do
  begin
    for x := 0 to size do
    begin

      Temp2 := ((Tile4[y] and ($80 shr x)) shr (size -x));
      Temp3 := ((Tile4[y + 8] and ($80 shr x)) shr (size -x));

      Temp4 := (Temp3 shl 1) + Temp2;
      if Temp4 = 0 then
        pBitmap.Pixel[pX + 8 + x,py+8+y] := NESPal[pPal.Color1]
      else if Temp4 = 1 then
        pBitmap.Pixel[pX + 8 + x,py+8+y] := NESPal[pPal.Color2]
      else if Temp4 = 2 then
        pBitmap.Pixel[pX + 8 + x,py+8+y] := NESPal[pPal.Color3]
      else if Temp4 = 3 then
        pBitmap.Pixel[pX + 8 + x,py+8+y] := NESPal[pPal.Color4];

{      TempBin := ByteToBin(Tile4[y]);
      CurBit := TempBin[x + 1];
      TempBin := ByteToBin(Tile4[y + 8]);
      CurBit2 := TempBin[x + 1];

      TempBin := CurBit + CurBit2;

      if TempBin = '00' Then
        pBitmap.Pixel[pX + 8 + x,pY + 8 + y] := NESPal[pPal.Color1]
      else if TempBin = '10' Then
        pBitmap.Pixel[pX + 8 + x,pY + 8 + y] := NESPal[pPal.Color2]
      else if TempBin = '01' Then
        pBitmap.Pixel[pX + 8 + x,pY + 8 + y] := NESPal[pPal.Color3]
      else if TempBin = '11' Then
        pBitmap.Pixel[pX + 8 + x,pY + 8 + y] := NESPal[pPal.Color4];}
    end;
  end;
end;



procedure TfrmQuarry.DrawLevelData;
var

  i, x,z, TempHeight, TempWidth : Integer;
begin

  for z := 0 to 3 do
  begin
    if LevelPix[z] = nil then
    begin
      LevelPix[z] := TBitmap32.Create;
      try
        LevelPix[z].Width := 256;
        LevelPix[z].Height := 240;
      except
        FreeAndNil(LevelPix[z]);
      end;
    end;

    if LevelPix[z] <> nil then
    begin
      TempWidth := 0;
      TempHeight := 0;

      For I := VertScrollBar.Position To VertScrollBar.Position+14 do
      begin
        For X := HorzScrollBar.Position To HorzScrollBar.Position + 15 do
        begin
          LevelPix[z].Draw(bounds(TempWidth*16,TempHeight*16,16,16),bounds(LevelData[i,x] * 16,0,16,16),LevelGFX[z]);

          inc(TempWidth);

        end;
        inc(TempHeight);
        TempWidth := 0;
      end;

      // Now draw the start position
      If (StartX >= HorzScrollBar.Position) And (StartY >= VertScrollBar.Position) Then
        LevelPix[z].Draw(Bounds((StartX- HorzScrollBar.Position)*16,(StartY - VertScrollBar.Position) *16,8,8),bounds(0,0,8,8),imgStart.Bitmap);

      if tlbGridlines.Down = True then
      begin
        for i :=  1  to 15 do
          LevelPix[z].Line(i*16,0,i*16,levelpix[0].Height,GridlineColours[CurGridLineColour]);
        for i := 1 to 14 do
          LevelPix[z].Line(0,i*16,levelpix[0].Width,i*16,GridlineColours[CurGridLineColour]);
      end;
    end;

  end;
  imgLevel.Bitmap := LevelPix[FrameNumber];

end;

procedure TfrmQuarry.DrawTileSelector();
var
  x,i : Integer;
  CurTileGFX : TBitmap32;
begin
  CurTileGFX := TBitmap32.Create();
  try
    CurTileGFX.Width := 32;
    CurTileGFX.Height := 128;
    For X := 0 To 7 do
      For I := 0 To 1 do
        CurTileGFX.Draw(bounds(i*16,x*16,16,16),bounds((I + (X * 2)) * 16,0,16,16),LevelGFX[0]);

    // Draw the box around the currently selected TSA block
    // Draw the top line
//    CurTileGFX.Line(TileX,TileY,TileX+15,TileY,clRed32);
    // Draw the left line
//    CurTileGFX.Line(TileX,TileY,TileX,TileY+15,clRed32);
    // Draw the bottom line
//    CurTileGFX.Line(TileX,TileY+15,TileX+16,TileY+15,clRed32);
    // Draw the right line
//    CurTileGFX.Line(TileX+15,TileY,TileX+15,TileY+15,clRed32);
    CurTileGFX.FrameRectS(TileX,TileY,TileX+16, TileY+16,clRed32);
//    CurTileGFX.SaveToFile('c:\tiles.bmp');
    imgTiles.Bitmap := CurTileGFX;
  finally
    FreeAndNil(CurTileGFX);
  end;
end;



procedure TfrmQuarry.imgLevelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
var
  TempX, TempY : Integer;
begin
  If X >= 512 Then Exit;
  If y >= 480 Then Exit;
  Changed := True;
//  MouseDown := True;

  TempX := (X div 32) + HorzScrollBar.Position;
  TempY := (y div 32) + VertScrollBar.Position;

  If Button = mbRight Then
  begin
    CurTile := LevelData[TempY, TempX];
    DrawTileSelector();
    TileX := (CurTile mod 2) * 16;
    TileY := (CurTile div 2) * 16;
//    showmessage('tile X: ' + IntToStr(TileX));
//    showmessage('tile Y: ' + IntToStr(TileY));
//    showmessage('CurTile: ' + IntToStr(CurTile));
    Exit;
  End;

  If StartEditing = False Then
    LevelData[TempY, TempX] := CurTile
  Else
  begin
    TempX := (X div 32) + HorzScrollBar.Position;
    TempY := (y div 32) + VertScrollBar.Position;
    StartX := TempX;
    StartY := TempY;
  End;

  DrawLevelData();
end;

procedure TfrmQuarry.VertScrollBarChange(Sender: TObject);
begin
  DrawLevelData();
end;

procedure TfrmQuarry.VertScrollBarScroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
  DrawLevelData();
end;

procedure TfrmQuarry.HorzScrollBarChange(Sender: TObject);
begin
  DrawLevelData();
end;

procedure TfrmQuarry.HorzScrollBarScroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
  DrawLevelData();
end;

procedure TfrmQuarry.imgLevelMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer; Layer: TCustomLayer);
var
  TempX, TempY : Integer;
begin
  If X >= 512 Then Exit;
  If y >= 480 Then Exit;
  Changed := True;
  If ssLeft in Shift Then
  begin
    TempX := (X div 32) + HorzScrollBar.Position;
    TempY := (y div 32) + VertScrollBar.Position;
    If StartEditing = False Then
        LevelData[TempY, TempX] := CurTile
    Else
    begin
      StartX := TempX;
      StartY := TempY;

    End;

    DrawLevelData();
  End;
end;

procedure TfrmQuarry.imgLevelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
var
  TempX, TempY : Integer;
begin
  If X >= 512 Then Exit;
  If y >= 480 Then Exit;
  Changed := True;
//  if MouseDown = False then Exit;

  TempX := (X div 32) + HorzScrollBar.Position;
  TempY := (y div 32) + VertScrollBar.Position;

  If Button = mbRight Then
  begin

    CurTile := LevelData[TempY, TempX];

    DrawTileSelector();
//    MouseDown := False;
    Exit;
  End;

  If StartEditing = False Then
    LevelData[TempY, TempX] := CurTile
  Else
  begin

    StartX := TempX;
    StartY := TempY;

  End;
  DrawLevelData();

//  MouseDown := False;

end;

procedure TfrmQuarry.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  // If the level is available, run all the key checks listed
  // below.
  if imgLevel.Visible = True then
  begin
    // The first key check to run is the enabling and disabling
    // of the start position editing. The F11 key is the trigger
    // for this check.
    if Key = VK_F11 then
    begin
      // Set the start editing variable to the opposite
      // of its current value.
      StartEditing := Not(StartEditing);
      // If the start editing variable is set to false
      // change the text in status bar.
      if StartEditing = False then
        StatusBar.Panels.Items[0].Text := 'F11 - Enable Start Position Editing'
      else
        StatusBar.Panels.Items[0].Text := 'F11 - Disable Start Position Editing';
      // Beep the computer's speaker
      beep;
      // Exit the subroutine.
      exit;
    end;
    // Save the start X and Y properties
    SaveStartXY();
    // Save the level data
    SaveLevelData();
    // If the key pressed is the Page Up key,
    // check if the current Level variable is 23.
    // 23 is the last level, so loop round to the
    // beginning (0). If it is not 23, increment the
    // current level variable by 1.
    if Key = VK_PRIOR	then
    begin
      if Level = 23 then
        Level := 0
      else
        inc(Level);
    end
    // If the key pressed is the Page Down key,
    // check if the current Level variable is 0.
    // If it is, then set the current Level variable
    // to 23. If it is not 0, decrement the current
    // level variable by 1.
    else if Key = VK_NEXT	then
    begin
      if Level = 0 then
        Level := 23
      else
        dec(Level);
    end
    // If the key pressed is neither Page Up or Page Down
    // exit the subroutine.
    else
      exit;
    //Initialise();
    // Set the caption of the form to say Quarry v0.8 plus
    // the level name.
    Caption := 'Quarry v0.8 - ' + LevelType[Level].LevelName;
    // Regenerate the tiles. This should probably
    // contain a check to see if the previous or next
    // level is the same as the current level. If it is
    // then don't regenerate the tiles.
    GenerateTiles();
    // Reload the start X and Y co-ordinates
    LoadStartXY();
    // Reload the level data for new level.
    LoadLevelData();
    // Draw the new level.
    DrawLevelData();
    // Draw the tile selector
    DrawTileSelector();
  end;
end;

procedure TfrmQuarry.imgTilesMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
var
  Tile, TileX1, TileY1 : Integer;
begin
  Tile := ((y div 32) * 2 * 32) + ((X div 32) * 32);
  CurTile := Tile div 32;

  If ((Button = mbRight) and (CurTSABlock > -1)) then
  begin

//    showmessage('you suck');
    TileX1 := (X mod 32);
    TileY1 := (y mod 32);
    If (TileX1 < 16) And (TileY1 < 16) Then
      ROMData.Blocks[ROMData.WorldBlocks[LevelType[Level].LevelTileset, CurTile]].TopLeft := CurTSABlock
    Else If (TileX1 < 16) And (TileY1 >= 16) Then
      ROMData.Blocks[ROMData.WorldBlocks[LevelType[Level].LevelTileset, CurTile]].BottomLeft := CurTSABlock
    Else If (TileX1 >= 16) And (TileY1 < 16) Then
      ROMData.Blocks[ROMData.WorldBlocks[LevelType[Level].LevelTileset, CurTile]].TopRight := CurTSABlock
    Else If (TileX1 >= 16) And (TileY1 >= 16) Then
      ROMData.Blocks[ROMData.WorldBlocks[LevelType[Level].LevelTileset, CurTile]].BottomRight := CurTSABlock;
    GenerateTile();
    DrawLevelData();
    //showmessage(IntToStr(TileX1) + ' ' + IntToStr(TileY1));
  end;
  TileX := (X div 32) * 16;
  TileY := (y div 32) * 16;
  DrawTileSelector();

end;

procedure TfrmQuarry.GenerateTile();
var
  i, z : Integer;
begin

  for z := 0 to 3 do
  begin
    for i := 0 to 15 do
      if ROMData.WorldBlocks[LevelType[Level].LevelTileset, i] = ROMData.WorldBlocks[LevelType[Level].LevelTileset, CurTile] then
        DrawNESTile(ROMGFXLoc[z],LevelGFX[z],i*16,0,ROMData.GamePalettes[ROMData.WorldPalette[LevelType[Level].LevelTileset, ROMData.BlockPalettes[I]]],LevelType[Level].LevelTileset,i);
  end;

//  LevelGFX.SaveToFile('C:\test.bmp');

end;

procedure TfrmQuarry.GeneratePalTile(pTile : Integer);
var
  i : Integer;
begin


  for i := 0 to 3 do
    DrawNESTile(ROMGFXLoc[i],LevelGFX[i],pTile*16,0,ROMData.GamePalettes[ROMData.WorldPalette[LevelType[Level].LevelTileset, ROMData.BlockPalettes[pTile]]],LevelType[Level].LevelTileset,pTile);


end;

procedure TfrmQuarry.GeneratePalTiles(pPalette : Integer);
var
  i,z : Integer;
begin

  for z := 0 to 3 do
  begin
    for i := 0 to 15 do
    begin
      if ROMData.BlockPalettes[i] =  pPalette then
        DrawNESTile(ROMGFXLoc[z],LevelGFX[z],i*16,0,
          ROMData.GamePalettes[ROMData.WorldPalette[LevelType[Level].LevelTileset,
            ROMData.BlockPalettes[I]]],LevelType[Level].LevelTileset,i);
    end;
  end;

end;

procedure TfrmQuarry.LoadStartXY();
begin
  StartX := ROM[LevelType[Level].LevelStartXOffset];
  StartY := ROM[LevelType[Level].LevelStartYOffset];
end;

procedure TfrmQuarry.SaveStartXY();
begin
  ROM[LevelType[Level].LevelStartXOffset] := StartX;
  ROM[LevelType[Level].LevelStartYOffset] := StartY;
end;

//procedure TfrmQuarry.mnuEncryptCurrentDataFileClick(Sender: TObject);
//begin
//  EncryptDataFile(CurDataFileStr);
//  showmessage('done');
//end;


procedure TfrmQuarry.mnuGFXEditorClick(Sender: TObject);
begin

//  ShowGFXEditor();
  showmessage('I don''t work');
end;

procedure TfrmQuarry.mnuWorldMapEditorClick(Sender: TObject);
begin
  showmessage('I don''t work');
end;

procedure TfrmQuarry.TimerTimer(Sender: TObject);
begin
  if Animate = true and imgLevel.Visible = True then
  begin
    if FrameNumber = 3 then
      FrameNumber := 0
    else
      inc(FrameNumber);

    // Now set the level gfx
    imgLevel.Bitmap := LevelPix[FrameNumber];
  end;

end;

procedure TfrmQuarry.FormDestroy(Sender: TObject);
begin
  FreeAndNil(LevelPix[0]);
  FreeAndNil(LevelPix[1]);
  FreeAndNil(LevelPix[2]);
  FreeAndNil(LevelPix[3]);
  FreeAndNil(LevelGFX[0]);
  FreeAndNil(LevelGFX[1]);
  FreeAndNil(LevelGFX[2]);
  FreeAndNil(LevelGFX[3]);
end;

procedure TfrmQuarry.mnuExitClick(Sender: TObject);
begin
  application.terminate();
end;

procedure TfrmQuarry.actCreateTSAEditorExecute(Sender: TObject);
begin
  if CurTSABlock = -1 then
    TSA := TfrmTSAEditor.Create(self);

  TSA.Show;

end;

procedure TfrmQuarry.actCreateSetupExecute(Sender: TObject);
var
  Setup : TfrmQuarrySetup;
begin
  Setup := TfrmQuarrySetup.Create(self);
  try
    Setup.ShowModal;
  finally
    FreeAndNil(Setup);
  end;

end;

procedure TfrmQuarry.actCreateOptionsExecute(Sender: TObject);
var
  Options : TfrmOptions;
begin

  Options := TfrmOptions.Create(self);
  try
    Options.ShowModal;
  finally
    FreeAndNil(Options);
  end;

  // If the level editor is enabled, reload everything
  if imgLevel.Visible =  True then
  begin
    SaveLevelData();
    LoadEncryptedDataFile();
    Initialise();
    LoadPaletteFile();

    Timer.Interval := FrameTimeAnimation;
    GenerateTiles();
    LoadLevelData();
    DrawLevelData();
    DrawTileSelector();
    Timer.Interval := FrameTimeAnimation;
  end;

end;

procedure TfrmQuarry.actCreateAboutExecute(Sender: TObject);
var
  About : TfrmAbout;
begin

  About := TfrmAbout.Create(self);
  try
    About.ShowModal;
  finally
    FreeAndNil(About);
  end;

end;

procedure TfrmQuarry.actCreatePaletteEditorExecute(Sender: TObject);
var
  Palette : TfrmPaletteEditor;
begin

  Palette := TfrmPaletteEditor.Create(self);
  try
    Palette.ShowModal;
  finally
    FreeAndNil(Palette);
  end;

end;

procedure TfrmQuarry.actCreateJumpToExecute(Sender: TObject);
var
  JumpTo : TfrmJumpTo;
begin

  JumpTo := TfrmJumpTo.Create(self);
  try
    JumpTo.ShowModal;
  finally
    FreeAndNil(JumpTo);
  end;

end;

procedure TfrmQuarry.actCreatePasswordExecute(Sender: TObject);
var
  Password : TfrmPasswordEditor;
begin

  Password := TfrmPasswordEditor.Create(self);
  try
    Password.ShowModal;
  finally
    FreeAndNil(Password);
  end;

end;

procedure TfrmQuarry.actCreatePropertiesExecute(Sender: TObject);
var
  Properties : TfrmLevelProperties;
begin

  Properties := TfrmLevelProperties.Create(self);
  try
    Properties.ShowModal;
  finally
    FreeAndNil(Properties);
  end;

end;

procedure TfrmQuarry.actCreateScrollEditorExecute(Sender: TObject);
var
  Scroll : TfrmScrollEditor;
begin

//  Scroll := TfrmScrollEditor.Create(frmQuarry,Level,LevelGFX[0]);
  Scroll := TfrmScrollEditor.Create(self);
  try
    Scroll.ShowModal;
  finally
    FreeAndNil(Scroll);
  end;

end;

procedure TfrmQuarry.actCreateStartingLivesExecute(Sender: TObject);
var
  StartingLives : TfrmStartingLivesEditor;
begin

  StartingLives := TfrmStartingLivesEditor.Create(self);
  try
    StartingLives.ShowModal;
  finally
    FreeAndNil(StartingLives);
  end;

end;

procedure TfrmQuarry.actCreateImportExecute(Sender: TObject);
var
  Import : TfrmImportLevel;
begin

  Import := TfrmImportLevel.Create(self);
  try
    Import.ShowModal;
  finally
    FreeAndNil(Import);
  end;

end;

procedure TfrmQuarry.actCreateExportExecute(Sender: TObject);
var
  ExportLevel : TfrmExportLevel;
begin

  ExportLevel := TfrmExportLevel.Create(self);
  try
    ExportLevel.ShowModal;
  finally
    FreeAndNil(ExportLevel);
  end;

end;

procedure TfrmQuarry.actRefreshDataExecute(Sender: TObject);
begin
  LoadLevelData();
  LoadStartXY();
  GenerateTile();
  DrawLevelData();
end;

procedure TfrmQuarry.actOpenROMExecute(Sender: TObject);
var
  i : integer;
begin
  if FileExists(LastROMLoaded) =  true then
    OpenDialog.InitialDir := ExtractFileDir(LastROMLoaded);
  if OpenDialog.Execute then
  begin
    LoadNESROM(Opendialog.FileName);
    LoadiNESHeader();
    LoadEncryptedDataFile();
    //LoadDataFile();
    Initialise();
    DumpHexData;
    for i := 0 to 3 do
    begin
      if LevelPix[i] = nil then
      begin
        LevelPix[i] := TBitmap32.Create;
        try

          LevelPix[i].Width := 256;
          LevelPix[i].Height := 240;
        except
          FreeAndNil(LevelPix[i]);
        end;
      end;
    end;

    if LevelPix[0] <> nil then
    begin
      Level := 0;
      GenerateTiles();
      // Now enable the save and close menu, and make all the controls visible.

      actCreatePaletteEditor.Enabled := True;
      actCreateProperties.Enabled := True;
      actCreateTSAEditor.Enabled := True;
      actCreateJumpTo.Enabled := True;
      actCreatePassword.Enabled := True;
      actCreateStartingLives.Enabled := True;
      actCreateScrollEditor.Enabled := True;
      actCreateImport.Enabled := True;
      actCreateExport.Enabled := True;
      actCreateTitleLogo.Enabled := True;
      actRubLevel.Enabled := True;
      actRandomLevel.Enabled := True;
      actSaveROM.Enabled := True;
      actCloseROM.Enabled := True;
      actCreateRockFordsPalette.Enabled := True;
      actCreateWorldMap.Enabled := True;
      tlbGridlines.Enabled := True;
      tlbAnimate.Enabled := True;
      imgLevel.Visible := True;
      imgTiles.Visible := True;

      StatusBar.Visible := True;
      HorzScrollBar.Visible := True;
      VertScrollBar.Visible := True;
      FrameNumber := 0;
      // Change the caption of the form
      Caption := 'Quarry v0.8 - ' + LevelType[Level].LevelName;
      LoadStartXY();
      LoadLevelData();
      DrawLevelData();
      DrawTileSelector();
      LastROMLoaded := OpenDialog.FileName;
      SaveOptions();
//      DumpLevelDataToINI();
    end
    else
    begin
      messagebox(Handle,'An unknown error has occurred. Quarry will now quit.',PChar(Application.Title),0);
      application.Terminate;
    end;
  end;

end;

procedure TfrmQuarry.actRubLevelExecute(Sender: TObject);
var
  i,x : Integer;
begin
  // Now we erase the level data and redraw it.
  for i := 0 to 21 do
  begin
    for x :=0 to 39 do
      LevelData[i,x] := 2;
  end;

  for i := 0 to 39 do
    LevelData[0,i] := 3;

  for i := 0 to 39 do
    LevelData[21,i] := 3;

  for i :=0 to 21 do
  begin
    LevelData[i,0] := 3;
    LevelData[i,39] := 3;
  end;

  DrawLevelData();


end;

procedure TfrmQuarry.actRandomLevelExecute(Sender: TObject);
var
  i,x : Integer;
begin
  // Initialise the random number generator
  Randomize;

  // Now we erase the level data and redraw it.
  for i := 0 to 21 do
  begin
    for x :=0 to 39 do
      LevelData[i,x] := random(15);
  end;

  for i := 0 to 39 do
    LevelData[0,i] := 3;

  for i := 0 to 39 do
    LevelData[21,i] := 3;

  for i :=0 to 21 do
  begin
    LevelData[i,0] := 3;
    LevelData[i,39] := 3;
  end;

  DrawLevelData();

end;

procedure TfrmQuarry.actSaveROMExecute(Sender: TObject);
begin
  SaveStartXY();
  SaveBlocks();
  saveleveldata();
  SaveNESROM(OpenDialog.FileName);
  Changed := False;
  messagebox(Handle,'Changes saved.',pchar(application.title),0);
end;

procedure TfrmQuarry.actCloseROMExecute(Sender: TObject);
var
  msgres : Integer;
begin
  msgres := Messagebox(Handle,'Do you wish to save the ROM before closing?',PChar(Application.Title),MB_YESNOCANCEL);
  if (msgres = IDYES) or (msgres = IDNO) then
  begin
    if msgres = IDYES then
    begin
      actSaveROMExecute(Application);
    end;
    
    // close the rom
    SetLength(ROM,0);

    if LevelPix[0] <> nil then
    begin
      FreeAndNil(LevelPix[0]);
      FreeAndNil(LevelPix[1]);
      FreeAndNil(LevelPix[2]);
      FreeAndNil(LevelPix[3]);
    end;
    if LevelGFX[0] <> nil then
    begin
      FreeAndNil(LevelGFX[0]);
      FreeAndNil(LevelGFX[1]);
      FreeAndNil(LevelGFX[2]);
      FreeAndNil(LevelGFX[3]);
    end;

    actCreatePaletteEditor.Enabled := False;
    actCreateProperties.Enabled := False;
    actCreateTSAEditor.Enabled := False;
    actCreateJumpTo.Enabled := False;
    actCreatePassword.Enabled := False;
    actCreateStartingLives.Enabled := False;
    actCreateScrollEditor.Enabled := False;
    actCreateImport.Enabled := False;
    actCreateExport.Enabled := False;
    actRubLevel.Enabled := False;
    actRandomLevel.Enabled := False;
    actCreateTitleLogo.Enabled := False;
    actCreateRockFordsPalette.Enabled := False;
    actSaveROM.Enabled := False;
    actCloseROM.Enabled := False;
    actCreateWorldMap.Enabled := False;

    tlbGridlines.Enabled := False;
    tlbAnimate.Enabled := False;

    imgLevel.Visible := False;
    imgTiles.Visible := False;

    StatusBar.Visible := False;
    HorzScrollBar.Visible := False;
    VertScrollBar.Visible := False;
    tlbGridlines.Down := EnableGridlinesDef;
    Caption := 'Quarry v0.8';
  end;
end;

procedure TfrmQuarry.tlbGridlinesClick(Sender: TObject);
begin
  tlbGridlines.Down := not tlbGridlines.Down;
  DrawLevelData();
end;

procedure TfrmQuarry.tlbAnimateClick(Sender: TObject);
begin
  tlbAnimate.Down := not tlbanimate.Down;
  Animate := tlbanimate.Down;
  FrameNumber :=0;

  GenerateTiles();
  DrawLevelData();
  Timer.Enabled := Animate;
end;

procedure TfrmQuarry.actCreateRockFordsPaletteExecute(Sender: TObject);
var
  RockFord : TfrmRockFordsColours;
begin

  RockFord := TfrmRockFordsColours.Create(self);
  try
    RockFord.ShowModal;
  finally
    FreeAndNil(RockFord);
  end;

end;

procedure TfrmQuarry.actCreateTitleLogoExecute(Sender: TObject);
var
  TitleLogo : TfrmTitleLogo;
begin

  TitleLogo := TfrmTitleLogo.Create(self);
  try
    TitleLogo.ShowModal;
  finally
    FreeAndNil(TitleLogo);
  end;

end;

procedure TfrmQuarry.actCreateWorldMapExecute(Sender: TObject);
var
  WorldMap : TfrmWorldMapEditor;
begin

  WorldMap := TfrmWorldMapEditor.Create(self);
  try
    WorldMap.ShowModal;
  finally
    FreeAndNil(WorldMap);
  end;
end;

end.
