unit uDaoOrcLivreItens;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

//procedure SetValuesOrcLivreItens(vfOrcLivreItens: TOrcLivreItens);
procedure InsOrcLivreItens;
procedure EdtOrcLivreItens;
procedure PostOrcLivreItens;
procedure ListarOrcLivreItens(vfOrdem: String);
procedure FiltrarOrcLivreItens(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
procedure DelOrcLivreItens;
procedure CalculaMargemOrcL;
procedure CalculaTotalOrcL;
procedure CalcularItemOrcL(vfPosicao: Integer);

const
ctCampos = 'ORI_CODIGO, ORL_NUMERO, ORI_QUANTIDADE, PRO_CODIGO, ORI_DESCRICAO, ' +
           'UNI_CODIGO, ORI_VLRCUSTO, ORI_VLRBRT, ORI_VLRDESC, ORI_PERCDESC, ' +
           'ORI_VLRLIQ, ORI_VLRTOTAL, ORI_PERCMG';
ctTabelas = 'ORCLIVREITENS';

implementation

uses dataOrcamentos, uFuncoesDB;

{--- Seta algum valor na tabela -----------------------------------------------}

{
procedure SetValuesOrcLivreItens(vfOrcLivreItens: TOrcLivreItens);
begin
  //@VINCULAR
end;
}

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsOrcLivreItens;
begin
  if dmOrcamentos.qyOrcLivreItens.Active = false then
    dmOrcamentos.qyOrcLivreItens.Active := True;
  dmOrcamentos.qyOrcLivreItens.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtOrcLivreItens;
begin
  dmOrcamentos.qyOrcLivreItens.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostOrcLivreItens;
begin
  try
    if dmOrcamentos.qyOrcLivreItens.State in [dsInsert] then
      dmOrcamentos.qyOrcLivreItensORI_CODIGO.Value := GetCodigo('ORI_CODIGO', 'ORCLIVREITENS');
    dmOrcamentos.qyOrcLivreItens.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmOrcamentos.qyOrcLivreItens.Refresh;
    end;
  end;
end;

procedure DelOrcLivreItens;
begin
  try
    dmOrcamentos.qyOrcLivreItens.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmOrcamentos.qyOrcLivreItens.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarOrcLivreItens(vfOrdem: String);
begin
  dmOrcamentos.qyOrcLivreItens.Close;
  dmOrcamentos.qyOrcLivreItens.SQL.Clear;
  dmOrcamentos.qyOrcLivreItens.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  if vfOrdem <> '0' then
    dmOrcamentos.qyOrcLivreItens.SQL.Add(' ORDER BY ' + vfOrdem);
  dmOrcamentos.qyOrcLivreItens.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarOrcLivreItens(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmOrcamentos.qyOrcLivreItens.Close;
  dmOrcamentos.qyOrcLivreItens.SQL.Clear;
  dmOrcamentos.qyOrcLivreItens.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmOrcamentos.qyOrcLivreItens.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmOrcamentos.qyOrcLivreItens.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmOrcamentos.qyOrcLivreItens.SQL.Add(' ORDER BY ' + vfOrdem);
  dmOrcamentos.qyOrcLivreItens.Open;
end;

{--- Cálculos do DBGrid -------------------------------------------------------}

procedure CalculaMargemOrcL;
Var
vQuant, vTotCusto, vTotVenda, vMargem: Real;
begin
  vQuant := dmOrcamentos.qyOrcLivreItensORI_QUANTIDADE.Value;
  vTotCusto := vQuant * dmOrcamentos.qyOrcLivreItensORI_VLRCUSTO.Value;
  vTotVenda := dmOrcamentos.qyOrcLivreItensORI_VLRTOTAL.Value;
  if vTotCusto <> 0 then
    vMargem := ((((vTotCusto / vTotVenda) - 1) * 100) * -1)
  else
    vMargem := 0;
  dmOrcamentos.qyOrcLivreItensORI_PERCMG.Value := vMargem;
end;

procedure CalculaTotalOrcL;
Var
vQuant, vVlrLiq, vVlrTotal: Real;
begin
  vQuant := dmOrcamentos.qyOrcLivreItensORI_QUANTIDADE.Value;
  vVlrLiq := dmOrcamentos.qyOrcLivreItensORI_VLRLIQ.Value;
  vVlrTotal := vQuant * vVlrLiq;
  dmOrcamentos.qyOrcLivreItensORI_VLRTOTAL.Value := vVlrTotal;
  CalculaMargemOrcL;
end;

procedure CalcularItemOrcL(vfPosicao: Integer);
Var
vQuant, vVlrTotal, vVlrLiq: Real;
vVlrBrt, vVlrDesc, vPercDes: Real;
begin
  if dmOrcamentos.qyOrcLivreItens.State in [dsInsert, dsEdit] then
  begin
    if vfPosicao = 1 then //Quantidade ---------------------------
      CalculaTotalOrcL;
    if vfPosicao = 5 then //Vlr. Bruto ---------------------------
    begin
      if dmOrcamentos.qyOrcLivreItensORI_VLRLIQ.Value = 0 then
        dmOrcamentos.qyOrcLivreItensORI_VLRLIQ.Value := dmOrcamentos.qyOrcLivreItensORI_VLRBRT.Value;
      CalculaTotalOrcL;
    end;
    if vfPosicao = 6 then //Vlr. Desconto ------------------------
    begin
      vVlrDesc := dmOrcamentos.qyOrcLivreItensORI_VLRDESC.Value;
      vVlrBrt := dmOrcamentos.qyOrcLivreItensORI_VLRBRT.Value;
      if vVlrDesc = 0  then
      begin
        dmOrcamentos.qyOrcLivreItensORI_VLRLIQ.Value := dmOrcamentos.qyOrcLivreItensORI_VLRBRT.Value;
        dmOrcamentos.qyOrcLivreItensORI_PERCDESC.Value := 0;
      end
      else
      begin
        vVlrLiq := dmOrcamentos.qyOrcLivreItensORI_VLRBRT.Value -
                   dmOrcamentos.qyOrcLivreItensORI_VLRDESC.Value;
        dmOrcamentos.qyOrcLivreItensORI_VLRLIQ.Value := vVlrLiq;
        vPercDes := ((((vVlrLiq / vVlrBrt) - 1) * 100) * -1);
        dmOrcamentos.qyOrcLivreItensORI_PERCDESC.Value := vPercDes;
      end;
      CalculaTotalOrcL;
    end;
    if vfPosicao = 7 then //Perc. Desconto -----------------------
    begin
      if dmOrcamentos.qyOrcLivreItensORI_PERCDESC.Value = 0 then
      begin
        dmOrcamentos.qyOrcLivreItensORI_VLRLIQ.Value := dmOrcamentos.qyOrcLivreItensORI_VLRBRT.Value;
        dmOrcamentos.qyOrcLivreItensORI_VLRDESC.Value := 0;
      end
      else
      begin
        vPercDes := dmOrcamentos.qyOrcLivreItensORI_PERCDESC.Value;
        vVlrBrt := dmOrcamentos.qyOrcLivreItensORI_VLRBRT.Value;
        vVlrDesc := ((vVlrBrt * vPercDes) / 100);
        vVlrLiq := vVlrBrt - vVlrDesc;
        dmOrcamentos.qyOrcLivreItensORI_VLRDESC.Value := vVlrDesc;
        dmOrcamentos.qyOrcLivreItensORI_VLRLIQ.Value := vVlrLiq;
      end;
      CalculaTotalOrcL;
    end;
    if vfPosicao = 8 then //Vlr. Líquido -------------------------
    begin
      vVlrLiq := dmOrcamentos.qyOrcLivreItensORI_VLRLIQ.Value;
      vVlrBrt := dmOrcamentos.qyOrcLivreItensORI_VLRBRT.Value;
      if vVlrLiq = vVlrBrt then
      begin
        dmOrcamentos.qyOrcLivreItensORI_VLRDESC.Value := 0;
        dmOrcamentos.qyOrcLivreItensORI_PERCDESC.Value := 0;
      end
      else
      begin
        vVlrDesc := vVlrBrt - vVlrLiq;
        vPercDes := ((((vVlrLiq / vVlrBrt) - 1) * 100) * -1);
        dmOrcamentos.qyOrcLivreItensORI_VLRDESC.Value := vVlrDesc;
        dmOrcamentos.qyOrcLivreItensORI_PERCDESC.Value := vPercDes;
      end;
      CalculaTotalOrcL;
    end;
  end;
end;

end.
