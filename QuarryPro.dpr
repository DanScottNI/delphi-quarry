program QuarryPro;

uses
  Forms,
  Quarry in 'Quarry.pas' {frmQuarry},
  BoulderDashData in 'BoulderDashData.pas',
  Options in 'Options.pas' {frmOptions},
  TSAEditor in 'TSAEditor.pas' {frmTSAEditor},
  About in 'About.pas' {frmAbout},
  QuarrySetup in 'QuarrySetup.pas' {frmQuarrySetup},
  JumpTo in 'JumpTo.pas' {frmJumpTo},
  Palette in 'Palette.pas' {frmPaletteEditor},
  Lives in 'Lives.pas' {frmStartingLivesEditor},
  Password in 'Password.pas' {frmPasswordEditor},
  LevelProperties in 'LevelProperties.pas' {frmLevelProperties},
  WorldMap in 'WorldMap.pas' {frmWorldMapEditor},
  ScrollEditor in 'ScrollEditor.pas' {frmScrollEditor},
  ImportLevel in 'ImportLevel.pas' {frmImportLevel},
  ExportLevel in 'ExportLevel.pas' {frmExportLevel},
  iNESHeaderChecks in 'iNESHeaderChecks.pas',
  RockFordPalette in 'RockFordPalette.pas' {frmRockFordsColours},
  TitleLogo in 'TitleLogo.pas' {frmTitleLogo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Quarry v0.8';
  Application.CreateForm(TfrmQuarry, frmQuarry);
  Application.Run;
end.
