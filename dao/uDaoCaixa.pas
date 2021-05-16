unit uDaoCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassCaixa;

procedure SetValuesCaixa(vfCaixa: TCaixa);
procedure InsCaixa;
procedure EdtCaixa;
procedure PostCaixa;
procedure ListarCaixa(vfOrdem: String);
procedure FiltrarCaixa(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);
function GetNumTransf: Integer;
procedure SetDataEfet(vfDataEfet: TDate);

const
ctCampos = 'cai_codigo, cai_id, cai_data, cai_dataefet, con_codigo, plc_codigo, cai_valor, cai_numdoc, ' +
           'cai_descricao, pag_codigo, rec_codigo, mdc_codigo, usu_codigo';
ctTabelas = 'caixa';

implementation

uses dataFinanceiro, uVarGlobal, uFuncoesDB;

{--- Seta algum valor na tabela -----------------------------------------------}

procedure SetValuesCaixa(vfCaixa: TCaixa);
begin
  if vfCaixa.Codigo = 0 then
    dmFinanceiro.qyCaixacai_codigo.Value := GetCodigo('cai_codigo', 'caixa')
  else
    dmFinanceiro.qyCaixacai_codigo.Value := vfCaixa.Codigo;
  dmFinanceiro.qyCaixacai_id.Value := vfCaixa.Id;
  dmFinanceiro.qyCaixacai_data.Value := vfCaixa.Data;
  dmFinanceiro.qyCaixacai_dataefet.Value := vfCaixa.Dataefet;
  dmFinanceiro.qyCaixacon_codigo.Value := vfCaixa.CodConta;
  dmFinanceiro.qyCaixaplc_codigo.Value := vfCaixa.CodPlano;
  dmFinanceiro.qyCaixacai_valor.Value := vfCaixa.Valor;
  dmFinanceiro.qyCaixacai_numdoc.Value := vfCaixa.Numdoc;
  dmFinanceiro.qyCaixacai_descricao.Text := vfCaixa.Descricao;
  if vfCaixa.CodPag <> 0 then
    dmFinanceiro.qyCaixapag_codigo.Value := vfCaixa.CodPag;
  if vfCaixa.CodRec <> 0 then
    dmFinanceiro.qyCaixarec_codigo.Value := vfCaixa.CodRec;
  if vfCaixa.CodMdc <> '0' then
    dmFinanceiro.qyCaixamdc_codigo.Text := vfCaixa.CodMdc;
  dmFinanceiro.qyCaixausu_codigo.Text := vgCodUsuarioLog;
end;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsCaixa;
begin
  if dmFinanceiro.qyCaixa.Active = false then
    dmFinanceiro.qyCaixa.Active := True;
  dmFinanceiro.qyCaixa.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtCaixa;
begin
  dmFinanceiro.qyCaixa.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostCaixa;
begin
  try
    if dmFinanceiro.qyCaixa.State in [dsInsert] then
      dmFinanceiro.qyCaixaCAI_CODIGO.Value := GetCodigo('CAI_CODIGO', 'Caixa');
    dmFinanceiro.qyCaixa.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmFinanceiro.qyCaixa.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarCaixa(vfOrdem: String);
begin
  dmFinanceiro.qyCaixa.Close;
  dmFinanceiro.qyCaixa.SQL.Clear;
  dmFinanceiro.qyCaixa.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  if vfOrdem <> '0' then
    dmFinanceiro.qyCaixa.SQL.Add(' ORDER BY ' + vfOrdem);
  dmFinanceiro.qyCaixa.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarCaixa(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);
begin
  dmFinanceiro.qyCaixa.Close;
  dmFinanceiro.qyCaixa.SQL.Clear;
  dmFinanceiro.qyCaixa.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmFinanceiro.qyCaixa.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmFinanceiro.qyCaixa.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmFinanceiro.qyCaixa.SQL.Add(' ORDER BY ' + vfOrdem);
  dmFinanceiro.qyCaixa.Open;
end;

function GetNumTransf: Integer;
begin
  dmFinanceiro.QTemp.Close;
  dmFinanceiro.QTemp.SQL.Clear;
  dmFinanceiro.QTemp.SQL.Add('SELECT COUNT(CAI_CODIGO) FROM CAIXA ');
  dmFinanceiro.QTemp.SQL.Add('WHERE PLC_CODIGO = 5');
  dmFinanceiro.QTemp.Open;
  Result := dmFinanceiro.QTemp.Fields[0].Value + 1;
end;

procedure SetDataEfet(vfDataEfet: TDate);
begin
  dmFinanceiro.qyCaixacai_dataefet.Value := vfDataEfet;
end;

end.
