unit uDaoLogradourostipo;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure ListarLogradourostipo(vfOrdem: String);
procedure FiltrarLogradourostipo(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);

const
ctCampos = 'TPL_CODIGO, TPL_DESCRICAO';
ctTabelas = 'LOGRADOUROSTIPO';

implementation

uses dataDiversos, uFuncoesDB;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarLogradourostipo(vfOrdem: String);
begin
  dmDiversos.qyLogradourostipo.Close;
  dmDiversos.qyLogradourostipo.SQL.Clear;
  dmDiversos.qyLogradourostipo.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  if vfOrdem <> '0' then
    dmDiversos.qyLogradourostipo.SQL.Add(' ORDER BY ' + vfOrdem);
  dmDiversos.qyLogradourostipo.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarLogradourostipo(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);
begin
  dmDiversos.qyLogradourostipo.Close;
  dmDiversos.qyLogradourostipo.SQL.Clear;
  dmDiversos.qyLogradourostipo.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmDiversos.qyLogradourostipo.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmDiversos.qyLogradourostipo.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmDiversos.qyLogradourostipo.SQL.Add(' ORDER BY ' + vfOrdem);
  dmDiversos.qyLogradourostipo.Open;
end;

end.
