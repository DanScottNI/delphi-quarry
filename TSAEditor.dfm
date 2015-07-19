object frmTSAEditor: TfrmTSAEditor
  Left = 814
  Top = 543
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'TSA Blocks'
  ClientHeight = 128
  ClientWidth = 256
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object imgTSABlocks: TImage32
    Left = 0
    Top = 0
    Width = 256
    Height = 128
    Align = alClient
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 0
    OnMouseUp = imgTSABlocksMouseUp
  end
end
