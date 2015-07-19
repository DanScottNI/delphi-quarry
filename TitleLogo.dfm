object frmTitleLogo: TfrmTitleLogo
  Left = 265
  Top = 222
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Title Logo Editor'
  ClientHeight = 302
  ClientWidth = 597
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
  object imgPatternTable: TImage32
    Left = 336
    Top = 8
    Width = 256
    Height = 256
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 0
    OnMouseUp = imgPatternTableMouseUp
  end
  object imgTitleLogo: TImage32
    Left = 8
    Top = 8
    Width = 320
    Height = 160
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 1
    OnMouseDown = imgTitleLogoMouseDown
    OnMouseMove = imgTitleLogoMouseMove
    OnMouseUp = imgTitleLogoMouseUp
  end
  object chkGridlines: TCheckBox
    Left = 8
    Top = 176
    Width = 113
    Height = 17
    Caption = 'Gridlines'
    TabOrder = 2
    OnClick = chkGridlinesClick
  end
  object cmdOK: TButton
    Left = 438
    Top = 272
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 517
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
end
