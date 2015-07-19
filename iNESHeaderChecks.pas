unit iNESHeaderChecks;

interface

uses BoulderDashData;

function LoadiNESHeader(): Boolean;

type
  TRomHeader = record
    RomType : array[0..2] of Byte;
    Ctrl,
    PRGROM,
    CHRRAM,
    ROMctrl1,
    ROMctrl2 : Byte;
    Expansion : array[0..7] of Byte;
  end;

var
  ROMHeader : TROMheader;
    ROMSize,
    VROMSize,
    ROMType,
    MMCType,
    Mirroring,
  PRGBytes,
  CHRBytes,
  CartSize,
    MirrorXor : Integer;
const
  ROM_MIRROR  = 1;
  ROM_WRAM    = 2;
  ROM_TRAINER = 4;
  ROM_FOUR    = 8;
implementation

function LoadiNESHeader(): Boolean;
var
  i : integer;
begin

  // Load the iNES Header information in
  // from the byte array
  with ROMHeader do
  begin
    for i := 0 to 2 do
      RomType[i] := ROM[i];

    Ctrl := ROM[3];
    PRGROM := ROM[4];
    CHRRAM := ROM[5];
    ROMctrl1 := ROM[6];
    ROMctrl2 := ROM[7];

    for i:= 0 to 7 do
      Expansion[i] := ROM[8+i];
  end;
{    RomType : array[0..2] of Byte;
    Ctrl,
    PRGROM,
    CHRRAM,
    ROMctrl1,
    ROMctrl2 : Byte;
    Expansion : array[0..7] of Byte;}

  if ((ROMHeader.RomType[0] <> $4E) or (ROMHeader.RomType[1] <> $45) or (ROMHeader.RomType[2] <> $53)) then
  begin
//   Terminal.Lines.Add('Unsupported file format.');
   Result := false;
   Exit;
  end;
//  Terminal.Lines.Add('iNES file format found.');

  ROMSize  := Ord(ROMHeader.PRGROM);
  VROMSize := Ord(ROMHeader.CHRRAM);
  ROMType  := Ord(ROMHeader.ROMctrl1);
  MMCType  := (Ord(ROMHeader.ROMctrl1) shr 4);
  CartSize := ROMSize shl 4 + VROMSize * 8;

//  Terminal.Lines.Add(format('[%d] of PRG Rom', [ROMSize]));
//  Terminal.Lines.Add(format('[%d] of CHR Ram', [VROMSize]));
//  Terminal.Lines.Add(format('Size of the cartridge : [%d Kb]', [CartSize]));

  if ROMHeader.Expansion[0]=$0 then
    MMCType := MMCType or (Ord(ROMHeader.ROMctrl2) and $F0);
  Mirroring := (Ord(ROMHeader.ROMctrl1) and ROM_MIRROR);
  MirrorXor := $400 shl Mirroring; { Horizontal : $400; Vertical : $800)
  { dimensionamento aree di memoria }
  PRGBytes := $4000 * ROMSize;
  CHRBytes := $2000 * VROMSize;

  Result := true;
end; { LoadNES }

end.
