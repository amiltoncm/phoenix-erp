unit uDaoSubGrupos;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure InsSubGrupos;
procedure EdtSubGrupos;
procedure PostSubGrupos;
procedure DelSubGrupos;
procedure ListarSubGrupos(vfOrdem: String);
procedure FiltrarSubGrupos(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
function GetCodSubGrupo(vfCodGrupo: Integer): String;

const
ctCampos = 'SGR_CODIGO, SGR_DESCRICAO, GRP_CODIGO, SGR_MKPATAC, SGR_MKPVAR';
ctTabelas = 'SUBGRUPOS';

implementation

uses dataCadastros;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsSubGrupos;
begin
  if dmCadastros.qySubGrupos.Active = false then
    dmCadastros.qySubGrupos.Active := True;
  dmCadastros.qySubGrupos.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtSubGrupos;
begin
  dmCadastros.qySubGrupos.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostSubGrupos;
begin
  try
    dmCadastros.qySubGrupos.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmCadastros.qySubGrupos.Refresh;
    end;
  end;
end;

{--- Exclui item databela -----------------------------------------------------}

procedure DelSubGrupos;
begin
  try
    dmCadastros.qySubGrupos.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmCadastros.qySubGrupos.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarSubGrupos(vfOrdem: String);
begin
  dmCadastros.qySubGrupos.Close;
  dmCadastros.qySubGrupos.SQL.Clear;
  dmCadastros.qySubGrupos.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qySubGrupos.SQL.Add('WHERE SGR_CODIGO > 0');
  if vfOrdem <> '0' then
    dmCadastros.qySubGrupos.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qySubGrupos.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarSubGrupos(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmCadastros.qySubGrupos.Close;
  dmCadastros.qySubGrupos.SQL.Clear;
  dmCadastros.qySubGrupos.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmCadastros.qySubGrupos.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qySubGrupos.SQL.Add(QuotedStr(vfParametro));
  dmCadastros.qySubGrupos.SQL.Add('AND SGR_CODIGO > 0');
  if vfOrdem <> '0' then
    dmCadastros.qySubGrupos.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qySubGrupos.Open;
end;

function GetCodSubGrupo(vfCodGrupo: Integer): String;
Var
vResultStr: String;
vCont: Integer;
begin
  dmCadastros.QTemp.Close;
  dmCadastros.QTemp.SQL.Clear;
  dmCadastros.QTemp.SQL.Add('SELECT COUNT(GRP_CODIGO) FROM SUBGRUPOS');
  dmCadastros.QTemp.SQL.Add('WHERE GRP_CODIGO = ' + IntToStr(vfCodGrupo));
  dmCadastros.QTemp.Open;
  if dmCadastros.QTemp.Fields[0].IsNull then
    vCont := 1
  else
    vCont := dmCadastros.QTemp.Fields[0].Value + 1;
  vResultStr := IntToStr(vfCodGrupo) + FormatFloat('00', vCont);
  Result := vResultStr;
end;

end.
