unit uDaoPais;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure ListarPais(vfOrdem: String);
procedure FiltrarPais(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
function GetNamePais(vfCodPais: Integer): String;

const
ctCampos = 'pai_codigo, pai_pais, pai_alpha3';
ctTabelas = 'pais';

implementation

uses dataDiversos;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarPais(vfOrdem: String);
begin
  dmDiversos.qyPais.Close;
  dmDiversos.qyPais.SQL.Clear;
  dmDiversos.qyPais.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  if vfOrdem <> '0' then
    dmDiversos.qyPais.SQL.Add(' ORDER BY ' + vfOrdem);
  dmDiversos.qyPais.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarPais(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);
begin
  dmDiversos.qyPais.Close;
  dmDiversos.qyPais.SQL.Clear;
  dmDiversos.qyPais.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmDiversos.qyPais.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmDiversos.qyPais.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmDiversos.qyPais.SQL.Add(' ORDER BY ' + vfOrdem);
  dmDiversos.qyPais.Open;
end;

function GetNamePais(vfCodPais: Integer): String;
begin
  dmDiversos.QTemp.Close;
  dmDiversos.QTemp.SQL.Clear;
  dmDiversos.QTemp.SQL.Add('select pai_pais from pais ');
  dmDiversos.QTemp.SQL.Add('where pai_codigo = ' + IntToStr(vfCodPais));
  dmDiversos.QTemp.Open;
  Result := dmDiversos.QTemp.Fields[0].Text;
end;

end.
