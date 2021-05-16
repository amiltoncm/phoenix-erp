unit uDaoLookups;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure AtualizarLookup(vfTabela: String);
procedure FiltrarSubGrupo(vfCodGrupo: String);
procedure FiltrarPrazosFrpLk(vfCodFrp: String);

implementation

uses dataLookups;

procedure AtualizarLookup(vfTabela: String);
begin
  if ((vfTabela = '0') or (vfTabela = 'ACESSO')) then
  begin
    dmLookups.qyLkAcesso.Active := False;
    dmLookups.qyLkAcesso.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'BANCOS')) then
  begin
    dmLookups.qyLkBancos.Active := False;
    dmLookups.qyLkBancos.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'CIDADES')) then
  begin
    dmLookups.qyLkCidades.Active := False;
    dmLookups.qyLkCidades.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'COMANDAS')) then
  begin
    dmLookups.qyLkComandas.Active := False;
    dmLookups.qyLkComandas.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'CONTAS')) then
  begin
    dmLookups.qyLkContas.Active := False;
    dmLookups.qyLkContas.Active := True;
    dmLookups.qyLkContaCred.Active := False;
    dmLookups.qyLkContaCred.Active := True;
    dmLookups.qyLkContaDeb.Active := False;
    dmLookups.qyLkContaDeb.Active := True;
    dmLookups.qyLkContaLanc.Active := False;
    dmLookups.qyLkContaLanc.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'EMAILSDEST')) then
  begin
    dmLookups.qyLkEmailsDest.Active := False;
    dmLookups.qyLkEmailsDest.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'ENTREGA')) then
  begin
    dmLookups.qyLkEntrega.Active := False;
    dmLookups.qyLkEntrega.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'ENDELETROTIPO')) then
  begin
    dmLookups.qyLkEndEletroTipo.Active := False;
    dmLookups.qyLkEndEletroTipo.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'ENDERECOSTIPO')) then
  begin
    dmLookups.qyLkTpEndereco.Active := False;
    dmLookups.qyLkTpEndereco.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'FONESTIPO')) then
  begin
    dmLookups.qyLkTpFone.Active := False;
    dmLookups.qyLkTpFone.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'FORMPAG')) then
  begin
    dmLookups.qyLkFormPag.Active := False;
    dmLookups.qyLkFormPag.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'FUNCIONARIOS')) then
  begin
    dmLookups.qyLkFuncionarios.Active := False;
    dmLookups.qyLkFuncionarios.Active := True;
    dmLookups.qyLkVendedores.Active := False;
    dmLookups.qyLkVendedores.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'FUNCOES')) then
  begin
    dmLookups.qyLkFuncoes.Active := False;
    dmLookups.qyLkFuncoes.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'GRUPOS')) then
  begin
    dmLookups.qyLkGrupos.Active := False;
    dmLookups.qyLkGrupos.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'LOCALIZACAO')) then
  begin
    dmLookups.qyLkLocalizacao.Active := False;
    dmLookups.qyLkLocalizacao.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'LOGRADOUROSTIPO')) then
  begin
    dmLookups.qyLkTpLogradouro.Active := False;
    dmLookups.qyLkTpLogradouro.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'MARCAS')) then
  begin
    dmLookups.qyLkMarcas.Active := False;
    dmLookups.qyLkMarcas.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'MESAS')) then
  begin
    dmLookups.qyLkMesas.Active := False;
    dmLookups.qyLkMesas.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'MODDOC')) then
  begin
    dmLookups.qyLkModDoc.Active := False;
    dmLookups.qyLkModDoc.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'MODFRETE')) then
  begin
    dmLookups.qyLkModFrete.Active := False;
    dmLookups.qyLkModFrete.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'PAIS')) then
  begin
    dmLookups.qyLkPais.Active := False;
    dmLookups.qyLkPais.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'PRAZOS')) then
  begin
    dmLookups.qyLkPrazos.Active := False;
    dmLookups.qyLkPrazos.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'PRAZOSFRP')) then
  begin
    dmLookups.qyLkPrazos.Active := False;
    dmLookups.qyLkPrazos.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'PRODUTOS')) then
  begin
    dmLookups.qyLkProdutos.Active := False;
    dmLookups.qyLkProdutos.Active := True;
    dmLookups.qyLkProdutosVenda.Active := False;
    dmLookups.qyLkProdutosVenda.Active := True;
    dmLookups.qyLkServicos.Active := False;
    dmLookups.qyLkServicos.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'PESSOAS')) then
  begin
    dmLookups.qyLkPessoas.Active := False;
    dmLookups.qyLkPessoas.Active := True;
    dmLookups.qyLkFornecedores.Active := False;
    dmLookups.qyLkFornecedores.Active := True;
    dmLookups.qyLkClientes.Active := False;
    dmLookups.qyLkClientes.Active := True;
    dmLookups.qyLkTransportadoras.Active := False;
    dmLookups.qyLkTransportadoras.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'PLANOCONTAS')) then
  begin
    dmLookups.qyLkPlanoContas.Active := False;
    dmLookups.qyLkPlanoContas.Active := True;
    dmLookups.qyLkPlanoContasEnt.Active := False;
    dmLookups.qyLkPlanoContasEnt.Active := True;
    dmLookups.qyLkPlanoContasSai.Active := False;
    dmLookups.qyLkPlanoContasSai.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'QUADRAS')) then
  begin
    dmLookups.qyLkQuadras.Active := False;
    dmLookups.qyLkQuadras.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'REGIME')) then
  begin
    dmLookups.qyLkRegime.Active := False;
    dmLookups.qyLkRegime.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'SETOR')) then
  begin
    dmLookups.qyLkSetor.Active := False;
    dmLookups.qyLkSetor.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'STATUSMOV')) then
  begin
    dmLookups.qyLkStatusMov.Active := False;
    dmLookups.qyLkStatusMov.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'STATUSORV')) then
  begin
    dmLookups.qyLkStatusOrc.Active := False;
    dmLookups.qyLkStatusOrc.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'SUBGRUPOS')) then
  begin
    dmLookups.qyLkSubGrupos.Active := False;
    dmLookups.qyLkSubGrupos.Active := True;
    dmLookups.qyLkSubGruposCad.Active := False;
    dmLookups.qyLkSubGruposCad.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'TIPOITEM')) then
  begin
    dmLookups.qyLkTipoItem.Active := False;
    dmLookups.qyLkTipoItem.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'UF')) then
  begin
    dmLookups.qyLkUf.Active := False;
    dmLookups.qyLkUf.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'UNIDADES')) then
  begin
    dmLookups.qyLkUnidades.Active := False;
    dmLookups.qyLkUnidades.Active := True;
  end;
  if ((vfTabela = '0') or (vfTabela = 'USUARIOS')) then
  begin
    dmLookups.qyLkUsuarios.Active := False;
    dmLookups.qyLkUsuarios.Active := True;
  end;
end;

procedure FiltrarSubGrupo(vfCodGrupo: String);
begin
  dmLookups.qyLkSubGruposCad.Close;
  dmLookups.qyLkSubGruposCad.SQL.Clear;
  dmLookups.qyLkSubGruposCad.SQL.Add('SELECT SGR_DESCRICAO, SGR_CODIGO, GRP_CODIGO, ');
  dmLookups.qyLkSubGruposCad.SQL.Add('SGR_MKPATAC, SGR_MKPVAR FROM SUBGRUPOS');
  dmLookups.qyLkSubGruposCad.SQL.Add('WHERE GRP_CODIGO = ' + vfCodGrupo);
  dmLookups.qyLkSubGruposCad.SQL.Add('ORDER BY SGR_DESCRICAO');
  dmLookups.qyLkSubGruposCad.Open;
end;

procedure FiltrarPrazosFrpLk(vfCodFrp: String);
begin
  dmLookups.qyLkPrazosFrp.Close;
  dmLookups.qyLkPrazosFrp.SQL.Clear;
  dmLookups.qyLkPrazosFrp.SQL.Add('select p.prz_codigo, p.frp_codigo, f.frp_descricao ');
  dmLookups.qyLkPrazosFrp.SQL.Add('from prazosfrp p, formpag f ');
  dmLookups.qyLkPrazosFrp.SQL.Add('where p.frp_codigo = f.frp_codigo ');
  dmLookups.qyLkPrazosFrp.SQL.Add('and p.prz_codigo = ' + vfCodFrp);
  dmLookups.qyLkPrazosFrp.SQL.Add(' order by f.frp_descricao');
  dmLookups.qyLkPrazosFrp.Open;
end;

end.
