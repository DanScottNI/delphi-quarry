unit QuarrySetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, INIFiles, BoulderDashData;

type
  TfrmQuarrySetup = class(TForm)
    lblQuarrySetupTitle: TLabel;
    lblSelectDataFile: TLabel;
    cbDataFile: TComboBox;
    lblPaletteSelect: TLabel;
    cbPalette: TComboBox;
    cmdOK: TButton;
    procedure FormCreate(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
  private
    DataFilenames : Array Of String;
    procedure PopulatePalettes;
    procedure PopulateDataFiles;
    procedure SaveDefaultOptions;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQuarrySetup: TfrmQuarrySetup;

implementation

{$R *.dfm}

procedure TfrmQuarrySetup.PopulatePalettes();
var
  PalDef : TStringList;
  i,x : Integer;
  TempString : String;
begin
  // Create the string list.
  PalDef := TStringList.Create;
  try
    with PalDef do
    begin
      // Load the palette definition file into memory.
      LoadFromFile(ExtractFileDir(ParamStr(0)) + '\Palettes\pal.dat');

      // Loop through each palette in the file, and add them to the listbox
      for i := 0 to Count -1 do
      begin
        TempString := '';
        for x := 0 to length(Strings[i]) - 1 do
        begin
          If PalDef.Strings[i][x] = '.' then
          begin
            cbPalette.Items.Add(Trim(TempString));
            TempString := '';
          end
          else
            TempString := TempString + Strings[i][x];
        end;

      end;
      cbPalette.ItemIndex := 0;
    end;
  finally
    // Free up the stringlist
    FreeAndNil(PalDef);
  end;
end;

procedure TfrmQuarrySetup.FormCreate(Sender: TObject);
begin
  PopulatePalettes();
  PopulateDataFiles();
end;

procedure TfrmQuarrySetup.PopulateDataFiles();
var
  PalDef : TStringList;
  i,x : Integer;
  TempString : String;
begin
  // Create the string list.
  PalDef := TStringList.Create;
  try
    With PalDef do
    begin
      // Load the palette definition file into memory.
      LoadFromFile(ExtractFileDir(ParamStr(0)) + '\data\list.dat');
      SetLength(DataFilenames,Count);
      // Loop through each palette in the file, and add them to the listbox
      for i := 0 to PalDef.Count -1 do
      begin
        TempString := '';
        for x := 0 to length(PalDef.Strings[i]) do
        begin
          If PalDef.Strings[i][x] = ':' then
          begin
            DataFilenames[i] := Trim(TempString);

            TempString := '';
          end
          else
            TempString := TempString + PalDef.Strings[i][x];
        end;
        cbDataFile.Items.Add(Trim(TempString));

      end;
      cbDataFile.ItemIndex := 0;
    end;
  finally
    // Free up the stringlist
    FreeAndNil(PalDef);
  end;
end;

procedure TfrmQuarrySetup.SaveDefaultOptions();
var
  INI : TMemINIFile;
begin
  // First we initialise the ini file
  INI := TMemINIFile.Create(ExtractFileDir(ParamStr(0))+ '\options.ini');
  try
    with INI do
    begin
      WriteInteger('Options','DataFile',cbDataFile.ItemIndex);
      CurDataFileStr := ExtractFileDir(ParamStr(0))+'\Data\' + DataFilenames[cbDataFile.ItemIndex];
      WriteInteger('Options','PaletteFile',cbPalette.ItemIndex);
      CurPaletteStr := ExtractFileDir(ParamStr(0))+'\Palettes\' + cbPalette.Items[cbPalette.ItemIndex] + '.pal';
      WriteInteger('Options','GridlineColour',4);
      WriteBool('Options','EnableGridlines',True);
      WriteInteger('Options','TimeFrameAnimation',100);
      FrameTimeAnimation := 100;
      UpdateFile;
    end;
  finally
    FreeAndNil(ini);
  end;
end;

procedure TfrmQuarrySetup.cmdOKClick(Sender: TObject);
begin
  SaveDefaultOptions();
end;

end.
