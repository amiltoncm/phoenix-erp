unit uDaoPlanocontas;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure ListarPlanocontas(vfOrdem: String);
procedure FiltrarPlanocontas(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);

const
ctCampos = 'PLC_CODIGO, PLC_DESCRICAO, PLC_TIPO';
ctTabelas = 'PLANOCONTAS';

implementation

uses dataCadastros;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarPlanocontas(vfOrdem: String);
begin
  dmCadastros.qyPlanocontas.Close;
  dmCadastros.qyPlanocontas.SQL.Clear;
  dmCadastros.qyPlanocontas.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  if vfOrdem <> '0' then
    dmCadastros.qyPlanocontas.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyPlanocontas.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarPlanocontas(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);
begin
  dmCadastros.qyPlanocontas.Close;
  dmCadastros.qyPlanocontas.SQL.Clear;
  dmCadastros.qyPlanocontas.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmCadastros.qyPlanocontas.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qyPlanocontas.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmCadastros.qyPlanocontas.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyPlanocontas.Open;
end;

end.
