unit uDaoUsuMails;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassCfgmail, uClassUsumails;

procedure SetValuesUsuMails(vfUsuMails: TUsuMails);
procedure InsUsuMails;
procedure EdtUsuMails;
procedure PostUsuMails;
procedure ListarUsuMails(vfOrdem: String);
procedure FiltrarUsuMails(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);
procedure GetCfgMail;
procedure GetMailDefault;

const
ctCampos = 'USU_CODIGO, MAI_HOST, MAI_USERNAME, MAI_PASSWORD, MAI_NAMEFROM, ' +
           'MAI_ADRESSFROM, MAI_PORTA, MAI_AUTHTYPE, MAI_SSLMETHOD, MAI_SSLMODE, MAI_USETLS';
ctTabelas = 'USUMAILS';

implementation

uses dataCadastros, uFuncoesString, uDaoEmpresa, uVarGlobal;

{--- Seta algum valor na tabela -----------------------------------------------}

procedure SetValuesUsuMails(vfUsuMails: TUsuMails);
begin
  dmCadastros.qyUsuMailsUSU_CODIGO.Value := vfUsuMails.Codigo;
  dmCadastros.qyUsuMailsMAI_HOST.Text := vfUsuMails.Host;
  dmCadastros.qyUsuMailsMAI_USERNAME.Text := vfUsuMails.Username;
  dmCadastros.qyUsuMailsMAI_PASSWORD.Text := vfUsuMails.Password;
  dmCadastros.qyUsuMailsMAI_NAMEFROM.Text := vfUsuMails.Namefrom;
  dmCadastros.qyUsuMailsMAI_ADRESSFROM.Text := vfUsuMails.Adressfrom;
  dmCadastros.qyUsuMailsMAI_PORTA.Value := vfUsuMails.Porta;
  dmCadastros.qyUsuMailsMAI_AUTHTYPE.Value := vfUsuMails.Authtype;
  dmCadastros.qyUsuMailsMAI_SSLMETHOD.Value := vfUsuMails.Sslmethod;
  dmCadastros.qyUsuMailsMAI_SSLMODE.Value := vfUsuMails.Sslmode;
  dmCadastros.qyUsuMailsMAI_USETLS.Value := vfUsuMails.Usetls;
end;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsUsuMails;
begin
  if dmCadastros.qyUsuMails.Active = false then
    dmCadastros.qyUsuMails.Active := True;
  dmCadastros.qyUsuMails.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtUsuMails;
begin
  dmCadastros.qyUsuMails.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostUsuMails;
begin
  try
    dmCadastros.qyUsuMails.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmCadastros.qyUsuMails.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarUsuMails(vfOrdem: String);
begin
  dmCadastros.qyUsuMails.Close;
  dmCadastros.qyUsuMails.SQL.Clear;
  dmCadastros.qyUsuMails.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  if vfOrdem <> '0' then
    dmCadastros.qyUsuMails.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyUsuMails.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarUsuMails(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmCadastros.qyUsuMails.Close;
  dmCadastros.qyUsuMails.SQL.Clear;
  dmCadastros.qyUsuMails.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmCadastros.qyUsuMails.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qyUsuMails.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmCadastros.qyUsuMails.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyUsuMails.Open;
end;

procedure GetCfgMail;
begin
  vgCfgMail.Host := dmCadastros.qyUsuMailsMAI_HOST.Text;
  vgCfgMail.Username := dmCadastros.qyUsuMailsMAI_USERNAME.Text;
  vgCfgMail.Password := dmCadastros.qyUsuMailsMAI_PASSWORD.Text;
  vgCfgMail.Namefrom := dmCadastros.qyUsuMailsMAI_NAMEFROM.Text;
  vgCfgMail.Adressfrom := dmCadastros.qyUsuMailsMAI_ADRESSFROM.Text;
  vgCfgMail.Door := dmCadastros.qyUsuMailsMAI_PORTA.Value;
  vgCfgMail.Authtype := dmCadastros.qyUsuMailsMAI_AUTHTYPE.Value;
  vgCfgMail.Sslmethod := dmCadastros.qyUsuMailsMAI_SSLMETHOD.Value;
  vgCfgMail.Sslmode := dmCadastros.qyUsuMailsMAI_SSLMODE.Value;
  vgCfgMail.Usetls := dmCadastros.qyUsuMailsMAI_USETLS.Value;
end;

procedure GetMailDefault;
begin
  dmCadastros.qyEmailPadrao.Active := True;
  vgUsuMail.Codigo := StrToInt(vgCodUsuarioLog);
  vgUsuMail.Host := dmCadastros.qyEmailPadraoMAI_HOST.Text;
  vgUsuMail.Porta := dmCadastros.qyEmailPadraoMAI_PORTA.Value;
  vgUsuMail.Authtype := dmCadastros.qyEmailPadraoMAI_AUTHTYPE.Value;
  vgUsuMail.Sslmethod := dmCadastros.qyEmailPadraoMAI_SSLMETHOD.Value;
  vgUsuMail.Sslmode := dmCadastros.qyEmailPadraoMAI_SSLMODE.Value;
  vgUsuMail.Usetls := dmCadastros.qyEmailPadraoMAI_USETLS.Value;
  SetValuesUsuMails(vgUsuMail);
end;

end.
