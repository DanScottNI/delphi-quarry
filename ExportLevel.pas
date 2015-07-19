unit ExportLevel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, BoulderDashData,Quarry;

type
  TfrmExportLevel = class(TForm)
    lblExportFile: TLabel;
    lblExportToLevel: TLabel;
    SaveDialog: TSaveDialog;
    cbLevelExport: TComboBox;
    txtExportFile: TEdit;
    cmdSelect: TButton;
    cmdExport: TButton;
    cmdCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure cmdSelectClick(Sender: TObject);
    procedure cmdExportClick(Sender: TObject);
  private
    procedure ExportR3File(pFilename: String);
    function RotateByte(num: Byte): Byte;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExportLevel: TfrmExportLevel;

const
  XORKEY : Byte = 99;

implementation

{$R *.dfm}

procedure TfrmExportLevel.FormShow(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to 23 do
    cbLevelExport.Items.Add(LevelType[i].LevelName);

  cbLevelExport.ItemIndex := 0;

end;

procedure TfrmExportLevel.ExportR3File(pFilename : String);
var
  LevelFile : TMemoryStream;
  TempBuf : Byte;
  i,x : Integer;
begin
  LevelFile := TMemoryStream.Create;
  try
    with LevelFile do
    begin
      // Write the header.
      TempBuf := $51;
      Write(TempBuf,1);
      TempBuf := $44;
      Write(TempBuf,1);
      TempBuf := $46;
      Write(TempBuf,1);
      TempBuf := $52;
      Write(TempBuf,1);
      TempBuf := $33;
      Write(TempBuf,1);

      // Now write the value for the crystals
      TempBuf := ROM[LevelType[cbLevelExport.ItemIndex].LevelCrystalOffset] xor XORKEY;
      Write(TempBuf,1);
      // Now write the value for the time
      TempBuf := ROM[LevelType[cbLevelExport.ItemIndex].LevelTimeOffset] xor XORKEY;
      Write(TempBuf,1);
      // Now write the value for the Start X co-ordinate
      TempBuf := ROM[LevelType[cbLevelExport.ItemIndex].LevelStartXOffset] xor XORKEY;
      Write(TempBuf,1);
      // Now write the value for the Start Y co-ordinate
      TempBuf := ROM[LevelType[cbLevelExport.ItemIndex].LevelStartYOffset] xor XORKEY;
      Write(TempBuf,1);

      // Now write the scroll data
      for i :=0 to 8 do
      begin

        TempBuf := ROM[LevelType[cbLevelExport.ItemIndex].LevelScrollDataOffset + i] xor XORKEY;
        Write(TempBuf,1);
      end;
      // Now write the actual level data
      For I := 0 To 21 do
      begin

        For X := 0 To 19 do
        begin
          TempBuf := ROM[LevelType[cbLevelExport.ItemIndex].LevelOffset + (I * 20) + X] xor XORKEY;

          Write(TempBuf,1);
        end;

      end;
      SaveToFile(pFilename);
    end;
  finally
    FreeAndNil(LevelFile);
  end;
end;

procedure TfrmExportLevel.cmdSelectClick(Sender: TObject);
begin
  if SaveDialog.Execute then
  begin

    txtExportFile.Text := SaveDialog.FileName;
    txtExportFile.SelStart := Length(txtExportFile.Text);
  end;
end;

procedure TfrmExportLevel.cmdExportClick(Sender: TObject);
begin
  ExportR3File(txtExportFile.Text);
  messagebox(Handle,'Quarry has successfully exported the level',
  //PChar(LevelType[cbLevelExport.ItemIndex].LevelName) + ' to: ' +
  //chr(13) + chr(10) + PChar(txtExportFile.Text),
  PChar(Application.Title),0);
end;

function TfrmExportLevel.RotateByte(num : Byte):Byte;
begin
  RotateByte := (num shl 4) or (num shr 4);
end;

end.
