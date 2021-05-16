unit uDaoContas;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure ListarContas(vfOrdem: String);
procedure FiltrarContas(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
function GetDescConta(vfCodConta: Integer): String;

const
ctCampos = 'C.CON_CODIGO, C.CON_DESCRICAO, C.BAN_CODIGO, B.BAN_DESCRICAO, C.CON_ATIVA';
ctTabelas = 'CONTAS C, BANCOS B';

implementation

uses dataCadastros;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarContas(vfOrdem: String);
begin
  dmCadastros.qyContas.Close;
  dmCadastros.qyContas.SQL.Clear;
  dmCadastros.qyContas.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyContas.SQL.Add(' WHERE C.BAN_CODIGO = B.BAN_CODIGO AND C.CON_CODIGO > 0 ');
  if vfOrdem <> '0' then
    dmCadastros.qyContas.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyContas.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarContas(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmCadastros.qyContas.Close;
  dmCadastros.qyContas.SQL.Clear;
  dmCadastros.qyContas.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyContas.SQL.Add(' WHERE C.BAN_CODIGO = B.BAN_CODIGO AND C.CON_CODIGO > 0 AND ');
  dmCadastros.qyContas.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qyContas.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmCadastros.qyContas.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyContas.Open;
end;

function GetDescConta(vfCodConta: Integer): String;
begin
  dmCadastros.QTemp.Close;
  dmCadastros.QTemp.SQL.Clear;
  dmCadastros.QTemp.SQL.Add('select con_descricao from contas ');
  dmCadastros.QTemp.SQL.Add('where con_codigo = ' + IntToStr(vfCodConta));
  dmCadastros.QTemp.Open;
  if dmCadastros.QTemp.Fields[0].IsNull then
    Result := ''
  else
    Result := dmCadastros.QTemp.Fields[0].Text;
end;

end.
