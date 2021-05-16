unit uDaoUf;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure ListarUf(vfOrdem: String);
procedure FiltrarUf(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
function GetCodUf(vfUf: String): String;
function GetPercInt(vfUf: String): Real;
function GetCodPais(vfUf: String): Integer;

const
ctCampos = 'u.uf_sigla, u.uf_estado, u.uf_codigo, u.pai_codigo, p.pai_pais, u.uf_icmsint';
ctTabelas = 'uf u, pais p';

implementation

uses dataDiversos;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarUf(vfOrdem: String);
begin
  dmDiversos.qyUf.Close;
  dmDiversos.qyUf.SQL.Clear;
  dmDiversos.qyUf.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  dmDiversos.qyUf.SQL.Add(' where u.pai_codigo = p.pai_codigo ');
  if vfOrdem <> '0' then
    dmDiversos.qyUf.SQL.Add(' order by ' + vfOrdem);
  dmDiversos.qyUf.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarUf(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmDiversos.qyUf.Close;
  dmDiversos.qyUf.SQL.Clear;
  dmDiversos.qyUf.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  dmDiversos.qyUf.SQL.Add(' where u.pai_codigo = p.pai_codigo and ');
  dmDiversos.qyUf.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmDiversos.qyUf.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmDiversos.qyUf.SQL.Add(' order by ' + vfOrdem);
  dmDiversos.qyUf.Open;
end;

function GetCodUf(vfUf: String): String;
begin
  dmDiversos.QTemp.Close;
  dmDiversos.QTemp.SQL.Clear;
  dmDiversos.QTemp.SQL.Add('select uf_codigo from uf where uf_sigla = ' +
                           QuotedStr(vfUf));
  dmDiversos.QTemp.Open;
  Result := dmDiversos.QTemp.Fields[0].Text;
end;

function GetPercInt(vfUf: String): Real;
begin
  FiltrarUf('u.uf_sigla', '=', vfUf, '0');
  Result := dmDiversos.qyUfuf_icmsint.Value;
end;

function GetCodPais(vfUf: String): Integer;
begin
  dmDiversos.QTemp.Close;
  dmDiversos.QTemp.SQL.Clear;
  dmDiversos.QTemp.SQL.Add('select pai_codigo from uf where uf_sigla = ' +
                           QuotedStr(vfUf));
  dmDiversos.QTemp.Open;
  Result := dmDiversos.QTemp.Fields[0].Value;
end;

end.
