object frmImportLevel: TfrmImportLevel
  Left = 435
  Top = 348
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Import Level'
  ClientHeight = 95
  ClientWidth = 449
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblImportFile: TLabel
    Left = 8
    Top = 8
    Width = 55
    Height = 13
    Caption = 'Import File:'
  end
  object lblImportToLevel: TLabel
    Left = 8
    Top = 32
    Width = 79
    Height = 13
    Caption = 'Import To Level:'
  end
  object cbLevelImport: TComboBox
    Left = 96
    Top = 32
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
  end
  object txtImportFile: TEdit
    Left = 96
    Top = 8
    Width = 265
    Height = 21
    TabOrder = 1
  end
  object cmdSelect: TButton
    Left = 368
    Top = 8
    Width = 75
    Height = 21
    Caption = 'Select'
    TabOrder = 2
    OnClick = cmdSelectClick
  end
  object cmdImport: TButton
    Left = 288
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Import'
    Default = True
    TabOrder = 3
    OnClick = cmdImportClick
  end
  object cmdCancel: TButton
    Left = 368
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 1
    TabOrder = 4
  end
  object OpenDialog: TOpenDialog
    Filter = 
      'Quarry Data File Format Revision 3 (*.qdf)|*.qdf|Quarry Data Fil' +
      'e Format Revision 1 + 2 (*.bdd)|*.bdd|All Files (*.*)|*.*'
    Left = 264
    Top = 32
  end
end
