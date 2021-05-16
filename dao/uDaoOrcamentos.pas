unit uDaoOrcamentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassPrevendas;

procedure InsOrcamentos;
procedure EdtOrcamentos;
procedure PostOrcamentos;
procedure DelOrcamentos;
procedure ListarOrcamentos(vfOrdem: String);
procedure FiltrarOrcamentos(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
procedure AtualizaTotalORC(vfNumOrc: Integer);
procedure SetStatusOrc(vfStatus: Integer);
function GetSubtotal: Real;
function GetDescP: Real;
function GetDescVlr: Real;
function GetVlrTot: Real;
function GetCusto: Real;
procedure SetDescP(vfValor: Real);
procedure SetDescVlr(vfValor: Real);
procedure SetVlrLiq(vfValor: Real);
procedure SetMargem(vfValor: Real);
procedure ImportOrc(vfNumOrc: Integer);

const
ctCampos = 'o.orc_numero, o.orc_data, o.pes_codigo, p.pes_nome, p.pes_fone, ' +
           'o.orc_contato, o.fun_codigo, f.fun_nome, o.orc_tabvenda, ' +
           'o.orc_referente, o.orc_obs, o.orc_vlrcusto, o.orc_subtotal, ' +
           'o.orc_vlrdesc, o.orc_percdesc, o.orc_vlrtotal, o.orc_percmg, o.orc_validade, ' +
           'o.prz_codigo, z.prz_descricao, o.frp_codigo, m.frp_descricao, o.orc_vlrlucro, ' +
           'o.mdf_codigo, e.mdf_descricao, o.sto_codigo, s.sto_descricao, o.prv_numero, ' +
           'o.ent_codigo, g.ent_descricao ';
ctTabelas = 'orcamentos o, pessoas p, funcionarios f, prazos z, formpag m, ' +
            'modfrete e, statusorc s, entrega g';

implementation

uses dataOrcamentos, uFuncoesDB, uVarGlobal;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsOrcamentos;
begin
  if dmOrcamentos.qyOrcamentos.Active = false then
    dmOrcamentos.qyOrcamentos.Active := True;
  dmOrcamentos.qyOrcamentos.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtOrcamentos;
begin
  dmOrcamentos.qyOrcamentos.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostOrcamentos;
begin
  try
    if dmOrcamentos.qyOrcamentos.State in [dsInsert] then
      dmOrcamentos.qyOrcamentosORC_NUMERO.Value := GetCodigo('orc_numero', 'orcamentos');
    dmOrcamentos.qyOrcamentos.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmOrcamentos.qyOrcamentos.Refresh;
    end;
  end;
end;

procedure DelOrcamentos;
begin
  try
    dmOrcamentos.qyOrcamentos.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir o orçamento!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmOrcamentos.qyOrcamentos.Refresh;
    end;
  end;
end;


{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarOrcamentos(vfOrdem: String);
begin
  dmOrcamentos.qyOrcamentos.Close;
  dmOrcamentos.qyOrcamentos.SQL.Clear;
  dmOrcamentos.qyOrcamentos.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  dmOrcamentos.qyOrcamentos.SQL.Add('where o.orc_numero > 0 ' +
                                    'and o.pes_codigo = p.pes_codigo ' +
                                    'and o.fun_codigo = f.fun_codigo ' +
                                    'and o.prz_codigo = z.prz_codigo ' +
                                    'and o.frp_codigo = m.frp_codigo ' +
                                    'and o.mdf_codigo = e.mdf_codigo ' +
                                    'and o.sto_codigo = s.sto_codigo ' +
                                    'and o.ent_codigo = g.ent_codigo ');
  if vfOrdem <> '0' then
    dmOrcamentos.qyOrcamentos.SQL.Add(' order by ' + vfOrdem);
  dmOrcamentos.qyOrcamentos.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarOrcamentos(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmOrcamentos.qyOrcamentos.Close;
  dmOrcamentos.qyOrcamentos.SQL.Clear;
  dmOrcamentos.qyOrcamentos.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  dmOrcamentos.qyOrcamentos.SQL.Add('where o.orc_numero > 0 ' +
                                    'and o.pes_codigo = p.pes_codigo ' +
                                    'and o.fun_codigo = f.fun_codigo ' +
                                    'and o.prz_codigo = z.prz_codigo ' +
                                    'and o.frp_codigo = m.frp_codigo ' +
                                    'and o.mdf_codigo = e.mdf_codigo ' +
                                    'and o.sto_codigo = s.sto_codigo ' +
                                    'and o.ent_codigo = g.ent_codigo and ');
  dmOrcamentos.qyOrcamentos.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmOrcamentos.qyOrcamentos.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmOrcamentos.qyOrcamentos.SQL.Add(' order by ' + vfOrdem);
  dmOrcamentos.qyOrcamentos.Open;
end;

procedure AtualizaTotalORC(vfNumOrc: Integer);
Var
vMargem, vLucro: Real;
begin
  dmOrcamentos.qyAtualizaTotalORC.Close;
  dmOrcamentos.qyAtualizaTotalORC.SQL.Clear;
  dmOrcamentos.qyAtualizaTotalORC.SQL.Add('select sum(ort_vlrcusto * ort_quantidade) as totcusto,');
  dmOrcamentos.qyAtualizaTotalORC.SQL.Add('sum(ort_vlrtotal) as total');
  dmOrcamentos.qyAtualizaTotalORC.SQL.Add('from orcitens where orc_numero = ' + IntToStr(vfNumOrc));
  dmOrcamentos.qyAtualizaTotalORC.Open;
  if dmOrcamentos.qyAtualizaTotalORCtotcusto.Value <> 0 then
  begin
    vMargem := ((((dmOrcamentos.qyAtualizaTotalORCtotcusto.Value /
               dmOrcamentos.qyAtualizaTotalORCtotal.Value) - 1) * 100) * -1);

  end
  else
    vMargem := 100;
  vLucro := dmOrcamentos.qyAtualizaTotalORCtotal.Value - dmOrcamentos.qyAtualizaTotalORCtotcusto.Value;
  EdtOrcamentos;
  dmOrcamentos.qyOrcamentosORC_VLRCUSTO.Value := dmOrcamentos.qyAtualizaTotalORCtotcusto.Value;
  dmOrcamentos.qyOrcamentosORC_SUBTOTAL.Value := dmOrcamentos.qyAtualizaTotalORCtotal.Value;
  dmOrcamentos.qyOrcamentosORC_VLRTOTAL.Value := dmOrcamentos.qyAtualizaTotalORCtotal.Value;
  dmOrcamentos.qyOrcamentosORC_VLRDESC.Value := 0;
  dmOrcamentos.qyOrcamentosORC_PERCDESC.Value := 0;
  dmOrcamentos.qyOrcamentosORC_PERCMG.Value := vMargem;
  dmOrcamentos.qyOrcamentosORC_VLRLUCRO.Value := vLucro;
  PostOrcamentos;
end;

procedure SetStatusOrc(vfStatus: Integer);
begin
  EdtOrcamentos;
  dmOrcamentos.qyOrcamentosSTO_CODIGO.Value := vfStatus;
  PostOrcamentos;
end;

function GetSubtotal: Real;
begin
  Result := dmOrcamentos.qyOrcamentosORC_SUBTOTAL.Value;
end;

function GetDescP: Real;
begin
  Result := dmOrcamentos.qyOrcamentosORC_PERCDESC.Value;
end;

function GetDescVlr: Real;
begin
  Result := dmOrcamentos.qyOrcamentosORC_VLRDESC.Value;
end;

function GetVlrTot: Real;
begin
  Result := dmOrcamentos.qyOrcamentosORC_VLRTOTAL.Value;
end;

function GetCusto: Real;
begin
  Result := dmOrcamentos.qyOrcamentosORC_VLRCUSTO.Value;
end;

procedure SetDescP(vfValor: Real);
begin
  dmOrcamentos.qyOrcamentosORC_PERCDESC.Value := vfValor;
end;

procedure SetDescVlr(vfValor: Real);
begin
  dmOrcamentos.qyOrcamentosORC_VLRDESC.Value := vfValor;
end;

procedure SetVlrLiq(vfValor: Real);
begin
  dmOrcamentos.qyOrcamentosORC_VLRTOTAL.Value := vfValor;
end;

procedure SetMargem(vfValor: Real);
begin
  dmOrcamentos.qyOrcamentosORC_PERCMG.Value := vfValor;
end;

procedure ImportOrc(vfNumOrc: Integer);
begin
  FiltrarOrcamentos('orc_numero', '=', IntToStr(vfNumOrc), '0');
  vgPreVenda.Codcliente := dmOrcamentos.qyOrcamentospes_codigo.Value;
  vgPreVenda.Cliente := dmOrcamentos.qyOrcamentospes_nome.Text;
  vgPreVenda.Fone := dmOrcamentos.qyOrcamentospes_fone.Text;
  vgPreVenda.Codfuncionario := dmOrcamentos.qyOrcamentosfun_codigo.Value;
  vgPreVenda.Funcionario := dmOrcamentos.qyOrcamentosfun_nome.Text;
  vgPreVenda.Tabvenda := dmOrcamentos.qyOrcamentosorc_tabvenda.Value;
  vgPreVenda.Codprazo := dmOrcamentos.qyOrcamentosprz_codigo.Value;
  vgPreVenda.Prazo := dmOrcamentos.qyOrcamentosprz_descricao.Text;
  vgPreVenda.Codforma := dmOrcamentos.qyOrcamentosfrp_codigo.Value;
  vgPreVenda.Forma := dmOrcamentos.qyOrcamentosfrp_descricao.Text;
  vgPreVenda.CodEntrega := dmOrcamentos.qyOrcamentosent_codigo.Value;
  vgPreVenda.Entrega := dmOrcamentos.qyOrcamentosent_descricao.Text;
  vgPreVenda.Referente := dmOrcamentos.qyOrcamentosorc_referente.Text;
  vgPreVenda.Obs := dmOrcamentos.qyOrcamentosorc_obs.Text;
  vgPreVenda.Vlrcusto := dmOrcamentos.qyOrcamentosorc_vlrcusto.Value;
  vgPreVenda.Subtotal := dmOrcamentos.qyOrcamentosorc_subtotal.Value;
  vgPreVenda.Vlrdesc := dmOrcamentos.qyOrcamentosorc_vlrdesc.Value;
  vgPreVenda.Percdesc := dmOrcamentos.qyOrcamentosorc_percdesc.Value;
  vgPreVenda.Vlrtotal := dmOrcamentos.qyOrcamentosorc_vlrtotal.Value;
  vgPreVenda.Permg := dmOrcamentos.qyOrcamentosorc_percmg.Value;
  vgPreVenda.Vlrlucro := dmOrcamentos.qyOrcamentosorc_vlrlucro.Value;
  vgPreVenda.Modfrete := dmOrcamentos.qyOrcamentosmdf_codigo.Value;
  vgPreVenda.Frete := dmOrcamentos.qyOrcamentosmdf_descricao.Text;
  SetStatusOrc(4);
end;

end.
