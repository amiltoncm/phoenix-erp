unit uDaoSetor;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure ListarSetor(vfOrdem: String);
procedure FiltrarSetor(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);

const
ctCampos = 'SET_CODIGO, SET_DESCRICAO';
ctTabelas = 'SETOR';

implementation

uses dataDiversos, uFuncoesDB;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarSetor(vfOrdem: String);
begin
  dmDiversos.qySetor.Close;
  dmDiversos.qySetor.SQL.Clear;
  dmDiversos.qySetor.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  if vfOrdem <> '0' then
    dmDiversos.qySetor.SQL.Add(' ORDER BY ' + vfOrdem);
  dmDiversos.qySetor.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarSetor(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);
begin
  dmDiversos.qySetor.Close;
  dmDiversos.qySetor.SQL.Clear;
  dmDiversos.qySetor.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmDiversos.qySetor.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmDiversos.qySetor.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmDiversos.qySetor.SQL.Add(' ORDER BY ' + vfOrdem);
  dmDiversos.qySetor.Open;
end;

end.
