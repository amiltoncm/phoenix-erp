unit uDaoComandas;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure InsComandas;
procedure EdtComandas;
procedure PostComandas;
procedure DelComandas;
procedure ListarComandas(vfOrdem: String);
procedure FiltrarComandas(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);

const
ctCampos = 'cma_codigo, cma_descricao, cma_ativa';
ctTabelas = 'comandas';

implementation

uses dataGestao;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsComandas;
begin
  if dmGestao.qyComandas.Active = false then
    dmGestao.qyComandas.Active := True;
  dmGestao.qyComandas.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtComandas;
begin
  dmGestao.qyComandas.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostComandas;
begin
  try
    //if dmGestao.qyComandas.State in [dsInsert] then
      //dmGestao.qyComandascma_codigo.Value := GetCodigo('cma_codigo', 'Comandas');
    dmGestao.qyComandas.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmGestao.qyComandas.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelComandas;
begin
  try
    dmGestao.qyComandas.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                  E.Message,mtError,[mbOk],0);
      dmGestao.qyComandas.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarComandas(vfOrdem: String);
begin
  dmGestao.qyComandas.Close;
  dmGestao.qyComandas.SQL.Clear;
  dmGestao.qyComandas.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  if vfOrdem <> '0' then
    dmGestao.qyComandas.SQL.Add(' order by ' + vfOrdem);
  dmGestao.qyComandas.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarComandas(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);
begin
  dmGestao.qyComandas.Close;
  dmGestao.qyComandas.SQL.Clear;
  dmGestao.qyComandas.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas + ' where ');
  dmGestao.qyComandas.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmGestao.qyComandas.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmGestao.qyComandas.SQL.Add(' order by ' + vfOrdem);
  dmGestao.qyComandas.Open;
end;

end.
