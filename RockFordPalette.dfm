object frmRockFordsColours: TfrmRockFordsColours
  Left = 344
  Top = 304
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Rockford Palette Editor'
  ClientHeight = 200
  ClientWidth = 422
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl000F: TLabel
    Left = 301
    Top = 9
    Width = 34
    Height = 13
    Caption = '00 - 0F'
  end
  object lbl101F: TLabel
    Left = 301
    Top = 27
    Width = 34
    Height = 13
    Caption = '10 - 1F'
  end
  object lbl202F: TLabel
    Left = 301
    Top = 45
    Width = 34
    Height = 13
    Caption = '20 - 2F'
  end
  object lbl303F: TLabel
    Left = 301
    Top = 63
    Width = 34
    Height = 13
    Caption = '30 - 3F'
  end
  object lblCurrentPalette: TLabel
    Left = 8
    Top = 88
    Width = 133
    Height = 13
    Caption = 'Current Palette Colour: $00'
  end
  object lblRockFordPalette: TLabel
    Left = 8
    Top = 112
    Width = 91
    Height = 13
    Caption = 'Rockford'#39's Palette:'
  end
  object imgRockFordPal1: TImage32
    Left = 8
    Top = 136
    Width = 25
    Height = 25
    BitmapAlign = baTopLeft
    ParentShowHint = False
    Scale = 1
    ScaleMode = smNormal
    ShowHint = True
    TabOrder = 0
    OnMouseUp = imgRockFordPal1MouseUp
  end
  object imgRockFordPal2: TImage32
    Left = 40
    Top = 136
    Width = 25
    Height = 25
    BitmapAlign = baTopLeft
    ParentShowHint = False
    Scale = 1
    ScaleMode = smNormal
    ShowHint = True
    TabOrder = 1
    OnMouseUp = imgRockFordPal2MouseUp
  end
  object imgRockFordPal3: TImage32
    Left = 72
    Top = 136
    Width = 25
    Height = 25
    BitmapAlign = baTopLeft
    ParentShowHint = False
    Scale = 1
    ScaleMode = smNormal
    ShowHint = True
    TabOrder = 2
    OnMouseUp = imgRockFordPal3MouseUp
  end
  object imgRockFordPal4: TImage32
    Left = 104
    Top = 136
    Width = 25
    Height = 25
    BitmapAlign = baTopLeft
    ParentShowHint = False
    Scale = 1
    ScaleMode = smNormal
    ShowHint = True
    TabOrder = 3
    OnMouseUp = imgRockFordPal4MouseUp
  end
  object imgRockFordPal5: TImage32
    Left = 136
    Top = 136
    Width = 25
    Height = 25
    BitmapAlign = baTopLeft
    ParentShowHint = False
    Scale = 1
    ScaleMode = smNormal
    ShowHint = True
    TabOrder = 4
    OnMouseUp = imgRockFordPal5MouseUp
  end
  object imgRockFordPal6: TImage32
    Left = 168
    Top = 136
    Width = 25
    Height = 25
    BitmapAlign = baTopLeft
    ParentShowHint = False
    Scale = 1
    ScaleMode = smNormal
    ShowHint = True
    TabOrder = 5
    OnMouseUp = imgRockFordPal6MouseUp
  end
  object imgRockFordPal7: TImage32
    Left = 200
    Top = 136
    Width = 25
    Height = 25
    BitmapAlign = baTopLeft
    ParentShowHint = False
    Scale = 1
    ScaleMode = smNormal
    ShowHint = True
    TabOrder = 6
    OnMouseUp = imgRockFordPal7MouseUp
  end
  object imgRockFordPal8: TImage32
    Left = 232
    Top = 136
    Width = 25
    Height = 25
    BitmapAlign = baTopLeft
    ParentShowHint = False
    Scale = 1
    ScaleMode = smNormal
    ShowHint = True
    TabOrder = 7
    OnMouseUp = imgRockFordPal8MouseUp
  end
  object imgRockFordPal9: TImage32
    Left = 264
    Top = 136
    Width = 25
    Height = 25
    BitmapAlign = baTopLeft
    ParentShowHint = False
    Scale = 1
    ScaleMode = smNormal
    ShowHint = True
    TabOrder = 8
    OnMouseUp = imgRockFordPal9MouseUp
  end
  object imgRockFordPal10: TImage32
    Left = 296
    Top = 136
    Width = 25
    Height = 25
    BitmapAlign = baTopLeft
    ParentShowHint = False
    Scale = 1
    ScaleMode = smNormal
    ShowHint = True
    TabOrder = 9
    OnMouseUp = imgRockFordPal10MouseUp
  end
  object imgRockFordPal11: TImage32
    Left = 328
    Top = 136
    Width = 25
    Height = 25
    BitmapAlign = baTopLeft
    ParentShowHint = False
    Scale = 1
    ScaleMode = smNormal
    ShowHint = True
    TabOrder = 10
    OnMouseUp = imgRockFordPal11MouseUp
  end
  object imgRockFordPal12: TImage32
    Left = 360
    Top = 136
    Width = 25
    Height = 25
    BitmapAlign = baTopLeft
    ParentShowHint = False
    Scale = 1
    ScaleMode = smNormal
    ShowHint = True
    TabOrder = 11
    OnMouseUp = imgRockFordPal12MouseUp
  end
  object imgRockFordPal13: TImage32
    Left = 392
    Top = 136
    Width = 25
    Height = 25
    BitmapAlign = baTopLeft
    ParentShowHint = False
    Scale = 1
    ScaleMode = smNormal
    ShowHint = True
    TabOrder = 12
    OnMouseUp = imgRockFordPal13MouseUp
  end
  object chkDisableRockfordPalChange: TCheckBox
    Left = 8
    Top = 168
    Width = 185
    Height = 17
    Caption = 'Disable Rockford Palette Change'
    TabOrder = 13
    Visible = False
  end
  object imgNESColours: TImage32
    Left = 8
    Top = 8
    Width = 286
    Height = 73
    BitmapAlign = baTopLeft
    Scale = 1
    ScaleMode = smNormal
    TabOrder = 14
    OnMouseMove = imgNESColoursMouseMove
    OnMouseUp = imgNESColoursMouseUp
  end
  object cmdOK: TButton
    Left = 264
    Top = 168
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 15
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 344
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 1
    TabOrder = 16
  end
end
