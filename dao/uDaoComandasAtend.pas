unit uDaoComandasAtend;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassComandasAtend;

procedure SetValuesComandasAtend(vfComandasAtend: TComandasAtend);
procedure InsComandasAtend;
procedure EdtComandasAtend;
procedure PostComandasAtend;
procedure DelComandasAtend;
procedure ListarComandasAtend(vfOrdem: String);
procedure FiltrarComandasAtend(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);
function TestaComandaUso(vfNumero: Integer): Boolean;
procedure AtualizaTotalAtend(vfNumComanda: Integer; vfNumAtend: Integer);
procedure AtualizaTotalCustoAtend(vfNumComanda: Integer; vfNumAtend: Integer);
procedure GerarDadosPV(vfNumComanda: Integer);

const
ctCampos = 'a.cmu_codigo, a.cma_codigo, c.cma_descricao, a.mes_codigo, ' +
           'a.prv_numero,a.cmu_vlrtotcusto, a.cmu_valortotal';
ctTabelas = 'comandasatend a, comandas c';

implementation

uses dataGestao, uFuncoesDB, uVarGlobal, uDaoComandasItens;

{--- Seta algum valor na tabela -----------------------------------------------}

procedure SetValuesComandasAtend(vfComandasAtend: TComandasAtend);
begin
  if vfComandasAtend.Codigo = 0 then
    dmGestao.qyComandasAtendcmu_codigo.Value := GetCodigo('cmu_codigo', 'comandasatend')
  else
    dmGestao.qyComandasAtendcmu_codigo.Value := vfComandasatend.Codigo;
  dmGestao.qyComandasAtendcma_codigo.Value := vfComandasatend.Codcomanda;
  dmGestao.qyComandasAtendmes_codigo.Value := vfComandasatend.Codmesa;
  dmGestao.qyComandasAtendprv_numero.Value := vfComandasatend.Codprevenda;
end;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsComandasAtend;
begin
  if dmGestao.qyComandasAtend.Active = false then
    dmGestao.qyComandasAtend.Active := True;
  dmGestao.qyComandasAtend.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtComandasAtend;
begin
  dmGestao.qyComandasAtend.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostComandasAtend;
begin
  try
    if dmGestao.qyComandasAtend.State in [dsInsert] then
      dmGestao.qyComandasAtendcmu_codigo.Value := GetCodigo('cmu_codigo', 'comandasatend');
    dmGestao.qyComandasAtend.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmGestao.qyComandasAtend.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelComandasAtend;
begin
  try
    dmGestao.qyComandasAtend.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                  E.Message,mtError,[mbOk],0);
      dmGestao.qyComandasAtend.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarComandasAtend(vfOrdem: String);
begin
  dmGestao.qyComandasAtend.Close;
  dmGestao.qyComandasAtend.SQL.Clear;
  dmGestao.qyComandasAtend.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas );
  dmGestao.qyComandasAtend.SQL.Add('where a.cma_codigo = c.cma_codigo ');
  if vfOrdem <> '0' then
    dmGestao.qyComandasAtend.SQL.Add(' order by ' + vfOrdem);
  dmGestao.qyComandasAtend.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarComandasAtend(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmGestao.qyComandasAtend.Close;
  dmGestao.qyComandasAtend.SQL.Clear;
  dmGestao.qyComandasAtend.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmGestao.qyComandasAtend.SQL.Add('where a.cma_codigo = c.cma_codigo and ');
  dmGestao.qyComandasAtend.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmGestao.qyComandasAtend.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmGestao.qyComandasAtend.SQL.Add(' order by ' + vfOrdem);
  dmGestao.qyComandasAtend.Open;
end;

function TestaComandaUso(vfNumero: Integer): Boolean;
begin
  dmGestao.QTemp.Close;
  dmGestao.QTemp.SQL.Clear;
  dmGestao.QTemp.SQL.Add('select cma_codigo from comandasatend ');
  dmGestao.QTemp.SQL.Add('where prv_numero = 0');
  dmGestao.QTemp.SQL.Add('and cma_codigo = ' + IntToStr(vfNumero));
  dmGestao.QTemp.Open;
  if dmGestao.QTemp.Fields[0].IsNull then
    Result := False
  else
    Result := True;
end;

procedure AtualizaTotalAtend(vfNumComanda: Integer; vfNumAtend: Integer);
begin
  dmGestao.QTemp.Close;
  dmGestao.QTemp.SQL.Clear;
  dmGestao.QTemp.SQL.Add('select sum(cmi_vlrtotal) from comandasitens ');
  dmGestao.QTemp.SQL.Add('where prv_numero = 0');
  dmGestao.QTemp.SQL.Add('and cma_codigo = ' + IntToStr(vfNumComanda));
  dmGestao.QTemp.Open;
  FiltrarComandasAtend('cmu_codigo', '=', IntToStr(vfNumAtend), '0');
  EdtComandasAtend;
  if dmGestao.QTemp.Fields[0].IsNull then
    dmGestao.qyComandasAtendcmu_valortotal.Value := 0
  else
    dmGestao.qyComandasAtendcmu_valortotal.Value := dmGestao.QTemp.Fields[0].Value;
  PostComandasAtend;
end;

procedure AtualizaTotalCustoAtend(vfNumComanda: Integer; vfNumAtend: Integer);
begin
  dmGestao.QTemp.Close;
  dmGestao.QTemp.SQL.Clear;
  dmGestao.QTemp.SQL.Add('select sum(cmi_vlrtotcusto) from comandasitens ');
  dmGestao.QTemp.SQL.Add('where prv_numero = 0');
  dmGestao.QTemp.SQL.Add('and cma_codigo = ' + IntToStr(vfNumComanda));
  dmGestao.QTemp.Open;
  FiltrarComandasAtend('cmu_codigo', '=', IntToStr(vfNumAtend), '0');
  EdtComandasAtend;
  if dmGestao.QTemp.Fields[0].IsNull then
    dmGestao.qyComandasAtendcmu_vlrtotcusto.Value := 0
  else
    dmGestao.qyComandasAtendcmu_vlrtotcusto.Value := dmGestao.QTemp.Fields[0].Value;
  PostComandasAtend;
end;

procedure GerarDadosPV(vfNumComanda: Integer);
begin
  vgPrevenda.Numero := 0;
  vgPreVenda.Data := GetDateServerPG;
  vgPreVenda.Codcliente := 0;
  vgPreVenda.Cliente := 'VENDA AO CONSUMIDOR';
  vgPreVenda.Fone := '(00) 0000-0000';
  vgPreVenda.Codfuncionario := 0;
  vgPreVenda.Funcionario := 'NÃO DEFINIDO';
  vgPreVenda.Tabvenda := 2;
  vgPreVenda.Codprazo := 1;
  vgPreVenda.Prazo := 'À VISTA';
  vgPreVenda.Codforma := 0;
  vgPreVenda.Forma := 'DINHEIRO';
  vgPreVenda.CodEntrega := 3;
  vgPreVenda.Entrega := 'CLIENTE LEVA NA HORA';
  vgPreVenda.Referente := 'Referente Comanda: ' + FormatFloat('000', vfNumComanda);
  vgPreVenda.Obs := 'Referente Comanda: ' + FormatFloat('000', vfNumComanda);
  vgPreVenda.Vlrcusto := ComandasItensCusto(vfNumComanda);
  vgPreVenda.Subtotal := ComandasItensTotal(vfNumComanda);
  vgPreVenda.Vlrdesc := 0;
  vgPreVenda.Percdesc := 0;
  vgPreVenda.Vlrtotal := vgPreVenda.Subtotal;
  vgPreVenda.Permg := ((vgPreVenda.Vlrtotal / vgPreVenda.Vlrcusto) -1) * 100;
  vgPreVenda.Vlrlucro := vgPreVenda.Vlrtotal - vgPreVenda.Vlrcusto;
  vgPreVenda.Modfrete := 0;
  vgPreVenda.Frete := 'CIF';
  vgPreVenda.Codstatus := 1;
end;

end.
