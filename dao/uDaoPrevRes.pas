unit uDaoPrevRes;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassPrevRes;

procedure SetValuesPrevRes(vfPrevRes: TPrevRes);
procedure InsPrevRes;
procedure EdtPrevRes;
procedure PostPrevRes;
procedure DelPrevRes;
procedure ListarPrevRes(vfOrdem: String);
procedure FiltrarPrevRes(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
procedure FiltrarConsPrevRes(vfCampoFil: String; vfOperador: String; vfParametro:
         		     String; vfOrdem: String);
procedure ZerarPrevRes;
procedure ScriptDelPrevRes(vfCodPV: String);
function SomaProdutoRes(vfCodProduto: Integer): Real;

const
ctCampos = 'PRI_CODIGO, PRV_NUMERO, PRO_CODIGO, PRI_QUANTIDADE';
ctTabelas = 'PREVRES';

implementation

uses dataOrcamentos;

{--- Seta algum valor na tabela -----------------------------------------------}

procedure SetValuesPrevRes(vfPrevRes: TPrevRes);
begin
  dmOrcamentos.qyPrevResPRI_CODIGO.Value := vfPrevRes.Item;
  dmOrcamentos.qyPrevResPRV_NUMERO.Value := vfPrevRes.Prevenda;
  dmOrcamentos.qyPrevResPRO_CODIGO.Value := vfPrevRes.Produto;
  dmOrcamentos.qyPrevResPRI_QUANTIDADE.Value := vfPrevRes.Quantidade;
end;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsPrevRes;
begin
  if dmOrcamentos.qyPrevRes.Active = false then
    dmOrcamentos.qyPrevRes.Active := True;
  dmOrcamentos.qyPrevRes.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtPrevRes;
begin
  dmOrcamentos.qyPrevRes.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostPrevRes;
begin
  try
    dmOrcamentos.qyPrevRes.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmOrcamentos.qyPrevRes.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelPrevRes;
begin
  try
    dmOrcamentos.qyPrevRes.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                  E.Message,mtError,[mbOk],0);
      dmOrcamentos.qyPrevRes.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarPrevRes(vfOrdem: String);
begin
  dmOrcamentos.qyPrevRes.Close;
  dmOrcamentos.qyPrevRes.SQL.Clear;
  dmOrcamentos.qyPrevRes.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  if vfOrdem <> '0' then
    dmOrcamentos.qyPrevRes.SQL.Add(' ORDER BY ' + vfOrdem);
  dmOrcamentos.qyPrevRes.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarPrevRes(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmOrcamentos.qyPrevRes.Close;
  dmOrcamentos.qyPrevRes.SQL.Clear;
  dmOrcamentos.qyPrevRes.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmOrcamentos.qyPrevRes.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmOrcamentos.qyPrevRes.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmOrcamentos.qyPrevRes.SQL.Add(' ORDER BY ' + vfOrdem);
  dmOrcamentos.qyPrevRes.Open;
end;

{--- Filtra registros da tabela (Consulta Produto ) ---------------------------}

procedure FiltrarConsPrevRes(vfCampoFil: String; vfOperador: String; vfParametro:
         		     String; vfOrdem: String);
begin
  dmOrcamentos.qyConsPrevRes.Close;
  dmOrcamentos.qyConsPrevRes.SQL.Clear;
  dmOrcamentos.qyConsPrevRes.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmOrcamentos.qyConsPrevRes.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmOrcamentos.qyConsPrevRes.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmOrcamentos.qyConsPrevRes.SQL.Add(' ORDER BY ' + vfOrdem);
  dmOrcamentos.qyConsPrevRes.Open;
end;

procedure ZerarPrevRes;
begin
  dmOrcamentos.qyPrevResPRI_QUANTIDADE.Value := 0;
end;

procedure ScriptDelPrevRes(vfCodPV: String);
begin
  dmOrcamentos.ScriptDelPrevRes.SQL.Clear;
  dmOrcamentos.ScriptDelPrevRes.SQL.Add('delete from prevres ');
  dmOrcamentos.ScriptDelPrevRes.SQL.Add('where prv_numero = ' + vfCodPV);
  dmOrcamentos.ScriptDelPrevRes.ExecSQL;
end;

function SomaProdutoRes(vfCodProduto: Integer): Real;
begin
  dmOrcamentos.qySomaProdutoRes.Close;
  dmOrcamentos.qySomaProdutoRes.SQL.Clear;
  dmOrcamentos.qySomaProdutoRes.SQL.Add('SELECT SUM(PRI_QUANTIDADE) FROM PREVRES ');
  dmOrcamentos.qySomaProdutoRes.SQL.Add('WHERE PRO_CODIGO = ' + IntToStr(vfCodProduto));
  dmOrcamentos.qySomaProdutoRes.Open;
  if dmOrcamentos.qySomaProdutoResSUM.IsNull then
    Result := 0
  else
    Result := dmOrcamentos.qySomaProdutoResSUM.Value;
end;

end.
