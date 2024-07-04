object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Mail program'
  ClientHeight = 521
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lbl1: TLabel
    Left = 0
    Top = 16
    Width = 101
    Height = 15
    Caption = 'Host (SMTP Server)'
  end
  object lbl2: TLabel
    Left = 0
    Top = 61
    Width = 56
    Height = 15
    Caption = 'User name'
  end
  object lbl3: TLabel
    Left = 0
    Top = 112
    Width = 50
    Height = 15
    Caption = 'Password'
  end
  object lbl4: TLabel
    Left = 0
    Top = 157
    Width = 28
    Height = 15
    Caption = 'From'
  end
  object lbl5: TLabel
    Left = 0
    Top = 208
    Width = 12
    Height = 15
    Caption = 'To'
  end
  object lbl6: TLabel
    Left = 0
    Top = 275
    Width = 32
    Height = 15
    Caption = 'Status'
  end
  object lbl7: TLabel
    Left = 272
    Top = 16
    Width = 39
    Height = 15
    Caption = 'Subject'
  end
  object lbl8: TLabel
    Left = 272
    Top = 61
    Width = 66
    Height = 15
    Caption = 'Path of a file'
  end
  object lbl9: TLabel
    Left = 272
    Top = 109
    Width = 76
    Height = 15
    Caption = 'Body of a mail'
  end
  object edtHost: TEdit
    Left = 0
    Top = 32
    Width = 225
    Height = 23
    TabOrder = 0
  end
  object edtUserName: TEdit
    Left = 0
    Top = 80
    Width = 225
    Height = 23
    TabOrder = 1
  end
  object edtPassword: TEdit
    Left = 0
    Top = 128
    Width = 225
    Height = 23
    TabOrder = 2
  end
  object edtFromText: TEdit
    Left = 0
    Top = 178
    Width = 225
    Height = 23
    TabOrder = 3
  end
  object edtToText: TEdit
    Left = 0
    Top = 226
    Width = 225
    Height = 23
    TabOrder = 4
  end
  object btnSend: TButton
    Left = 0
    Top = 471
    Width = 225
    Height = 25
    Caption = 'Send a mail'
    TabOrder = 5
    OnClick = btnSendClick
  end
  object mmoStatus: TMemo
    Left = 0
    Top = 288
    Width = 225
    Height = 170
    TabOrder = 6
  end
  object mmoBody: TMemo
    Left = 272
    Top = 128
    Width = 340
    Height = 368
    TabOrder = 7
  end
  object edtSubject: TEdit
    Left = 272
    Top = 32
    Width = 340
    Height = 23
    TabOrder = 8
  end
  object edtPathFile: TEdit
    Left = 272
    Top = 80
    Width = 340
    Height = 23
    TabOrder = 9
  end
  object idsmtp: TIdSMTP
    SASLMechanisms = <>
    Top = 504
  end
  object idmsg: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 64
    Top = 504
  end
  object idslhndlrscktpnsl: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 32
    Top = 504
  end
end
