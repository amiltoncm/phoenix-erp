unit uDaoOrcItens;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassPrevItens, uClassOrcItens;

procedure SetValuesOrcItens(vfOrcItens: TOrcItens);
procedure InsOrcItens;
procedure EdtOrcItens;
procedure PostOrcItens;
procedure DelOrcItens;
procedure ListarOrcItens(vfOrdem: String);
procedure FiltrarOrcItens(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
procedure ImportOrcItens(vfNumOrc: Integer; vfPV: Integer);

const
ctCampos = 'O.ORT_CODIGO, O.ORC_NUMERO, O.ORT_QUANTIDADE, O.PRO_CODIGO, ' +
           'P.PRO_DESCRICAO, P.UNI_CODIGO, ORT_VLRCUSTO, O.ORT_VLRBRT, ' +
           'O.ORT_VLRDESC, O.ORT_PERCDESC, O.ORT_VLRLIQ, O.ORT_VLRTOTAL, O.ORT_PERCMG';
ctTabelas = 'ORCITENS O, PRODUTOS P ';

implementation

uses dataOrcamentos, uFuncoesDB, uDaoOrcamentos, uVarGlobal, uDaoProdutos,
  uSenhaDescItem, uSenhaMgOrc, uDaoPrevItens;

{--- Seta algum valor na tabela -----------------------------------------------}

procedure SetValuesOrcItens(vfOrcItens: TOrcItens);
Var
vCusto: Real;
begin
  FiltrarProdutos('pro_codigo', '=', IntToStr(vfOrcitens.Codproduto), '0');
  vCusto := GetCustoProd;
  dmOrcamentos.qyOrcItensort_codigo.Value := GetCodigo('ort_codigo', 'orcitens');
  dmOrcamentos.qyOrcItensorc_numero.Value := vfOrcitens.Orcamento;
  dmOrcamentos.qyOrcItensort_quantidade.Value := vfOrcitens.Quantidade;
  dmOrcamentos.qyOrcItenspro_codigo.Value := vfOrcitens.Codproduto;
  dmOrcamentos.qyOrcItensort_vlrcusto.Value := vCusto;
  dmOrcamentos.qyOrcItensort_vlrbrt.Value := vfOrcitens.Vlrbruto;
  dmOrcamentos.qyOrcItensort_vlrdesc.Value := vfOrcitens.Vlrdesc;
  dmOrcamentos.qyOrcItensort_percdesc.Value := vfOrcitens.Percdesc;
  dmOrcamentos.qyOrcItensort_vlrliq.Value := vfOrcitens.Vlrliq;
  dmOrcamentos.qyOrcItensort_vlrtotal.Value := vfOrcitens.Vlrtotal;
  dmOrcamentos.qyOrcItensort_percmg.Value := (((vfOrcitens.Vlrliq / vCusto) - 1) * 100);
end;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsOrcItens;
begin
  if dmOrcamentos.qyOrcItens.Active = false then
    dmOrcamentos.qyOrcItens.Active := True;
  dmOrcamentos.qyOrcItens.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtOrcItens;
begin
  dmOrcamentos.qyOrcItens.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostOrcItens;
begin
  try
    if dmOrcamentos.qyOrcItens.State in [dsInsert] then
      dmOrcamentos.qyOrcItensORT_CODIGO.Value := GetCodigo('ORT_CODIGO', 'ORCITENS');
    dmOrcamentos.qyOrcItens.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmOrcamentos.qyOrcItens.Refresh;
    end;
  end;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure DelOrcItens;
begin
  try
    dmOrcamentos.qyOrcItens.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir o registro!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmOrcamentos.qyOrcItens.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarOrcItens(vfOrdem: String);
begin
  dmOrcamentos.qyOrcItens.Close;
  dmOrcamentos.qyOrcItens.SQL.Clear;
  dmOrcamentos.qyOrcItens.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmOrcamentos.qyOrcItens.SQL.Add(' WHERE O.PRO_CODIGO = P.PRO_CODIGO ');
  if vfOrdem <> '0' then
    dmOrcamentos.qyOrcItens.SQL.Add(' ORDER BY ' + vfOrdem);
  dmOrcamentos.qyOrcItens.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarOrcItens(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);
begin
  dmOrcamentos.qyOrcItens.Close;
  dmOrcamentos.qyOrcItens.SQL.Clear;
  dmOrcamentos.qyOrcItens.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmOrcamentos.qyOrcItens.SQL.Add(' WHERE O.PRO_CODIGO = P.PRO_CODIGO AND ');
  dmOrcamentos.qyOrcItens.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmOrcamentos.qyOrcItens.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmOrcamentos.qyOrcItens.SQL.Add(' ORDER BY ' + vfOrdem);
  dmOrcamentos.qyOrcItens.Open;
end;

procedure ImportOrcItens(vfNumOrc: Integer; vfPV: Integer);
Var
vPrevItem: TPrevitens;
begin
  FiltrarOrcItens('ORC_NUMERO', '=', IntToStr(vfNumOrc), '0');
  dmOrcamentos.qyOrcItens.First;
  repeat
    vPrevItem := TPrevitens.Create;
    vPrevItem.Numero := vfPV;
    vPrevItem.Quantidade := dmOrcamentos.qyOrcItensORT_QUANTIDADE.Value;
    vPrevItem.Codproduto := dmOrcamentos.qyOrcItensPRO_CODIGO.Value;
    vPrevItem.Produto := dmOrcamentos.qyOrcItensPRO_DESCRICAO.Text;
    vPrevItem.Unidade := dmOrcamentos.qyOrcItensUNI_CODIGO.Text;
    vPrevItem.Vlrcusto := dmOrcamentos.qyOrcItensORT_VLRCUSTO.Value;
    vPrevItem.Vlrbruto := dmOrcamentos.qyOrcItensORT_VLRBRT.Value;
    vPrevItem.Vlrdesc := dmOrcamentos.qyOrcItensORT_VLRDESC.Value;
    vPrevItem.Percdesc := dmOrcamentos.qyOrcItensORT_PERCDESC.Value;
    vPrevItem.Vlrliq := dmOrcamentos.qyOrcItensORT_VLRLIQ.Value;
    vPrevItem.Vlrtotal := dmOrcamentos.qyOrcItensORT_VLRTOTAL.Value;
    vPrevItem.Permg := dmOrcamentos.qyOrcItensORT_PERCMG.Value;
    InsPrevItens;
    SetValuesPrevItens(vPrevItem);
    PostPrevItens;
    vPrevItem.Free;
    dmOrcamentos.qyOrcItens.Next
  until dmOrcamentos.qyOrcItens.Eof = True;
end;

end.
