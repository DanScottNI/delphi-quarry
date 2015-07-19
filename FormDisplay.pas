unit FormDisplay;

interface

uses Forms, GR32;

Procedure ShowOptions();
Procedure ShowTSAEditor();
Procedure ShowQuarrySetup();
Procedure ShowAboutForm();
Procedure ShowJumpTo();
Procedure ShowPaletteEditor();
Procedure ShowPasswordEditor();
Procedure ShowStartingLivesEditor();
Procedure ShowLevelProperties();
Procedure ShowScrollEditor(pLevel : Byte; pCurLevelGFX :TBitmap32);
Procedure ShowExportLevel();
Procedure ShowImportLevel();
Procedure ShowOpenDialog();
Procedure ShowGFXEditor();

implementation

uses Options, TSAEditor, QuarrySetup, About,
  JumpTo, Palette, Password, Lives, LevelProperties, ScrollEditor,
    ImportLevel, ExportLevel, OPenDialogRep, GFXEditor;

Procedure ShowScrollEditor(pLevel : Byte; pCurLevelGFX :TBitmap32);
begin
  // if the options dialog is not open then
  // create it, and show it
  if frmScrollEditor = nil then
    frmScrollEditor := TfrmScrollEditor.Create(Application, pLevel, pCurLevelGFX);
  // If the options dialog is open,
  // then just show it.
  if frmScrollEditor <> nil then
  begin
    frmScrollEditor.ShowModal;
  end;
end;

Procedure ShowOpenDialog();
begin
  // if the options dialog is not open then
  // create it, and show it
  if frmOpenDialog = nil then
  begin
    frmOpenDialog := TfrmOpenDialog.Create(Application);
  end;
  // If the options dialog is open,
  // then just show it.
  if frmOpenDialog <> nil then
  begin
    frmOpenDialog.ShowModal;
  end;
end;

Procedure ShowGFXEditor();
begin
  // if the options dialog is not open then
  // create it, and show it
  if frmGFXEditor = nil then
  begin
    frmGFXEditor := TfrmGFXEditor.Create(Application);
  end;
  // If the options dialog is open,
  // then just show it.
  if frmGFXEditor <> nil then
  begin
    frmGFXEditor.ShowModal;
  end;
end;

Procedure ShowOptions();
begin
  // if the options dialog is not open then
  // create it, and show it
  if frmOptions = nil then
  begin
    frmOptions := TfrmOptions.Create(Application);
  end;
  // If the options dialog is open,
  // then just show it.
  if frmOptions <> nil then
  begin
    frmOptions.ShowModal;
  end;
end;

Procedure ShowImportLevel();
begin
  // if the options dialog is not open then
  // create it, and show it
  if frmImportLevel = nil then
  begin
    frmImportLevel := TfrmImportLevel.Create(Application);
  end;
  // If the options dialog is open,
  // then just show it.
  if frmImportLevel <> nil then
  begin
    frmImportLevel.ShowModal;
  end;
end;

Procedure ShowExportLevel();
begin
  // if the options dialog is not open then
  // create it, and show it
  if frmExportLevel = nil then
  begin
    frmExportLevel := TfrmExportLevel.Create(Application);
  end;
  // If the options dialog is open,
  // then just show it.
  if frmExportLevel <> nil then
  begin
    frmExportLevel.ShowModal;
  end;
end;

Procedure ShowLevelProperties();
begin
  // if the Level Properties dialog is not open then
  // create it, and show it
  if frmLevelProperties = nil then
  begin
    frmLevelProperties := TfrmLevelProperties.Create(Application);
  end;
  // If the Level Properties dialog is open,
  // then just show it.
  if frmLevelProperties <> nil then
  begin
    frmLevelProperties.ShowModal;
  end;
end;

Procedure ShowTSAEditor();
begin
  // if the TSA Editor dialog is not open then
  // create it, and show it
  if frmTSAEditor = nil then
  begin
    frmTSAEditor := TfrmTSAEditor.Create(Application);
  end;
  // If the TSA Editor dialog is open,
  // then just show it.
  if frmTSAEditor <> nil then
  begin
    frmTSAEditor.Show;
  end;
end;

Procedure ShowQuarrySetup();
begin
  // if the Quarry Setup dialog is not open then
  // create it, and show it
  if frmQuarrySetup = nil then
  begin
    frmQuarrySetup := TfrmQuarrySetup.Create(Application);
  end;
  // If the Quarry Setup dialog is open,
  // then just show it.
  if frmQuarrySetup <> nil then
  begin
    frmQuarrySetup.ShowModal;
  end;
end;

Procedure ShowAboutForm();
begin
  // if the About dialog is not open then
  // create it, and show it
  if frmAbout = nil then
  begin
    frmAbout := TfrmAbout.Create(Application);
  end;
  // If the About dialog is open,
  // then just show it.
  if frmAbout <> nil then
  begin
    frmAbout.ShowModal;
  end;
end;

Procedure ShowJumpTo();
begin
  // if the Jump To dialog is not open then
  // create it, and show it
  if frmJumpTo = nil then
  begin
    frmJumpTo := TfrmJumpTo.Create(Application);
  end;
  // If the Jump To dialog is open,
  // then just show it.
  if frmJumpTo <> nil then
  begin
    frmJumpTo.ShowModal;
  end;
end;

Procedure ShowPaletteEditor();
begin
  // if the Palette Editor dialog is not open then
  // create it, and show it
  if frmPaletteEditor = nil then
  begin
    frmPaletteEditor := TfrmPaletteEditor.Create(Application);
  end;
  // If the Palette Editor dialog is open,
  // then just show it.
  if frmPaletteEditor <> nil then
  begin
    frmPaletteEditor.ShowModal;
  end;
end;

Procedure ShowPasswordEditor();
begin
  // if the Password Editor dialog is not open then
  // create it, and show it
  if frmPasswordEditor = nil then
  begin
    frmPasswordEditor := TfrmPasswordEditor.Create(Application);
  end;
  // If the Password Editor dialog is open,
  // then just show it.
  if frmPasswordEditor <> nil then
  begin
    frmPasswordEditor.ShowModal;
  end;
end;

Procedure ShowStartingLivesEditor();
begin
  // if the Starting Lives Editor dialog is not open then
  // create it, and show it
  if frmStartingLivesEditor = nil then
  begin
    frmStartingLivesEditor := TfrmStartingLivesEditor.Create(Application);
  end;
  // If the Starting Lives Editor dialog is open,
  // then just show it.
  if frmStartingLivesEditor <> nil then
  begin
    frmStartingLivesEditor.ShowModal;
  end;
end;

end.
