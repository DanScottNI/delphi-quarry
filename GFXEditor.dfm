object frmGFXEditor: TfrmGFXEditor
  Left = 234
  Top = 113
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'GFX Editor'
  ClientHeight = 241
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object imgTileSet: TImage32
    Left = 8
    Top = 8
    Width = 384
    Height = 192
    BitmapAlign = baTopLeft
    Scale = 3
    ScaleMode = smScale
    TabOrder = 0
  end
  object imgTile: TImage32
    Left = 416
    Top = 8
    Width = 128
    Height = 128
    BitmapAlign = baTopLeft
    Scale = 1
    ScaleMode = smNormal
    TabOrder = 1
  end
  object cmdOK: TButton
    Left = 392
    Top = 208
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 2
  end
  object cmdCancel: TButton
    Left = 472
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Cancel'
    Enabled = False
    TabOrder = 3
  end
  object ScrollBar1: TScrollBar
    Left = 392
    Top = 8
    Width = 17
    Height = 192
    Kind = sbVertical
    PageSize = 0
    TabOrder = 4
  end
end
