unit uDaoProdComanda;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure InsProdComanda;
procedure EdtProdComanda;
procedure PostProdComanda;
procedure DelProdComanda;
procedure ListarProdComanda(vfOrdem: String);
procedure FiltrarProdComanda(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);

const
ctCampos = 'pro_codigo, prd_copa, prd_cozinha';
ctTabelas = 'prodcomanda';

implementation

uses dataGestao;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsProdComanda;
begin
  if dmGestao.qyProdComanda.Active = false then
    dmGestao.qyProdComanda.Active := True;
  dmGestao.qyProdComanda.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtProdComanda;
begin
  dmGestao.qyProdComanda.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostProdComanda;
begin
  try
    //if dmGestao.qyProdComanda.State in [dsInsert] then
      //dmGestao.qyProdComandapro_codigo.Value := GetCodigo('pro_codigo', 'ProdComanda');
    dmGestao.qyProdComanda.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmGestao.qyProdComanda.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelProdComanda;
begin
  try
    dmGestao.qyProdComanda.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                  E.Message,mtError,[mbOk],0);
      dmGestao.qyProdComanda.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarProdComanda(vfOrdem: String);
begin
  dmGestao.qyProdComanda.Close;
  dmGestao.qyProdComanda.SQL.Clear;
  dmGestao.qyProdComanda.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  if vfOrdem <> '0' then
    dmGestao.qyProdComanda.SQL.Add(' order by ' + vfOrdem);
  dmGestao.qyProdComanda.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarProdComanda(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);
begin
  dmGestao.qyProdComanda.Close;
  dmGestao.qyProdComanda.SQL.Clear;
  dmGestao.qyProdComanda.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas + ' where ');
  dmGestao.qyProdComanda.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmGestao.qyProdComanda.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmGestao.qyProdComanda.SQL.Add(' order by ' + vfOrdem);
  dmGestao.qyProdComanda.Open;
end;

end.
