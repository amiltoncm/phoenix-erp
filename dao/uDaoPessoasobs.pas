unit uDaoPessoasobs;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure InsPessoasobs;
procedure EdtPessoasobs;
procedure PostPessoasobs;
procedure ListarPessoasobs(vfOrdem: String);
procedure FiltrarPessoasobs(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
procedure SetPesObs(vfCodPessoa: String);

const
ctCampos = 'PES_CODIGO, PES_OBS';
ctTabelas = 'PESSOASOBS';

implementation

uses dataPessoas;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsPessoasobs;
begin
  if dmPessoas.qyPessoasobs.Active = false then
    dmPessoas.qyPessoasobs.Active := True;
  dmPessoas.qyPessoasobs.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtPessoasobs;
begin
  dmPessoas.qyPessoasobs.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostPessoasobs;
begin
  try
    dmPessoas.qyPessoasobs.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmPessoas.qyPessoasobs.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarPessoasobs(vfOrdem: String);
begin
  dmPessoas.qyPessoasobs.Close;
  dmPessoas.qyPessoasobs.SQL.Clear;
  dmPessoas.qyPessoasobs.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  if vfOrdem <> '0' then
    dmPessoas.qyPessoasobs.SQL.Add(' ORDER BY ' + vfOrdem);
  dmPessoas.qyPessoasobs.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarPessoasobs(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmPessoas.qyPessoasobs.Close;
  dmPessoas.qyPessoasobs.SQL.Clear;
  dmPessoas.qyPessoasobs.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmPessoas.qyPessoasobs.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmPessoas.qyPessoasobs.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmPessoas.qyPessoasobs.SQL.Add(' ORDER BY ' + vfOrdem);
  dmPessoas.qyPessoasobs.Open;
end;

procedure SetPesObs(vfCodPessoa: String);
begin
  if dmPessoas.qyPessoasObs.State in [dsInsert] then
    dmPessoas.qyPessoasObsPES_CODIGO.Text := vfCodPessoa;
end;

end.
