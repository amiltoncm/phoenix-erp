unit uDaoProdutosFor;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassProdutosFor;

procedure SetValuesProdutosFor(vfProdutosFor: TProdutosFor);
procedure InsProdutosFor;
procedure EdtProdutosFor;
procedure PostProdutosFor;
procedure DelProdutosFor;
procedure ListarProdutosFor(vfOrdem: String);
procedure FiltrarProdutosFor(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
procedure FiltrarProdutosForX(vfCodProduto: String; vfCodFornecedor: String);
function VerifVinculo(vfCodProd: String; vfCodForn: String): Boolean;
function GetCodProdutoFor: Integer;
function GetMultiplyEnt: Real;

const
ctCampos = 'P.PRO_CODIGO, E.PRO_DESCRICAO, P.PES_CODIGO, F.PES_NOME, P.PRF_REFERENCIA, ' +
           'P.PRO_CODBARRAS, P.PRF_UNIDADECP, P.PRF_UNIDADEVD';
ctTabelas = 'PRODUTOSFOR P, PESSOAS F, PRODUTOS E';

implementation

uses dataEstoque;

{--- Seta algum valor na tabela -----------------------------------------------}

procedure SetValuesProdutosFor(vfProdutosFor: TProdutosFor);
begin
  dmEstoque.qyProdutosForPRO_CODIGO.Value := vfProdutosFor.Codproduto;
  dmEstoque.qyProdutosForPRO_DESCRICAO.Value := vfProdutosFor.Produto;
  dmEstoque.qyProdutosForPES_CODIGO.Value := vfProdutosFor.Codfornecedor;
  dmEstoque.qyProdutosForPES_NOME.Value := vfProdutosFor.Fornecedor;
  dmEstoque.qyProdutosForPRF_REFERENCIA.Value := vfProdutosFor.Referencia;
  dmEstoque.qyProdutosForPRO_CODBARRAS.Value := vfProdutosFor.Codbarras;
  dmEstoque.qyProdutosForPRF_UNIDADECP.Value := vfProdutosFor.UniCp;
  dmEstoque.qyProdutosForPRF_UNIDADEVD.Value := vfProdutosFor.UniVd;
end;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsProdutosFor;
begin
  if dmEstoque.qyProdutosFor.Active = false then
    dmEstoque.qyProdutosFor.Active := True;
  dmEstoque.qyProdutosFor.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtProdutosFor;
begin
  dmEstoque.qyProdutosFor.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostProdutosFor;
begin
  try
    dmEstoque.qyProdutosFor.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmEstoque.qyProdutosFor.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelProdutosFor;
begin
  try
    dmEstoque.qyProdutosFor.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                 E.Message,mtError,[mbOk],0);
      dmEstoque.qyProdutosFor.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarProdutosFor(vfOrdem: String);
begin
  dmEstoque.qyProdutosFor.Close;
  dmEstoque.qyProdutosFor.SQL.Clear;
  dmEstoque.qyProdutosFor.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmEstoque.qyProdutosFor.SQL.Add(' WHERE P.PES_CODIGO = F.PES_CODIGO AND P.PRO_CODIGO = E.PRO_CODIGO ');
  if vfOrdem <> '0' then
    dmEstoque.qyProdutosFor.SQL.Add(' ORDER BY ' + vfOrdem);
  dmEstoque.qyProdutosFor.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarProdutosFor(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmEstoque.qyProdutosFor.Close;
  dmEstoque.qyProdutosFor.SQL.Clear;
  dmEstoque.qyProdutosFor.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmEstoque.qyProdutosFor.SQL.Add(' WHERE P.PES_CODIGO = F.PES_CODIGO AND P.PRO_CODIGO = E.PRO_CODIGO AND ');
  dmEstoque.qyProdutosFor.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmEstoque.qyProdutosFor.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmEstoque.qyProdutosFor.SQL.Add(' ORDER BY ' + vfOrdem);
  dmEstoque.qyProdutosFor.Open;
end;

procedure FiltrarProdutosForX(vfCodProduto: String; vfCodFornecedor: String);
begin
  dmEstoque.qyProdutosFor.Close;
  dmEstoque.qyProdutosFor.SQL.Clear;
  dmEstoque.qyProdutosFor.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmEstoque.qyProdutosFor.SQL.Add('WHERE P.PES_CODIGO = F.PES_CODIGO AND P.PRO_CODIGO = E.PRO_CODIGO ');
  dmEstoque.qyProdutosFor.SQL.Add('AND P.PRF_REFERENCIA = ' + QuotedStr(vfCodProduto));
  dmEstoque.qyProdutosFor.SQL.Add('AND P.PES_CODIGO = ' + vfCodFornecedor);
  dmEstoque.qyProdutosFor.Open;
end;

function VerifVinculo(vfCodProd: String; vfCodForn: String): Boolean;
begin
  dmEstoque.QTemp.Close;
  dmEstoque.QTemp.SQL.Clear;
  dmEstoque.QTemp.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmEstoque.QTemp.SQL.Add('WHERE P.PES_CODIGO = F.PES_CODIGO AND P.PRO_CODIGO = E.PRO_CODIGO ');
  dmEstoque.QTemp.SQL.Add('AND P.PRF_REFERENCIA = ' + QuotedStr(vfCodProd));
  dmEstoque.QTemp.SQL.Add('AND F.PES_CODIGO = ' + vfCodForn);
  dmEstoque.QTemp.Open;
  if dmEstoque.QTemp.Fields[0].IsNull then
    Result := False
  else
    Result := True;
end;

function GetCodProdutoFor: Integer;
begin
  Result := dmEstoque.qyProdutosForPRO_CODIGO.Value;
end;

function GetMultiplyEnt: Real;
Var
vMult, vUniCp, vUniVd: Real;
begin
  vUniCp := dmEstoque.qyProdutosForPRF_UNIDADECP.Value;
  vUniVd := dmEstoque.qyProdutosForPRF_UNIDADEVD.Value;
  vMult := vUniCp / vUniVd;
  Result := vMult;
end;

end.
