unit uDaoConsultas;

interface

uses System.SysUtils, Dialogs;

procedure ConsPagCaixa(vfCodPag: String);
procedure ConsRecCaixa(vfCodRec: String);
procedure ConsPagCaixaFilt(vfDataInic: String; vfDataFinal: String; vfConta: String);
procedure ConsPagCaixaFilAgp(vfDataInic: String; vfDataFinal: String; vfConta: String);
procedure ConsPagCaixaFilDet(vfDataInic: String; vfDataFinal: String; vfConta: String);
procedure FiltRelPagar(vfDataInicial: String; vfDataFinal: String; vfCodForncedor: String; vfStatus: String);
procedure ConsCartoes(vfDataInicial: String);
procedure ConsEstMin(vfOrdem: String);
procedure ItensReservados(vfCodProd: String);
procedure ConsEstNeg(vfOrdem: String);

implementation

uses dataConsultas, uVarGlobal;

//------------------------------------------------------------------------------
procedure ConsPagCaixa(vfCodPag: String);
begin
  dmConsultas.qyConsPagCaixa.Close;
  dmConsultas.qyConsPagCaixa.SQL.Clear;
  dmConsultas.qyConsPagCaixa.SQL.Add('SELECT C.CAI_DATA, C.CAI_CODIGO, T.CON_DESCRICAO, P.PLC_DESCRICAO, ');
  dmConsultas.qyConsPagCaixa.SQL.Add('C.CAI_DESCRICAO, C.CAI_NUMDOC, C.CAI_VALOR, U.USU_NOME ');
  dmConsultas.qyConsPagCaixa.SQL.Add('FROM CAIXA C, CONTAS T, PLANOCONTAS P, USUARIOS U ');
  dmConsultas.qyConsPagCaixa.SQL.Add('WHERE C.CON_CODIGO = T.CON_CODIGO ');
  dmConsultas.qyConsPagCaixa.SQL.Add('AND C.PLC_CODIGO = P.PLC_CODIGO ');
  dmConsultas.qyConsPagCaixa.SQL.Add('AND C.USU_CODIGO = U.USU_CODIGO ');
  dmConsultas.qyConsPagCaixa.SQL.Add('AND C.PAG_CODIGO = ' + vfCodPag);
  dmConsultas.qyConsPagCaixa.SQL.Add('ORDER BY C.CAI_DATA');
  dmConsultas.qyConsPagCaixa.Open;
end;

//------------------------------------------------------------------------------
procedure ConsRecCaixa(vfCodRec: String);
begin
  dmConsultas.qyConsRecCaixa.Close;
  dmConsultas.qyConsRecCaixa.SQL.Clear;
  dmConsultas.qyConsRecCaixa.SQL.Add('SELECT C.CAI_DATA, C.CAI_CODIGO, T.CON_DESCRICAO, P.PLC_DESCRICAO, ');
  dmConsultas.qyConsRecCaixa.SQL.Add('C.CAI_DESCRICAO, C.CAI_NUMDOC, C.CAI_VALOR, U.USU_NOME ');
  dmConsultas.qyConsRecCaixa.SQL.Add('FROM CAIXA C, CONTAS T, PLANOCONTAS P, USUARIOS U ');
  dmConsultas.qyConsRecCaixa.SQL.Add('WHERE C.CON_CODIGO = T.CON_CODIGO ');
  dmConsultas.qyConsRecCaixa.SQL.Add('AND C.PLC_CODIGO = P.PLC_CODIGO ');
  dmConsultas.qyConsRecCaixa.SQL.Add('AND C.USU_CODIGO = U.USU_CODIGO ');
  dmConsultas.qyConsRecCaixa.SQL.Add('AND C.REC_CODIGO = ' + vfCodRec);
  dmConsultas.qyConsRecCaixa.SQL.Add('ORDER BY C.CAI_DATA');
  dmConsultas.qyConsRecCaixa.Open;
end;

//------------------------------------------------------------------------------
procedure ConsPagCaixaFilt(vfDataInic: String; vfDataFinal: String; vfConta: String);
begin
  dmConsultas.qyConsPagCaixa.Close;
  dmConsultas.qyConsPagCaixa.SQL.Clear;
  dmConsultas.qyConsPagCaixa.SQL.Add('SELECT C.CAI_DATA, C.CAI_CODIGO, T.CON_DESCRICAO, P.PLC_DESCRICAO, ');
  dmConsultas.qyConsPagCaixa.SQL.Add('C.CAI_DESCRICAO, C.CAI_NUMDOC, C.CAI_VALOR, U.USU_NOME ');
  dmConsultas.qyConsPagCaixa.SQL.Add('FROM CAIXA C, CONTAS T, PLANOCONTAS P, USUARIOS U ');
  dmConsultas.qyConsPagCaixa.SQL.Add('WHERE C.CON_CODIGO = T.CON_CODIGO ');
  dmConsultas.qyConsPagCaixa.SQL.Add('AND C.PLC_CODIGO = P.PLC_CODIGO ');
  dmConsultas.qyConsPagCaixa.SQL.Add('AND C.USU_CODIGO = U.USU_CODIGO ');
  dmConsultas.qyConsPagCaixa.SQL.Add('AND C.CAI_DATA >= ' + QuotedStr(vfDataInic));
  dmConsultas.qyConsPagCaixa.SQL.Add('AND C.CAI_DATA <= ' + QuotedStr(vfDataFinal));
  if vfConta <> '0' then
    dmConsultas.qyConsPagCaixa.SQL.Add('AND T.CON_CODIGO = ' + vfConta);
  dmConsultas.qyConsPagCaixa.SQL.Add('ORDER BY C.CAI_DATA, T.CON_CODIGO');
  dmConsultas.qyConsPagCaixa.Open;
end;

//------------------------------------------------------------------------------
procedure ConsPagCaixaFilAgp(vfDataInic: String; vfDataFinal: String; vfConta: String);
begin
  dmConsultas.qyRelCaixaAg.Close;
  dmConsultas.qyRelCaixaAg.SQL.Clear;
  dmConsultas.qyRelCaixaAg.SQl.Add('SELECT C.CAI_DATA, T.CON_DESCRICAO, P.PLC_DESCRICAO, SUM(C.CAI_VALOR) ');
  dmConsultas.qyRelCaixaAg.SQl.Add('FROM CAIXA C, CONTAS T, PLANOCONTAS P, USUARIOS U ');
  dmConsultas.qyRelCaixaAg.SQl.Add('WHERE C.CON_CODIGO = T.CON_CODIGO ');
  dmConsultas.qyRelCaixaAg.SQl.Add('AND C.PLC_CODIGO = P.PLC_CODIGO AND C.USU_CODIGO = U.USU_CODIGO ');
  dmConsultas.qyRelCaixaAg.SQl.Add('AND C.CAI_DATA >= ' + QuotedStr(vfDataInic));
  dmConsultas.qyRelCaixaAg.SQl.Add('AND C.CAI_DATA <= ' + QuotedStr(vfDataFinal));
  if vfConta <> '0' then
    dmConsultas.qyRelCaixaAg.SQl.Add('AND C.CON_CODIGO = ' + vfConta);
  dmConsultas.qyRelCaixaAg.SQl.Add('GROUP BY C.CAI_DATA, T.CON_DESCRICAO, P.PLC_DESCRICAO ');
  dmConsultas.qyRelCaixaAg.SQl.Add('ORDER BY P.PLC_DESCRICAO, C.CAI_DATA');
  dmConsultas.qyRelCaixaAg.Open;
end;

//------------------------------------------------------------------------------
procedure ConsPagCaixaFilDet(vfDataInic: String; vfDataFinal: String; vfConta: String);
begin
  dmConsultas.qyRelCaixaDet.Close;
  dmConsultas.qyRelCaixaDet.SQL.Clear;
  dmConsultas.qyRelCaixaDet.SQl.Add('SELECT C.CAI_DATA, T.CON_DESCRICAO, P.PLC_DESCRICAO, ');
  dmConsultas.qyRelCaixaDet.SQl.Add('C.CAI_DESCRICAO, C.CAI_NUMDOC, C.CAI_VALOR ');
  dmConsultas.qyRelCaixaDet.SQl.Add('FROM CAIXA C, CONTAS T, PLANOCONTAS P, USUARIOS U ');
  dmConsultas.qyRelCaixaDet.SQl.Add('WHERE C.CON_CODIGO = T.CON_CODIGO ');
  dmConsultas.qyRelCaixaDet.SQl.Add('AND C.PLC_CODIGO = P.PLC_CODIGO AND C.USU_CODIGO = U.USU_CODIGO ');
  dmConsultas.qyRelCaixaDet.SQl.Add('AND C.CAI_DATA >= ' + QuotedStr(vfDataInic));
  dmConsultas.qyRelCaixaDet.SQl.Add('AND C.CAI_DATA <= ' + QuotedStr(vfDataFinal));
  if vfConta <> '0' then
    dmConsultas.qyRelCaixaDet.SQl.Add('AND C.CON_CODIGO = ' + vfConta);
  dmConsultas.qyRelCaixaDet.SQl.Add('ORDER BY P.PLC_DESCRICAO, C.CAI_DATA');
  dmConsultas.qyRelCaixaDet.Open;
end;

//------------------------------------------------------------------------------
procedure FiltRelPagar(vfDataInicial: String; vfDataFinal: String; vfCodForncedor: String; vfStatus: String);
begin
  dmConsultas.qyRelPagar.Close;
  dmConsultas.qyRelPagar.SQL.Clear;
  dmConsultas.qyRelPagar.SQL.Add('SELECT P.PAG_VENCIMENTO, P.PAG_EMISSAO, P.PAG_NUMERO, ');
  dmConsultas.qyRelPagar.SQL.Add('P.PAG_SERIE, P.PAG_PARCELA, F.PES_NOME, P.PAG_VALOR, ');
  dmConsultas.qyRelPagar.SQL.Add('P.PAG_DESCONTO, P.PAG_ACRESCIMO, P.PAG_PAGO, P.PAG_SALDO ');
  dmConsultas.qyRelPagar.SQL.Add('FROM PAGAR P, PESSOAS F WHERE P.PES_CODIGO = F.PES_CODIGO ');
  dmConsultas.qyRelPagar.SQL.Add('AND P.PAG_VENCIMENTO >= ' + QuotedStr(vfDataInicial));
  dmConsultas.qyRelPagar.SQL.Add('AND P.PAG_VENCIMENTO <= ' + QuotedStr(vfDataFinal));
  if vfCodForncedor <> '0' then
    dmConsultas.qyRelPagar.SQL.Add('AND F.PES_CODIGO = ' + vfCodForncedor);
  if vgPagar = 'R' then
    dmConsultas.qyRelPagar.SQL.Add('AND P.STA_CODIGO = 1');
  if vgPagar = 'S' then
    dmConsultas.qyRelPagar.SQL.Add('AND P.STA_CODIGO = 2');
  dmConsultas.qyRelPagar.Open;
end;

//------------------------------------------------------------------------------
procedure ConsCartoes(vfDataInicial: String);
begin
  dmConsultas.qyConsCartoes.Close;
  dmConsultas.qyConsCartoes.SQL.Clear;
  dmConsultas.qyConsCartoes.SQL.Add('select c.cai_dataefet, c.cai_data, c.cai_id, ');
  dmConsultas.qyConsCartoes.SQL.Add('p.pes_nome, c.cai_numdoc, c.mdc_codigo, ');
  dmConsultas.qyConsCartoes.SQL.Add('c.con_codigo, t.con_descricao, c.cai_valor ');
  dmConsultas.qyConsCartoes.SQL.Add('from caixa c, contas t, prevendas v, pessoas p ');
  dmConsultas.qyConsCartoes.SQL.Add('where c.con_codigo = t.con_codigo ');
  dmConsultas.qyConsCartoes.SQL.Add('and c.cai_numdoc = v.prv_numero ');
  dmConsultas.qyConsCartoes.SQL.Add('and v.pes_codigo = p.pes_codigo ');
  dmConsultas.qyConsCartoes.SQL.Add('and ((v.frp_codigo = 2) or (v.frp_codigo = 3)) ');
  dmConsultas.qyConsCartoes.SQL.Add('and c.cai_dataefet >= ' + QuotedStr(vfDataInicial));
  dmConsultas.qyConsCartoes.SQL.Add('order by c.cai_dataefet, cai_numdoc');
  dmConsultas.qyConsCartoes.Open;
end;

//------------------------------------------------------------------------------
procedure ConsEstMin(vfOrdem: String);
begin
  dmConsultas.qyProdEstMin.Close;
  dmConsultas.qyProdEstMin.SQL.Clear;
  dmConsultas.qyProdEstMin.SQL.Add('select p.pro_descricao, p.pro_codigo, p.uni_codigo,p.grp_codigo, ');
  dmConsultas.qyProdEstMin.SQL.Add('g.grp_descricao, p.sgr_codigo, s.sgr_descricao, p.mar_codigo, ');
  dmConsultas.qyProdEstMin.SQL.Add('m.mar_descricao, p.pro_vlrcusto, p.pro_estmin, p.pro_estideal, ');
  dmConsultas.qyProdEstMin.SQL.Add('e.est_fisico, e.est_reservas, e.est_disponivel ');
  dmConsultas.qyProdEstMin.SQL.Add('from produtos p, produtosest e, grupos g, subgrupos s, marcas m ');
  dmConsultas.qyProdEstMin.SQL.Add('where p.pro_codigo = e.pro_codigo ');
  dmConsultas.qyProdEstMin.SQL.Add('and p.grp_codigo = g.grp_codigo ');
  dmConsultas.qyProdEstMin.SQL.Add('and p.sgr_codigo = s.sgr_codigo ');
  dmConsultas.qyProdEstMin.SQL.Add('and p.mar_codigo = m.mar_codigo ');
  dmConsultas.qyProdEstMin.SQL.Add('and e.est_disponivel <= p.pro_estmin ');
  dmConsultas.qyProdEstMin.SQL.Add('and p.pro_status = ' + QuotedStr('A'));
  dmConsultas.qyProdEstMin.SQL.Add('order by ' + vfOrdem);
  dmConsultas.qyProdEstMin.Open;
end;

//------------------------------------------------------------------------------
procedure ItensReservados(vfCodProd: String);
begin
  dmConsultas.qyItensReservados.Close;
  dmConsultas.qyItensReservados.SQL.Clear;
  dmConsultas.qyItensReservados.SQL.Add('select r.prv_numero, v.prv_data, r.pro_codigo, p.pro_descricao, ');
  dmConsultas.qyItensReservados.SQL.Add('c.pes_nome, v.pes_codigo, r.pri_quantidade ');
  dmConsultas.qyItensReservados.SQL.Add('from prevres r, prevendas v, produtos p, pessoas c ');
  dmConsultas.qyItensReservados.SQL.Add('where r.prv_numero = v.prv_numero ');
  dmConsultas.qyItensReservados.SQL.Add('and v.pes_codigo = c.pes_codigo ');
  dmConsultas.qyItensReservados.SQL.Add('and r.pro_codigo = p.pro_codigo ');
  if vfCodProd <> '0' then
    dmConsultas.qyItensReservados.SQL.Add('and p.pro_codigo = ' + vfCodProd);
  dmConsultas.qyItensReservados.SQL.Add('order by r.prv_numero');
  dmConsultas.qyItensReservados.Open;
end;

//------------------------------------------------------------------------------
procedure ConsEstNeg(vfOrdem: String);
begin
  dmConsultas.qyProdEstNeg.Close;
  dmConsultas.qyProdEstNeg.SQL.Clear;
  dmConsultas.qyProdEstNeg.SQL.Add('select p.pro_descricao, p.pro_codigo, p.uni_codigo,p.grp_codigo, ');
  dmConsultas.qyProdEstNeg.SQL.Add('g.grp_descricao, p.sgr_codigo, s.sgr_descricao, p.mar_codigo, ');
  dmConsultas.qyProdEstNeg.SQL.Add('m.mar_descricao, p.pro_vlrcusto, p.pro_estmin, p.pro_estideal, ');
  dmConsultas.qyProdEstNeg.SQL.Add('e.est_fisico, e.est_reservas, e.est_disponivel ');
  dmConsultas.qyProdEstNeg.SQL.Add('from produtos p, produtosest e, grupos g, subgrupos s, marcas m ');
  dmConsultas.qyProdEstNeg.SQL.Add('where p.pro_codigo = e.pro_codigo ');
  dmConsultas.qyProdEstNeg.SQL.Add('and p.grp_codigo = g.grp_codigo ');
  dmConsultas.qyProdEstNeg.SQL.Add('and p.sgr_codigo = s.sgr_codigo ');
  dmConsultas.qyProdEstNeg.SQL.Add('and p.mar_codigo = m.mar_codigo ');
  dmConsultas.qyProdEstNeg.SQL.Add('and e.est_fisico < 0 ');
  dmConsultas.qyProdEstNeg.SQL.Add('and p.pro_status = ' + QuotedStr('A'));
  dmConsultas.qyProdEstNeg.SQL.Add('order by ' + vfOrdem);
  dmConsultas.qyProdEstNeg.Open;
end;

end.
