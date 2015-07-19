unit BoulderDashData;

interface

uses INIFiles, SysUtils,GR32, Classes;

Procedure SetupLevelData();
Procedure Initialise();
procedure DumpLevelDataToINI();
procedure LoadDataFile();
procedure LoadOptions();
procedure SaveOptions;
Procedure SaveBlocks();
//function  ByteToBin(OneByte: Byte): String;
Procedure LoadBlockPalettes();
Procedure SaveBlockPalettes();
Procedure SaveGamePalettes();
Procedure LoadGamePalettes();
//Procedure EncryptDataFile(pFilename : String);
procedure XOREncryptDataFile(pFilename: String);
Procedure RotateByte(num : Byte);
procedure LoadEncryptedDataFile();
// The palettes that are used in the game.
Type GamePalettesStr = record
  Color1 : Byte;
  Color2 : Byte;
  Color3 : Byte;
  Color4 : Byte;
end;

// The 8x8 tiles which make up a block.
Type BlocksStr = record
  TopLeft : Byte;
  TopRight : Byte;
  BottomLeft : Byte;
  BottomRight : Byte;
end;

Type LevelTypeStr = record
  LevelName : String;
  LevelTileset : Integer;
  LevelOffset : Integer;
  LevelCrystalOffset : Integer;
  LevelStartXOffset : Integer;
  LevelStartYOffset : Integer;
  LevelTimeOffset : Integer;
  LevelScrollDataOffset : Integer;
End;

type ROMDataStr = record
  // The palettes that are used in the world.
  WorldPalette : Array [0..5, 0..7] of Byte;
  // To store all the palettes used in the game.
  GamePalettes : Array [0..47] of GamePalettesStr;
  // Each block that is used in every world.
  WorldBlocks : Array [0..5, 0..15] of Byte;
  // All the blocks that are available in the game. Needs the proper figure.
  Blocks : Array [0..43] of BlocksStr;
  // The palettes that are loaded for each block (0-15)
  BlockPalettes : Array [0..15] of Byte;
end;

var
  // The data that is stored about each of the levels.
  LevelType: Array[0 .. 23] of LevelTypeStr;
  // Contains the entire ROM in memory.
  ROM : Array Of Byte;
  ROMData : ROMDataStr;
  // The locations of the GFX in the rom
  ROMGFXLoc : Array [0..3] of Integer;
  // The locations of the passwords in the ROM
  Passwords : Array [0..4] of Integer;
  // The location of the starting lives in the ROM
  StartingLives : Integer;
  // The currently selected palette
  CurPalette : Integer;
  // The currently selected palette
  CurPaletteStr : String;
  // The colour of the gridlines in the level editor
  CurGridLineColour : Integer;
  // The data file to use.
  CurDataFile : Integer;
  // The data file to use.
  CurDataFileStr : String;
  // The location of the TSA data
  TSALoc : Integer;
  // The location of Rockford's Palette
  RockFordPal : Integer;
  // The location of the world map data
  WorldMapLoc : Integer;
  // The location of the world map's palette
  WorldMapPalLoc : Integer;
  // The location of the world map's attributes
  WorldMapAttLoc : Integer;
  // The location of the world map's pattern table
  WorldMapPatLoc : Integer;
  // The location of the title logo data
  TitleLogoData : Integer;
  // The location of the title logo attributes
  TitleLogoAtt : Integer;
  // The location of the title logo's palette
  TitleLogoPal : Integer;
  // The location of the title logo's pattern table
  TitleLogoPat : Integer;
  // The location of the palette data
  PalDataLoc : integer;
  // The location of the block palette attributes
  BlockPalAttLoc : integer;
  // Whether to enable gridlines by default
  EnableGridlinesDef : Boolean;
  // The gridline colours
  GridlineColours : Array [0..21] of TColor32 = (clBlack32, clDimGray32,
  clGray32,clLightGray32,clWhite32,clMaroon32,clGreen32,clOlive32,clNavy32,
  clPurple32,clTeal32,clRed32,clLime32,clYellow32,clBlue32,clFuchsia32,
  clAqua32,clTrWhite32,clTrBlack32,clTrRed32,clTrGreen32,clTrBlue32);
  // The nes palette
  NESPal : Array [0 .. 63] Of TColor32;
  // The last ROM
  LastROMLoaded : String;
  // The start & end of the tile editor's graphics.
  TileEditorStart, TileEditorEnd : Integer;
  // The frame time animation
  FrameTimeAnimation : Integer;
  // Enable animation by default
  AnimationDef : Boolean;
const
  PROGRAMKEY : String = 'QUARRY';
  PASSWORDKEY : String = 'FLOPPY';
  XORKEY : Byte = 67;
implementation

procedure LoadBlockPalettes();
var
  I : Integer;
begin

  For I := 0 To 15 do
    ROMData.BlockPalettes[i] := ROM[BlockPalAttLoc + I];

end;

procedure SaveBlockPalettes();
var
  I : Integer;
begin

  For I := 0 To 15 do
    ROM[BlockPalAttLoc + I] := ROMData.BlockPalettes[i];

end;

Procedure LoadBlocks();
var
  I : Integer;

begin

  For I := 0 To 43 do
  begin
    ROMData.Blocks[I].TopLeft := ROM[TSALoc + (I * 4)];
    ROMData.Blocks[I].TopRight := ROM[TSALoc + (I * 4) + 1];
    ROMData.Blocks[I].BottomLeft := ROM[TSALoc + (I * 4) + 2];
    ROMData.Blocks[I].BottomRight := ROM[TSALoc + (I * 4) + 3];
  end;

end;

Procedure LoadGamePalettes();
var
  I : Integer;
begin
  with ROMData do
  begin
    // Loop through all the palettes storing them in bytes
    // then transfer them into actual colors.
    For I := 0 To 27 do
    begin
      GamePalettes[I].Color1 := ROM[PalDataLoc + (I * 4)];
      GamePalettes[I].Color2 := ROM[PalDataLoc + (I * 4) + 1];
      GamePalettes[I].Color3 := ROM[PalDataLoc + (I * 4) + 2];
      GamePalettes[I].Color4 := ROM[PalDataLoc + (I * 4) + 3];
    end;

    // Now add the palettes for world 2-6
    i := 28;
    while (i < 47) do
    begin

      GamePalettes[I].Color1 := GamePalettes[24].Color1;
      GamePalettes[I].Color2 := GamePalettes[24].Color2;
      GamePalettes[I].Color3 := GamePalettes[24].Color3;
      GamePalettes[I].Color4 := GamePalettes[24].Color4;

      GamePalettes[I + 1].Color1 := GamePalettes[25].Color1;
      GamePalettes[I + 1].Color2 := GamePalettes[25].Color2;
      GamePalettes[I + 1].Color3 := GamePalettes[25].Color3;
      GamePalettes[I + 1].Color4 := GamePalettes[25].Color4;

      GamePalettes[I + 2].Color1 := GamePalettes[26].Color1;
      GamePalettes[I + 2].Color2 := GamePalettes[26].Color2;
      GamePalettes[I + 2].Color3 := GamePalettes[26].Color3;
      GamePalettes[I + 2].Color4 := GamePalettes[26].Color4;

      GamePalettes[I + 3].Color1 := GamePalettes[27].Color1;
      GamePalettes[I + 3].Color2 := GamePalettes[27].Color2;
      GamePalettes[I + 3].Color3 := GamePalettes[27].Color3;
      GamePalettes[I + 3].Color4 := GamePalettes[27].Color4;

      i := i + 4;
    end;

    // Now change the first colour for the second world.
    For I := 28 To 31 do
      GamePalettes[I].Color1 := 12;

    // Now change the first colour for the third world.
    For I := 32 To 35 do
      GamePalettes[I].Color1 := 8;


    // Now change the first colour for the fourth world.
    For I := 36 To 39 do
      GamePalettes[I].Color1 := 2;

    // Now change the first colour for the fifth world.
    For I := 40 To 43 do
      GamePalettes[I].Color1 := 8;

    // Now change the first colour for the sixth world.
    For I := 44 To 47 do
      GamePalettes[I].Color1 := 7;
  end;
end;

Procedure SaveGamePalettes();
var
  I : Integer;
begin

  // Loop through all the palettes storing them in bytes
  // then transfer them into actual colors.
  For I := 0 To 27 do
  begin
    ROM[PalDataLoc + (I * 4)] := ROMData.GamePalettes[I].Color1;
    ROM[PalDataLoc + (I * 4) + 1] := ROMData.GamePalettes[I].Color2;
    ROM[PalDataLoc + (I * 4) + 2] := ROMData.GamePalettes[I].Color3;
    ROM[PalDataLoc + (I * 4) + 3] := ROMData.GamePalettes[I].Color4;
  end;

end;

Procedure LoadWorldBlocks();
begin
  {WorldBlocks[0, 0] := 0;
  WorldBlocks[0, 1] := 0;
  WorldBlocks[0, 2] := 6;
  WorldBlocks[0, 3] := 12;
  WorldBlocks[0, 4] := 20;
  WorldBlocks[0, 5] := 12;
  WorldBlocks[0, 6] := 12;
  WorldBlocks[0, 7] := 21;
  WorldBlocks[0, 8] := 27;
  WorldBlocks[0, 9] := 28;
  WorldBlocks[0, 10] := 29;
  WorldBlocks[0, 11] := 30;
  WorldBlocks[0, 12] := 36;
  WorldBlocks[0, 13] := 42;
  WorldBlocks[0, 14] := 42;
  WorldBlocks[0, 15] := 43;

  WorldBlocks[1, 0] := 1;
  WorldBlocks[1, 1] := 1;
  WorldBlocks[1, 2] := 7;
  WorldBlocks[1, 3] := 13;
  WorldBlocks[1, 4] := 20;
  WorldBlocks[1, 5] := 13;
  WorldBlocks[1, 6] := 13;
  WorldBlocks[1, 7] := 22;
  WorldBlocks[1, 8] := 27;
  WorldBlocks[1, 9] := 28;
  WorldBlocks[1, 10] := 29;
  WorldBlocks[1, 11] := 31;
  WorldBlocks[1, 12] := 37;
  WorldBlocks[1, 13] := 42;
  WorldBlocks[1, 14] := 42;
  WorldBlocks[1, 15] := 43;

  WorldBlocks[2, 0] := 2;
  WorldBlocks[2, 1] := 2;
  WorldBlocks[2, 2] := 8;
  WorldBlocks[2, 3] := 14;
  WorldBlocks[2, 4] := 20;
  WorldBlocks[2, 5] := 14;
  WorldBlocks[2, 6] := 14;
  WorldBlocks[2, 7] := 23;
  WorldBlocks[2, 8] := 27;
  WorldBlocks[2, 9] := 28;
  WorldBlocks[2, 10] := 29;
  WorldBlocks[2, 11] := 32;
  WorldBlocks[2, 12] := 38;
  WorldBlocks[2, 13] := 42;
  WorldBlocks[2, 14] := 42;
  WorldBlocks[2, 15] := 43;

  WorldBlocks[3, 0] := 3;
  WorldBlocks[3, 1] := 3;
  WorldBlocks[3, 2] := 9;
  WorldBlocks[3, 3] := 15;
  WorldBlocks[3, 4] := 20;
  WorldBlocks[3, 5] := 15;
  WorldBlocks[3, 6] := 15;
  WorldBlocks[3, 7] := 24;
  WorldBlocks[3, 8] := 27;
  WorldBlocks[3, 9] := 28;
  WorldBlocks[3, 10] := 29;
  WorldBlocks[3, 11] := 33;
  WorldBlocks[3, 12] := 39;
  WorldBlocks[3, 13] := 42;
  WorldBlocks[3, 14] := 42;
  WorldBlocks[3, 15] := 43;

  WorldBlocks[4, 0] := 4;
  WorldBlocks[4, 1] := 4;
  WorldBlocks[4, 2] := 10;
  WorldBlocks[4, 3] := 16;
  WorldBlocks[4, 4] := 20;
  WorldBlocks[4, 5] := 16;
  WorldBlocks[4, 6] := 16;
  WorldBlocks[4, 7] := 25;
  WorldBlocks[4, 8] := 27;
  WorldBlocks[4, 9] := 28;
  WorldBlocks[4, 10] := 29;
  WorldBlocks[4, 11] := 34;
  WorldBlocks[4, 12] := 40;
  WorldBlocks[4, 13] := 42;
  WorldBlocks[4, 14] := 42;
  WorldBlocks[4, 15] := 43;

  WorldBlocks[5, 0] := 5;
  WorldBlocks[5, 1] := 5;
  WorldBlocks[5, 2] := 11;
  WorldBlocks[5, 3] := 17;
  WorldBlocks[5, 4] := 20;
  WorldBlocks[5, 5] := 17;
  WorldBlocks[5, 6] := 17;
  WorldBlocks[5, 7] := 26;
  WorldBlocks[5, 8] := 27;
  WorldBlocks[5, 9] := 28;
  WorldBlocks[5, 10] := 29;
  WorldBlocks[5, 11] := 35;
  WorldBlocks[5, 12] := 41;
  WorldBlocks[5, 13] := 42;
  WorldBlocks[5, 14] := 42;
  WorldBlocks[5, 15] := 43;}

end;

Procedure SaveBlocks();
var
  I : Integer;
begin

  For I := 0 To 43 do
  begin
    ROM[TSALoc + (I * 4)] := ROMData.Blocks[I].TopLeft;
    ROM[TSALoc + (I * 4) + 1] := ROMData.Blocks[I].TopRight;
    ROM[TSALoc + (I * 4) + 2] := ROMData.Blocks[I].BottomLeft;
    ROM[TSALoc + (I * 4) + 3] := ROMData.Blocks[I].BottomRight;
  end;
end;

Procedure SetWorldPalettes();
begin
{  WorldPalette[0, 0] := 0;
  WorldPalette[0, 1] := 1;
  WorldPalette[0, 2] := 2;
  WorldPalette[0, 3] := 3;
  WorldPalette[0, 4] := 24;
  WorldPalette[0, 5] := 25;
  WorldPalette[0, 6] := 26;
  WorldPalette[0, 7] := 27;
  // World 2 Palette
  WorldPalette[1, 0] := 4;
  WorldPalette[1, 1] := 5;
  WorldPalette[1, 2] := 6;
  WorldPalette[1, 3] := 7;
  WorldPalette[1, 4] := 28;
  WorldPalette[1, 5] := 29;
  WorldPalette[1, 6] := 30;
  WorldPalette[1, 7] := 31;
  // World 3 Palette
  WorldPalette[2, 0] := 8;
  WorldPalette[2, 1] := 9;
  WorldPalette[2, 2] := 10;
  WorldPalette[2, 3] := 11;
  WorldPalette[2, 4] := 32;
  WorldPalette[2, 5] := 33;
  WorldPalette[2, 6] := 34;
  WorldPalette[2, 7] := 35;
  // World 4 Palette
  WorldPalette[3, 0] := 12;
  WorldPalette[3, 1] := 13;
  WorldPalette[3, 2] := 14;
  WorldPalette[3, 3] := 15;
  WorldPalette[3, 4] := 36;
  WorldPalette[3, 5] := 37;
  WorldPalette[3, 6] := 38;
  WorldPalette[3, 7] := 39;
  // World 5 Palette
  WorldPalette[4, 0] := 16;
  WorldPalette[4, 1] := 17;
  WorldPalette[4, 2] := 18;
  WorldPalette[4, 3] := 19;
  WorldPalette[4, 4] := 40;
  WorldPalette[4, 5] := 41;
  WorldPalette[4, 6] := 42;
  WorldPalette[4, 7] := 43;
  // World 6 Palette
  WorldPalette[5, 0] := 20;
  WorldPalette[5, 1] := 21;
  WorldPalette[5, 2] := 22;
  WorldPalette[5, 3] := 23;
  WorldPalette[5, 4] := 44;
  WorldPalette[5, 5] := 45;
  WorldPalette[5, 6] := 46;
  WorldPalette[5, 7] := 47;}
end;

procedure DumpLevelDataToINI();
var
  INI : TMemINIFile;
  i,x : Integer;
begin
  // Create the ini file.
  INI := TMemINIFile.Create(ExtractFileDir(paramstr(0)) + '\data.ini');
  try
    with INI do
    begin
      WriteString('GameData','TSAData',IntToHex(29600,4));
      WriteString('GameData','PalData',IntToHex(15410,4));
      WriteString('GameData','BlockPalAtt',IntToHex(29776,4));
      WriteString('GameData','FirstAniTile',IntToHex(32784,4));
      WriteString('GameData','SecondAniTile',IntToHex(36880,4));
      WriteString('GameData','ThirdAniTile',IntToHex(40976,4));
      for i := 0 to 23 do
      begin
        WriteString('LevelData' + IntToStr(i),'LevelName', LevelType[i].LevelName);
        WriteString('LevelData' + IntToStr(i),'LevelOffset', IntToHex(LevelType[i].LevelOffset,4));
        WriteString('LevelData' + IntToStr(i),'LevelCrystalOffset', IntToHex(LevelType[i].LevelCrystalOffset,4));
        WriteString('LevelData' + IntToStr(i),'LevelTimeOffset', IntToHex(LevelType[i].LevelTimeOffset,4));
        WriteString('LevelData' + IntToStr(i),'LevelStartYOffset', IntToHex(LevelType[i].LevelStartYOffset,4));
        WriteString('LevelData' + IntToStr(i),'LevelStartXOffset', IntToHex(LevelType[i].LevelStartXOffset,4));
        WriteString('LevelData' + IntToStr(i),'LevelTileSet', IntToHex(LevelType[i].LevelTileset,4));
        WriteString('LevelData' + IntToStr(i),'LevelScrollDataOffset', IntToHex(LevelType[i].LevelScrollDataOffset,4));
      end;
      // Write the world palettes to file.
      for i := 0 to 5 do
        for x := 0 to 7 do
          WriteInteger('WorldPalette' + IntToStr(i),'Pal' + IntToStr(x),ROMData.WorldPalette[i,x]);

      // Write the blocks that are used in each world to file.
      for i := 0 to 5 do
        for x := 0 to 15 do
          WriteInteger('WorldBlocks' + IntToStr(i),'Block' + IntToStr(x),ROMData.WorldBlocks[i,x]);


      UpdateFile;
    end;
  finally
    FreeAndNil(INI);
  end;
end;

Procedure SetupLevelData();
begin

  ROMGFXLoc[0] := 32784;
  ROMGFXLoc[1] := 36880;
  ROMGFXLoc[2] := 40976;
  // World 1-1
  LevelType[0].LevelName := 'World 1-1';
  LevelType[0].LevelOffset := 34832;
  LevelType[0].LevelCrystalOffset := 29284;
  LevelType[0].LevelTimeOffset := 29285;
  LevelType[0].LevelStartYOffset := 29280;
  LevelType[0].LevelStartXOffset := 29281;
  LevelType[0].LevelTileset := 0;
  LevelType[0].LevelScrollDataOffset := $3CA2;
  // World 1-2
  LevelType[1].LevelName := 'World 1-2';
  LevelType[1].LevelOffset := 35272;
  LevelType[1].LevelCrystalOffset := 29296;
  LevelType[1].LevelTimeOffset := 29297;
  LevelType[1].LevelStartYOffset := 29292;
  LevelType[1].LevelStartXOffset := 29293;
  LevelType[1].LevelTileset := 0;
  LevelType[1].LevelScrollDataOffset := $3CAB;
  // World 1-3
  LevelType[2].LevelName := 'World 1-3';
  LevelType[2].LevelOffset := 35712;
  LevelType[2].LevelCrystalOffset := 29308;
  LevelType[2].LevelTimeOffset := 29309;
  LevelType[2].LevelStartYOffset := 29304;
  LevelType[2].LevelStartXOffset := 29305;
  LevelType[2].LevelTileset := 0;
  LevelType[2].LevelScrollDataOffset := $3CB4;
  // World 1-4
  LevelType[3].LevelName := 'World 1-4';
  LevelType[3].LevelOffset := 36152;
  LevelType[3].LevelCrystalOffset := 29320;
  LevelType[3].LevelTimeOffset := 29321;
  LevelType[3].LevelStartYOffset := 29316;
  LevelType[3].LevelStartXOffset := 29317;
  LevelType[3].LevelTileset := 0;
  LevelType[3].LevelScrollDataOffset := $3CBD;
  // World 2-1
  LevelType[4].LevelName := 'World 2-1';
  LevelType[4].LevelOffset := 38928;
  LevelType[4].LevelCrystalOffset := 29332;
  LevelType[4].LevelTimeOffset := 29333;
  LevelType[4].LevelStartYOffset := 29328;
  LevelType[4].LevelStartXOffset := 29329;
  LevelType[4].LevelTileset := 1;
  LevelType[4].LevelScrollDataOffset := $3CC6;
  // World 2-2
  LevelType[5].LevelName := 'World 2-2';
  LevelType[5].LevelOffset := 39368;
  LevelType[5].LevelCrystalOffset := 29344;
  LevelType[5].LevelTimeOffset := 29345;
  LevelType[5].LevelStartYOffset := 29340;
  LevelType[5].LevelStartXOffset := 29341;
  LevelType[5].LevelTileset := 1;
  LevelType[5].LevelScrollDataOffset := $3CCF;
  // World 2-3
  LevelType[6].LevelName := 'World 2-3';
  LevelType[6].LevelOffset := 39808;
  LevelType[6].LevelCrystalOffset := 29356;
  LevelType[6].LevelTimeOffset := 29357;
  LevelType[6].LevelStartYOffset := 29352;
  LevelType[6].LevelStartXOffset := 29353;
  LevelType[6].LevelTileset := 1;
  LevelType[6].LevelScrollDataOffset := $3CD8;
  // World 2-4
  LevelType[7].LevelName := 'World 2-4';
  LevelType[7].LevelOffset := 40248;
  LevelType[7].LevelCrystalOffset := 29368;
  LevelType[7].LevelTimeOffset := 29369;
  LevelType[7].LevelStartYOffset := 29364;
  LevelType[7].LevelStartXOffset := 29365;
  LevelType[7].LevelTileset := 1;
  LevelType[7].LevelScrollDataOffset := $3CE1;
  // World 3-1
  LevelType[8].LevelName := 'World 3-1';
  LevelType[8].LevelOffset := 43024;
  LevelType[8].LevelCrystalOffset := 29380;
  LevelType[8].LevelTimeOffset := 29381;
  LevelType[8].LevelStartYOffset := 29376;
  LevelType[8].LevelStartXOffset := 29377;
  LevelType[8].LevelTileset := 2;
  LevelType[8].LevelScrollDataOffset := $3CEA;
  // World 3-2
  LevelType[9].LevelName := 'World 3-2';
  LevelType[9].LevelOffset := 43464;
  LevelType[9].LevelCrystalOffset := 29392;
  LevelType[9].LevelTimeOffset := 29393;
  LevelType[9].LevelStartYOffset := 29388;
  LevelType[9].LevelStartXOffset := 29389;
  LevelType[9].LevelTileset := 2;
  LevelType[9].LevelScrollDataOffset := $3CF3;
  // World 3-3
  LevelType[10].LevelName := 'World 3-3';
  LevelType[10].LevelOffset := 43904;
  LevelType[10].LevelCrystalOffset := 29404;
  LevelType[10].LevelTimeOffset := 29405;
  LevelType[10].LevelStartYOffset := 29400;
  LevelType[10].LevelStartXOffset := 29401;
  LevelType[10].LevelTileset := 2;
  LevelType[10].LevelScrollDataOffset := $3CFC;
  // World 3-4
  LevelType[11].LevelName := 'World 3-4';
  LevelType[11].LevelOffset := 44344;
  LevelType[11].LevelCrystalOffset := 29416;
  LevelType[11].LevelTimeOffset := 29417;
  LevelType[11].LevelStartYOffset := 29412;
  LevelType[11].LevelStartXOffset := 29413;
  LevelType[11].LevelTileset := 2;
  LevelType[11].LevelScrollDataOffset := $3D05;
  // World 4-1
  LevelType[12].LevelName := 'World 4-1';
  LevelType[12].LevelOffset := 47120;
  LevelType[12].LevelCrystalOffset := 29428;
  LevelType[12].LevelTimeOffset := 29429;
  LevelType[12].LevelStartYOffset := 29424;
  LevelType[12].LevelStartXOffset := 29425;
  LevelType[12].LevelTileset := 3;
  LevelType[12].LevelScrollDataOffset := $3D0E;
  // World 4-2
  LevelType[13].LevelName := 'World 4-2';
  LevelType[13].LevelOffset := 47560;
  LevelType[13].LevelCrystalOffset := 29440;
  LevelType[13].LevelTimeOffset := 29441;
  LevelType[13].LevelStartYOffset := 29436;
  LevelType[13].LevelStartXOffset := 29437;
  LevelType[13].LevelTileset := 3;
  LevelType[13].LevelScrollDataOffset := $3D17;
  // World 4-3
  LevelType[14].LevelName := 'World 4-3';
  LevelType[14].LevelOffset := 48000;
  LevelType[14].LevelCrystalOffset := 29452;
  LevelType[14].LevelTimeOffset := 29453;
  LevelType[14].LevelStartYOffset := 29448;
  LevelType[14].LevelStartXOffset := 29449;
  LevelType[14].LevelTileset := 3;
  LevelType[14].LevelScrollDataOffset := $3D20;
  // World 4-4
  LevelType[15].LevelName := 'World 4-4';
  LevelType[15].LevelOffset := 48440;
  LevelType[15].LevelCrystalOffset := 29464;
  LevelType[15].LevelTimeOffset := 29465;
  LevelType[15].LevelStartYOffset := 29460;
  LevelType[15].LevelStartXOffset := 29461;
  LevelType[15].LevelTileset := 3;
  LevelType[15].LevelScrollDataOffset := $3D29;
  // World 5-1
  LevelType[16].LevelName := 'World 5-1';
  LevelType[16].LevelOffset := 61456;
  LevelType[16].LevelCrystalOffset := 29476;
  LevelType[16].LevelTimeOffset := 29477;
  LevelType[16].LevelStartYOffset := 29472;
  LevelType[16].LevelStartXOffset := 29473;
  LevelType[16].LevelTileset := 4;
  LevelType[16].LevelScrollDataOffset := $3D32;
  // World 5-2
  LevelType[17].LevelName := 'World 5-2';
  LevelType[17].LevelOffset := 61896;
  LevelType[17].LevelCrystalOffset := 29488;
  LevelType[17].LevelTimeOffset := 29489;
  LevelType[17].LevelStartYOffset := 29484;
  LevelType[17].LevelStartXOffset := 29485;
  LevelType[17].LevelTileset := 4;
  LevelType[17].LevelScrollDataOffset := $3D3B;
  // World 5-3
  LevelType[18].LevelName := 'World 5-3';
  LevelType[18].LevelOffset := 62336;
  LevelType[18].LevelCrystalOffset := 29500;
  LevelType[18].LevelTimeOffset := 29501;
  LevelType[18].LevelStartYOffset := 29496;
  LevelType[18].LevelStartXOffset := 29497;
  LevelType[18].LevelTileset := 4;
  LevelType[18].LevelScrollDataOffset := $3D44;
  // World 5-4
  LevelType[19].LevelName := 'World 5-4';
  LevelType[19].LevelOffset := 62776;
  LevelType[19].LevelCrystalOffset := 29512;
  LevelType[19].LevelTimeOffset := 29513;
  LevelType[19].LevelStartYOffset := 29508;
  LevelType[19].LevelStartXOffset := 29509;
  LevelType[19].LevelTileset := 4;
  LevelType[19].LevelScrollDataOffset := $3D4D;
  // World 6-1
  LevelType[20].LevelName := 'World 6-1';
  LevelType[20].LevelOffset := 63216;
  LevelType[20].LevelCrystalOffset := 29524;
  LevelType[20].LevelTimeOffset := 29525;
  LevelType[20].LevelStartYOffset := 29520;
  LevelType[20].LevelStartXOffset := 29521;
  LevelType[20].LevelTileset := 5;
  LevelType[20].LevelScrollDataOffset := $3D56;
  // World 6-2
  LevelType[21].LevelName := 'World 6-2';
  LevelType[21].LevelOffset := 63656;
  LevelType[21].LevelCrystalOffset := 29536;
  LevelType[21].LevelTimeOffset := 29537;
  LevelType[21].LevelStartYOffset := 29532;
  LevelType[21].LevelStartXOffset := 29533;
  LevelType[21].LevelTileset := 5;
  LevelType[21].LevelScrollDataOffset := $3D5F;
  // World 6-3
  LevelType[22].LevelName := 'World 6-3';
  LevelType[22].LevelOffset := 64096;
  LevelType[22].LevelCrystalOffset := 29548;
  LevelType[22].LevelTimeOffset := 29549;
  LevelType[22].LevelStartYOffset := 29544;
  LevelType[22].LevelStartXOffset := 29545;
  LevelType[22].LevelTileset := 5;
  LevelType[22].LevelScrollDataOffset := $3D68;
  // World 6-4
  LevelType[23].LevelName := 'World 6-4';
  LevelType[23].LevelOffset := 64536;
  LevelType[23].LevelCrystalOffset := 29560;
  LevelType[23].LevelTimeOffset := 29561;
  LevelType[23].LevelStartYOffset := 29556;
  LevelType[23].LevelStartXOffset := 29557;
  LevelType[23].LevelTileset := 5;
  LevelType[23].LevelScrollDataOffset := $3D71;
End;

procedure LoadDataFile();
var
  INI : TMemINIFile;
  i,x : Integer;
begin
  // Create the ini file.
  INI := TMemINIFile.Create(CurDataFileStr);
  try
    with INI do
    begin
      TSALoc := ReadInteger('GameData','TSAData',29600);
      PalDataLoc := ReadInteger('GameData','PalData',15410);
      BlockPalAttLoc := ReadInteger('GameData','BlockPalAtt',29776);
      ROMGFXLoc[0] := ReadInteger('GameData','FirstAniTile',32784);
      ROMGFXLoc[1] := ReadInteger('GameData','SecondAniTile',36880);
      ROMGFXLoc[2] := ReadInteger('GameData','ThirdAniTile', 40976);
      ROMGFXLoc[3] := ReadInteger('GameData','FourthAniTile',$b010);
      StartingLives := ReadInteger('GameData','StartingLives',23376);
      TileEditorStart := ReadInteger('TileEditor','StartOffset',32784);
      TileEditorEnd := ReadInteger('TileEditor','EndOffset',61440);
      for i := 0 to 4 do
        Passwords[i] := ReadInteger('GameData','Password' + IntToStr(i+2),10553 + (i*8));

      for i := 0 to 23 do
      begin
        LevelType[i].LevelName := ReadString('LevelData' + IntToStr(i),'LevelName', LevelType[i].LevelName);
        LevelType[i].LevelOffset := ReadInteger('LevelData' + IntToStr(i),'LevelOffset', LevelType[i].LevelOffset);
        LevelType[i].LevelCrystalOffset := ReadInteger('LevelData' + IntToStr(i),'LevelCrystalOffset', LevelType[i].LevelCrystalOffset);
        LevelType[i].LevelTimeOffset := ReadInteger('LevelData' + IntToStr(i),'LevelTimeOffset', LevelType[i].LevelTimeOffset);
        LevelType[i].LevelStartYOffset := ReadInteger('LevelData' + IntToStr(i),'LevelStartYOffset', LevelType[i].LevelStartYOffset);
        LevelType[i].LevelStartXOffset := ReadInteger('LevelData' + IntToStr(i),'LevelStartXOffset', LevelType[i].LevelStartXOffset);
        LevelType[i].LevelScrollDataOffset := ReadInteger('LevelData' + IntToStr(i),'LevelScrollDataOffset', LevelType[i].LevelScrollDataOffset);
        LevelType[i].LevelTileset := ReadInteger('LevelData' + IntToStr(i),'LevelTileSet', LevelType[i].LevelTileset);
      end;
      // Write the world palettes to file.
      for i := 0 to 5 do
        for x := 0 to 7 do
          ROMData.WorldPalette[i,x] := ReadInteger('WorldPalette' + IntToStr(i),'Pal' + IntToStr(x),ROMData.WorldPalette[i,x]);

      // Write the blocks that are used in each world to file.
      for i := 0 to 5 do
        for x := 0 to 15 do
          ROMData.WorldBlocks[i,x] := ReadInteger('WorldBlocks' + IntToStr(i),'Block' + IntToStr(x),ROMData.WorldBlocks[i,x]);
    end;
  finally
    FreeAndNil(INI);
  end;

end;

procedure LoadOptions();
var
  INI : TMemINIFile;
  TempStringList : TStringList;
  i : integer;
begin
  // Open the ini file.
  INI := TMemINIFile.Create(ExtractFileDir(ParamStr(0)) + '\options.ini');
  try
    with INI do
    begin
      // Create the string list
      TempStringList := TStringList.Create;

      CurPalette := ReadInteger('Options','PaletteFile',0);
      TempStringList.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\Palettes\pal.dat');
      CurPaletteStr := ExtractFileDir(ParamStr(0)) + '\Palettes\';
      for i := 1 to length(TempStringList.Strings[CurPalette]) do
      begin
        if TempStringList.Strings[CurPalette][i] = ':' then break;
        CurPaletteStr := CurPaletteStr + TempStringList.Strings[CurPalette][i]
      end;
      CurPaletteStr := Trim(CurPaletteStr);
      FrameTimeAnimation := ReadInteger('Options','TimeFrameAnimation',100);
  //showmessage(CurPaletteStr);

      CurDataFile := ReadInteger('Options','DataFile',0);
      TempStringList.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\data\list.dat');
      CurDataFileStr := ExtractFileDir(ParamStr(0)) + '\Data\';
      for i := 1 to length(TempStringList.Strings[CurDataFile]) do
      begin
        if TempStringList.Strings[CurDataFile][i] = ':' then break;
        CurDataFileStr := CurDataFileStr + TempStringList.Strings[CurDataFile][i]
      end;
      CurDataFileStr := Trim(CurDataFileStr);
      AnimationDef := ReadBool('Options','EnableAni',False);
  //showmessage(CurDataFileStr);

      CurGridlineColour := ReadInteger('Options','GridlineColour',4);
      EnableGridlinesDef := ReadBool('Options','EnableGridlines',True);
      LastROMLoaded := ReadString('General','LastROMLoaded','');
    end;
  finally
    FreeAndNil(INI);
  end;
end;

procedure SaveOptions;
var
  INI : TMemINIFile;
begin
  // Open the ini file.
  INI := TMemINIFile.Create(ExtractFileDir(ParamStr(0)) + '\options.ini');
  try
    with INI do
    begin
      WriteInteger('Options','PaletteFile',CurPalette);
      WriteInteger('Options','DataFile',CurDataFile);
      WriteInteger('Options','GridlineColour',CurGridlineColour);
      WriteInteger('Options','TimeFrameAnimation',FrameTimeAnimation);
      WriteBool('Options','EnableGridlines',EnableGridlinesDef);
      WriteBool('Options','EnableAni',AnimationDef);
      WriteString('General','LastROMLoaded',LastROMLoaded);
      UpdateFile;
    end;
  finally
    FreeAndNil(INI);
  end;
end;

procedure Initialise();
begin
  //SetWorldPalettes();

  LoadBlocks();
  LoadBlockPalettes();

  //LoadWorldBlocks();

  LoadGamePalettes();
end;

{Function ByteToBin(OneByte : Byte) : String;
var
BinaryString : String;
begin

  BinaryString := IntToBin(OneByte);

  ByteToBin := copy(BinaryString,25, 8);

end;}

procedure XOREncryptDataFile(pFilename: String);
var
  INIFile : TMemoryStream;
  TempBuf : Byte;
  i : Integer;
begin
  INIFile := TMemoryStream.Create;
  try
    with INIFile do
    begin
      LoadFromFile(pFilename);
      for i := 0 to INIFile.Size -1 do
      begin
        ReadBuffer(TempBuf,1);
        Seek(i,soFromBeginning);
        RotateByte(Tempbuf);
        TempBuf := TempBuf xor XORKEY;
        WriteBuffer(TempBuf,1);
      end;

      SaveToFile(ExtractFileDir(pFilename) + '\encrypt.dat');
    end;
  finally
    FreeAndNil(INIFile);
  end;
end;

procedure RotateByte(num : Byte);
begin
  num := (num shl 4) or (num shr 4);
end;

{Procedure EncryptDataFile(pFilename : String);
var
  s:TSecurityIni;
  i:TMemINIFILE;
  sectionstrings, keystrings:TStringList;
  a,b:integer;
begin

  i:=TMemIniFile.Create(pFilename);
  try
    s:=TSECURITYINI.Create(pFilename + '.encrypted',PROGRAMKEY,PASSWORDKEY);

    sectionstrings:=TStringList.Create();

    i.ReadSections(sectionstrings);

    for a:=1 to sectionstrings.Count do
    begin
      keystrings:=TStringList.Create();

      i.ReadSection(sectionstrings[a-1],keystrings);
      for b:=1 to keystrings.Count do
      begin
        s.WriteString(sectionstrings[a-1], keystrings[b-1],
          i.ReadString(sectionstrings[a-1],keystrings[b-1],''));
      end;

      FreeAndNil(keystrings);
    end;
    S.UpdateFile();

    FreeAndNil(sectionstrings);
  finally
    FreeAndNil(i);
    FreeAndNil(s);
  end;
end;}

procedure LoadEncryptedDataFile();
var
//  SecureINI : TSecurityINI;
  SecureINI : TMemINIFile;
  i,x : Integer;
begin
//  SecureINI := TSecurityINI.Create(CurDataFileStr,PROGRAMKEY,PASSWORDKEY);
  SecureINI := TMemINIFile.Create(CurDataFileStr);
  try
    with SecureINI do
    begin
{-----------------------------------------------
The TSA, palette and attribute data for the
in-game blocks
------------------------------------------------}
      TSALoc := ReadInteger('GameData','TSAData',29600);
      PalDataLoc := ReadInteger('GameData','PalData',15410);
      BlockPalAttLoc := ReadInteger('GameData','BlockPalAtt',29776);
{-----------------------------------------------
The In-game Pattern Table Locations
------------------------------------------------}
      ROMGFXLoc[0] := ReadInteger('GameData','FirstAniTile',32784);
      ROMGFXLoc[1] := ReadInteger('GameData','SecondAniTile',36880);
      ROMGFXLoc[2] := ReadInteger('GameData','ThirdAniTile', 40976);
      ROMGFXLoc[3] := ReadInteger('GameData','FourthAniTile',$b010);
{-----------------------------------------------
The RockFord Palette Data
------------------------------------------------}
      // The location of Rockford's Palette
      RockFordPal := ReadInteger('GameData','RockfordPalette',10099);

{-----------------------------------------------
The World Map Data
------------------------------------------------}

      // The location of the world map data
      WorldMapLoc := ReadInteger('WorldMap','WorldMapStart',30602);

      // The location of the world map's palette
      WorldMapPalLoc := ReadInteger('WorldMap','WorldMapPalette',10204);

      // The location of the world map's attributes
      WorldMapAttLoc := ReadInteger('WorldMap','WorldMapAttributes',31562);
      // The location of the pattern table
      WorldMapPatLoc := ReadInteger('WorldMap','WorldMapPatternTable',57360);

{-----------------------------------------------
The Title Logo Data
------------------------------------------------}

      // The location of the title logo data
      TitleLogoData := ReadInteger('TitleLogo','TitleLogoLoc',29792);

      // The location of the title logo attributes
      TitleLogoAtt := ReadInteger('TitleLogo','TitleLogoAtt',30025);

      // The location of the title logo's palette
      TitleLogoPal := ReadInteger('TitleLogo','TitleLogoPal',23282);

      // The location of the title logo's pattern table
      TitleLogoPat := ReadInteger('TitleLogo','TitleLogoPat',53264);

{-----------------------------------------------
The Starting Lives Data
------------------------------------------------}
      StartingLives := ReadInteger('GameData','StartingLives',23376);
{-----------------------------------------------
The Tile Editor Data
------------------------------------------------}
      TileEditorStart := ReadInteger('TileEditor','StartOffset',32784);
      TileEditorEnd := ReadInteger('TileEditor','EndOffset',61440);

{-----------------------------------------------
The Password Data
------------------------------------------------}
      for i := 0 to 4 do
        Passwords[i] := ReadInteger('GameData','Password' + IntToStr(i+2),10553 + (i*8));

{-----------------------------------------------
The Level Data
------------------------------------------------}
      for i := 0 to 23 do
      begin
        LevelType[i].LevelName := ReadString('LevelData' + IntToStr(i),'LevelName', LevelType[i].LevelName);
        LevelType[i].LevelOffset := ReadInteger('LevelData' + IntToStr(i),'LevelOffset', LevelType[i].LevelOffset);
        LevelType[i].LevelCrystalOffset := ReadInteger('LevelData' + IntToStr(i),'LevelCrystalOffset', LevelType[i].LevelCrystalOffset);
        LevelType[i].LevelTimeOffset := ReadInteger('LevelData' + IntToStr(i),'LevelTimeOffset', LevelType[i].LevelTimeOffset);
        LevelType[i].LevelStartYOffset := ReadInteger('LevelData' + IntToStr(i),'LevelStartYOffset', LevelType[i].LevelStartYOffset);
        LevelType[i].LevelStartXOffset := ReadInteger('LevelData' + IntToStr(i),'LevelStartXOffset', LevelType[i].LevelStartXOffset);
        LevelType[i].LevelTileset := ReadInteger('LevelData' + IntToStr(i),'LevelTileSet', LevelType[i].LevelTileset);
        LevelType[i].LevelScrollDataOffset := ReadInteger('LevelData' + IntToStr(i),'LevelScrollDataOffset', LevelType[i].LevelScrollDataOffset);
      end;

{-----------------------------------------------
The Palettes that are used in each world.
------------------------------------------------}
      // Read the world palettes from file.
      for i := 0 to 5 do
        for x := 0 to 7 do
          ROMData.WorldPalette[i,x] := ReadInteger('WorldPalette' + IntToStr(i),'Pal' + IntToStr(x),ROMData.WorldPalette[i,x]);

{-----------------------------------------------
The blocks that are used in each world.
------------------------------------------------}
      // Read the blocks that are used in each world from file.
      for i := 0 to 5 do
        for x := 0 to 15 do
          ROMData.WorldBlocks[i,x] := ReadInteger('WorldBlocks' + IntToStr(i),'Block' + IntToStr(x),ROMData.WorldBlocks[i,x]);
    end;
  finally
    FreeAndNil(SecureINI);
  end;
end;

{procedure BinaryToHex(pValue : String);
var
  E: Extended;
  //Make sure there is room for null terminator
  Buf: array[0..SizeOf(Extended) * 2] of Char;
begin
  E := Pi;
//  Label1.Caption := Format('E starts off as %.15f', [E]);
  BinToHex(@E, Buf, SizeOf(E));
  //Slot in the null terminator for the PChar, so we can display it easily
  Buf[SizeOf(Buf) - 1] := #0;
  Label2.Caption := Format('As text, the binary contents of E look like %s', [Buf]);
  //Translate just the characters, not the null terminator
  HexToBin(Buf, @E, SizeOf(Buf) - 1);
  Label3.Caption := Format('Back from text to binary, E is now %.15f', [E]);
end;}

end.
