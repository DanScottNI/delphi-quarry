object frmOptions: TfrmOptions
  Left = 384
  Top = 318
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Options'
  ClientHeight = 318
  ClientWidth = 342
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblPalettes: TLabel
    Left = 8
    Top = 8
    Width = 43
    Height = 13
    Caption = 'Palettes:'
  end
  object lblGridlinesColour: TLabel
    Left = 8
    Top = 258
    Width = 78
    Height = 13
    Caption = 'Gridlines Colour:'
  end
  object lblPaletteDescription: TLabel
    Left = 184
    Top = 8
    Width = 153
    Height = 97
    AutoSize = False
    Caption = 'Palette Description:'
    WordWrap = True
  end
  object lblDataFile: TLabel
    Left = 8
    Top = 152
    Width = 46
    Height = 13
    Caption = 'Data File:'
  end
  object lblAnimationTime: TLabel
    Left = 8
    Top = 208
    Width = 109
    Height = 13
    Caption = 'Frame Animation Time:'
  end
  object lstPalettes: TListBox
    Left = 56
    Top = 8
    Width = 121
    Height = 129
    ItemHeight = 13
    TabOrder = 0
    OnClick = lstPalettesClick
  end
  object cmdInstallPal: TButton
    Left = 184
    Top = 112
    Width = 105
    Height = 25
    Caption = 'Install New Palette'
    TabOrder = 1
    Visible = False
    OnClick = cmdInstallPalClick
  end
  object chkEnableGridlinesByDefault: TCheckBox
    Left = 8
    Top = 234
    Width = 153
    Height = 17
    Caption = 'Enable Gridlines By Default'
    TabOrder = 2
  end
  object cmdOK: TButton
    Left = 184
    Top = 288
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 264
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 1
    TabOrder = 4
  end
  object cbGridlineColours: TComboBox
    Left = 96
    Top = 258
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 5
    Text = 'Black'
    Items.Strings = (
      'Black'
      'Dim Grey'
      'Grey'
      'Light Grey'
      'White'
      'Maroon'
      'Green'
      'Olive'
      'Navy'
      'Purple'
      'Teal'
      'Red'
      'Lime'
      'Yellow'
      'Blue'
      'Fuchsia'
      'Aqua')
  end
  object cbDataFile: TComboBox
    Left = 56
    Top = 152
    Width = 281
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 6
  end
  object txtFrameAnimationTime: TEdit
    Left = 128
    Top = 208
    Width = 89
    Height = 21
    MaxLength = 4
    TabOrder = 7
  end
  object chkEnableAnimation: TCheckBox
    Left = 8
    Top = 184
    Width = 161
    Height = 17
    Caption = 'Enable Animation By Default'
    TabOrder = 8
  end
end
