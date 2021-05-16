unit uDaoGrupos;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

//procedure SetValuesGrupos(vfGrupos: TGrupos);
procedure InsGrupos;
procedure EdtGrupos;
procedure PostGrupos;
procedure ListarGrupos(vfOrdem: String);
procedure FiltrarGrupos(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);

const
ctCampos = 'GRP_CODIGO, GRP_DESCRICAO';
ctTabelas = 'GRUPOS';

implementation

uses dataCadastros;

{--- Seta algum valor na tabela -----------------------------------------------}

{
procedure SetValuesGrupos(vfGrupos: TGrupos);
begin
  //@VINCULAR
end;
}

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsGrupos;
begin
  if dmCadastros.qyGrupos.Active = false then
    dmCadastros.qyGrupos.Active := True;
  dmCadastros.qyGrupos.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtGrupos;
begin
  dmCadastros.qyGrupos.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostGrupos;
begin
  try
    //if dmCadastros.qyGrupos.State in [dsInsert] then
      //dmCadastros.qyGruposGRP_CODIGO.Value := GetCodigo('GRP_CODIGO', 'Grupos');
    dmCadastros.qyGrupos.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmCadastros.qyGrupos.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarGrupos(vfOrdem: String);
begin
  dmCadastros.qyGrupos.Close;
  dmCadastros.qyGrupos.SQL.Clear;
  dmCadastros.qyGrupos.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyGrupos.SQL.Add('WHERE GRP_CODIGO > 0');
  if vfOrdem <> '0' then
    dmCadastros.qyGrupos.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyGrupos.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarGrupos(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmCadastros.qyGrupos.Close;
  dmCadastros.qyGrupos.SQL.Clear;
  dmCadastros.qyGrupos.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmCadastros.qyGrupos.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qyGrupos.SQL.Add(QuotedStr(vfParametro));
  dmCadastros.qyGrupos.SQL.Add('AND GRP_CODIGO > 0');
  if vfOrdem <> '0' then
    dmCadastros.qyGrupos.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyGrupos.Open;
end;

end.
