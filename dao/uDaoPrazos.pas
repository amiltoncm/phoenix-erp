unit uDaoPrazos;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure InsPrazos;
procedure EdtPrazos;
procedure PostPrazos;
procedure ListarPrazos(vfOrdem: String);
procedure FiltrarPrazos(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
function GetIndPag(vfCodPag: Integer): Integer;
function GetNumParc(vfCodPrazo: Integer): Integer;
function GetInterval(vfCodPrazo: Integer): Integer;
function GetDescPrazos(vfCodPrazo: Integer): String;
function GetJurosPrz(vfCodPrazo: Integer): Real;

const
ctCampos = 'prz_codigo, prz_descricao, prz_parcelas, prz_juros, prz_indpag, prz_periodo';
ctTabelas = 'prazos';

implementation

uses dataFinanceiro;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsPrazos;
begin
  if dmFinanceiro.qyPrazos.Active = false then
    dmFinanceiro.qyPrazos.Active := True;
  dmFinanceiro.qyPrazos.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtPrazos;
begin
  dmFinanceiro.qyPrazos.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostPrazos;
begin
  try
    dmFinanceiro.qyPrazos.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmFinanceiro.qyPrazos.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarPrazos(vfOrdem: String);
begin
  dmFinanceiro.qyPrazos.Close;
  dmFinanceiro.qyPrazos.SQL.Clear;
  dmFinanceiro.qyPrazos.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmFinanceiro.qyPrazos.SQL.Add('WHERE PRZ_CODIGO > 0');
  if vfOrdem <> '0' then
    dmFinanceiro.qyPrazos.SQL.Add(' ORDER BY ' + vfOrdem);
  dmFinanceiro.qyPrazos.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarPrazos(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmFinanceiro.qyPrazos.Close;
  dmFinanceiro.qyPrazos.SQL.Clear;
  dmFinanceiro.qyPrazos.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmFinanceiro.qyPrazos.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmFinanceiro.qyPrazos.SQL.Add(QuotedStr(vfParametro));
  dmFinanceiro.qyPrazos.SQL.Add('AND PRZ_CODIGO > 0');
  if vfOrdem <> '0' then
    dmFinanceiro.qyPrazos.SQL.Add(' ORDER BY ' + vfOrdem);
  dmFinanceiro.qyPrazos.Open;
end;

function GetIndPag(vfCodPag: Integer): Integer;
begin
  dmFinanceiro.QTemp.Close;
  dmFinanceiro.QTemp.SQL.Clear;
  dmFinanceiro.QTemp.SQL.Add('select prz_indpag from prazos ');
  dmFinanceiro.QTemp.SQL.Add('where prz_codigo = ' + IntToStr(vfCodPag));
  dmFinanceiro.QTemp.Open;
  Result := dmFinanceiro.QTemp.Fields[0].Value;
end;

function GetNumParc(vfCodPrazo: Integer): Integer;
begin
  dmFinanceiro.QTemp.Close;
  dmFinanceiro.QTemp.SQL.Clear;
  dmFinanceiro.QTemp.SQL.Add('select prz_parcelas from prazos ');
  dmFinanceiro.QTemp.SQL.Add('where prz_codigo = ' + IntToStr(vfCodPrazo));
  dmFinanceiro.QTemp.Open;
  Result := dmFinanceiro.QTemp.Fields[0].Value;
end;

function GetInterval(vfCodPrazo: Integer): Integer;
begin
  dmFinanceiro.QTemp.Close;
  dmFinanceiro.QTemp.SQL.Clear;
  dmFinanceiro.QTemp.SQL.Add('select prz_periodo from prazos ');
  dmFinanceiro.QTemp.SQL.Add('where prz_codigo = ' + IntToStr(vfCodPrazo));
  dmFinanceiro.QTemp.Open;
  Result := dmFinanceiro.QTemp.Fields[0].Value;
end;

function GetDescPrazos(vfCodPrazo: Integer): String;
Var
vResult: String;
begin
  dmFinanceiro.QTemp.Close;
  dmFinanceiro.QTemp.SQL.Clear;
  dmFinanceiro.QTemp.SQL.Add('select prz_descricao from prazos ');
  dmFinanceiro.QTemp.SQL.Add('where prz_codigo = ' + IntToStr(vfCodPrazo));
  dmFinanceiro.QTemp.Open;
  if dmFinanceiro.QTemp.Fields[0].IsNull then
    vResult := 'Forma de pagamento não encontrada - (' + IntToStr(vfCodPrazo) + ')'
  else
    vResult := dmFinanceiro.QTemp.Fields[0].Text;
  Result := vResult;
end;

function GetJurosPrz(vfCodPrazo: Integer): Real;
begin
  dmFinanceiro.QTemp.Close;
  dmFinanceiro.QTemp.SQL.Clear;
  dmFinanceiro.QTemp.SQL.Add('select prz_juros from prazos ');
  dmFinanceiro.QTemp.SQL.Add('where prz_codigo = ' + IntToStr(vfCodPrazo));
  dmFinanceiro.QTemp.Open;
  Result := dmFinanceiro.QTemp.Fields[0].Value;
end;

end.
