unit uDaoEnderecostipo;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure ListarEnderecostipo(vfOrdem: String);
procedure FiltrarEnderecostipo(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);

const
ctCampos = 'TPE_CODIGO, TPE_DESCRICAO';
ctTabelas = 'ENDERECOSTIPO';

implementation

uses dataDiversos;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarEnderecostipo(vfOrdem: String);
begin
  dmDiversos.qyEnderecostipo.Close;
  dmDiversos.qyEnderecostipo.SQL.Clear;
  dmDiversos.qyEnderecostipo.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  if vfOrdem <> '0' then
    dmDiversos.qyEnderecostipo.SQL.Add(' ORDER BY ' + vfOrdem);
  dmDiversos.qyEnderecostipo.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarEnderecostipo(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmDiversos.qyEnderecostipo.Close;
  dmDiversos.qyEnderecostipo.SQL.Clear;
  dmDiversos.qyEnderecostipo.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmDiversos.qyEnderecostipo.SQL.Add(' WHERE ');
  dmDiversos.qyEnderecostipo.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmDiversos.qyEnderecostipo.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmDiversos.qyEnderecostipo.SQL.Add(' ORDER BY ' + vfOrdem);
  dmDiversos.qyEnderecostipo.Open;
end;

end.
