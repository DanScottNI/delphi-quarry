object frmLevelProperties: TfrmLevelProperties
  Left = 437
  Top = 387
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Level Properties'
  ClientHeight = 138
  ClientWidth = 185
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grpCrystalsTime: TGroupBox
    Left = 8
    Top = 8
    Width = 169
    Height = 89
    Caption = 'Crystals && Time'
    TabOrder = 0
    object lblCrystals: TLabel
      Left = 8
      Top = 24
      Width = 43
      Height = 13
      Caption = 'Crystals:'
    end
    object lblTime: TLabel
      Left = 8
      Top = 48
      Width = 26
      Height = 13
      Caption = 'Time:'
    end
    object txtCrystals: TSpinEdit
      Left = 72
      Top = 24
      Width = 50
      Height = 22
      MaxLength = 3
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
    end
    object txtTime: TSpinEdit
      Left = 72
      Top = 48
      Width = 50
      Height = 22
      MaxLength = 3
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 0
    end
  end
  object cmdOK: TButton
    Left = 21
    Top = 104
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 102
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 1
    TabOrder = 2
  end
end
