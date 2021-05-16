unit uDaoUsuarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure ListarUsuarios(vfOrdem: String);
procedure FiltrarUsuarios(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
function FiltLoginUsuarios(vfUsuario: String; vfSenha: String): boolean;

const
ctCampos = 'u.usu_codigo, u.usu_nome, u.usu_senha, u.usu_ativo, u.ace_codigo, ' +
           'a.ace_descricao, u.usu_userapp, u.usu_senhaapp';
ctTabelas = 'usuarios u, acesso a';

implementation

uses dataCadastros, uDaoUsuariosMod;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarUsuarios(vfOrdem: String);
begin
  dmCadastros.qyUsuarios.Close;
  dmCadastros.qyUsuarios.SQL.Clear;
  dmCadastros.qyUsuarios.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  dmCadastros.qyUsuarios.SQL.Add(' where u.ace_codigo = a.ace_codigo and u.usu_codigo > 0 ');
  if vfOrdem <> '0' then
    dmCadastros.qyUsuarios.SQL.Add(' order by ' + vfOrdem);
  dmCadastros.qyUsuarios.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarUsuarios(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmCadastros.qyUsuarios.Close;
  dmCadastros.qyUsuarios.SQL.Clear;
  dmCadastros.qyUsuarios.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  dmCadastros.qyUsuarios.SQL.Add(' where u.ace_codigo = a.ace_codigo and u.usu_codigo > 0 and ');
  dmCadastros.qyUsuarios.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qyUsuarios.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmCadastros.qyUsuarios.SQL.Add(' order by ' + vfOrdem);
  dmCadastros.qyUsuarios.Open;
end;

{--- Verifica Login -----------------------------------------------------------}

function FiltLoginUsuarios(vfUsuario: String; vfSenha: String): boolean;
Var
vResult: Boolean;
begin
  dmCadastros.qyUsuarios.Close;
  dmCadastros.qyUsuarios.SQL.Clear;
  dmCadastros.qyUsuarios.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmCadastros.qyUsuarios.SQL.Add(' where u.usu_nome = ');
  dmCadastros.qyUsuarios.SQL.Add(QuotedStr(vfUsuario));
  dmCadastros.qyUsuarios.SQL.Add(' and u.usu_senha = ');
  dmCadastros.qyUsuarios.SQL.Add(QuotedStr(vfSenha));
  dmCadastros.qyUsuarios.SQL.Add(' and u.usu_ativo = ');
  dmCadastros.qyUsuarios.SQL.Add(QuotedStr('S'));
  dmCadastros.qyUsuarios.Open;
  if dmCadastros.qyUsuariosUSU_CODIGO.IsNull then
    vResult := false
  else
    vResult := true;
  //Adicionado controle de módulos
  if ((vResult = true) and (vfUsuario <> 'MASTER')) then
  begin
    vResult := FiltLoginUsuariosMod(IntToStr(dmCadastros.qyUsuariosusu_codigo.Value));
    if vResult = false then
      MessageDlg('Módulo indisponível para o usuário!', mtWarning, [mbOk], 0);
  end;
  Result := vResult;
end;

end.
