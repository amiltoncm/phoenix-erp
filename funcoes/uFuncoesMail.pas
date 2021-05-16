unit uFuncoesMail;

interface

uses Windows, Classes, Forms, Mapi, SysUtils, Dialogs, IdSMTP,
  IdMessage, IdBaseComponent, IdComponent, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdAttachmentFile,
  Inifiles, uClassSendMail, IdText;

  procedure SendMailIndyClass(vfSendMail: TSendMail);

implementation

uses uVarGlobal, uFuncoesSeguranca;

procedure SendMailIndyClass(vfSendMail: TSendMail);
var
// objetos necessários para o funcionamento
vAuthSSL: TIdSSLIOHandlerSocketOpenSSL;
vIdSMTP: TIdSMTP;
vIdMessage: TIdMessage;
vIdAttachment: TIdAttachmentFile;
vIDText: TIdText;
begin
  try
    vIdMessage := TIdMessage.Create(nil);
    // Configuração do SMTP
    vIdSMTP := TIdSMTP.Create;
    vIdSMTP.Host := vfSendMail.Host;
    vIdSMTP.Username := vfSendMail.Username;
    vIdSMTP.Password := vfSendMail.Password;
    vIdSMTP.Port := vfSendMail.Door;
    case vfSendMail.Authtype of
      0: vIdSMTP.AuthType := satNone;
      1: vIdSMTP.AuthType := satDefault;
      2: vIdSMTP.AuthType := satSASL;
    end;
    // Configuração do SSL
    vAuthSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    vIdSMTP.IOHandler := vAuthSSL;
    case vfSendMail.Sslmethod of
      0: vAuthSSL.SSLOptions.Method := sslvSSLv2;
      1: vAuthSSL.SSLOptions.Method := sslvSSLv23;
      2: vAuthSSL.SSLOptions.Method := sslvSSLv3;
      3: vAuthSSL.SSLOptions.Method := sslvTLSv1;
    end;
    case vfSendMail.Sslmode of
      0: vAuthSSL.SSLOptions.Mode := sslmUnassigned;
      1: vAuthSSL.SSLOptions.Mode := sslmClient;
      2: vAuthSSL.SSLOptions.Mode := sslmServer;
      3: vAuthSSL.SSLOptions.Mode := sslmBoth;
    end;
    case vfSendMail.Usetls of
      0: vIdSMTP.UseTLS := utNoTLSSupport;
      1: vIdSMTP.UseTLS := utUseImplicitTLS;
      2: vIdSMTP.UseTLS := utUseRequireTLS;
      3: vIdSMTP.UseTLS := utUseExplicitTLS;
    end;
    // Tentativa de conexão e autenticação
    try
      vIdSMTP.Connect;
      vIdSMTP.Authenticate;
    except
      on E:Exception do
      begin
        MessageDlg('Erro na conexão e/ou autenticação: ' +
                    E.Message, mtWarning, [mbOK], 0);
        Exit;
      end;
    end;

    // Configuração da mensagem - emitente
    vIdMessage.From.Address := vfSendMail.Adress;
    vIdMessage.From.Name := vfSendMail.Name;
    vIdMessage.ReplyTo.EMailAddresses := vIdMessage.From.Address;
    // Configuração da mensagem - destinatário

    vIdMessage.MessageParts.Clear;

    vIdMessage.Recipients.EMailAddresses := vfSendMail.Sendto;
    vIdMessage.Subject := vfSendMail.Subject;
    //vIdMessage.Body.text := vfSendMail.Message;
    vIDText := TIdText.Create(vIdMessage.MessageParts);
    vIDText.Body.Add(vfSendMail.Message);
    vIDText.ContentType := 'text/html; charset=iso-8859-1';
    // Anexo da mensagem (opcional)
    if FileExists(vfSendMail.Attachment) then
    begin
      vIdAttachment := TIdAttachmentFile.Create(vIdMessage.MessageParts, TFilename(vfSendMail.Attachment));
      vIdAttachment.ContentType := vfSendMail.TipoAnexo;
    end;
    // Envio da mensagem
    try
      vIdSMTP.Send(vIdMessage);
      if vfSendMail.Msg = True then
        MessageDlg('Mensagem enviada com sucesso.', mtInformation, [mbOK], 0);
    except
      On E:Exception do
        MessageDlg('Erro ao enviar a mensagem: ' +
                    E.Message, mtWarning, [mbOK], 0);
    end;
  finally
    // liberação dos objetos da memória
    vIdSMTP.Disconnect;
    FreeAndNil(vIdMessage);
    FreeAndNil(vAuthSSL);
    FreeAndNil(vIdSMTP);
  end;
end;

end.
