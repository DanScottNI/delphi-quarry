object frmAbout: TfrmAbout
  Left = 342
  Top = 281
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'About'
  ClientHeight = 321
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object lblQuarry: TLabel
    Left = 8
    Top = 8
    Width = 66
    Height = 13
    Caption = 'Quarry v0.8'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDescription: TLabel
    Left = 8
    Top = 32
    Width = 385
    Height = 78
    Caption = 
      'Quarry is a level editor for the NES game Boulder Dash. Quarry s' +
      'upports the '#13#10'three versions of the game, the american, european' +
      ', and the japanese version.'#13#10'Quarry has had a long development a' +
      's the author (me, Dan), was still'#13#10'learning about level editors ' +
      'as Quarry was being coded. Which is why Quarry'#13#10'was rewritten th' +
      'ree times in as many languages. It'#39's also why Quarry has had'#13#10'a ' +
      'long time in development.'
  end
  object lblDESHomepage: TLabel
    Left = 8
    Top = 288
    Width = 58
    Height = 13
    Cursor = crHandPoint
    Hint = 'http://dan.panicus.org'
    Caption = 'Dan'#39's Space'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    DetectMouse = True
    URLType = utCustom
    URL = 'http://dan.panicus.org'
  end
  object Label1: TLabel
    Left = 8
    Top = 120
    Width = 395
    Height = 156
    Caption = 
      'Special thanks to:'#13#10#13#10'- Parasyte: For giving suggestions and fin' +
      'ding the much needed scroll data. Also'#13#10'for coding FCEUd'#39's debug' +
      'ger which helped me find the starting lives.'#13#10'- Vagla: For suppl' +
      'ying me with valuable data about Boulder Dash.'#13#10'- Dahrk Daiz: Fo' +
      'r helping me find the starting lives.'#13#10'- The Fake God: For relea' +
      'sing his NES tile drawing source code to the world,'#13#10'and for put' +
      'ting up with my many questions throughout the time I have known ' +
      'him.'#13#10'Thanks man!'#13#10'- Gil-Galad: For being a generally nice fello' +
      'w, and for attempting to teach me the '#13#10'wonders of ASM. (Even th' +
      'ough I'#39'm totally thick)'#13#10'- Anyone who uses this to make a hack.'
  end
  object cmdOK: TButton
    Left = 320
    Top = 288
    Width = 80
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
    OnClick = cmdOKClick
  end
end
