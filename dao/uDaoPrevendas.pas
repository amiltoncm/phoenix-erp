unit uDaoPrevendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassPrevendas, Clipbrd;

procedure SetValuesPrevendas(vfPrevendas: TPrevendas);
procedure InsPrevendas;
procedure EdtPrevendas;
procedure PostPrevendas;
procedure DelPrevendas;
procedure ListarPrevendas(vfOrdem: String);
procedure FiltrarPrevendas(vfCampoFil: String; vfOperador: String; vfParametro:
		                       String; vfOrdem: String);
procedure AtualizaTotalPREV(vfNumPrev: Integer);
procedure SetStatusPrev(vfStatus: Integer);
procedure SetDataEfetPV(vfData: TDate);
procedure SetNumOrc(vfNumOrc: Integer);
function GetSubtotalPV: Real;
function GetDescPPV: Real;
function GetDescVlrPV: Real;
function GetVlrTotPV: Real;
function GetCustoPV: Real;
procedure SetDescPPV(vfValor: Real);
procedure SetDescVlrPV(vfValor: Real);
procedure SetVlrLiqPV(vfValor: Real);
procedure SetMargemPV(vfValor: Real);
function VerifPVOpenCli(vfCodCliente: String): Integer;
procedure ConsPreVendas(vfDataInic: String; vfDataFinal: String; vfVendedor: String; vfStatus: String);
procedure ConsPreVendasGer(vfDataInic: String; vfDataFinal: String; vfVendedor: String; vfStatus: String);

const

ctCampos = 'p.prv_numero, p.prv_data, p.pes_codigo, c.pes_nome, c.pes_logradouro, ' +
'c.pes_bairro, c.pes_numero, c.cid_codigo, m.cid_municipio, m.uf_sigla, c.pes_cep, ' +
'c.pes_fone, p.fun_codigo, n.fun_nome, p.prv_tabvenda, p.prv_referente, p.prv_obs, ' +
'p.prv_vlrcusto, p.prv_subtotal, p.prv_vlrdesc, p.prv_percdesc, p.prv_vlrtotal, ' +
'p.prv_percmg, p.prz_codigo, z.prz_descricao, p.frp_codigo, f.frp_descricao, ' +
'p.prv_vlrlucro, p.mdf_codigo, d.mdf_descricao, p.sto_codigo, s.sto_descricao, ' +
'p.orc_numero, p.ent_codigo, e.ent_descricao';
ctTabelas = 'prevendas p, pessoas c, cidades m, prazos z, formpag f, ' +
            'modfrete d, funcionarios n, statusorc s, entrega e';

implementation

uses dataOrcamentos, uFuncoesDB, uDaoPrevItens, dataConsultas, uVarGlobal;

{--- Seta algum valor na tabela -----------------------------------------------}


procedure SetValuesPrevendas(vfPrevendas: TPrevendas);
begin
  if vfPrevendas.Numero = 0 then
    dmOrcamentos.qyPrevendasprv_numero.Value := GetCodigo('prv_numero', 'prevendas')
  else
    dmOrcamentos.qyPrevendasprv_numero.Value := vfPrevendas.Numero;
  dmOrcamentos.qyPrevendasprv_data.Value := vfPrevendas.Data;
  dmOrcamentos.qyPrevendaspes_codigo.Value := vfPrevendas.Codcliente;
  dmOrcamentos.qyPrevendaspes_nome.Text := vfPrevendas.Cliente;
  dmOrcamentos.qyPrevendaspes_logradouro.Text := vfPrevendas.Logradouro;
  dmOrcamentos.qyPrevendaspes_numero.Value := vfPrevendas.Numero;
  dmOrcamentos.qyPrevendaspes_bairro.Text := vfPrevendas.Bairro;
  dmOrcamentos.qyPrevendascid_codigo.Value := vfPrevendas.Codcidade;
  dmOrcamentos.qyPrevendascid_municipio.Text := vfPrevendas.Cidade;
  dmOrcamentos.qyPrevendasuf_sigla.Text := vfPrevendas.Uf;
  dmOrcamentos.qyPrevendaspes_fone.Text := vfPrevendas.Fone;
  dmOrcamentos.qyPrevendaspes_cep.Text := vfPrevendas.Cep;
  dmOrcamentos.qyPrevendasfun_codigo.Value := vfPrevendas.Codfuncionario;
  dmOrcamentos.qyPrevendasfun_nome.Text := vfPrevendas.Funcionario;
  dmOrcamentos.qyPrevendasprv_tabvenda.Value := vfPrevendas.Tabvenda;
  dmOrcamentos.qyPrevendasprv_referente.Text := vfPrevendas.Referente;
  dmOrcamentos.qyPrevendasprv_obs.Text := vfPrevendas.Obs;
  dmOrcamentos.qyPrevendasprv_vlrcusto.Value := vfPrevendas.Vlrcusto;
  dmOrcamentos.qyPrevendasprv_subtotal.Value := vfPrevendas.Subtotal;
  dmOrcamentos.qyPrevendasprv_vlrdesc.Value := vfPrevendas.Vlrdesc;
  dmOrcamentos.qyPrevendasprv_percdesc.Value := vfPrevendas.Percdesc;
  dmOrcamentos.qyPrevendasprv_vlrtotal.Value := vfPrevendas.Vlrtotal;
  dmOrcamentos.qyPrevendasprv_percmg.Value := vfPrevendas.Permg;
  dmOrcamentos.qyPrevendasprz_codigo.Value := vfPrevendas.Codprazo;
  dmOrcamentos.qyPrevendasprz_descricao.Text := vfPrevendas.Prazo;
  dmOrcamentos.qyPrevendasfrp_codigo.Value := vfPrevendas.Codforma;
  dmOrcamentos.qyPrevendasfrp_descricao.Text := vfPrevendas.Forma;
  dmOrcamentos.qyPrevendasprv_vlrlucro.Value := vfPrevendas.Vlrlucro;
  dmOrcamentos.qyPrevendasmdf_codigo.Value := vfPrevendas.Modfrete;
  dmOrcamentos.qyPrevendasent_codigo.Value := vfPrevendas.CodEntrega;
  dmOrcamentos.qyPrevendasent_descricao.Text := vfPrevendas.Entrega;
  dmOrcamentos.qyPrevendassto_codigo.Value := vfPrevendas.Codstatus;
  if vfPrevendas.Numorc <> 0 then
    dmOrcamentos.qyPrevendasorc_numero.Value := vfPrevendas.Numorc;
  //Utilizado para gerar o número
  vgNumPVGer := dmOrcamentos.qyPrevendasprv_numero.Value;
end;


{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsPrevendas;
begin
  if dmOrcamentos.qyPrevendas.Active = false then
    dmOrcamentos.qyPrevendas.Active := True;
  dmOrcamentos.qyPrevendas.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtPrevendas;
begin
  dmOrcamentos.qyPrevendas.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostPrevendas;
begin
  try
    if dmOrcamentos.qyPrevendas.State in [dsInsert] then
       dmOrcamentos.qyPrevendasPRV_NUMERO.Value := GetCodigo('prv_numero', 'prevendas');
    dmOrcamentos.qyPrevendas.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmOrcamentos.qyPrevendas.Refresh;
    end;
  end;
end;

procedure DelPrevendas;
begin
  try
    dmOrcamentos.qyPrevendas.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmOrcamentos.qyPrevendas.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarPrevendas(vfOrdem: String);
begin
  dmOrcamentos.qyPrevendas.Close;
  dmOrcamentos.qyPrevendas.SQL.Clear;
  dmOrcamentos.qyPrevendas.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmOrcamentos.qyPrevendas.SQL.Add(' where p.pes_codigo = c.pes_codigo ' +
                                   'and c.cid_codigo = m.cid_codigo ' +
                                   'and p.prz_codigo = z.prz_codigo ' +
                                   'and p.frp_codigo = f.frp_codigo ' +
                                   'and p.fun_codigo = n.fun_codigo ' +
                                   'and p.mdf_codigo = d.mdf_codigo ' +
                                   'and p.sto_codigo = s.sto_codigo ' +
                                   'and p.ent_codigo = e.ent_codigo');
  if vfOrdem <> '0' then
    dmOrcamentos.qyPrevendas.SQL.Add(' order by ' + vfOrdem);
  dmOrcamentos.qyPrevendas.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarPrevendas(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmOrcamentos.qyPrevendas.Close;
  dmOrcamentos.qyPrevendas.SQL.Clear;
  dmOrcamentos.qyPrevendas.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmOrcamentos.qyPrevendas.SQL.Add(' where p.pes_codigo = c.pes_codigo ' +
                                   'and c.cid_codigo = m.cid_codigo ' +
                                   'and p.prz_codigo = z.prz_codigo ' +
                                   'and p.frp_codigo = f.frp_codigo ' +
                                   'and p.fun_codigo = n.fun_codigo ' +
                                   'and p.mdf_codigo = d.mdf_codigo ' +
                                   'and p.sto_codigo = s.sto_codigo ' +
                                   'and p.ent_codigo = e.ent_codigo and ');
  dmOrcamentos.qyPrevendas.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmOrcamentos.qyPrevendas.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmOrcamentos.qyPrevendas.SQL.Add(' order by ' + vfOrdem);
  dmOrcamentos.qyPrevendas.Open;
end;

procedure AtualizaTotalPREV(vfNumPrev: Integer);
Var
vMargem, vLucro: Real;
begin
  dmOrcamentos.qyAtualizaTotalPREV.Close;
  dmOrcamentos.qyAtualizaTotalPREV.SQL.Clear;
  dmOrcamentos.qyAtualizaTotalPREV.SQL.Add('select sum(pri_vlrcusto * pri_quantidade) as totcusto, ');
  dmOrcamentos.qyAtualizaTotalPREV.SQL.Add('sum(pri_vlrtotal) as total');
  dmOrcamentos.qyAtualizaTotalPREV.SQL.Add('from previtens where prv_numero = ' + IntToStr(vfNumPrev));
  dmOrcamentos.qyAtualizaTotalPREV.Open;
  if dmOrcamentos.qyAtualizaTotalPREVtotcusto.Value <> 0 then
  begin
    vMargem := ((((dmOrcamentos.qyAtualizaTotalPREVtotcusto.Value /
               dmOrcamentos.qyAtualizaTotalPREVtotal.Value) - 1) * 100) * -1);

  end
  else
    vMargem := 100;
  vLucro := dmOrcamentos.qyAtualizaTotalPREVtotal.Value - dmOrcamentos.qyAtualizaTotalPREVtotcusto.Value;
  EdtPrevendas;
  dmOrcamentos.qyPrevendasprv_vlrcusto.Value := dmOrcamentos.qyAtualizaTotalPREVtotcusto.Value;
  dmOrcamentos.qyPrevendasprv_subtotal.Value := dmOrcamentos.qyAtualizaTotalPREVtotal.Value;
  dmOrcamentos.qyPrevendasprv_vlrtotal.Value := dmOrcamentos.qyAtualizaTotalPREVtotal.Value;
  dmOrcamentos.qyPrevendasprv_vlrdesc.Value := 0;
  dmOrcamentos.qyPrevendasprv_percdesc.Value := 0;
  dmOrcamentos.qyPrevendasprv_percmg.Value := vMargem;
  dmOrcamentos.qyPrevendasprv_vlrlucro.Value := vLucro;
  PostPrevendas;
end;

procedure SetStatusPrev(vfStatus: Integer);
begin
  EdtPrevendas;
  dmOrcamentos.qyPreVendasSTO_CODIGO.Value := vfStatus;
  PostPrevendas;
end;

procedure SetDataEfetPV(vfData: TDate);
begin
  EdtPrevendas;
  dmOrcamentos.qyPreVendasprv_data.Value := vfData;
  PostPrevendas;
end;

procedure SetNumOrc(vfNumOrc: Integer);
begin
  EdtPrevendas;
  dmOrcamentos.qyPrevendasORC_NUMERO.Value := vfNumOrc;
  PostPrevendas;
end;

function GetSubtotalPV: Real;
begin
  Result := dmOrcamentos.qyPrevendasPRV_SUBTOTAL.Value;
end;

function GetDescPPV: Real;
begin
  Result := dmOrcamentos.qyPrevendasPRV_PERCDESC.Value;
end;

function GetDescVlrPV: Real;
begin
  Result := dmOrcamentos.qyPrevendasPRV_VLRDESC.Value;
end;

function GetVlrTotPV: Real;
begin
  Result := dmOrcamentos.qyPrevendasPRV_VLRTOTAL.Value;
end;

function GetCustoPV: Real;
begin
  Result := dmOrcamentos.qyPrevendasPRV_VLRCUSTO.Value;
end;

procedure SetDescPPV(vfValor: Real);
begin
  dmOrcamentos.qyPrevendasPRV_PERCDESC.Value := vfValor;
end;

procedure SetDescVlrPV(vfValor: Real);
begin
  dmOrcamentos.qyPrevendasPRV_VLRDESC.Value := vfValor;
end;

procedure SetVlrLiqPV(vfValor: Real);
begin
  dmOrcamentos.qyPrevendasPRV_VLRTOTAL.Value := vfValor;
end;

procedure SetMargemPV(vfValor: Real);
begin
  dmOrcamentos.qyPrevendasPRV_PERCMG.Value := vfValor;
end;

function VerifPVOpenCli(vfCodCliente: String): Integer;
begin
  dmOrcamentos.QTemp.Close;
  dmOrcamentos.QTemp.SQL.Clear;
  dmOrcamentos.QTemp.SQL.Add('select prv_numero from prevendas ');
  dmOrcamentos.QTemp.SQL.Add('where sto_codigo = 1 ');
  dmOrcamentos.QTemp.SQL.Add('and pes_codigo = ' + vfCodCliente);
  dmOrcamentos.QTemp.SQL.Add(' order by prv_numero');
  dmOrcamentos.QTemp.Open;
  if dmOrcamentos.QTemp.Fields[0].IsNull then
    Result := 0
  else
    Result := dmOrcamentos.QTemp.Fields[0].Value;
end;

procedure ConsPreVendas(vfDataInic: String; vfDataFinal: String; vfVendedor: String; vfStatus: String);
begin
  dmOrcamentos.qyPrevendas.Close;
  dmOrcamentos.qyPrevendas.SQL.Clear;
  dmOrcamentos.qyPrevendas.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmOrcamentos.qyPrevendas.SQL.Add(' where p.pes_codigo = c.pes_codigo ' +
                                   'and c.cid_codigo = m.cid_codigo ' +
                                   'and p.prz_codigo = z.prz_codigo ' +
                                   'and p.frp_codigo = f.frp_codigo ' +
                                   'and p.fun_codigo = n.fun_codigo ' +
                                   'and p.mdf_codigo = d.mdf_codigo ' +
                                   'and p.sto_codigo = s.sto_codigo ' +
                                   'and p.ent_codigo = e.ent_codigo ');
  if vfVendedor <> '0' then
    dmOrcamentos.qyPrevendas.SQL.Add('and p.fun_codigo >= ' + vfVendedor);
  dmOrcamentos.qyPrevendas.SQL.Add('and p.prv_data >= ' + QuotedStr(vfDataInic));
  dmOrcamentos.qyPrevendas.SQL.Add('and p.prv_data <= ' + QuotedStr(vfDataFinal));
  if vfStatus <> '0' then
    dmOrcamentos.qyPrevendas.SQL.Add('and p.sto_codigo = ' + vfStatus);
  dmOrcamentos.qyPrevendas.SQL.Add(' order by p.prv_data');
  dmOrcamentos.qyPrevendas.Open;
end;

procedure ConsPreVendasGer(vfDataInic: String; vfDataFinal: String; vfVendedor: String; vfStatus: String);
begin
  dmConsultas.qyConsPrevendas.Close;
  dmConsultas.qyConsPrevendas.SQL.Clear;
  dmConsultas.qyConsPrevendas.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmConsultas.qyConsPrevendas.SQL.Add(' where p.pes_codigo = c.pes_codigo ' +
                                   'and c.cid_codigo = m.cid_codigo ' +
                                   'and p.prz_codigo = z.prz_codigo ' +
                                   'and p.frp_codigo = f.frp_codigo ' +
                                   'and p.fun_codigo = n.fun_codigo ' +
                                   'and p.mdf_codigo = d.mdf_codigo ' +
                                   'and p.sto_codigo = s.sto_codigo ' +
                                   'and p.ent_codigo = e.ent_codigo ');
  if vfVendedor <> '0' then
    dmConsultas.qyConsPrevendas.SQL.Add('and p.fun_codigo >= ' + vfVendedor);
  dmConsultas.qyConsPrevendas.SQL.Add('and p.prv_data >= ' + QuotedStr(vfDataInic));
  dmConsultas.qyConsPrevendas.SQL.Add('and p.prv_data <= ' + QuotedStr(vfDataFinal));
  if vfStatus <> '0' then
    dmConsultas.qyConsPrevendas.SQL.Add('and p.sto_codigo = ' + vfStatus);
  dmConsultas.qyConsPrevendas.SQL.Add(' order by p.prv_data');
  dmConsultas.qyConsPrevendas.Open;
end;

end.
