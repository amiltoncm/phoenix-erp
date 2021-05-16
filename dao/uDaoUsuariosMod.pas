unit uDaoUsuariosMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure InsertUsuariosMod(vfCodUser: integer);
procedure FiltrarUsuariosMod(vfCampoFil: String; vfOperador: String; vfParametro: String);
function FiltLoginUsuariosMod(vfUsuario: String): boolean;

const
ctCampos = 'u.usu_codigo, u.usm_erp, u.usm_comandas, usm_delivery';
ctTabelas = 'usuariosmod u';

implementation

uses dataCadastros, uConstants;

procedure InsertUsuariosMod(vfCodUser: integer);
begin
  dmCadastros.qyUsuariosMod.Insert;
  dmCadastros.qyUsuariosModusu_codigo.Value := vfCodUser;
  try
    dmCadastros.qyUsuariosMod.Post;
  except
    dmCadastros.qyUsuariosMod.Refresh;
  end;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarUsuariosMod(vfCampoFil: String; vfOperador: String; vfParametro: String);
begin
  dmCadastros.qyUsuariosMod.Close;
  dmCadastros.qyUsuariosMod.SQL.Clear;
  dmCadastros.qyUsuariosMod.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  dmCadastros.qyUsuariosMod.SQL.Add( ' where ' + vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qyUsuariosMod.SQL.Add(QuotedStr(vfParametro));
  dmCadastros.qyUsuariosMod.Open;
  if dmCadastros.qyUsuariosModusu_codigo.IsNull then
    InsertUsuariosMod(StrToInt(vfParametro));
end;

{--- Verifica Login por módulo ------------------------------------------------}

function FiltLoginUsuariosMod(vfUsuario: String): boolean;
Var
vResult: Boolean;
begin
  vResult := false;
  dmCadastros.qyUsuariosMod.Close;
  dmCadastros.qyUsuariosMod.SQL.Clear;
  dmCadastros.qyUsuariosMod.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  dmCadastros.qyUsuariosMod.SQL.Add('where u.usu_codigo = ' + vfUsuario);
  dmCadastros.qyUsuariosMod.SQL.Add('and ' + ctModulo + ' =  1');
  dmCadastros.qyUsuariosMod.Open;
  if not(dmCadastros.qyUsuariosModusu_codigo.IsNull) then
    vResult := true;
  Result := vResult;
end;

end.
