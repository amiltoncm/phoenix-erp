unit uDaoProdutos;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassProdutos;

procedure SetValuesProdutos(vfProdutos: TProdutos);
procedure InsProdutos;
procedure EdtProdutos;
function PostProdutos: Boolean;
procedure ListarProdutos(vfOrdem: String);
procedure FiltrarProdutos(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
function FiltrarProdutosCodBar(vfCodigo: String; vfVenda: Integer): boolean;
procedure SetMkpAtac(vfPerc: Real);
procedure SetMkpVar(vfPerc: Real);
function GetCodProd: Integer;
function GetUniProd: String;
function GetCustoProd: Real;
function GetTab1Prod: Real;
function GetTab2Prod: Real;
function GetLocalizacao: String;
function GetDescMax(vfCodProduto: Integer): Real;
function GetMgMin(vfCodProduto: Integer): Real;
function GetProdMov: String;
procedure FindCode(vfCode: String);
procedure FindDesc(vfDesc: String);
function GetDescProd: String;
function GetEan: String;
function GetNcm: String;
function GetCest: String;
function GetClassFisc: Integer;
function GetOrigProd: Integer;
function GetCST: String;
function TestaDupCodBar(vfCodBar: String): String;
function TestaDupCodBarEmb(vfCodBar: String): String;

const
ctCampos = 'P.PRO_CODIGO, P.PRO_DESCRICAO, P.UNI_CODIGO, U.UNI_DESCRICAO, ' +
           'P.GRP_CODIGO, G.GRP_DESCRICAO, P.SGR_CODIGO, S.SGR_DESCRICAO, ' +
           'P.MAR_CODIGO, M.MAR_DESCRICAO, P.PRO_CODBARRAS, P.TIP_CODIGO, ' +
           'T.TIP_DESCRICAO, P.PRO_CLASSFISC, P.PRO_NCM, P.PRO_VLRUNITARIO, P.PRO_CREDICMS, ' +
           'P.PRO_VLRFRETE, P.PRO_VLROUTRAS, P.PRO_VLRIMPORT, P.PRO_VLRCUSTO, ' +
           'P.PRO_MKPATAC, P.PRO_MKPVAR, P.PRO_VLRATAC, P.PRO_VLRVAR, P.PRO_MGMIN, ' +
           'P.PRO_DESMAX, P.PRO_MOVEST, P.LOC_CODIGO, L.LOC_DESCRICAO, P.PRO_DTCAD, ' +
           'P.PRO_ESTMIN, P.PRO_ESTIDEAL, P.PRO_PESOBRUTO, P.PRO_PESOLIQ, P.PRO_ORIGEM, ' +
           'P.PRO_INATZERAR, P.PRO_CEST, P.PRO_EMBALAGEM, P.PRO_CODBARRASEMB, P.PRO_STATUS';
ctTabelas = 'PRODUTOS P, UNIDADES U, GRUPOS G, SUBGRUPOS S, MARCAS M, TIPOITEM T, LOCALIZACAO L';

implementation

uses dataCadastros, uVarGlobal;

{--- Seta algum valor na tabela -----------------------------------------------}

procedure SetValuesProdutos(vfProdutos: TProdutos);
begin
  dmCadastros.qyProdutosPRO_CODIGO.Value := vfProdutos.Codigo;
  dmCadastros.qyProdutosPRO_DESCRICAO.Text := vfProdutos.Descricao;
  dmCadastros.qyProdutosUNI_CODIGO.Text := vfProdutos.Codunidade;
  dmCadastros.qyProdutosUNI_DESCRICAO.Text := vfProdutos.Unidade;
  dmCadastros.qyProdutosGRP_CODIGO.Value := vfProdutos.Codgrupo;
  dmCadastros.qyProdutosGRP_DESCRICAO.Text := vfProdutos.Grupo;
  dmCadastros.qyProdutosSGR_CODIGO.Value := vfProdutos.Codsubgrupo;
  dmCadastros.qyProdutosSGR_DESCRICAO.Text := vfProdutos.Subgrupo;
  dmCadastros.qyProdutosMAR_CODIGO.Value := vfProdutos.Codmarca;
  dmCadastros.qyProdutosMAR_DESCRICAO.Text := vfProdutos.Marca;
  dmCadastros.qyProdutosPRO_CODBARRAS.Text := vfProdutos.Codbarras;
  dmCadastros.qyProdutosTIP_CODIGO.Value := vfProdutos.Codtipo;
  dmCadastros.qyProdutosTIP_DESCRICAO.Text := vfProdutos.Tipo;
  dmCadastros.qyProdutosPRO_CLASSFISC.Value := vfProdutos.Classif;
  dmCadastros.qyProdutosPRO_VLRUNITARIO.Value := vfProdutos.Vlrunitario;
  dmCadastros.qyProdutospro_credicms.Value := vfProdutos.CredIcms;
  dmCadastros.qyProdutosPRO_VLRFRETE.Value := vfProdutos.Vlrfrete;
  dmCadastros.qyProdutosPRO_VLROUTRAS.Value := vfProdutos.Vlroutras;
  dmCadastros.qyProdutosPRO_VLRIMPORT.Value := vfProdutos.Vlrimport;
  dmCadastros.qyProdutosPRO_VLRCUSTO.Value := vfProdutos.Vlrcusto;
  dmCadastros.qyProdutosPRO_MKPATAC.Value := vfProdutos.Mkpatac;
  dmCadastros.qyProdutosPRO_MKPVAR.Value := vfProdutos.Mkpvar;
  dmCadastros.qyProdutosPRO_VLRATAC.Value := vfProdutos.Vlratac;
  dmCadastros.qyProdutosPRO_VLRVAR.Value := vfProdutos.Vlrvar;
  dmCadastros.qyProdutosPRO_MGMIN.Value := vfProdutos.Mgmin;
  dmCadastros.qyProdutosPRO_DESMAX.Value := vfProdutos.Descmax;
  dmCadastros.qyProdutosPRO_MOVEST.Text := vfProdutos.Movest;
  dmCadastros.qyProdutosLOC_CODIGO.Value := vfProdutos.Codlocal;
  dmCadastros.qyProdutosLOC_DESCRICAO.Text := vfProdutos.Local;
  dmCadastros.qyProdutosPRO_ESTMIN.Value := vfProdutos.Estmin;
  dmCadastros.qyProdutosPRO_ESTIDEAL.Value := vfProdutos.Estide;
  dmCadastros.qyProdutosPRO_PESOBRUTO.Value := vfProdutos.Pesobruto;
  dmCadastros.qyProdutosPRO_PESOLIQ.Value := vfProdutos.Pesoliq;
  dmCadastros.qyProdutosPRO_ORIGEM.Value := vfProdutos.Origem;
  dmCadastros.qyProdutosPRO_INATZERAR.Value := vfProdutos.Inativar;
  dmCadastros.qyProdutosPRO_NCM.Text := vfProdutos.Ncm;
  dmCadastros.qyProdutosPRO_STATUS.Text := vfProdutos.Status;
  dmCadastros.qyProdutospro_embalagem.Value := vfProdutos.Embalagem;
  dmCadastros.qyProdutospro_codbarrasemb.Text := vfProdutos.CodBarrasEmb;
end;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsProdutos;
begin
  if dmCadastros.qyProdutos.Active = false then
    dmCadastros.qyProdutos.Active := True;
  dmCadastros.qyProdutos.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtProdutos;
begin
  dmCadastros.qyProdutos.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

function PostProdutos: Boolean;
begin
  try
    dmCadastros.qyProdutos.Post;
    Result := True;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      Result := False;
      dmCadastros.qyProdutos.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarProdutos(vfOrdem: String);
begin
  dmCadastros.qyProdutos.Close;
  dmCadastros.qyProdutos.SQL.Clear;
  dmCadastros.qyProdutos.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyProdutos.SQL.Add('WHERE P.UNI_CODIGO = U.UNI_CODIGO ' +
                                 'AND P.GRP_CODIGO = G.GRP_CODIGO ' +
                                 'AND P.SGR_CODIGO = S.SGR_CODIGO ' +
                                 'AND P.MAR_CODIGO = M.MAR_CODIGO ' +
                                 'AND P.TIP_CODIGO = T.TIP_CODIGO ' +
                                 'AND P.LOC_CODIGO = L.LOC_CODIGO ');
  dmCadastros.qyProdutos.SQL.Add('AND P.PRO_CODIGO > 0');
  if vfOrdem <> '0' then
    dmCadastros.qyProdutos.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyProdutos.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarProdutos(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmCadastros.qyProdutos.Close;
  dmCadastros.qyProdutos.SQL.Clear;
  dmCadastros.qyProdutos.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyProdutos.SQL.Add('WHERE P.UNI_CODIGO = U.UNI_CODIGO ' +
                                 'AND P.GRP_CODIGO = G.GRP_CODIGO ' +
                                 'AND P.SGR_CODIGO = S.SGR_CODIGO ' +
                                 'AND P.MAR_CODIGO = M.MAR_CODIGO ' +
                                 'AND P.TIP_CODIGO = T.TIP_CODIGO ' +
                                 'AND P.LOC_CODIGO = L.LOC_CODIGO AND ');
  dmCadastros.qyProdutos.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qyProdutos.SQL.Add(QuotedStr(vfParametro));
  dmCadastros.qyProdutos.SQL.Add('AND P.PRO_CODIGO > 0');
  if vfOrdem <> '0' then
    dmCadastros.qyProdutos.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyProdutos.Open;
end;

{--- Filtra registros da tabela pelo código ou código de barras ---------------}
{
  Caso o filtro por código de barras for na venda (vfVenda = 1) só pode trazer
  resultado de produto com o tip_codigo = 0 (Mercadoria para revenda).
}
function FiltrarProdutosCodBar(vfCodigo: String; vfVenda: Integer): boolean;
begin
  // Testa por Código e ou Código de barras ------------------------------------
  dmCadastros.qyProdutos.Close;
  dmCadastros.qyProdutos.SQL.Clear;
  dmCadastros.qyProdutos.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyProdutos.SQL.Add('WHERE P.UNI_CODIGO = U.UNI_CODIGO ' +
                                 'AND P.GRP_CODIGO = G.GRP_CODIGO ' +
                                 'AND P.SGR_CODIGO = S.SGR_CODIGO ' +
                                 'AND P.MAR_CODIGO = M.MAR_CODIGO ' +
                                 'AND P.TIP_CODIGO = T.TIP_CODIGO ' +
                                 'AND P.LOC_CODIGO = L.LOC_CODIGO ');
  dmCadastros.qyProdutos.SQL.Add('AND ((P.PRO_CODIGO = ' + vfCodigo);
  dmCadastros.qyProdutos.SQL.Add(') OR (P.PRO_CODBARRAS = ' + QuotedStr(vfCodigo) + '))');
  dmCadastros.qyProdutos.SQL.Add(' AND P.PRO_CODIGO > 0 ');
  if vfVenda = 1 then
    dmCadastros.qyProdutos.SQL.Add(' AND P.TIP_CODIGO = 0 ');
  dmCadastros.qyProdutos.Open;
  // Caso não ache, verifica embalagem -----------------------------------------
  if dmCadastros.qyProdutosPRO_CODIGO.IsNull then
  begin
    dmCadastros.qyProdutos.Close;
    dmCadastros.qyProdutos.SQL.Clear;
    dmCadastros.qyProdutos.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
    dmCadastros.qyProdutos.SQL.Add('WHERE P.UNI_CODIGO = U.UNI_CODIGO ' +
                                   'AND P.GRP_CODIGO = G.GRP_CODIGO ' +
                                   'AND P.SGR_CODIGO = S.SGR_CODIGO ' +
                                   'AND P.MAR_CODIGO = M.MAR_CODIGO ' +
                                   'AND P.TIP_CODIGO = T.TIP_CODIGO ' +
                                   'AND P.LOC_CODIGO = L.LOC_CODIGO ');
    dmCadastros.qyProdutos.SQL.Add('AND P.PRO_CODBARRASEMB = ' + QuotedStr(vfCodigo));
    dmCadastros.qyProdutos.SQL.Add(' AND P.PRO_CODIGO > 0');
    dmCadastros.qyProdutos.Open;
    if dmCadastros.qyProdutosPRO_CODIGO.IsNull then
      Result := false
    else
    begin
      // Pega quantidade da embalagem ------------------------------------------
      if dmCadastros.qyProdutospro_embalagem.IsNull then
        vgQdtEmbPV := 1
      else
        vgQdtEmbPV := dmCadastros.qyProdutospro_embalagem.Value;
      Result := true;
    end;
  end
  else
    Result := true;
end;

procedure SetMkpAtac(vfPerc: Real);
begin
  dmCadastros.qyProdutosPRO_MKPATAC.Value := vfPerc;
end;

procedure SetMkpVar(vfPerc: Real);
begin
  dmCadastros.qyProdutosPRO_MKPVAR.Value := vfPerc;
end;

function GetCodProd: Integer;
begin
  Result := dmCadastros.qyProdutosPRO_CODIGO.Value;
end;

function GetUniProd: String;
begin
  Result := dmCadastros.qyProdutosUNI_CODIGO.Text;
end;

function GetCustoProd: Real;
begin
  Result := dmCadastros.qyProdutosPRO_VLRCUSTO.Value;
end;

function GetTab1Prod: Real;
begin
  Result := dmCadastros.qyProdutosPRO_VLRATAC.Value;
end;

function GetTab2Prod: Real;
begin
  Result := dmCadastros.qyProdutosPRO_VLRVAR.Value;
end;

function GetLocalizacao: String;
begin
  Result := dmCadastros.qyProdutosLOC_DESCRICAO.Text;
end;

function GetDescMax(vfCodProduto: Integer): Real;
begin
  dmCadastros.QTemp.Close;
  dmCadastros.QTemp.SQL.Clear;
  dmCadastros.QTemp.SQL.Add('SELECT PRO_DESMAX FROM PRODUTOS ');
  dmCadastros.QTemp.SQL.Add('WHERE PRO_CODIGO = ' + IntToStr(vfCodProduto));
  dmCadastros.QTemp.Open;
  if dmCadastros.QTemp.Fields[0].IsNull then
    Result := 0
  else
    Result := dmCadastros.QTemp.Fields[0].Value;
end;

function GetMgMin(vfCodProduto: Integer): Real;
begin
  dmCadastros.QTemp.Close;
  dmCadastros.QTemp.SQL.Clear;
  dmCadastros.QTemp.SQL.Add('SELECT PRO_MGMIN FROM PRODUTOS ');
  dmCadastros.QTemp.SQL.Add('WHERE PRO_CODIGO = ' + IntToStr(vfCodProduto));
  dmCadastros.QTemp.Open;
  if dmCadastros.QTemp.Fields[0].IsNull then
    Result := 0
  else
    Result := dmCadastros.QTemp.Fields[0].Value;
end;

function GetProdMov: String;
begin
  Result := dmCadastros.qyProdutosPRO_MOVEST.Text;
end;

procedure FindCode(vfCode: String);
begin
  dmCadastros.qyProdutos.Close;
  dmCadastros.qyProdutos.SQL.Clear;
  dmCadastros.qyProdutos.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyProdutos.SQL.Add('WHERE P.UNI_CODIGO = U.UNI_CODIGO ' +
                                 'AND P.GRP_CODIGO = G.GRP_CODIGO ' +
                                 'AND P.SGR_CODIGO = S.SGR_CODIGO ' +
                                 'AND P.MAR_CODIGO = M.MAR_CODIGO ' +
                                 'AND P.TIP_CODIGO = T.TIP_CODIGO ' +
                                 'AND P.LOC_CODIGO = L.LOC_CODIGO AND ');
  dmCadastros.qyProdutos.SQL.Add('((P.PRO_CODIGO = ' + vfCode + ')');
  dmCadastros.qyProdutos.SQL.Add('OR (P.PRO_CODBARRAS = ' + QuotedStr(vfCode) + '))');
  dmCadastros.qyProdutos.SQL.Add('AND P.PRO_CODIGO > 0 ');
  dmCadastros.qyProdutos.SQL.Add('AND P.PRO_STATUS = ' + QuotedStr('A'));
  dmCadastros.qyProdutos.SQL.Add(' ORDER BY P.PRO_CODIGO');
  dmCadastros.qyProdutos.Open;
end;

procedure FindDesc(vfDesc: String);
begin
  dmCadastros.qyProdutos.Close;
  dmCadastros.qyProdutos.SQL.Clear;
  dmCadastros.qyProdutos.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyProdutos.SQL.Add('WHERE P.UNI_CODIGO = U.UNI_CODIGO ' +
                                 'AND P.GRP_CODIGO = G.GRP_CODIGO ' +
                                 'AND P.SGR_CODIGO = S.SGR_CODIGO ' +
                                 'AND P.MAR_CODIGO = M.MAR_CODIGO ' +
                                 'AND P.TIP_CODIGO = T.TIP_CODIGO ' +
                                 'AND P.LOC_CODIGO = L.LOC_CODIGO ');
  dmCadastros.qyProdutos.SQL.Add('AND P.PRO_DESCRICAO LIKE ' + QuotedStr('%' + vfDesc + '%'));
  dmCadastros.qyProdutos.SQL.Add('AND P.PRO_CODIGO > 0');
  dmCadastros.qyProdutos.SQL.Add('AND P.PRO_STATUS = ' + QuotedStr('A'));
  dmCadastros.qyProdutos.SQL.Add(' ORDER BY P.PRO_DESCRICAO');
  dmCadastros.qyProdutos.Open;
end;

function GetDescProd: String;
begin
  Result := dmCadastros.qyProdutosPRO_DESCRICAO.Text;
end;

function GetEan: String;
begin
  Result := dmCadastros.qyProdutosPRO_CODBARRAS.Text;
end;

function GetNcm: String;
begin
  Result := dmCadastros.qyProdutosPRO_NCM.Text;
end;

function GetCest: String;
begin
  Result := dmCadastros.qyProdutospro_cest.Text;
end;

function GetNatureza(vfCodFinalidade: Integer): Integer;
begin
  if vfCodFinalidade = 1 then
  begin
    Result := 1;
  end;
end;

function GetClassFisc: Integer;
begin
  Result := dmCadastros.qyProdutosPRO_CLASSFISC.Value;
end;

function GetOrigProd: Integer;
begin
  Result := dmCadastros.qyProdutosPRO_ORIGEM.Value;
end;

function GetCST: String;
Var
vOrigem: String;
begin
  vOrigem := dmCadastros.qyProdutosPRO_ORIGEM.Text;
  if dmCadastros.qyProdutosPRO_CLASSFISC.Value = 1 then
    vOrigem := vOrigem + '00';
  if dmCadastros.qyProdutosPRO_CLASSFISC.Value = 2 then
    vOrigem := vOrigem + '60';
  Result := vOrigem;
end;

function TestaDupCodBar(vfCodBar: String): String;
Var
vCont: Integer;
vResult: String;
begin
  dmCadastros.QTemp.Close;
  dmCadastros.QTemp.SQL.Clear;
  dmCadastros.QTemp.SQL.Add('select pro_codigo from produtos ');
  dmCadastros.QTemp.SQL.Add('where pro_codbarras  = ' + QuotedStr(vfCodBar));
  dmCadastros.QTemp.Open;
  if dmCadastros.QTemp.Fields[0].IsNull then
    Result := '0'  else  begin    vCont := 0;    dmCadastros.QTemp.First;    repeat    begin      vResult := vResult + FormatFloat('000,000', dmCadastros.QTemp.Fields[0].Value) + #13;
      vCont := vCont + 1;
      dmCadastros.Qtemp.Next;
    end;
    until dmCadastros.QTemp.Eof = true;
    if vCont = 1 then
      Result := '0'
    else
    Result := vResult;
  end;end;
function TestaDupCodBarEmb(vfCodBar: String): String;
Var
vCont: Integer;
vResult: String;
begin
  dmCadastros.QTemp.Close;
  dmCadastros.QTemp.SQL.Clear;
  dmCadastros.QTemp.SQL.Add('select pro_codigo from produtos ');
  dmCadastros.QTemp.SQL.Add('where pro_codbarrasemb  = ' + QuotedStr(vfCodBar));
  dmCadastros.QTemp.Open;
  if dmCadastros.QTemp.Fields[0].IsNull then
    Result := '0'  else  begin    vCont := 0;    dmCadastros.QTemp.First;    repeat    begin      vResult := vResult + FormatFloat('000,000', dmCadastros.QTemp.Fields[0].Value) + #13;
      vCont := vCont + 1;
      dmCadastros.Qtemp.Next;
    end;
    until dmCadastros.QTemp.Eof = true;
    if vCont = 1 then
      Result := '0'
    else
    Result := vResult;
  end;end;

end.
