unit uDaoCidades;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure ListarCidades(vfOrdem: String);
procedure FiltrarCidades(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
function GetDescCidade(vfCodigo: String): String;
function GetCodCidade(vfCidade: String; vfUf: String): String;

const
ctCampos = 'C.CID_CODIGO, C.CID_MUNICIPIO, C.UF_SIGLA, C.CID_CEPPADRAO, U.UF_ESTADO';
ctTabelas = 'CIDADES C, UF U';

implementation

uses dataCadastros;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarCidades(vfOrdem: String);
begin
  dmCadastros.qyCidades.Close;
  dmCadastros.qyCidades.SQL.Clear;
  dmCadastros.qyCidades.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyCidades.SQL.Add(' WHERE C.UF_SIGLA = U.UF_SIGLA ');
  if vfOrdem <> '0' then
    dmCadastros.qyCidades.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyCidades.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarCidades(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmCadastros.qyCidades.Close;
  dmCadastros.qyCidades.SQL.Clear;
  dmCadastros.qyCidades.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmCadastros.qyCidades.SQL.Add(' WHERE C.UF_SIGLA = U.UF_SIGLA AND ');
  dmCadastros.qyCidades.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qyCidades.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmCadastros.qyCidades.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyCidades.Open;
end;

function GetDescCidade(vfCodigo: String): String;
begin
  dmCadastros.QTemp.Close;
  dmCadastros.QTemp.SQL.Clear;
  dmCadastros.QTemp.SQL.Add('SELECT CID_MUNICIPIO FROM CIDADES ');
  dmCadastros.QTemp.SQL.Add('WHERE CID_CODIGO = ' + vfCodigo);
  dmCadastros.QTemp.Open;
  Result := dmCadastros.QTemp.Fields[0].Text;
end;

function GetCodCidade(vfCidade: String; vfUf: String): String;
begin
  dmCadastros.QTemp.Close;
  dmCadastros.QTemp.SQL.Clear;
  dmCadastros.QTemp.SQL.Add('SELECT CID_CODIGO FROM CIDADES WHERE CID_MUNICIPIO = ' +  QuotedStr(UpperCase(vfCidade)));
  dmCadastros.QTemp.SQL.Add('AND UF_SIGLA = ' + QuotedStr(vfUf));
  dmCadastros.QTemp.Open;
  Result := dmCadastros.QTemp.Fields[0].Text;
end;

end.
