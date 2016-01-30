object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'ComputerTime'
  ClientHeight = 298
  ClientWidth = 635
  Color = clBtnFace
  Constraints.MaxHeight = 337
  Constraints.MaxWidth = 651
  Constraints.MinHeight = 337
  Constraints.MinWidth = 651
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 239
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 596
    Top = 239
    Width = 31
    Height = 13
    Alignment = taRightJustify
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 174
    Height = 193
    Caption = '00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -160
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 180
    Top = 8
    Width = 57
    Height = 193
    Caption = ':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -160
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 231
    Top = 8
    Width = 174
    Height = 193
    Caption = '00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -160
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 453
    Top = 8
    Width = 174
    Height = 193
    Caption = '00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -160
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 403
    Top = 8
    Width = 57
    Height = 193
    Caption = ':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -160
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 216
    Width = 619
    Height = 17
    Max = 100000
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 266
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 89
    Top = 266
    Width = 75
    Height = 25
    Caption = 'Reset'
    TabOrder = 2
    OnClick = Button3Click
  end
  object CheckBox1: TCheckBox
    Left = 511
    Top = 273
    Width = 116
    Height = 17
    Caption = 'Zawsze na wierzchu'
    TabOrder = 3
    OnClick = CheckBox1Click
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 460
    Top = 24
  end
end
