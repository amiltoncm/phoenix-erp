unit uDaoProdutosObs;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

//procedure SetValuesProdutosObs(vfProdutosObs: TProdutosObs);
procedure InsProdutosObs;
procedure EdtProdutosObs;
procedure PostProdutosObs;
procedure DelProdutosObs;
procedure ListarProdutosObs(vfOrdem: String);
procedure FiltrarProdutosObs(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);

const
ctCampos = 'pro_codigo, pro_obs';
ctTabelas = 'produtosobs';

implementation

uses dataEstoque;

{--- Seta algum valor na tabela -----------------------------------------------}

{
procedure SetValuesProdutosObs(vfProdutosObs: TProdutosObs);
begin
  //@VINCULAR
end;
}

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsProdutosObs;
begin
  if dmEstoque.qyProdutosObs.Active = false then
    dmEstoque.qyProdutosObs.Active := True;
  dmEstoque.qyProdutosObs.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtProdutosObs;
begin
  dmEstoque.qyProdutosObs.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostProdutosObs;
begin
  try
    //if dmEstoque.qyProdutosObs.State in [dsInsert] then
      //dmEstoque.qyProdutosObspro_codigo.Value := GetCodigo('pro_codigo', 'ProdutosObs');
    dmEstoque.qyProdutosObs.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmEstoque.qyProdutosObs.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelProdutosObs;
begin
  try
    dmEstoque.qyProdutosObs.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                  E.Message,mtError,[mbOk],0);
      dmEstoque.qyProdutosObs.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarProdutosObs(vfOrdem: String);
begin
  dmEstoque.qyProdutosObs.Close;
  dmEstoque.qyProdutosObs.SQL.Clear;
  dmEstoque.qyProdutosObs.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  if vfOrdem <> '0' then
    dmEstoque.qyProdutosObs.SQL.Add(' order by ' + vfOrdem);
  dmEstoque.qyProdutosObs.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarProdutosObs(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);
begin
  dmEstoque.qyProdutosObs.Close;
  dmEstoque.qyProdutosObs.SQL.Clear;
  dmEstoque.qyProdutosObs.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas + ' where ');
  dmEstoque.qyProdutosObs.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmEstoque.qyProdutosObs.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmEstoque.qyProdutosObs.SQL.Add(' order by ' + vfOrdem);
  dmEstoque.qyProdutosObs.Open;
end;

end.
