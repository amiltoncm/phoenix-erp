unit uDaoOrcLivre;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure InsOrcLivre;
procedure EdtOrcLivre;
procedure PostOrcLivre;
procedure DelOrcLivre;
procedure ListarOrcLivre(vfOrdem: String);
procedure FiltrarOrcLivre(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
procedure SetClienteORL(vfCod: Integer; vfNome: String);
procedure SetProjetoORL(vfCod: Integer; vfProjeto: String);
procedure AtualizaTotalORL(vfNumOrc: Integer);
procedure SetStatusOrcL(vfStatus: Integer);

const
ctCampos = 'O.ORL_NUMERO, O.ORL_DATA, O.PES_CODIGO, O.ORL_CLIENTE, O.PRJ_CODIGO, J.PRJ_DESCRICAO, ' +
           'O.ORL_CONTATO, O.FUN_CODIGO, F.FUN_NOME, O.ORL_TABVENDA, O.ORL_REFERENTE, O.ORL_OBS, ' +
           'O.ORL_VLRCUSTO, O.ORL_SUBTOTAL, O.ORL_VLRDESC, O.ORL_PERCDESC, O.ORL_VLRTOTAL, ' +
           'O.ORL_PERCMG, O.ORL_VLRLUCRO, O.ORL_VALIDADE, O.PRZ_CODIGO, Z.PRZ_DESCRICAO, ' +
           'O.FRP_CODIGO, M.FRP_DESCRICAO, O.MDF_CODIGO, R.MDF_DESCRICAO, O.ORL_ENTREGA, O.ORL_FONE, O.STO_CODIGO ';
ctTabelas = 'ORCLIVRE O, PROJETOS J, FUNCIONARIOS F, PRAZOS Z, FORMPAG M, MODFRETE R';

implementation

uses dataOrcamentos, uFuncoesDB;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsOrcLivre;
begin
  if dmOrcamentos.qyOrcLivre.Active = false then
    dmOrcamentos.qyOrcLivre.Active := True;
  dmOrcamentos.qyOrcLivre.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtOrcLivre;
begin
  dmOrcamentos.qyOrcLivre.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostOrcLivre;
begin
  try
    if dmOrcamentos.qyOrcLivre.State in [dsInsert] then
      dmOrcamentos.qyOrcLivreORL_NUMERO.Value := GetCodigo('ORL_NUMERO', 'ORCLIVRE');
    dmOrcamentos.qyOrcLivre.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmOrcamentos.qyOrcLivre.Refresh;
    end;
  end;
end;

procedure DelOrcLivre;
begin
  try
    dmOrcamentos.qyOrcLivre.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmOrcamentos.qyOrcLivre.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarOrcLivre(vfOrdem: String);
begin
  dmOrcamentos.qyOrcLivre.Close;
  dmOrcamentos.qyOrcLivre.SQL.Clear;
  dmOrcamentos.qyOrcLivre.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmOrcamentos.qyOrcLivre.SQL.Add('WHERE O.PRJ_CODIGO = J.PRJ_CODIGO ' +
                                  'AND O.FUN_CODIGO = F.FUN_CODIGO ' +
                                  'AND O.PRZ_CODIGO = Z.PRZ_CODIGO ' +
                                  'AND O.FRP_CODIGO = M.FRP_CODIGO ' +
                                  'AND O.MDF_CODIGO = R.MDF_CODIGO ');
  if vfOrdem <> '0' then
    dmOrcamentos.qyOrcLivre.SQL.Add(' ORDER BY ' + vfOrdem);
  dmOrcamentos.qyOrcLivre.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarOrcLivre(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmOrcamentos.qyOrcLivre.Close;
  dmOrcamentos.qyOrcLivre.SQL.Clear;
  dmOrcamentos.qyOrcLivre.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmOrcamentos.qyOrcLivre.SQL.Add('WHERE O.PRJ_CODIGO = J.PRJ_CODIGO ' +
                                  'AND O.FUN_CODIGO = F.FUN_CODIGO ' +
                                  'AND O.PRZ_CODIGO = Z.PRZ_CODIGO ' +
                                  'AND O.FRP_CODIGO = M.FRP_CODIGO ' +
                                  'AND O.MDF_CODIGO = R.MDF_CODIGO AND ');
  dmOrcamentos.qyOrcLivre.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmOrcamentos.qyOrcLivre.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmOrcamentos.qyOrcLivre.SQL.Add(' ORDER BY ' + vfOrdem);
  dmOrcamentos.qyOrcLivre.Open;
end;

procedure SetClienteORL(vfCod: Integer; vfNome: String);
begin
  dmOrcamentos.qyOrcLivrePES_CODIGO.Value := vfCod;
  dmOrcamentos.qyOrcLivreORL_CLIENTE.Text := vfNome;
end;

procedure SetProjetoORL(vfCod: Integer; vfProjeto: String);
begin
  dmOrcamentos.qyOrcLivrePRJ_CODIGO.Value := vfCod;
  dmOrcamentos.qyOrcLivrePRJ_DESCRICAO.Value := vfProjeto;
end;

procedure AtualizaTotalORL(vfNumOrc: Integer);
Var
vMargem, vLucro: Real;
begin
  dmOrcamentos.qyAtualizaTotalORL.Close;
  dmOrcamentos.qyAtualizaTotalORL.SQL.Clear;
  dmOrcamentos.qyAtualizaTotalORL.SQL.Add('SELECT SUM(ORI_VLRCUSTO * ORI_QUANTIDADE) AS TOTCUSTO,');
  dmOrcamentos.qyAtualizaTotalORL.SQL.Add('SUM(ORI_VLRTOTAL) AS TOTAL');
  dmOrcamentos.qyAtualizaTotalORL.SQL.Add('FROM ORCLIVREITENS WHERE ORL_NUMERO = ' + IntToStr(vfNumOrc));
  dmOrcamentos.qyAtualizaTotalORL.Open;
  if dmOrcamentos.qyAtualizaTotalORLTOTCUSTO.Value <> 0 then
  begin
    vMargem := ((((dmOrcamentos.qyAtualizaTotalORLTOTCUSTO.Value /
               dmOrcamentos.qyAtualizaTotalORLTOTAL.Value) - 1) * 100) * -1);

  end
  else
    vMargem := 100;
  vLucro := dmOrcamentos.qyAtualizaTotalORLTOTAL.Value - dmOrcamentos.qyAtualizaTotalORLTOTCUSTO.Value;
  EdtOrcLivre;
  dmOrcamentos.qyOrcLivreORL_VLRCUSTO.Value := dmOrcamentos.qyAtualizaTotalORLTOTCUSTO.Value;
  dmOrcamentos.qyOrcLivreORL_SUBTOTAL.Value := dmOrcamentos.qyAtualizaTotalORLTOTAL.Value;
  dmOrcamentos.qyOrcLivreORL_VLRTOTAL.Value := dmOrcamentos.qyAtualizaTotalORLTOTAL.Value;
  dmOrcamentos.qyOrcLivreORL_VLRDESC.Value := 0;
  dmOrcamentos.qyOrcLivreORL_PERCDESC.Value := 0;
  dmOrcamentos.qyOrcLivreORL_PERCMG.Value := vMargem;
  dmOrcamentos.qyOrcLivreORL_VLRLUCRO.Value := vLucro;
  PostOrcLivre;
end;

procedure SetStatusOrcL(vfStatus: Integer);
begin
  EdtOrcLivre;
  dmOrcamentos.qyOrcLivreSTO_CODIGO.Value := vfStatus;
  PostOrcLivre;
end;

end.
