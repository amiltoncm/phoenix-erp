unit uDaoProdutosSim;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassProdutosSim;

procedure SetValuesProdutosSim(vfProdutosSim: TProdutosSim);
procedure InsProdutosSim;
procedure EdtProdutosSim;
procedure PostProdutosSim;
procedure DelProdutosSim;
procedure ListarProdutosSim(vfOrdem: String);
procedure FiltrarProdutosSim(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
function TestaProdSim(vfCodProd: String; vfCodSim: String): boolean;

const
ctCampos = 's.pro_codsim, s.pro_codigo, p.pro_descricao, p.uni_codigo, p.pro_vlratac, p.pro_vlrvar ';
ctTabelas = 'produtossim s, produtos p';

implementation

uses dataEstoque;

{--- Seta algum valor na tabela -----------------------------------------------}

procedure SetValuesProdutosSim(vfProdutosSim: TProdutosSim);
begin
  dmEstoque.qyProdutosSimpro_codigo.Value := vfProdutossim.Codigo;
  dmEstoque.qyProdutosSimpro_codsim.Value := vfProdutossim.Codsim;
end;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsProdutosSim;
begin
  if dmEstoque.qyProdutosSim.Active = false then
    dmEstoque.qyProdutosSim.Active := True;
  dmEstoque.qyProdutosSim.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtProdutosSim;
begin
  dmEstoque.qyProdutosSim.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostProdutosSim;
begin
  try
    dmEstoque.qyProdutosSim.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmEstoque.qyProdutosSim.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelProdutosSim;
begin
  try
    dmEstoque.qyProdutosSim.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                 E.Message,mtError,[mbOk],0);
      dmEstoque.qyProdutosSim.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarProdutosSim(vfOrdem: String);
begin
  dmEstoque.qyProdutosSim.Close;
  dmEstoque.qyProdutosSim.SQL.Clear;
  dmEstoque.qyProdutosSim.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  dmEstoque.qyProdutosSim.SQL.Add(' where s.pro_codsim = p.pro_codigo ');
  if vfOrdem <> '0' then
    dmEstoque.qyProdutosSim.SQL.Add(' order by ' + vfOrdem);
  dmEstoque.qyProdutosSim.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarProdutosSim(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmEstoque.qyProdutosSim.Close;
  dmEstoque.qyProdutosSim.SQL.Clear;
  dmEstoque.qyProdutosSim.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmEstoque.qyProdutosSim.SQL.Add(' where s.pro_codsim = p.pro_codigo and ');
  dmEstoque.qyProdutosSim.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmEstoque.qyProdutosSim.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmEstoque.qyProdutosSim.SQL.Add(' order by ' + vfOrdem);
  dmEstoque.qyProdutosSim.Open;
end;

function TestaProdSim(vfCodProd: String; vfCodSim: String): boolean;
begin
  dmEstoque.QTemp.Close;
  dmEstoque.QTemp.SQL.Clear;
  dmEstoque.QTemp.SQL.Add('select pro_codigo from produtossim ');
  dmEstoque.QTemp.SQL.Add('where pro_codigo = ' + vfCodProd);
  dmEstoque.QTemp.SQL.Add(' and pro_codsim = ' + vfCodSim);
  dmEstoque.QTemp.Open;
  if dmEstoque.QTemp.Fields[0].IsNull then
    Result := false
  else
    Result := true;
end;

end.

