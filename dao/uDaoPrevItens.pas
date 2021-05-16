unit uDaoPrevItens;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassPrevItens;

procedure SetValuesPrevItens(vfPrevItens: TPrevItens);
procedure InsPrevItens;
procedure AppendPrevItens;
procedure EdtPrevItens;
procedure PostPrevItens;
procedure DelPrevItens;
procedure ListarPrevItens(vfOrdem: String);
procedure FiltrarPrevItens(vfCampoFil: String; vfOperador: String; vfParametro:
		                       String; vfOrdem: String);
procedure FiltResItem(vfNumPV: Integer);
procedure SelectResItem(vfNumPV: Integer; vfCodProd: Integer);
function GetVlrUnitPV(vfCodPri: Integer): Real;
procedure ScriptDelPrevItens(vfCodPV: String);
procedure ConsPevItens(vfNumPV: String);

const
ctCampos = 'I.PRI_CODIGO, I.PRV_NUMERO, I.PRI_QUANTIDADE, I.PRO_CODIGO, L.LOC_DESCRICAO, ' +
           'P.PRO_DESCRICAO, P.UNI_CODIGO, I.PRI_VLRCUSTO, I.PRI_VLRBRT, I.PRI_VLRDESC, ' +
           'I.PRI_PERCDESC, I.PRI_VLRLIQ, I.PRI_VLRTOTAL, I.PRI_PERCMG';
ctTabelas = 'PREVITENS I, PRODUTOS P, LOCALIZACAO L';

implementation

uses dataOrcamentos, uFuncoesDB, uDaoProdutos, uVarGlobal, uSenhaMgPrev,
  uSenhaDescItemPv, dataConsultas;

{--- Seta algum valor na tabela -----------------------------------------------}

procedure SetValuesPrevItens(vfPrevItens: TPrevItens);
Var
vCusto: Real;
begin
  FiltrarProdutos('pro_codigo', '=', IntToStr(vfPrevItens.Codproduto), '0');
  vCusto := GetCustoProd;
  dmOrcamentos.qyPrevItenspri_codigo.Value := GetCodigo('pri_codigo', 'previtens');
  dmOrcamentos.qyPrevItensPRV_NUMERO.Value := vfPrevItens.Numero;
  dmOrcamentos.qyPrevItensPRI_QUANTIDADE.Value := vfPrevItens.Quantidade;
  dmOrcamentos.qyPrevItensPRO_CODIGO.Value := vfPrevItens.Codproduto;
  dmOrcamentos.qyPrevItensPRO_DESCRICAO.Text := vfPrevItens.Produto;
  dmOrcamentos.qyPrevItensUNI_CODIGO.Text := vfPrevItens.Unidade;
  dmOrcamentos.qyPrevItensPRI_VLRCUSTO.Value := vfPrevItens.Vlrcusto;
  dmOrcamentos.qyPrevItensPRI_VLRBRT.Value := vfPrevItens.Vlrbruto;
  dmOrcamentos.qyPrevItensPRI_VLRDESC.Value := vfPrevItens.Vlrdesc;
  dmOrcamentos.qyPrevItensPRI_PERCDESC.Value := vfPrevItens.Percdesc;
  dmOrcamentos.qyPrevItensPRI_VLRLIQ.Value := vfPrevItens.Vlrliq;
  dmOrcamentos.qyPrevItensPRI_VLRTOTAL.Value := vfPrevItens.Vlrtotal;
  if vfPrevItens.Permg > 0 then
    dmOrcamentos.qyPrevItensPRI_PERCMG.Value := vfPrevItens.Permg
  else
    dmOrcamentos.qyPrevItensPRI_PERCMG.Value := (((vfPrevitens.Vlrliq / vCusto) - 1) * 100);
  // Complementos para poder gravar --------------------------------------------
  dmOrcamentos.qyPrevItensLOC_DESCRICAO.Text := vfPrevItens.Localizacao;
end;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsPrevItens;
begin
  if dmOrcamentos.qyPrevItens.Active = false then
    dmOrcamentos.qyPrevItens.Active := True;
  dmOrcamentos.qyPrevItens.Insert;
end;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure AppendPrevItens;
begin
  if dmOrcamentos.qyPrevItens.Active = false then
    dmOrcamentos.qyPrevItens.Active := True;
  dmOrcamentos.qyPrevItens.Append;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtPrevItens;
begin
  dmOrcamentos.qyPrevItens.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostPrevItens;
begin
  try
    if dmOrcamentos.qyPrevItens.State in [dsInsert] then
      dmOrcamentos.qyPrevItensPRI_CODIGO.Value := GetCodigo('pri_codigo', 'previtens');
    dmOrcamentos.qyPrevItens.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmOrcamentos.qyPrevItens.Refresh;
    end;
  end;
end;

procedure DelPrevItens;
begin
  try
    dmOrcamentos.qyPrevItens.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmOrcamentos.qyPrevItens.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarPrevItens(vfOrdem: String);
begin
  dmOrcamentos.qyPrevItens.Close;
  dmOrcamentos.qyPrevItens.SQL.Clear;
  dmOrcamentos.qyPrevItens.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmOrcamentos.qyPrevItens.SQL.Add(' WHERE I.PRO_CODIGO = P.PRO_CODIGO AND P.LOC_CODIGO = L.LOC_CODIGO ');
  if vfOrdem <> '0' then
    dmOrcamentos.qyPrevItens.SQL.Add(' ORDER BY ' + vfOrdem);
  dmOrcamentos.qyPrevItens.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarPrevItens(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmOrcamentos.qyPrevItens.Close;
  dmOrcamentos.qyPrevItens.SQL.Clear;
  dmOrcamentos.qyPrevItens.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmOrcamentos.qyPrevItens.SQL.Add(' WHERE I.PRO_CODIGO = P.PRO_CODIGO AND P.LOC_CODIGO = L.LOC_CODIGO AND ');
  dmOrcamentos.qyPrevItens.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmOrcamentos.qyPrevItens.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmOrcamentos.qyPrevItens.SQL.Add(' ORDER BY ' + vfOrdem);
  dmOrcamentos.qyPrevItens.Open;
end;

procedure FiltResItem(vfNumPV: Integer);
begin
  dmOrcamentos.qyCalcItensPV.Close;
  dmOrcamentos.qyCalcItensPV.SQL.Clear;
  dmOrcamentos.qyCalcItensPV.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmOrcamentos.qyCalcItensPV.SQL.Add(' WHERE I.PRO_CODIGO = P.PRO_CODIGO AND P.LOC_CODIGO = L.LOC_CODIGO ');
  dmOrcamentos.qyCalcItensPV.SQL.Add(' AND P.PRO_MOVEST = ' + QuotedStr('S'));
  dmOrcamentos.qyCalcItensPV.SQL.Add('AND I.PRV_NUMERO = ' + IntToStr(vfNumPV));
  dmOrcamentos.qyCalcItensPV.Open;
end;

procedure SelectResItem(vfNumPV: Integer; vfCodProd: Integer);
begin
  dmOrcamentos.qyCalcItensPV.Close;
  dmOrcamentos.qyCalcItensPV.SQL.Clear;
  dmOrcamentos.qyCalcItensPV.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmOrcamentos.qyCalcItensPV.SQL.Add(' WHERE I.PRO_CODIGO = P.PRO_CODIGO AND P.LOC_CODIGO = L.LOC_CODIGO ');
  dmOrcamentos.qyCalcItensPV.SQL.Add(' AND P.PRO_MOVEST = ' + QuotedStr('S'));
  dmOrcamentos.qyCalcItensPV.SQL.Add('AND I.PRV_NUMERO = ' + IntToStr(vfNumPV));
  dmOrcamentos.qyCalcItensPV.SQL.Add('AND I.PRO_CODIGO = ' + IntToStr(vfCodProd));
  dmOrcamentos.qyCalcItensPV.Open;
end;

function GetVlrUnitPV(vfCodPri: Integer): Real;
begin
  dmOrcamentos.QTemp.Close;
  dmOrcamentos.QTemp.SQL.Clear;
  dmOrcamentos.QTemp.SQL.Add('select pri_vlrliq from previtens ');
  dmOrcamentos.QTemp.SQL.Add('where pri_codigo = ' + IntToStr(vfCodPri));
  dmOrcamentos.QTemp.Open;
  if dmOrcamentos.QTemp.Fields[0].IsNull then
    Result := 0
  else
    Result := dmOrcamentos.QTemp.Fields[0].Value;
end;

procedure ScriptDelPrevItens(vfCodPV: String);
begin
  dmOrcamentos.ScriptDelPrevItens.SQL.Clear;
  dmOrcamentos.ScriptDelPrevItens.SQL.Add('delete from previtens where prv_numero = ' + vfCodPV);
  dmOrcamentos.ScriptDelPrevItens.ExecSQL;
end;

procedure ConsPevItens(vfNumPV: String);
begin
  dmConsultas.qyConsPrevItens.Close;
  dmConsultas.qyConsPrevItens.SQL.Clear;
  dmConsultas.qyConsPrevItens.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmConsultas.qyConsPrevItens.SQL.Add('where i.pro_codigo = p.pro_codigo and p.loc_codigo = l.loc_codigo ');
  dmConsultas.qyConsPrevItens.SQL.Add('and i.prv_numero = ' + vfNumPV);
  dmConsultas.qyConsPrevItens.SQL.Add('order by i.pri_codigo');
  dmConsultas.qyConsPrevItens.Open;
end;

end.
