unit uDaoPrazosFrp;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure InsPrazosFrp;
procedure EdtPrazosFrp;
procedure PostPrazosFrp;
procedure DelPrazosFrp;
procedure ListarPrazosFrp(vfOrdem: String);
procedure FiltrarPrazosFrp(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);

const
ctCampos = 'p.prz_codigo, p.frp_codigo, f.frp_descricao';
ctTabelas = 'prazosfrp p, formpag f';

implementation

uses dataFinanceiro;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsPrazosFrp;
begin
  if dmFinanceiro.qyPrazosFrp.Active = false then
    dmFinanceiro.qyPrazosFrp.Active := True;
  dmFinanceiro.qyPrazosFrp.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtPrazosFrp;
begin
  dmFinanceiro.qyPrazosFrp.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostPrazosFrp;
begin
  try
    dmFinanceiro.qyPrazosFrp.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmFinanceiro.qyPrazosFrp.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelPrazosFrp;
begin
  try
    dmFinanceiro.qyPrazosFrp.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                 E.Message,mtError,[mbOk],0);
      dmFinanceiro.qyPrazosFrp.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarPrazosFrp(vfOrdem: String);
begin
  dmFinanceiro.qyPrazosFrp.Close;
  dmFinanceiro.qyPrazosFrp.SQL.Clear;
  dmFinanceiro.qyPrazosFrp.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  dmFinanceiro.qyPrazosFrp.SQL.Add(' where p.frp_codigo = f.frp_codigo ');
  if vfOrdem <> '0' then
    dmFinanceiro.qyPrazosFrp.SQL.Add(' order by ' + vfOrdem);
  dmFinanceiro.qyPrazosFrp.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarPrazosFrp(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);
begin
  dmFinanceiro.qyPrazosFrp.Close;
  dmFinanceiro.qyPrazosFrp.SQL.Clear;
  dmFinanceiro.qyPrazosFrp.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmFinanceiro.qyPrazosFrp.SQL.Add(' where p.frp_codigo = f.frp_codigo and ');
  dmFinanceiro.qyPrazosFrp.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmFinanceiro.qyPrazosFrp.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmFinanceiro.qyPrazosFrp.SQL.Add(' order by ' + vfOrdem);
  dmFinanceiro.qyPrazosFrp.Open;
end;

end.
