object frmStartingLivesEditor: TfrmStartingLivesEditor
  Left = 465
  Top = 362
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Starting Lives Editor'
  ClientHeight = 71
  ClientWidth = 204
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
  object lblStartingLives: TLabel
    Left = 8
    Top = 8
    Width = 69
    Height = 13
    Caption = 'Starting Lives:'
  end
  object txtLives: TSpinEdit
    Left = 88
    Top = 8
    Width = 105
    Height = 22
    MaxLength = 1
    MaxValue = 0
    MinValue = 0
    TabOrder = 0
    Value = 0
  end
  object cmdOK: TButton
    Left = 40
    Top = 40
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 120
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 1
    TabOrder = 2
  end
end
