unit uDaoFuncionarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure InsFuncionarios;
procedure EdtFuncionarios;
procedure PostFuncionarios;
procedure ListarFuncionarios(vfOrdem: String);
procedure FiltrarFuncionarios(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
procedure FiltrarFuncionariosCfg(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);

const
ctCampos = 'f.fun_codigo, f.fun_nome, f.fun_telefone, f.fnc_codigo, n.fnc_descricao, f.fun_ativo';
ctTabelas = 'funcionarios f, funcoes n';

implementation

uses dataCadastros;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsFuncionarios;
begin
  if dmCadastros.qyFuncionarios.Active = false then
    dmCadastros.qyFuncionarios.Active := True;
  dmCadastros.qyFuncionarios.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtFuncionarios;
begin
  dmCadastros.qyFuncionarios.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostFuncionarios;
begin
  try
    dmCadastros.qyFuncionarios.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmCadastros.qyFuncionarios.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarFuncionarios(vfOrdem: String);
begin
  dmCadastros.qyFuncionarios.Close;
  dmCadastros.qyFuncionarios.SQL.Clear;
  dmCadastros.qyFuncionarios.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  dmCadastros.qyFuncionarios.SQL.Add(' where f.fnc_codigo = n.fnc_codigo ');
  dmCadastros.qyFuncionarios.SQL.Add('and f.fun_codigo > 0 ');
  if vfOrdem <> '0' then
    dmCadastros.qyFuncionarios.SQL.Add(' order by ' + vfOrdem);
  dmCadastros.qyFuncionarios.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarFuncionarios(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmCadastros.qyFuncionarios.Close;
  dmCadastros.qyFuncionarios.SQL.Clear;
  dmCadastros.qyFuncionarios.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmCadastros.qyFuncionarios.SQL.Add(' where f.fnc_codigo = n.fnc_codigo ');
  dmCadastros.qyFuncionarios.SQL.Add('and f.fun_codigo > 0 and ');
  dmCadastros.qyFuncionarios.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qyFuncionarios.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmCadastros.qyFuncionarios.SQL.Add(' order by ' + vfOrdem);
  dmCadastros.qyFuncionarios.Open;
end;

procedure FiltrarFuncionariosCfg(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmCadastros.qyFuncionarios.Close;
  dmCadastros.qyFuncionarios.SQL.Clear;
  dmCadastros.qyFuncionarios.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmCadastros.qyFuncionarios.SQL.Add(' where f.fnc_codigo = n.fnc_codigo and ');
  dmCadastros.qyFuncionarios.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qyFuncionarios.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmCadastros.qyFuncionarios.SQL.Add(' order by ' + vfOrdem);
  dmCadastros.qyFuncionarios.Open;
end;

end.
