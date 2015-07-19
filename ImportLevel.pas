unit ImportLevel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, BoulderDashData, Quarry;

type
  TfrmImportLevel = class(TForm)
    lblImportFile: TLabel;
    lblImportToLevel: TLabel;
    OpenDialog: TOpenDialog;
    cbLevelImport: TComboBox;
    txtImportFile: TEdit;
    cmdSelect: TButton;
    cmdImport: TButton;
    cmdCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure cmdImportClick(Sender: TObject);
    procedure cmdSelectClick(Sender: TObject);
  private
    procedure ImportR3File(pFilename: String);
    procedure ImportR1File(pFilename: String);
    procedure ImportR2File(pFilename: String);
    procedure XORDecryptLevelData(pFilename: String);
    function RotateByte(num: Byte): Byte;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportLevel: TfrmImportLevel;
const
  XORKEY : Byte = 99;

implementation

{$R *.dfm}

procedure TfrmImportLevel.FormShow(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to 23 do
    cbLevelImport.Items.Add(LevelType[i].LevelName);

  cbLevelImport.ItemIndex := 0;
end;

procedure TfrmImportLevel.ImportR3File(pFilename : String);
var
  LevelFile : TMemoryStream;
  TempBuf : Byte;
  i,x : Integer;
begin
  LevelFile := TMemoryStream.Create;
  try
    LevelFile.LoadFromFile(pFilename);
    If LevelFile.Size = 454 then
    begin
      messagebox(Handle,'Quarry has detected that this data file is'
      + chr(13) + chr(10) +
      'revision 2 of the Quarry Data File Format. Quarry will now import it.',
      PChar(Application.Title),0);

      FreeAndNil(LevelFile);

      ImportR2File(pFilename);
      if frmQuarry.Level = cbLevelImport.ItemIndex then
        frmQuarry.actRefreshData.Execute;

      frmImportLevel.ModalResult := mrOK;
      exit;
    end
    else if LevelFile.Size = 445 then
    begin
      messagebox(Handle,'Quarry has detected that this data file is'
      + chr(13) + chr(10) +
      'revision 1 of the Quarry Data File Format. Quarry will now import it.',
      PChar(Application.Title),0);
      FreeAndNil(LevelFile);
      ImportR1File(pFilename);
      if frmQuarry.Level = cbLevelImport.ItemIndex then
        frmQuarry.actRefreshData.Execute;

      frmImportLevel.ModalResult := mrOK;
      exit;

    end;

    // Now we check that the data file has a valid header.
    // If it does not, then exit the subroutine, freeing
    // the memorystream in the the process.
    LevelFile.Read(TempBuf,1);
    if TempBuf <> $51 then
    begin
      FreeAndNil(LevelFile);
      Exit;
    end;
    LevelFile.Read(TempBuf,1);
    if TempBuf <> $44 then
    begin
      messagebox(Handle,'Quarry has detected that this data file has not got a valid header. Aborting import.',
      PChar(Application.Title),0);
      FreeAndNil(LevelFile);
      Exit;
    end;
    LevelFile.Read(TempBuf,1);
    if TempBuf <> $46 then
    begin
      messagebox(Handle,'Quarry has detected that this data file has not got a valid header. Aborting import.',
      PChar(Application.Title),0);
      FreeAndNil(LevelFile);
      Exit;
    end;
    LevelFile.Read(TempBuf,1);
    if TempBuf <> $52 then
    begin
      messagebox(Handle,'Quarry has detected that this data file has not got a valid header. Aborting import.',
      PChar(Application.Title),0);
      FreeAndNil(LevelFile);
      Exit;
    end;
    LevelFile.Read(TempBuf,1);
    if TempBuf <> $33 then
    begin
      messagebox(Handle,'Quarry has detected that this data file has not got a valid header. Aborting import.',
      PChar(Application.Title),0);
      FreeAndNil(LevelFile);
      Exit;
    end;

    // Yay, we've passed the header checks. Now decrypt the data
    // so it can be used.

    for i := 5 to LevelFile.Size -1 do
    begin
      TempBuf :=0;
      LevelFile.Seek(i,soFromBeginning);
      LevelFile.Read(TempBuf,1);
      // First to decrypt the data, we need to
      // rotate the bits back.
      // Next we need to xor it.
      //TempBuf := RotateByte(TempBuf xor XORKEY);
      TempBuf := TempBuf xor XORKEY;
      LevelFile.Seek(i,soFromBeginning);
      // Next we rewrite it to the memorystream for easy access.
      LevelFile.Write(TempBuf,1);
    end;

    // We have decrypted the data successfully.
    // Now load it into memory.
    // First seek to the beginning of the file
    // past the header.
    LevelFile.Seek(5,soFromBeginning);

    // Now clear the TempBuf variable as it will corrupt
    // any file reading operations if it is not zero.
    TempBuf := 0;
    // Now load in the crystal data
    LevelFile.Read(TempBuf,1);
    ROM[LevelType[cbLevelImport.ItemIndex].LevelCrystalOffset] := TempBuf;

    // Now clear the TempBuf variable as it will corrupt
    // any file reading operations if it is not zero.
    TempBuf := 0;
    // Now load in the time data
    LevelFile.Read(TempBuf,1);
    ROM[LevelType[cbLevelImport.ItemIndex].LevelTimeOffset] := TempBuf;

    // Now clear the TempBuf variable as it will corrupt
    // any file reading operations if it is not zero.
    TempBuf := 0;
    // Now load in the start x data
    LevelFile.Read(TempBuf,1);
    ROM[LevelType[cbLevelImport.ItemIndex].LevelStartXOffset] := TempBuf;

    // Now clear the TempBuf variable as it will corrupt
    // any file reading operations if it is not zero.
    TempBuf := 0;
    // Now load in the Start Y data
    LevelFile.Read(TempBuf,1);
    ROM[LevelType[cbLevelImport.ItemIndex].LevelStartYOffset] := TempBuf;
    // Loop through loading all of the scroll data to the
    // current memory.
    for i :=0 to 8 do
    begin
      // Now clear the TempBuf variable as it will corrupt
      // any file reading operations if it is not zero.
      TempBuf := 0;
      // Now load in the scroll data data
      LevelFile.Read(TempBuf,1);
      ROM[LevelType[cbLevelImport.ItemIndex].LevelScrollDataOffset + i] := TempBuf;
    end;

    // Now load the level data
    For I := 0 To 21 do
    begin

      For X := 0 To 19 do
      begin
        TempBuf := 0;
        LevelFile.Read(TempBuf,1);
        ROM[LevelType[cbLevelImport.ItemIndex].LevelOffset + (I * 20) + X] := TempBuf;
      end;

    end;
    frmQuarry.actRefreshData.Execute;
  finally
    FreeAndNil(LevelFile);
    ModalResult := mrOK;
  end;

end;

procedure TfrmImportLevel.ImportR1File(pFilename : String);
var
  R1File : TMemoryStream;
  TempCrystal, TempTime,  TempStartY, TempStartX, TempByte : Byte;
  LevelData : Array [0..21,0..39] of Byte;
  i,x : Integer;
begin
  // The only difference between the R1 file format
  // and the R2 file format is the lack of scroll
  // data in R1 file. This is because I hadn't found
  // it by then.

  R1File := TMemoryStream.Create;
  try
    R1File.LoadFromFile(pFilename);

    TempCrystal := 0;
    TempTime := 0;
    TempStartX := 0;
    TempStartY := 0;

    R1File.Read(TempCrystal,1);
    R1File.Read(TempTime,1);
    R1File.Read(TempStartX,1);
    R1File.Read(TempStartY,1);

    // Now we seek one byte ahead as I made a slight error
    // in the earlier boulder dash data file format, which
    // resulted in a one byte space between the 'header' data
    // and the level data. Opps.
    R1File.Seek(1,soFromCurrent);

    For I := 0 To 21 do
    begin
      For X := 0 To 19 do
      begin
        TempByte :=0;

        R1File.Read(TempByte,1);
        LevelData[i,x] := TempByte;
      end;

    end;

    // Now we import it into the selected level.
    // First the crystal
    ROM[LevelType[cbLevelImport.ItemIndex].LevelCrystalOffset] := TempCrystal;
    // The time
    ROM[LevelType[cbLevelImport.ItemIndex].LevelTimeOffset] := TempTime;
    // The start X position
    ROM[LevelType[cbLevelImport.ItemIndex].LevelStartXOffset] := TempStartX;
    // The start Y position
    ROM[LevelType[cbLevelImport.ItemIndex].LevelStartYOffset] := TempStartY;

    // Now the level
    for i := 0 to 21 do
      for x :=0 to 19 do
        ROM[LevelType[cbLevelImport.ItemIndex].LevelOffset + (I * 20) + X] := LevelData[i,x];
  finally
    FreeAndNil(R1File);
  end;
end;

procedure TfrmImportLevel.ImportR2File(pFilename : String);
var
  R2File : TMemoryStream;
  TempCrystal, TempTime,  TempStartY, TempStartX, TempByte : Byte;
  TempScrollData : Array [0 .. 8] of Byte;
  LevelData : Array [0..21,0..19] of Byte;
  i,x : Integer;
begin
  R2File := TMemoryStream.Create;
  try
    R2File.LoadFromFile(pFilename);

    TempCrystal := 0;
    TempTime := 0;
    TempStartX := 0;
    TempStartY := 0;

    R2File.Read(TempCrystal,1);
    R2File.Read(TempTime,1);
    R2File.Read(TempStartX,1);
    R2File.Read(TempStartY,1);
    // Now we seek one byte ahead as I made a slight error
    // in the earlier boulder dash data file format, which
    // resulted in a one byte space between the 'header' data
    // and the level data. Opps.
    R2File.Seek(1,soFromCurrent);
    For I := 0 To 21 do
    begin

      For X := 0 To 19 do
      begin
        TempByte :=0;

        R2File.Read(TempByte,1);
        LevelData[i,x] := TempByte;

      end;

    end;

    // Now load the scroll data
    for i := 0 to 8 do
    begin
      TempScrollData[i] := 0;
      R2File.Read(TempScrollData,1);
    end;

    // Now we import it into the selected level.
    // First the crystal
    ROM[LevelType[cbLevelImport.ItemIndex].LevelCrystalOffset] := TempCrystal;
    // The time
    ROM[LevelType[cbLevelImport.ItemIndex].LevelTimeOffset] := TempTime;
    // The start X position
    ROM[LevelType[cbLevelImport.ItemIndex].LevelStartXOffset] := TempStartX;
    // The start Y position
    ROM[LevelType[cbLevelImport.ItemIndex].LevelStartYOffset] := TempStartY;
    // Now the level
    for i := 0 to 21 do
      for x :=0 to 19 do
        ROM[LevelType[cbLevelImport.ItemIndex].LevelOffset + (I * 20) + X] := LevelData[i,x];

    // Now we import the scroll data
    for i := 0 to 8 do
      ROM[LevelType[cbLevelImport.ItemIndex].LevelScrollDataOffset + i] := TempScrollData[i];
  finally
    FreeAndNil(R2File);
  end;
end;

procedure TfrmImportLevel.XORDecryptLevelData(pFilename: String);
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
        TempBuf := RotateByte(TempBuf xor XORKEY);
        WriteBuffer(TempBuf,1);
      end;
    end;
  finally
    FreeAndNil(INIFile);
  end;
end;

function TfrmImportLevel.RotateByte(num : Byte): Byte;
begin
  RotateByte := (num shl 4) or (num shr 4);
end;

procedure TfrmImportLevel.cmdImportClick(Sender: TObject);
begin
  if FileExists(txtImportFile.Text) = True then
    ImportR3File(txtImportFile.Text)
  else
    messagebox(Handle,'The file specified does not exist',PChar(Application.Title),0);
end;

procedure TfrmImportLevel.cmdSelectClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    txtImportFile.Text := OpenDialog.FileName;
    txtImportFile.SelStart := Length(txtImportFile.Text);
  end;
end;

end.
