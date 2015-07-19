unit Options;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, BoulderDashData;

type
  TfrmOptions = class(TForm)
    lblPalettes: TLabel;
    lstPalettes: TListBox;
    cmdInstallPal: TButton;
    chkEnableGridlinesByDefault: TCheckBox;
    cmdOK: TButton;
    cmdCancel: TButton;
    lblGridlinesColour: TLabel;
    cbGridlineColours: TComboBox;
    lblPaletteDescription: TLabel;
    lblDataFile: TLabel;
    cbDataFile: TComboBox;
    lblAnimationTime: TLabel;
    txtFrameAnimationTime: TEdit;
    chkEnableAnimation: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure lstPalettesClick(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
    procedure cmdInstallPalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    PaletteDes : Array Of String;
    DataDes : Array Of String;
    DataFileName : Array Of String;
    procedure PopulatePalettes;
    procedure PopulateDataFiles;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOptions: TfrmOptions;

implementation

{$R *.dfm}

procedure TfrmOptions.FormCreate(Sender: TObject);
begin
  // First we need to populate the list of palettes
  PopulatePalettes();
  // Next, we need to populate the data files list
  PopulateDataFiles();
end;

procedure TfrmOptions.PopulateDataFiles();
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
      SetLength(DataDes,Count);
      SetLength(DataFilename,Count);
      // Loop through each palette in the file, and add them to the listbox
      for i := 0 to PalDef.Count -1 do
      begin
        TempString := '';
        for x := 0 to length(PalDef.Strings[i]) do
        begin
          If Strings[i][x] = ':' then
          begin
            //cbDataFile.Items.Add(Trim(TempString));
            DataFileName[i] := Trim(TempString);
            TempString := '';
          end
          else
            TempString := TempString + Strings[i][x];
        end;
        DataDes[i] := Trim(TempString);
        cbDataFile.Items.Add(DataDes[i]);
      end;
      cbDataFile.ItemIndex := 0;
    end;
  finally
    // Free up the stringlist
    FreeAndNil(PalDef);
  end;
end;

procedure TfrmOptions.PopulatePalettes();
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
      LoadFromFile(ExtractFileDir(ParamStr(0)) + '\Palettes\pal.dat');
      SetLength(PaletteDes,Count);
      // Loop through each palette in the file, and add them to the listbox
      for i := 0 to Count -1 do
      begin
        TempString := '';
        for x := 0 to length(Strings[i]) do
        begin
          If Strings[i][x] = ':' then
          begin
            lstPalettes.Items.Add(Trim(TempString));
            TempString := '';
          end
          else
            TempString := TempString + Strings[i][x];
        end;
        PaletteDes[i] := Trim(TempString);
      end;
    end;
  finally
    // Free up the stringlist
    FreeAndNil(PalDef);
  end;
end;

procedure TfrmOptions.lstPalettesClick(Sender: TObject);
begin
  lblPaletteDescription.Caption := 'Palette Description: ' + chr(13) + chr(10) + chr(13) + chr(10) + PaletteDes[lstPalettes.ItemIndex];
end;

procedure TfrmOptions.cmdOKClick(Sender: TObject);
begin
  CurGridlineColour := cbGridlineColours.ItemIndex;
  EnableGridlinesDef := chkEnableGridlinesByDefault.Checked;
  CurPaletteStr := ExtractFileDir(ParamStr(0)) + '\Palettes\' + lstPalettes.Items[lstPalettes.ItemIndex];
  CurPalette := lstPalettes.ItemIndex;
  FrameTimeAnimation := StrToInt(txtFrameAnimationTime.Text);
  AnimationDef := chkEnableANimation.Checked;
//  CurDataFileStr := ExtractFileDir(ParamStr(0)) + '\Data\' + cbDataFile.Items[cbDataFile.ItemIndex];
  CurDataFileStr := ExtractFileDir(ParamStr(0)) + '\Data\' + DataFileName[cbDataFile.ItemIndex];
  CurDataFile := cbDataFile.ItemIndex;
  SaveOptions;
end;

procedure TfrmOptions.cmdInstallPalClick(Sender: TObject);
begin
  showmessage('I don''t work. But I' +
    ' will allow the updating of the palette data file and copying of the palette file into the palette directory');
end;

procedure TfrmOptions.FormShow(Sender: TObject);
begin
  cbGridlineColours.ItemIndex := CurGridlineColour;
  chkEnableGridlinesByDefault.Checked := EnableGridlinesDef;
  cbDataFile.ItemIndex := CurDataFile;
  lstpalettes.ItemIndex := CurPalette;
  lblPaletteDescription.Caption := 'Palette Description: ' + chr(13) + chr(10) + chr(13) + chr(10) + PaletteDes[lstPalettes.ItemIndex];
  txtFrameAnimationTime.Text := IntToStr(FrameTimeAnimation);
  chkEnableAnimation.Checked := AnimationDef;
end;

end.
