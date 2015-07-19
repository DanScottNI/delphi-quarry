object frmJumpTo: TfrmJumpTo
  Left = 234
  Top = 113
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Jump to level....'
  ClientHeight = 254
  ClientWidth = 208
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
  object lblLevel: TLabel
    Left = 8
    Top = 8
    Width = 29
    Height = 13
    Caption = 'Level:'
  end
  object lstLevels: TListBox
    Left = 8
    Top = 32
    Width = 193
    Height = 185
    ItemHeight = 13
    TabOrder = 0
  end
  object cmdOK: TButton
    Left = 48
    Top = 224
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 128
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
