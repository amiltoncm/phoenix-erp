unit uDaoProdutosMov;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassProdutosmov;

procedure SetValuesProdutosMov(vfProdutosMov: TProdutosMov);
procedure InsProdutosMov;
procedure EdtProdutosMov;
procedure PostProdutosMov;
procedure DelProdutosMov;
procedure ListarProdutosMov(vfOrdem: String);
procedure FiltrarProdutosMov(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
function VerifLanc(vfCodFor: Integer; vfNota: Integer; vfSerie: Integer; vfModelo: Integer): Boolean;
procedure ConsProdutosMov(vfCodProduto: String);
procedure ConsProdutosMovTp(vfCodProduto: String; vfTp: String);

const
ctCampos = 'prm_codigo, pro_codigo, prm_data, prm_quantidade, pes_codigo, ' +
           'prm_tipo, prm_nota, prm_serie, prm_modelo, prm_valor';

ctTabelas = 'produtosmov';

implementation

uses dataEstoque, uFuncoesDB, dataConsultas;

{--- Seta algum valor na tabela -----------------------------------------------}

procedure SetValuesProdutosMov(vfProdutosMov: TProdutosMov);
begin
  if vfProdutosMov.Codigo = 0 then
    dmEstoque.qyProdutosMovPRM_CODIGO.Value := GetCodigo('prm_codigo', 'produtosmov');
  dmEstoque.qyProdutosMovPRO_CODIGO.Value := vfProdutosMov.Codproduto;
  dmEstoque.qyProdutosMovPRM_DATA.Text := FormatDateTime('dd/MM/yyyy', vfProdutosMov.Data);
  dmEstoque.qyProdutosMovPRM_QUANTIDADE.Value := vfProdutosMov.Quantidade;
  dmEstoque.qyProdutosMovPES_CODIGO.Value := vfProdutosMov.Codpessoa;
  dmEstoque.qyProdutosMovPRM_TIPO.Text := vfProdutosMov.Tipo;
  dmEstoque.qyProdutosMovPRM_NOTA.Value := vfProdutosMov.Nota;
  dmEstoque.qyProdutosMovPRM_SERIE.Value := vfProdutosMov.Serie;
  dmEstoque.qyProdutosMovPRM_MODELO.Value := vfProdutosMov.Modelo;
  dmEstoque.qyProdutosMovprm_valor.Value := vfProdutosMov.Valor;
end;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsProdutosMov;
begin
  if dmEstoque.qyProdutosMov.Active = false then
    dmEstoque.qyProdutosMov.Active := True;
  dmEstoque.qyProdutosMov.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtProdutosMov;
begin
  dmEstoque.qyProdutosMov.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostProdutosMov;
begin
  try
    if dmEstoque.qyProdutosMov.State in [dsInsert] then
      dmEstoque.qyProdutosMovPRM_CODIGO.Value := GetCodigo('prm_codigo', 'produtosmov');
    dmEstoque.qyProdutosMov.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmEstoque.qyProdutosMov.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelProdutosMov;
begin
  try
    dmEstoque.qyProdutosMov.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                  E.Message,mtError,[mbOk],0);
      dmEstoque.qyProdutosMov.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarProdutosMov(vfOrdem: String);
begin
  dmEstoque.qyProdutosMov.Close;
  dmEstoque.qyProdutosMov.SQL.Clear;
  dmEstoque.qyProdutosMov.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  if vfOrdem <> '0' then
    dmEstoque.qyProdutosMov.SQL.Add(' order by ' + vfOrdem);
  dmEstoque.qyProdutosMov.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarProdutosMov(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmEstoque.qyProdutosMov.Close;
  dmEstoque.qyProdutosMov.SQL.Clear;
  dmEstoque.qyProdutosMov.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas + ' where ');
  dmEstoque.qyProdutosMov.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmEstoque.qyProdutosMov.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmEstoque.qyProdutosMov.SQL.Add(' order by ' + vfOrdem);
  dmEstoque.qyProdutosMov.Open;
end;

function VerifLanc(vfCodFor: Integer; vfNota: Integer; vfSerie: Integer; vfModelo: Integer): Boolean;
begin
  dmEstoque.qyProdutosMov.Close;
  dmEstoque.qyProdutosMov.SQL.Clear;
  dmEstoque.qyProdutosMov.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmEstoque.qyProdutosMov.SQL.Add('WHERE PES_CODIGO = ' + IntToStr(vfCodFor));
  dmEstoque.qyProdutosMov.SQL.Add('AND PRM_NOTA = ' + IntToStr(vfNota));
  dmEstoque.qyProdutosMov.SQL.Add('AND PRM_SERIE = ' + IntToStr(vfSerie));
  dmEstoque.qyProdutosMov.SQL.Add('AND PRM_MODELO = ' + IntToStr(vfModelo));
  dmEstoque.qyProdutosMov.Open;
  if dmEstoque.qyProdutosMovPRM_CODIGO.IsNull then
    Result := False
  else
    Result := True;
end;

procedure ConsProdutosMov(vfCodProduto: String);
begin
  dmConsultas.qyConsProdutosMov.Close;
  dmConsultas.qyConsProdutosMov.SQL.Clear;
  dmConsultas.qyConsProdutosMov.SQL.Add('SELECT M.PRM_CODIGO, M.PRO_CODIGO, M.PRM_DATA, M.PES_CODIGO, P.PES_NOME, ');
  dmConsultas.qyConsProdutosMov.SQL.Add('M.PRM_NOTA, M.PRM_MODELO, M.PRM_SERIE, M.PRM_QUANTIDADE, M.PRM_TIPO, M.PRM_VALOR ');
  dmConsultas.qyConsProdutosMov.SQL.Add('FROM PRODUTOSMOV M, PESSOAS P ');
  dmConsultas.qyConsProdutosMov.SQL.Add('WHERE M.PES_CODIGO = P.PES_CODIGO ');
  dmConsultas.qyConsProdutosMov.SQL.Add('AND M.PRO_CODIGO = ' + vfCodProduto);
  dmConsultas.qyConsProdutosMov.SQL.Add('ORDER BY PRM_DATA DESC, PRM_NOTA');
  dmConsultas.qyConsProdutosMov.Open;
end;

procedure ConsProdutosMovTp(vfCodProduto: String; vfTp: String);
begin
  dmConsultas.qyConsProdutosMov.Close;
  dmConsultas.qyConsProdutosMov.SQL.Clear;
  dmConsultas.qyConsProdutosMov.SQL.Add('SELECT M.PRM_CODIGO, M.PRO_CODIGO, M.PRM_DATA, M.PES_CODIGO, P.PES_NOME, ');
  dmConsultas.qyConsProdutosMov.SQL.Add('M.PRM_NOTA, M.PRM_MODELO, M.PRM_SERIE, M.PRM_QUANTIDADE, M.PRM_TIPO, M.PRM_VALOR ');
  dmConsultas.qyConsProdutosMov.SQL.Add('FROM PRODUTOSMOV M, PESSOAS P ');
  dmConsultas.qyConsProdutosMov.SQL.Add('WHERE M.PES_CODIGO = P.PES_CODIGO ');
  dmConsultas.qyConsProdutosMov.SQL.Add('AND M.PRO_CODIGO = ' + vfCodProduto);
  dmConsultas.qyConsProdutosMov.SQL.Add(' AND M.PRM_TIPO = ' + QuotedStr(vfTp));
  dmConsultas.qyConsProdutosMov.SQL.Add('ORDER BY PRM_DATA DESC, PRM_NOTA');
  dmConsultas.qyConsProdutosMov.Open;
end;

end.
