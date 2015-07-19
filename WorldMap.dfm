object frmWorldMapEditor: TfrmWorldMapEditor
  Left = 204
  Top = 165
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'World Map Editor'
  ClientHeight = 496
  ClientWidth = 792
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
  object imgWorldMap: TImage32
    Left = 8
    Top = 8
    Width = 512
    Height = 480
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 0
    OnMouseDown = imgWorldMapMouseDown
    OnMouseUp = imgWorldMapMouseUp
  end
  object imgPatternTable: TImage32
    Left = 528
    Top = 8
    Width = 256
    Height = 256
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 1
    OnMouseUp = imgPatternTableMouseUp
  end
  object cmdOK: TButton
    Left = 632
    Top = 464
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 712
    Top = 464
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object chkGridlines: TCheckBox
    Left = 528
    Top = 272
    Width = 97
    Height = 17
    Caption = 'Gridlines'
    TabOrder = 4
    OnClick = chkGridlinesClick
  end
end
