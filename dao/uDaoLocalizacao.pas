unit uDaoLocalizacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

//procedure SetValuesLocalizacao(vfLocalizacao: TLocalizacao);
procedure InsLocalizacao;
procedure EdtLocalizacao;
procedure PostLocalizacao;
procedure ListarLocalizacao(vfOrdem: String);
procedure FiltrarLocalizacao(vfCampoFil: String; vfOperador: String; vfParametro: 
		                         String; vfOrdem: String);

const
ctCampos = 'LOC_CODIGO, LOC_DESCRICAO';
ctTabelas = 'LOCALIZACAO';

implementation

uses dataCadastros;

{--- Seta algum valor na tabela -----------------------------------------------}

{
procedure SetValuesLocalizacao(vfLocalizacao: TLocalizacao);
begin
  //@VINCULAR
end;
}

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsLocalizacao;
begin
  if dmCadastros.qyLocalizacao.Active = false then
    dmCadastros.qyLocalizacao.Active := True;
  dmCadastros.qyLocalizacao.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtLocalizacao;
begin
  dmCadastros.qyLocalizacao.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostLocalizacao;
begin
  try
    dmCadastros.qyLocalizacao.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmCadastros.qyLocalizacao.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarLocalizacao(vfOrdem: String);
begin
  dmCadastros.qyLocalizacao.Close;
  dmCadastros.qyLocalizacao.SQL.Clear;
  dmCadastros.qyLocalizacao.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyLocalizacao.SQL.Add('WHERE LOC_CODIGO > 0');
  if vfOrdem <> '0' then
    dmCadastros.qyLocalizacao.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyLocalizacao.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarLocalizacao(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmCadastros.qyLocalizacao.Close;
  dmCadastros.qyLocalizacao.SQL.Clear;
  dmCadastros.qyLocalizacao.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmCadastros.qyLocalizacao.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qyLocalizacao.SQL.Add(QuotedStr(vfParametro));
  dmCadastros.qyLocalizacao.SQL.Add('AND LOC_CODIGO > 0');
  if vfOrdem <> '0' then
    dmCadastros.qyLocalizacao.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyLocalizacao.Open;
end;

end.
