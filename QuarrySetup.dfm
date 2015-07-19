object frmQuarrySetup: TfrmQuarrySetup
  Left = 304
  Top = 177
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Quarry - Setup'
  ClientHeight = 230
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblQuarrySetupTitle: TLabel
    Left = 8
    Top = 8
    Width = 366
    Height = 39
    Caption = 
      'Quarry has detected that you have never used the program before.' +
      ' Please '#13#10'take a few minutes and fill in the relevant data so yo' +
      'ur experience of using'#13#10'Quarry is a pleasant one :)'
  end
  object lblSelectDataFile: TLabel
    Left = 8
    Top = 56
    Width = 380
    Height = 26
    Caption = 
      'Please select the ROM that you will be editing from the drop dow' +
      'n list. You can '#13#10'change this later in the Options dialog, if yo' +
      'u wish.'
  end
  object lblPaletteSelect: TLabel
    Left = 8
    Top = 128
    Width = 387
    Height = 26
    Caption = 
      'Please select the palette that you wish to use in Quarry. Like t' +
      'he ROM type, you'#13#10'can also change this in the Options dialog if ' +
      'you wish.'
  end
  object cbDataFile: TComboBox
    Left = 8
    Top = 96
    Width = 377
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
  end
  object cbPalette: TComboBox
    Left = 8
    Top = 168
    Width = 241
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
  end
  object cmdOK: TButton
    Left = 288
    Top = 200
    Width = 105
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 2
    OnClick = cmdOKClick
  end
end
