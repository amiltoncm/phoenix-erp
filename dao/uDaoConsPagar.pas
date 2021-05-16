unit uDaoConsPagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure ListarConsPagar(vfOrdem: String);
procedure FiltrarConsPagar(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
procedure ConsPagar(vfDataInic: String; vfDataFinal: String; vfFornecedor: String; vfStatus: String);

const
ctCampos = 'P.PAG_CODIGO,P.PAG_VENCIMENTO, F.PES_NOME, P.PAG_NUMERO, P.PAG_SERIE, P.PAG_PARCELA, ' +
           'P.PAG_VALOR, P.PAG_ACRESCIMO, P.PAG_DESCONTO, P.PAG_PAGO, P.PAG_SALDO, ' +
           'S.STA_DESCRICAO, P.PAG_VENCIMENTO, P.PAG_DUPLICATA, P.PAG_EMISSAO, ' +
           'P.PAG_MODELO, P.PAG_CHAVENFE';
ctTabelas = 'PAGAR P, PESSOAS F, STATUSMOV S';

implementation

uses dataConsultas;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarConsPagar(vfOrdem: String);
begin
  dmConsultas.qyConsPagar.Close;
  dmConsultas.qyConsPagar.SQL.Clear;
  dmConsultas.qyConsPagar.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmConsultas.qyConsPagar.SQL.Add(' WHERE P.PES_CODIGO = F.PES_CODIGO AND P.STA_CODIGO = S.STA_CODIGO ');
  if vfOrdem <> '0' then
    dmConsultas.qyConsPagar.SQL.Add(' ORDER BY ' + vfOrdem);
  dmConsultas.qyConsPagar.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarConsPagar(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmConsultas.qyConsPagar.Close;
  dmConsultas.qyConsPagar.SQL.Clear;
  dmConsultas.qyConsPagar.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmConsultas.qyConsPagar.SQL.Add(' WHERE P.PES_CODIGO = F.PES_CODIGO AND P.STA_CODIGO = S.STA_CODIGO AND ');
  dmConsultas.qyConsPagar.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmConsultas.qyConsPagar.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmConsultas.qyConsPagar.SQL.Add(' ORDER BY ' + vfOrdem);
  dmConsultas.qyConsPagar.Open;
end;

procedure ConsPagar(vfDataInic: String; vfDataFinal: String; vfFornecedor: String; vfStatus: String);
begin
  dmConsultas.qyConsPagar.Close;
  dmConsultas.qyConsPagar.SQL.Clear;
  dmConsultas.qyConsPagar.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmConsultas.qyConsPagar.SQL.Add('WHERE P.PES_CODIGO = F.PES_CODIGO AND P.STA_CODIGO = S.STA_CODIGO ');
  dmConsultas.qyConsPagar.SQL.Add('AND P.PAG_VENCIMENTO >= ' + QuotedStr(vfDataInic));
  dmConsultas.qyConsPagar.SQL.Add('AND P.PAG_VENCIMENTO <= ' + QuotedStr(vfDataFinal));
  if vfFornecedor <> '0' then
    dmConsultas.qyConsPagar.SQL.Add('AND P.PES_CODIGO = ' + vfFornecedor);
  if vfStatus <> '0' then
    dmConsultas.qyConsPagar.SQL.Add('AND P.STA_CODIGO = ' + vfStatus);
  dmConsultas.qyConsPagar.SQL.Add(' ORDER BY P.PAG_VENCIMENTO');
  dmConsultas.qyConsPagar.Open;
end;

end.
