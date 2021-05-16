unit uDaoFormpag;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure InsFormpag;
procedure EdtFormpag;
procedure PostFormpag;
procedure ListarFormpag(vfOrdem: String);
procedure FiltrarFormpag(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
function GetTPag(vfCodigo: Integer): Integer;
function GetDescFormpag(vfCodigo: Integer): String;
function GetContaCred(vfCodigo: Integer): Integer;
function GetIntervCred(vfCodigo: Integer): Integer;

const
ctCampos = 'frp_codigo, frp_descricao, frp_tpag, frp_ativo, con_codigo, frp_dias';
ctTabelas = 'formpag';

implementation

uses dataFinanceiro;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsFormpag;
begin
  if dmFinanceiro.qyFormpag.Active = false then
    dmFinanceiro.qyFormpag.Active := True;
  dmFinanceiro.qyFormpag.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtFormpag;
begin
  dmFinanceiro.qyFormpag.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostFormpag;
begin
  try
    //if dmFinanceiro.qyFormpag.State in [dsInsert] then
      //dmFinanceiro.qyFormpagFRP_CODIGO.Value := GetCodigo('FRP_CODIGO', 'Formpag');
    dmFinanceiro.qyFormpag.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmFinanceiro.qyFormpag.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarFormpag(vfOrdem: String);
begin
  dmFinanceiro.qyFormpag.Close;
  dmFinanceiro.qyFormpag.SQL.Clear;
  dmFinanceiro.qyFormpag.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmFinanceiro.qyFormpag.SQL.Add('WHERE FRP_CODIGO >= 0 ');
  if vfOrdem <> '0' then
    dmFinanceiro.qyFormpag.SQL.Add(' ORDER BY ' + vfOrdem);
  dmFinanceiro.qyFormpag.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarFormpag(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmFinanceiro.qyFormpag.Close;
  dmFinanceiro.qyFormpag.SQL.Clear;
  dmFinanceiro.qyFormpag.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmFinanceiro.qyFormpag.SQL.Add(' WHERE FRP_CODIGO >= 0 AND ');
  dmFinanceiro.qyFormpag.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmFinanceiro.qyFormpag.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmFinanceiro.qyFormpag.SQL.Add(' ORDER BY ' + vfOrdem);
  dmFinanceiro.qyFormpag.Open;
end;

function GetTPag(vfCodigo: Integer): Integer;
begin
  dmFinanceiro.QTemp.Close;
  dmFinanceiro.QTemp.SQL.Clear;
  dmFinanceiro.QTemp.SQL.Add('select frp_tpag from formpag ');
  dmFinanceiro.QTemp.SQL.Add('where frp_codigo = ' + IntToStr(vfCodigo));
  dmFinanceiro.QTemp.Open;
  if dmFinanceiro.QTemp.Fields[0].IsNull then
    Result := 0
  else
    Result := dmFinanceiro.QTemp.Fields[0].Value;
end;

function GetDescFormpag(vfCodigo: Integer): String;
Var
vResult: String;
begin
  dmFinanceiro.QTemp.Close;
  dmFinanceiro.QTemp.SQL.Clear;
  dmFinanceiro.QTemp.SQL.Add('select frp_descricao from formpag ');
  dmFinanceiro.QTemp.SQL.Add('where frp_codigo = ' + IntToStr(vfCodigo));
  dmFinanceiro.QTemp.Open;
  if dmFinanceiro.QTemp.Fields[0].IsNull then
    vResult := 'Forma de pagamento não encontrada - (' + IntToStr(vfCodigo) + ')'
  else
    vResult := dmFinanceiro.QTemp.Fields[0].Text;
  Result := vResult;
end;

function GetContaCred(vfCodigo: Integer): Integer;
Var
vResult: Integer;
begin
  dmFinanceiro.QTemp.Close;
  dmFinanceiro.QTemp.SQL.Clear;
  dmFinanceiro.QTemp.SQL.Add('select con_codigo from formpag ');
  dmFinanceiro.QTemp.SQL.Add('where frp_codigo = ' + IntToStr(vfCodigo));
  dmFinanceiro.QTemp.Open;
  if dmFinanceiro.QTemp.Fields[0].IsNull then
    vResult := 0
  else
    vResult := dmFinanceiro.QTemp.Fields[0].Value;
  Result := vResult;
end;

function GetIntervCred(vfCodigo: Integer): Integer;
Var
vResult: Integer;
begin
  dmFinanceiro.QTemp.Close;
  dmFinanceiro.QTemp.SQL.Clear;
  dmFinanceiro.QTemp.SQL.Add('select frp_dias from formpag ');
  dmFinanceiro.QTemp.SQL.Add('where frp_codigo = ' + IntToStr(vfCodigo));
  dmFinanceiro.QTemp.Open;
  if dmFinanceiro.QTemp.Fields[0].IsNull then
    vResult := 0
  else
    vResult := dmFinanceiro.QTemp.Fields[0].Value;
  Result := vResult;
end;


end.
