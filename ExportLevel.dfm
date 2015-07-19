object frmExportLevel: TfrmExportLevel
  Left = 435
  Top = 348
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Export Level'
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
  object lblExportFile: TLabel
    Left = 8
    Top = 32
    Width = 55
    Height = 13
    Caption = 'Export File:'
  end
  object lblExportToLevel: TLabel
    Left = 8
    Top = 8
    Width = 64
    Height = 13
    Caption = 'Export Level:'
  end
  object cbLevelExport: TComboBox
    Left = 96
    Top = 8
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
  end
  object txtExportFile: TEdit
    Left = 96
    Top = 32
    Width = 265
    Height = 21
    TabOrder = 1
  end
  object cmdSelect: TButton
    Left = 368
    Top = 32
    Width = 75
    Height = 21
    Caption = 'Select'
    TabOrder = 2
    OnClick = cmdSelectClick
  end
  object cmdExport: TButton
    Left = 288
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Export'
    Default = True
    ModalResult = 1
    TabOrder = 3
    OnClick = cmdExportClick
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
  object SaveDialog: TSaveDialog
    DefaultExt = '.qdf'
    Filter = 'Quarry Data File Format Revision 3 (*.qdf)|*.qdf'
    Left = 256
    Top = 64
  end
end
