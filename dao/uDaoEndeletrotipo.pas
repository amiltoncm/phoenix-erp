unit uDaoEndeletrotipo;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure ListarEndeletrotipo(vfOrdem: String);
procedure FiltrarEndeletrotipo(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);

const
ctCampos = 'TPN_CODIGO, TPN_DESCRICAO';
ctTabelas = 'ENDELETROTIPO';

implementation

uses dataDiversos;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarEndeletrotipo(vfOrdem: String);
begin
  dmDiversos.qyEndeletrotipo.Close;
  dmDiversos.qyEndeletrotipo.SQL.Clear;
  dmDiversos.qyEndeletrotipo.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  if vfOrdem <> '0' then
    dmDiversos.qyEndeletrotipo.SQL.Add(' ORDER BY ' + vfOrdem);
  dmDiversos.qyEndeletrotipo.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarEndeletrotipo(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmDiversos.qyEndeletrotipo.Close;
  dmDiversos.qyEndeletrotipo.SQL.Clear;
  dmDiversos.qyEndeletrotipo.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmDiversos.qyEndeletrotipo.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmDiversos.qyEndeletrotipo.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmDiversos.qyEndeletrotipo.SQL.Add(' ORDER BY ' + vfOrdem);
  dmDiversos.qyEndeletrotipo.Open;
end;

end.
