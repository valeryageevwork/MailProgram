unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdSMTP, IdAttachmentFile, IdMessage,
  IdServerIOHandler, IdSSL, IdSSLOpenSSL, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack;

type
  TForm1 = class(TForm)
    edtHost: TEdit;
    edtUserName: TEdit;
    edtPassword: TEdit;
    edtFromText: TEdit;
    edtToText: TEdit;
    btnSend: TButton;
    mmoStatus: TMemo;
    mmoBody: TMemo;
    edtSubject: TEdit;
    edtPathFile: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    idsmtp: TIdSMTP;
    idmsg: TIdMessage;
    idslhndlrscktpnsl: TIdSSLIOHandlerSocketOpenSSL;
    procedure btnSendClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnSendClick(Sender: TObject);
begin
  mmoStatus.Clear;
  //установки SMTP
  idsmtp.Host := edtHost.Text;
  idsmtp.Username := edtUserName.Text;
  idsmtp.Password := edtPassword.Text;
  idsmtp.Port := 587;
  idsmtp.AuthType := satDefault;
  Idsmtp.ConnectTimeout:= 10000;
  Idsmtp.IOHandler  := idslhndlrscktpnsl;
  idsmtp.UseTLS := utUseExplicitTLS;

  idslhndlrscktpnsl.Destination := Idsmtp.Host+':'+IntToStr(Idsmtp.Port);
  idslhndlrscktpnsl.Host := Idsmtp.Host;
  idslhndlrscktpnsl.Port := Idsmtp.Port;
  idslhndlrscktpnsl.DefaultPort := 0;
  idslhndlrscktpnsl.SSLOptions.Method := sslvSSLv23;
  idslhndlrscktpnsl.SSLOptions.Mode := sslmUnassigned;

  //установки сообщения
  idmsg.CharSet:='koi8-r'; // для корректности русских букв
  idmsg.From.Address := edtFromText.Text;
  idmsg.Recipients.EMailAddresses := edtToText.Text;

  idmsg.Subject := edtSubject.Text;
  idmsg.Body.Text := mmoBody.Text;

  if FileExists(edtPathFile.Text) then
    TIdAttachmentFile.Create(idmsg.MessageParts, edtPathFile.Text);

  //отправка письма
  try
    try
      idsmtp.Connect;
      idsmtp.Send(idmsg);
    except on E:Exception do
      mmoStatus.Lines.Insert(0, 'ERROR: ' + E.Message);
    end;
  finally
    if idsmtp.Connected then idsmtp.Disconnect;
  end;

end;

end.
