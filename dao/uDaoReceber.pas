unit uDaoReceber;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassReceber;

procedure SetValuesReceber(vfReceber: TReceber);
procedure SetValuesRcto(vfReceber: TReceber);
procedure InsReceber;
procedure EdtReceber;
procedure PostReceber;
procedure DelReceber;
procedure ListarReceber(vfOrdem: String);
procedure FiltrarReceber(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);
procedure FiltrarReceberBx(vfDataInic: String; vfDataFinal: String; vfCliente: String);
procedure FiltrarConsReceber(vfDataInic: String; vfDataFinal: String; vfCliente: String; vfStatus: String);

const
ctCampos = 'r.rec_codigo, r.rec_emissao, r.rec_vencimento, p.pes_codigo, p.pes_nome, ' +
           'r.rec_numero, r.rec_serie, r.mdc_codigo, r.rec_parcela, r.rec_duplicata, ' +
           'r.rec_valor, r.rec_pago, r.rec_acrescimo, r.rec_desconto, r.rec_saldo, ' +
           'r.sta_codigo, r.frp_codigo, s.sta_descricao';
ctTabelas = 'receber r, statusmov s, pessoas p';

implementation

uses dataFinanceiro, uFuncoesDB, dataConsultas;

{--- Seta algum valor na tabela -----------------------------------------------}

procedure SetValuesReceber(vfReceber: TReceber);
begin
  if vfReceber.Codigo = 0 then
    dmFinanceiro.qyReceberrec_codigo.Value := GetCodigo('rec_codigo', 'receber')
  else
    dmFinanceiro.qyReceberrec_codigo.Value := vfReceber.Codigo;
  dmFinanceiro.qyReceberrec_emissao.Value := vfReceber.Emissao;
  dmFinanceiro.qyReceberrec_vencimento.Value := vfReceber.Vencimento;
  dmFinanceiro.qyReceberpes_codigo.Value := vfReceber.Coppessoa;
  dmFinanceiro.qyReceberrec_numero.Value := vfReceber.Numero;
  dmFinanceiro.qyReceberrec_serie.Value := vfReceber.Serie;
  dmFinanceiro.qyRecebermdc_codigo.Value := vfReceber.Codmdc;
  dmFinanceiro.qyReceberrec_parcela.Value := vfReceber.Parcela;
  dmFinanceiro.qyReceberrec_duplicata.Value := vfReceber.Duplicata;
  dmFinanceiro.qyReceberrec_valor.Value := vfReceber.Valor;
  dmFinanceiro.qyReceberrec_pago.Value := vfReceber.Pago;
  dmFinanceiro.qyReceberrec_acrescimo.Value := vfReceber.Acrescimo;
  dmFinanceiro.qyReceberrec_desconto.Value := vfReceber.Desconto;
  dmFinanceiro.qyReceberrec_saldo.Value := vfReceber.Saldo;
  dmFinanceiro.qyReceberfrp_codigo.Value := vfReceber.Codforma;
  dmFinanceiro.qyRecebersta_codigo.Value := vfReceber.Codstatus;
end;

procedure SetValuesRcto(vfReceber: TReceber);
begin
  dmFinanceiro.qyReceberrec_valor.Value := vfReceber.Valor;
  dmFinanceiro.qyReceberrec_pago.Value := vfReceber.Pago;
  dmFinanceiro.qyReceberrec_acrescimo.Value := vfReceber.Acrescimo;
  dmFinanceiro.qyReceberrec_desconto.Value := vfReceber.Desconto;
  dmFinanceiro.qyReceberrec_saldo.Value := vfReceber.Saldo;
  dmFinanceiro.qyRecebersta_codigo.Value := vfReceber.Codstatus;
end;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsReceber;
begin
  if dmFinanceiro.qyReceber.Active = false then
    dmFinanceiro.qyReceber.Active := True;
  dmFinanceiro.qyReceber.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtReceber;
begin
  dmFinanceiro.qyReceber.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostReceber;
begin
  try
    dmFinanceiro.qyReceber.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmFinanceiro.qyReceber.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelReceber;
begin
  try
    dmFinanceiro.qyReceber.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                 E.Message,mtError,[mbOk],0);
      dmFinanceiro.qyReceber.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarReceber(vfOrdem: String);
begin
  dmFinanceiro.qyReceber.Close;
  dmFinanceiro.qyReceber.SQL.Clear;
  dmFinanceiro.qyReceber.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  dmFinanceiro.qyReceber.SQL.Add(' where r.pes_codigo = p.pes_codigo ' +
                                 'and r.sta_codigo = s.sta_codigo ');
  if vfOrdem <> '0' then
    dmFinanceiro.qyReceber.SQL.Add(' order by ' + vfOrdem);
  dmFinanceiro.qyReceber.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarReceber(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmFinanceiro.qyReceber.Close;
  dmFinanceiro.qyReceber.SQL.Clear;
  dmFinanceiro.qyReceber.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmFinanceiro.qyReceber.SQL.Add(' where r.pes_codigo = p.pes_codigo ' +
                                 'and r.sta_codigo = s.sta_codigo and ');
  dmFinanceiro.qyReceber.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmFinanceiro.qyReceber.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmFinanceiro.qyReceber.SQL.Add(' order by ' + vfOrdem);
  dmFinanceiro.qyReceber.Open;
end;

procedure FiltrarReceberBx(vfDataInic: String; vfDataFinal: String; vfCliente: String);
begin
  dmFinanceiro.qyReceber.Close;
  dmFinanceiro.qyReceber.SQL.Clear;
  dmFinanceiro.qyReceber.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmFinanceiro.qyReceber.SQL.Add(' where r.pes_codigo = p.pes_codigo ' +
                                 'and r.sta_codigo = s.sta_codigo ');
  dmFinanceiro.qyReceber.SQL.Add('and r.rec_vencimento >= ' + QuotedStr(vfDataInic));
  dmFinanceiro.qyReceber.SQL.Add('and r.rec_vencimento <= ' + QuotedStr(vfDataFinal));
  if vfCliente <> '0' then
    dmFinanceiro.qyReceber.SQL.Add('and p.pes_codigo = ' + vfCliente);
  dmFinanceiro.qyReceber.SQL.Add('and r.sta_codigo = 1');
  dmFinanceiro.qyReceber.SQL.Add(' order by r.rec_vencimento');
  dmFinanceiro.qyReceber.Open;
end;

procedure FiltrarConsReceber(vfDataInic: String; vfDataFinal: String; vfCliente: String; vfStatus: String);
begin
  dmConsultas.qyConsReceber.Close;
  dmConsultas.qyConsReceber.SQL.Clear;
  dmConsultas.qyConsReceber.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmConsultas.qyConsReceber.SQL.Add(' where r.pes_codigo = p.pes_codigo ' +
                                    'and r.sta_codigo = s.sta_codigo ');
  dmConsultas.qyConsReceber.SQL.Add('and r.rec_vencimento >= ' + QuotedStr(vfDataInic));
  dmConsultas.qyConsReceber.SQL.Add('and r.rec_vencimento <= ' + QuotedStr(vfDataFinal));
  if vfCliente <> '0' then
    dmConsultas.qyConsReceber.SQL.Add('and p.pes_codigo = ' + vfCliente);
  dmConsultas.qyConsReceber.SQL.Add('and r.sta_codigo = ' + vfStatus);
  dmConsultas.qyConsReceber.SQL.Add(' order by r.rec_vencimento');
  dmConsultas.qyConsReceber.Open;
end;

end.
