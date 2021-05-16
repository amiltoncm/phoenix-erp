unit uDaoPagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassPagar;

procedure SetValuesPagar(vfPagar: TPagar);
procedure SetValuesPgto(vfPagar: TPagar);
procedure InsPagar;
procedure EdtPagar;
procedure PostPagar;
procedure ListarPagar(vfOrdem: String);
procedure FiltrarPagar(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
function VerPagChave(vfChave: String): boolean;
function VerPagLanc(vfCodFornecedor: String; vfNF: String; vfSerie: String; vfParcela: String): Boolean;
procedure FiltrarPagarBx(vfDataInic: String; vfDataFinal: String; vfFornecedor: String);

const
ctCampos = 'P.PAG_CODIGO, P.PAG_EMISSAO, P.PAG_VENCIMENTO, P.PAG_NUMERO, P.PAG_SERIE, ' +
           'P.PAG_MODELO, P.PAG_PARCELA, P.PAG_DUPLICATA, P.PES_CODIGO, P.PAG_VALOR, ' +
           'P.PAG_PAGO, P.PAG_ACRESCIMO, P.PAG_DESCONTO, P.PAG_SALDO, P.PAG_CHAVENFE, ' +
           'P.STA_CODIGO, S.STA_DESCRICAO, F.PES_NOME';
ctTabelas = 'PAGAR P, STATUSMOV S, PESSOAS F';

implementation

uses dataFinanceiro, uFuncoesDB, uVarGlobal;

{--- Seta algum valor na tabela -----------------------------------------------}

procedure SetValuesPagar(vfPagar: TPagar);
begin
  dmFinanceiro.qyPagarPAG_EMISSAO.Value := vfPagar.Emissao;
  dmFinanceiro.qyPagarPAG_VENCIMENTO.Value := vfPagar.Vencimento;
  dmFinanceiro.qyPagarPAG_NUMERO.Value := vfPagar.Numero;
  dmFinanceiro.qyPagarPAG_SERIE.Value := vfPagar.Serie;
  dmFinanceiro.qyPagarPAG_MODELO.Value := vfPagar.Modelo;
  dmFinanceiro.qyPagarPAG_PARCELA.Value := vfPagar.Parcela;
  dmFinanceiro.qyPagarPAG_DUPLICATA.Text := vfPagar.Duplicata;
  dmFinanceiro.qyPagarPES_CODIGO.Value := vfPagar.PesCodigo;
  dmFinanceiro.qyPagarPES_NOME.Text := vfPagar.Nome;
  dmFinanceiro.qyPagarPAG_VALOR.Value := vfPagar.Valor;
  dmFinanceiro.qyPagarPAG_PAGO.Value := vfPagar.Pago;
  dmFinanceiro.qyPagarPAG_ACRESCIMO.Value := vfPagar.Acrescimo;
  dmFinanceiro.qyPagarPAG_DESCONTO.Value := vfPagar.Desconto;
  dmFinanceiro.qyPagarPAG_SALDO.Value := vfPagar.Saldo;
  dmFinanceiro.qyPagarPAG_CHAVENFE.Text := vfPagar.Chavenfe;
  dmFinanceiro.qyPagarSTA_CODIGO.Value := vfPagar.StaCodigo;
  dmFinanceiro.qyPagarSTA_DESCRICAO.Text := vfPagar.Descricao;
end;

procedure SetValuesPgto(vfPagar: TPagar);
begin
  dmFinanceiro.qyPagarPAG_VALOR.Value := vfPagar.Valor;
  dmFinanceiro.qyPagarPAG_PAGO.Value := vfPagar.Pago;
  dmFinanceiro.qyPagarPAG_ACRESCIMO.Value := vfPagar.Acrescimo;
  dmFinanceiro.qyPagarPAG_DESCONTO.Value := vfPagar.Desconto;
  dmFinanceiro.qyPagarPAG_SALDO.Value := vfPagar.Saldo;
  dmFinanceiro.qyPagarSTA_CODIGO.Value := vfPagar.StaCodigo;
end;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsPagar;
begin
  if dmFinanceiro.qyPagar.Active = false then
    dmFinanceiro.qyPagar.Active := True;
  dmFinanceiro.qyPagar.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtPagar;
begin
  dmFinanceiro.qyPagar.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostPagar;
begin
  try
    if dmFinanceiro.qyPagar.State in [dsInsert] then
      dmFinanceiro.qyPagarPAG_CODIGO.Value := GetCodigo('PAG_CODIGO', 'PAGAR');
    dmFinanceiro.qyPagar.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmFinanceiro.qyPagar.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarPagar(vfOrdem: String);
begin
  dmFinanceiro.qyPagar.Close;
  dmFinanceiro.qyPagar.SQL.Clear;
  dmFinanceiro.qyPagar.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmFinanceiro.qyPagar.SQL.Add(' WHERE P.STA_CODIGO = S.STA_CODIGO ');
  dmFinanceiro.qyPagar.SQL.Add(' AND P.PES_CODIGO = F.PES_CODIGO ');
  if vfOrdem <> '0' then
    dmFinanceiro.qyPagar.SQL.Add(' ORDER BY ' + vfOrdem);
  dmFinanceiro.qyPagar.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarPagar(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmFinanceiro.qyPagar.Close;
  dmFinanceiro.qyPagar.SQL.Clear;
  dmFinanceiro.qyPagar.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmFinanceiro.qyPagar.SQL.Add(' WHERE P.STA_CODIGO = S.STA_CODIGO ');
  dmFinanceiro.qyPagar.SQL.Add(' AND P.PES_CODIGO = F.PES_CODIGO AND ');
  dmFinanceiro.qyPagar.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmFinanceiro.qyPagar.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmFinanceiro.qyPagar.SQL.Add(' ORDER BY ' + vfOrdem);
  dmFinanceiro.qyPagar.Open;
end;

function VerPagChave(vfChave: String): boolean;
begin
  dmFinanceiro.QTemp.Close;
  dmFinanceiro.QTemp.SQL.Clear;
  dmFinanceiro.QTemp.SQL.Add('SELECT PAG_CHAVENFE FROM PAGAR ');
  dmFinanceiro.QTemp.SQL.Add('WHERE PAG_CHAVENFE = ' + QuotedStr(vfChave));
  dmFinanceiro.QTemp.Open;
  if dmFinanceiro.QTemp.Fields[0].IsNull then
    Result := False
  else
    Result := True;
end;

function VerPagLanc(vfCodFornecedor: String; vfNF: String; vfSerie: String; vfParcela: String): Boolean;
begin
  dmFinanceiro.QTemp.Close;
  dmFinanceiro.QTemp.SQL.Clear;
  dmFinanceiro.QTemp.SQL.Add('SELECT PAG_CODIGO FROM PAGAR ');
  dmFinanceiro.QTemp.SQL.Add('WHERE PES_CODIGO = ' + vfCodFornecedor);
  dmFinanceiro.QTemp.SQL.Add('AND PAG_NUMERO = ' + vfNF);
  dmFinanceiro.QTemp.SQL.Add('AND PAG_SERIE = ' + vfSerie);
  dmFinanceiro.QTemp.SQL.Add('AND PAG_PARCELA = ' + vfParcela);
  dmFinanceiro.QTemp.Open;
  if dmFinanceiro.QTemp.Fields[0].IsNull then
    Result := False
  else
    Result := True;
end;

procedure FiltrarPagarBx(vfDataInic: String; vfDataFinal: String; vfFornecedor: String);
begin
  dmFinanceiro.qyPagar.Close;
  dmFinanceiro.qyPagar.SQL.Clear;
  dmFinanceiro.qyPagar.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmFinanceiro.qyPagar.SQL.Add('WHERE P.PES_CODIGO = F.PES_CODIGO AND P.STA_CODIGO = S.STA_CODIGO ');
  dmFinanceiro.qyPagar.SQL.Add('AND P.PAG_VENCIMENTO >= ' + QuotedStr(vfDataInic));
  dmFinanceiro.qyPagar.SQL.Add('AND P.PAG_VENCIMENTO <= ' + QuotedStr(vfDataFinal));
  if vfFornecedor <> '0' then
    dmFinanceiro.qyPagar.SQL.Add('AND P.PES_CODIGO = ' + vfFornecedor);
  dmFinanceiro.qyPagar.SQL.Add('AND P.STA_CODIGO = 1');
  dmFinanceiro.qyPagar.SQL.Add(' ORDER BY P.PAG_VENCIMENTO');
  dmFinanceiro.qyPagar.Open;
end;

end.
