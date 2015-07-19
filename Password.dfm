object frmPasswordEditor: TfrmPasswordEditor
  Left = 286
  Top = 172
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Password Editor'
  ClientHeight = 169
  ClientWidth = 186
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
  object lblWorld2: TLabel
    Left = 8
    Top = 8
    Width = 41
    Height = 13
    Caption = 'World 2:'
  end
  object lblWorld3: TLabel
    Left = 8
    Top = 32
    Width = 41
    Height = 13
    Caption = 'World 3:'
  end
  object lblWorld4: TLabel
    Left = 8
    Top = 56
    Width = 41
    Height = 13
    Caption = 'World 4:'
  end
  object lblWorld5: TLabel
    Left = 8
    Top = 80
    Width = 41
    Height = 13
    Caption = 'World 5:'
  end
  object lblWorld6: TLabel
    Left = 8
    Top = 104
    Width = 41
    Height = 13
    Caption = 'World 6:'
  end
  object txtWorld2: TEdit
    Left = 56
    Top = 8
    Width = 121
    Height = 21
    MaxLength = 6
    TabOrder = 0
  end
  object txtWorld3: TEdit
    Left = 56
    Top = 32
    Width = 121
    Height = 21
    MaxLength = 6
    TabOrder = 1
  end
  object txtWorld4: TEdit
    Left = 56
    Top = 56
    Width = 121
    Height = 21
    MaxLength = 6
    TabOrder = 2
  end
  object txtWorld5: TEdit
    Left = 56
    Top = 80
    Width = 121
    Height = 21
    MaxLength = 6
    TabOrder = 3
  end
  object txtWorld6: TEdit
    Left = 56
    Top = 104
    Width = 121
    Height = 21
    MaxLength = 6
    TabOrder = 4
  end
  object cmdOK: TButton
    Left = 24
    Top = 136
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 5
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 104
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 1
    TabOrder = 6
  end
end
