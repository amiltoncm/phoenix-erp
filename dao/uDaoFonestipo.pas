unit uDaoFonestipo;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure ListarFonestipo(vfOrdem: String);
procedure FiltrarFonestipo(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);

const
ctCampos = 'TPF_CODIGO, TPF_DESCRICAO, TPF_MASCARA';
ctTabelas = 'FONESTIPO';

implementation

uses dataDiversos;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarFonestipo(vfOrdem: String);
begin
  dmDiversos.qyFonestipo.Close;
  dmDiversos.qyFonestipo.SQL.Clear;
  dmDiversos.qyFonestipo.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  if vfOrdem <> '0' then
    dmDiversos.qyFonestipo.SQL.Add(' ORDER BY ' + vfOrdem);
  dmDiversos.qyFonestipo.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarFonestipo(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmDiversos.qyFonestipo.Close;
  dmDiversos.qyFonestipo.SQL.Clear;
  dmDiversos.qyFonestipo.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmDiversos.qyFonestipo.SQL.Add(' WHERE ');
  dmDiversos.qyFonestipo.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmDiversos.qyFonestipo.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmDiversos.qyFonestipo.SQL.Add(' ORDER BY ' + vfOrdem);
  dmDiversos.qyFonestipo.Open;
end;

end.
