unit uDaoMarcas;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure InsMarcas;
procedure EdtMarcas;
procedure PostMarcas;
procedure ListarMarcas(vfOrdem: String);
procedure FiltrarMarcas(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);

const
ctCampos = 'MAR_CODIGO, MAR_DESCRICAO';
ctTabelas = 'MARCAS';

implementation

uses dataCadastros;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsMarcas;
begin
  if dmCadastros.qyMarcas.Active = false then
    dmCadastros.qyMarcas.Active := True;
  dmCadastros.qyMarcas.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtMarcas;
begin
  dmCadastros.qyMarcas.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostMarcas;
begin
  try
    //if dmCadastros.qyMarcas.State in [dsInsert] then
      //dmCadastros.qyMarcasMAR_CODIGO.Value := GetCodigo('MAR_CODIGO', 'Marcas');
    dmCadastros.qyMarcas.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmCadastros.qyMarcas.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarMarcas(vfOrdem: String);
begin
  dmCadastros.qyMarcas.Close;
  dmCadastros.qyMarcas.SQL.Clear;
  dmCadastros.qyMarcas.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyMarcas.SQL.Add('WHERE MAR_CODIGO > 0');
  if vfOrdem <> '0' then
    dmCadastros.qyMarcas.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyMarcas.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarMarcas(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmCadastros.qyMarcas.Close;
  dmCadastros.qyMarcas.SQL.Clear;
  dmCadastros.qyMarcas.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmCadastros.qyMarcas.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qyMarcas.SQL.Add(QuotedStr(vfParametro));
  dmCadastros.qyMarcas.SQL.Add('AND MAR_CODIGO > 0');
  if vfOrdem <> '0' then
    dmCadastros.qyMarcas.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyMarcas.Open;
end;

end.
