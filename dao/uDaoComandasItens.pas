unit uDaoComandasItens;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassComandasItens;

procedure SetValuesComandasItens(vfComandasItens: TComandasItens);
procedure InsComandasItens;
procedure EdtComandasItens;
procedure PostComandasItens;
procedure DelComandasItens;
procedure ListarComandasItens(vfOrdem: String);
procedure FiltrarComandasItens(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);
procedure FiltrarComandasItensOpen(vfComanda: String);
function ComandasItensCusto(vfComanda: Integer): Real;
function ComandasItensTotal(vfComanda: Integer): Real;
procedure ExportComandasItens(vfNumComanda: Integer; vfPV: Integer);
procedure SetNumPVComandasItens(vfNumPV: Integer; vfNumComanda: Integer);

const
ctCampos = 'i.cmi_codigo, i.cma_codigo, i.cmi_quantidade, i.pro_codigo, p.pro_descricao, ' +
           'p.uni_codigo, i.cmi_vlrunitario, i.cmi_vlrtotcusto, i.cmi_vlrtotal, i.prv_numero, ' +
           'i.cmi_copa, i.cmi_cozinha, i.cmi_datetime, i.sat_codigo';
ctTabelas = 'comandasitens i, produtos p';

implementation

uses dataGestao, uFuncoesDB, uVarGlobal, uDaoPrevItens, uClassPrevitens;

{--- Seta algum valor na tabela -----------------------------------------------}

procedure SetValuesComandasItens(vfComandasItens: TComandasItens);
begin
  if vfComandasitens.Codigo = 0 then
    dmGestao.qyComandasItenscmi_codigo.Value := GetCodigo('cmi_codigo', 'Comandasitens')
  else
    dmGestao.qyComandasItenscmi_codigo.Value := vfComandasItens.Codigo;
  dmGestao.qyComandasItenscma_codigo.Value := vfComandasitens.Codcomanda;
  dmGestao.qyComandasItenscmi_quantidade.Value := vfComandasitens.Quantidade;
  dmGestao.qyComandasItenspro_codigo.Value := vfComandasitens.Codproduto;
  dmGestao.qyComandasItenscmi_vlrunitario.Value := vfComandasitens.Vlrunitario;
  dmGestao.qyComandasItenscmi_vlrtotcusto.Value := vfComandasitens.VlrCustoTotal;
  dmGestao.qyComandasItenscmi_vlrtotal.Value := vfComandasitens.Vlrtotal;
  dmGestao.qyComandasItensprv_numero.Value := vfComandasitens.Prevenda;
end;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsComandasItens;
begin
  if dmGestao.qyComandasItens.Active = false then
    dmGestao.qyComandasItens.Active := True;
  dmGestao.qyComandasItens.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtComandasItens;
begin
  dmGestao.qyComandasItens.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostComandasItens;
begin
  try
    dmGestao.qyComandasItens.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmGestao.qyComandasItens.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelComandasItens;
begin
  try
    dmGestao.qyComandasItens.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                 E.Message,mtError,[mbOk],0);
      dmGestao.qyComandasItens.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarComandasItens(vfOrdem: String);
begin
  dmGestao.qyComandasItens.Close;
  dmGestao.qyComandasItens.SQL.Clear;
  dmGestao.qyComandasItens.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  dmGestao.qyComandasItens.SQL.Add(' where i.pro_codigo = p.pro_codigo ');
  if vfOrdem <> '0' then
    dmGestao.qyComandasItens.SQL.Add(' order by ' + vfOrdem);
  dmGestao.qyComandasItens.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarComandasItens(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmGestao.qyComandasItens.Close;
  dmGestao.qyComandasItens.SQL.Clear;
  dmGestao.qyComandasItens.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmGestao.qyComandasItens.SQL.Add(' where i.pro_codigo = p.pro_codigo and ');
  dmGestao.qyComandasItens.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmGestao.qyComandasItens.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmGestao.qyComandasItens.SQL.Add(' order by ' + vfOrdem);
  dmGestao.qyComandasItens.Open;
end;

procedure FiltrarComandasItensOpen(vfComanda: String);
begin
  dmGestao.qyComandasItens.Close;
  dmGestao.qyComandasItens.SQL.Clear;
  dmGestao.qyComandasItens.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmGestao.qyComandasItens.SQL.Add('where i.pro_codigo = p.pro_codigo ');
  dmGestao.qyComandasItens.SQL.Add('and prv_numero = 0 and i.cma_codigo = ');
  dmGestao.qyComandasItens.SQL.Add(QuotedStr(vfComanda));
  dmGestao.qyComandasItens.SQL.Add(' order by i.cmi_codigo');
  dmGestao.qyComandasItens.Open;
end;

function ComandasItensCusto(vfComanda: Integer): Real;
begin
  dmGestao.QTemp.Close;
  dmGestao.QTemp.SQL.Clear;
  dmGestao.QTemp.SQL.Add('select sum(cmi_vlrtotcusto) from comandasitens ');
  dmGestao.QTemp.SQL.Add('where prv_numero = 0 ');
  dmGestao.QTemp.SQL.Add('and cma_codigo = ' + IntToStr(vfComanda));
  dmGestao.QTemp.Open;
  Result := dmGestao.QTemp.Fields[0].Value;
end;

function ComandasItensTotal(vfComanda: Integer): Real;
begin
  dmGestao.QTemp.Close;
  dmGestao.QTemp.SQL.Clear;
  dmGestao.QTemp.SQL.Add('select sum(cmi_vlrtotal) from comandasitens ');
  dmGestao.QTemp.SQL.Add('where prv_numero = 0 ');
  dmGestao.QTemp.SQL.Add('and cma_codigo = ' + IntToStr(vfComanda));
  dmGestao.QTemp.Open;
  Result := dmGestao.QTemp.Fields[0].Value;
end;

procedure ExportComandasItens(vfNumComanda: Integer; vfPV: Integer);
Var
vPrevItem: TPrevitens;
vMargem: Real;
begin
  FiltrarComandasItensOpen(IntToStr(vfNumComanda));
  dmGestao.qyComandasItens.First;
  repeat
    vPrevItem := TPrevitens.Create;
    vPrevItem.Numero := vfPV;
    vPrevItem.Quantidade := dmGestao.qyComandasItenscmi_quantidade.Value;
    vPrevItem.Codproduto := dmGestao.qyComandasItenspro_codigo.Value;
    vPrevItem.Produto := '';
    vPrevItem.Unidade := '';
    vPrevItem.Vlrcusto := dmGestao.qyComandasItenscmi_vlrtotcusto.Value;
    vPrevItem.Vlrbruto := dmGestao.qyComandasItenscmi_vlrtotal.Value;
    vPrevItem.Vlrdesc := 0;
    vPrevItem.Percdesc := 0;
    vPrevItem.Vlrliq := vPrevItem.Vlrbruto;
    vPrevItem.Vlrtotal := vPrevItem.Vlrbruto;
    vPrevItem.Permg := ((vPrevItem.Vlrtotal / vPrevItem.Vlrcusto) -1) * 100;
    InsPrevItens;
    SetValuesPrevItens(vPrevItem);
    PostPrevItens;
    vPrevItem.Free;
    dmGestao.qyComandasItens.Next
  until dmGestao.qyComandasItens.Eof = True;
end;

procedure SetNumPVComandasItens(vfNumPV: Integer; vfNumComanda: Integer);
begin
  dmGestao.qyScriptComandasItens.Close;
  dmGestao.qyScriptComandasItens.SQL.Clear;
  dmGestao.qyScriptComandasItens.SQL.Add('update comandasitens set prv_numero = ');
  dmGestao.qyScriptComandasItens.SQL.Add(IntToStr(vfNumPV));
  dmGestao.qyScriptComandasItens.SQL.Add('where prv_numero = 0');
  dmGestao.qyScriptComandasItens.SQL.Add('and cma_codigo = ');
  dmGestao.qyScriptComandasItens.SQL.Add(IntToStr(vfNumComanda));
  dmGestao.qyScriptComandasItens.ExecSQL;
end;

end.
