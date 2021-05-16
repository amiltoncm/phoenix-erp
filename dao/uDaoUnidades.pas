unit uDaoUnidades;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure InsUnidades;
procedure EdtUnidades;
procedure PostUnidades;
procedure ListarUnidades(vfOrdem: String);
procedure FiltrarUnidades(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
function GetCodUnidade: String;
function GetUnidade: String;

const
ctCampos = 'UNI_CODIGO, UNI_DESCRICAO';
ctTabelas = 'UNIDADES';

implementation

uses dataCadastros;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsUnidades;
begin
  if dmCadastros.qyUnidades.Active = false then
    dmCadastros.qyUnidades.Active := True;
  dmCadastros.qyUnidades.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtUnidades;
begin
  dmCadastros.qyUnidades.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostUnidades;
begin
  try
    dmCadastros.qyUnidades.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmCadastros.qyUnidades.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarUnidades(vfOrdem: String);
begin
  dmCadastros.qyUnidades.Close;
  dmCadastros.qyUnidades.SQL.Clear;
  dmCadastros.qyUnidades.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  if vfOrdem <> '0' then
    dmCadastros.qyUnidades.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyUnidades.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarUnidades(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);
begin
  dmCadastros.qyUnidades.Close;
  dmCadastros.qyUnidades.SQL.Clear;
  dmCadastros.qyUnidades.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmCadastros.qyUnidades.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qyUnidades.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmCadastros.qyUnidades.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyUnidades.Open;
end;

function GetCodUnidade: String;
begin
  Result := dmCadastros.qyUnidadesUNI_CODIGO.Text;
end;

function GetUnidade: String;
begin
  Result := dmCadastros.qyUnidadesUNI_DESCRICAO.Text;
end;

end.
