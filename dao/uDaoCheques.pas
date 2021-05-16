unit uDaoCheques;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassCheques;

procedure SetValuesCheques(vfCheques: TCheques);
procedure InsCheques;
procedure EdtCheques;
procedure PostCheques;
procedure DelCheques;
procedure ListarCheques(vfOrdem: String);
procedure FiltrarCheques(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
procedure ConsCheques(vfDataInic: String; vfDataFinal: String; vfCliente: String; vfStatus: String);
procedure SetDtVenc(vfDataVenc: TDate);
procedure SetStatusChq(vfCodStatus: Integer);

const
ctCampos = 'c.chq_lancamento, c.ban_codigo, c.chq_agencia, c.chq_conta, ' +
           'c.chq_cheque, c.chq_valor, c.chq_documento, c.chq_titular, ' +
           'c.chq_datalanc, c.chq_vencimento, c.pes_codigo, c.chq_endosso, ' +
           'c.chq_telefone, c.chq_destino, c.cai_codigo, c.sta_codigo, s.sta_descricao';
ctTabelas = 'cheques c, statusmov s';

implementation

uses dataFinanceiro, dataConsultas, uFuncoesDB;

{--- Seta algum valor na tabela -----------------------------------------------}

procedure SetValuesCheques(vfCheques: TCheques);
begin
  if vfCheques.Lancamento = 0 then
    dmFinanceiro.qyChequeschq_lancamento.Value := GetCodigo('chq_lancamento', 'cheques')
  else
    dmFinanceiro.qyChequeschq_lancamento.Value := vfCheques.Lancamento;
  dmFinanceiro.qyChequesban_codigo.Value := vfCheques.Banco;
  dmFinanceiro.qyChequeschq_agencia.Value := vfCheques.Agencia;
  dmFinanceiro.qyChequeschq_conta.Value := vfCheques.Conta;
  dmFinanceiro.qyChequeschq_cheque.Value := vfCheques.Cheque;
  dmFinanceiro.qyChequeschq_valor.Value := vfCheques.Valor;
  dmFinanceiro.qyChequeschq_documento.Value := vfCheques.Documento;
  dmFinanceiro.qyChequeschq_titular.Value := vfCheques.Titular;
  dmFinanceiro.qyChequeschq_datalanc.Value := vfCheques.Datalanc;
  dmFinanceiro.qyChequeschq_vencimento.Value := vfCheques.Vencimento;
  dmFinanceiro.qyChequespes_codigo.Value := vfCheques.Codpessoa;
  dmFinanceiro.qyChequeschq_endosso.Value := vfCheques.Endosso;
  dmFinanceiro.qyChequeschq_telefone.Value := vfCheques.Telefone;
  if vfCheques.Destino <> '0' then
    dmFinanceiro.qyChequeschq_destino.Value := vfCheques.Destino;
  if vfCheques.Codcaixa <> 0 then
    dmFinanceiro.qyChequescai_codigo.Value := vfCheques.Codcaixa;
  dmFinanceiro.qyChequessta_codigo.Value := vfCheques.Codstatus;
end;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsCheques;
begin
  if dmFinanceiro.qyCheques.Active = false then
    dmFinanceiro.qyCheques.Active := True;
  dmFinanceiro.qyCheques.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtCheques;
begin
  dmFinanceiro.qyCheques.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostCheques;
begin
  try
    dmFinanceiro.qyCheques.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmFinanceiro.qyCheques.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelCheques;
begin
  try
    dmFinanceiro.qyCheques.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                 E.Message,mtError,[mbOk],0);
      dmFinanceiro.qyCheques.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarCheques(vfOrdem: String);
begin
  dmFinanceiro.qyCheques.Close;
  dmFinanceiro.qyCheques.SQL.Clear;
  dmFinanceiro.qyCheques.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  dmFinanceiro.qyCheques.SQL.Add(' where c.sta_codigo = s.sta_codigo ');
  if vfOrdem <> '0' then
    dmFinanceiro.qyCheques.SQL.Add(' order by ' + vfOrdem);
  dmFinanceiro.qyCheques.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarCheques(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmFinanceiro.qyCheques.Close;
  dmFinanceiro.qyCheques.SQL.Clear;
  dmFinanceiro.qyCheques.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmFinanceiro.qyCheques.SQL.Add(' where c.sta_codigo = s.sta_codigo and ');
  dmFinanceiro.qyCheques.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmFinanceiro.qyCheques.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmFinanceiro.qyCheques.SQL.Add(' order by ' + vfOrdem);
  dmFinanceiro.qyCheques.Open;
end;

procedure ConsCheques(vfDataInic: String; vfDataFinal: String; vfCliente: String; vfStatus: String);
begin
  dmConsultas.qyConsCheques.Close;
  dmConsultas.qyConsCheques.SQL.Clear;
  dmConsultas.qyConsCheques.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmConsultas.qyConsCheques.SQL.Add(' where c.sta_codigo = s.sta_codigo ');
  dmConsultas.qyConsCheques.SQL.Add('and c.chq_vencimento >= ' + QuotedStr(vfDataInic));
  dmConsultas.qyConsCheques.SQL.Add('and c.chq_vencimento <= ' + QuotedStr(vfDataFinal));
  if vfCliente <> '0' then
    dmConsultas.qyConsCheques.SQL.Add('and c.pes_codigo = ' + vfCliente);
  if vfStatus <> '0' then
    dmConsultas.qyConsCheques.SQL.Add('and c.sta_codigo = ' + vfStatus);
  dmConsultas.qyConsCheques.SQL.Add(' order by chq_vencimento');
  dmConsultas.qyConsCheques.Open;
end;

procedure SetDtVenc(vfDataVenc: TDate);
begin
  dmFinanceiro.qyChequeschq_vencimento.Value := vfDataVenc;
end;

procedure SetStatusChq(vfCodStatus: Integer);
begin
  dmFinanceiro.qyChequessta_codigo.Value := 3;
end;

end.
