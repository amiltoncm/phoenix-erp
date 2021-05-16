unit uDaoOrdItens;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

//procedure SetValuesOrdItens(vfOrdItens: TOrdItens);
procedure InsOrdItens;
procedure EdtOrdItens;
procedure PostOrdItens;
procedure DelOrdItens;
procedure ListarOrdItens(vfOrdem: String);
procedure FiltrarOrdItens(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);
procedure CalculaTotalOrdItens;
procedure CalcularItemOrdItens(vfPosicao: Integer);

const
ctCampos = 'i.ori_codigo, i.ord_numero, i.ori_quantidade, i.pro_codigo, p.pro_descricao, ' +
           'p.uni_codigo, i.ori_vlrbrt, i.ori_vlrdesc, i.ori_percdesc, i.ori_vlrliq, i.ori_vlrtotal';
ctTabelas = 'orditens i, produtos p';

implementation

uses dataCompras;

{--- Seta algum valor na tabela -----------------------------------------------}

{
procedure SetValuesOrdItens(vfOrdItens: TOrdItens);
begin
  //@VINCULAR
end;
}

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsOrdItens;
begin
  if dmCompras.qyOrdItens.Active = false then
    dmCompras.qyOrdItens.Active := True;
  dmCompras.qyOrdItens.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtOrdItens;
begin
  dmCompras.qyOrdItens.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostOrdItens;
begin
  try
    //if dmCompras.qyOrdItens.State in [dsInsert] then
      //dmCompras.qyOrdItensi.ori_codigo.Value := GetCodigo('i.ori_codigo', 'OrdItens');
    dmCompras.qyOrdItens.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmCompras.qyOrdItens.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelOrdItens;
begin
  try
    dmCompras.qyOrdItens.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                 E.Message,mtError,[mbOk],0);
      dmCompras.qyOrdItens.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarOrdItens(vfOrdem: String);
begin
  dmCompras.qyOrdItens.Close;
  dmCompras.qyOrdItens.SQL.Clear;
  dmCompras.qyOrdItens.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  dmCompras.qyOrdItens.SQL.Add(' where i.pro_codigo = p.pro_codigo ');
  if vfOrdem <> '0' then
    dmCompras.qyOrdItens.SQL.Add(' order by ' + vfOrdem);
  dmCompras.qyOrdItens.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarOrdItens(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);
begin
  dmCompras.qyOrdItens.Close;
  dmCompras.qyOrdItens.SQL.Clear;
  dmCompras.qyOrdItens.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmCompras.qyOrdItens.SQL.Add(' where i.pro_codigo = p.pro_codigo and ');
  dmCompras.qyOrdItens.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCompras.qyOrdItens.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmCompras.qyOrdItens.SQL.Add(' order by ' + vfOrdem);
  dmCompras.qyOrdItens.Open;
end;

procedure CalculaTotalOrdItens;
Var
vQuant, vVlrLiq, vVlrTotal: Real;
begin
  vQuant := dmCompras.qyOrdItensori_quantidade.Value;
  vVlrLiq := dmCompras.qyOrdItensori_vlrliq.Value;
  vVlrTotal := vQuant * vVlrLiq;
  dmCompras.qyOrdItensori_vlrtotal.Value := vVlrTotal;
end;

procedure CalcularItemOrdItens(vfPosicao: Integer);
Var
vQuant, vVlrTotal, vVlrLiq: Real;
vVlrBrt, vVlrDesc, vPercDes: Real;
begin
  if dmCompras.qyOrdItens.State in [dsInsert, dsEdit] then
  begin
    if vfPosicao = 1 then //Quantidade ---------------------------
      CalculaTotalOrdItens;
    if vfPosicao = 5 then //Vlr. Bruto ---------------------------
    begin
      if dmCompras.qyOrdItensori_vlrliq.Value = 0 then
        dmCompras.qyOrdItensori_vlrliq.Value := dmCompras.qyOrdItensori_vlrbrt.Value;
      CalculaTotalOrdItens;
    end;
    if vfPosicao = 6 then //Vlr. Desconto --------------------------------------
    begin
      vVlrDesc := dmCompras.qyOrdItensori_vlrdesc.Value;
      vVlrBrt := dmCompras.qyOrdItensori_vlrbrt.Value;
      if vVlrDesc = 0  then
      begin
        dmCompras.qyOrdItensori_vlrliq.Value := dmCompras.qyOrdItensori_vlrbrt.Value;
        dmCompras.qyOrdItensori_percdesc.Value := 0;
      end
      else
      begin
        vVlrLiq := dmCompras.qyOrdItensori_vlrbrt.Value -
                   dmCompras.qyOrdItensori_vlrdesc.Value;
        vPercDes := ((((vVlrLiq / vVlrBrt) - 1) * 100) * -1);
        dmCompras.qyOrdItensori_vlrliq.Value := vVlrLiq;
        dmCompras.qyOrdItensori_percdesc.Value := vPercDes;
      end;
      CalculaTotalOrdItens;
    end;
    if vfPosicao = 7 then //Perc. Desconto -------------------------------------
    begin
      if dmCompras.qyOrdItensori_percdesc.Value = 0 then
      begin
        dmCompras.qyOrdItensori_vlrliq.Value := dmCompras.qyOrdItensori_vlrbrt.Value;
        dmCompras.qyOrdItensori_vlrdesc.Value := 0;
      end
      else
      begin
        vPercDes := dmCompras.qyOrdItensori_percdesc.Value;
        vVlrBrt := dmCompras.qyOrdItensori_vlrbrt.Value;
        vVlrDesc := ((vVlrBrt * vPercDes) / 100);
        vVlrLiq := vVlrBrt - vVlrDesc;
        dmCompras.qyOrdItensori_vlrdesc.Value := vVlrDesc;
        dmCompras.qyOrdItensori_vlrliq.Value := vVlrLiq;
      end;
      CalculaTotalOrdItens;
    end;
    if vfPosicao = 8 then //Vlr. Líquido ---------------------------------------
    begin
      vVlrLiq := dmCompras.qyCotItenscti_vlrliq.Value;
      vVlrBrt := dmCompras.qyCotItenscti_vlrbrt.Value;
      if vVlrLiq = vVlrBrt then
      begin
        dmCompras.qyOrdItensori_vlrdesc.Value := 0;
        dmCompras.qyOrdItensori_percdesc.Value := 0;
      end
      else
      begin
        vVlrDesc := vVlrBrt - vVlrLiq;
        vPercDes := ((((vVlrLiq / vVlrBrt) - 1) * 100) * -1);
        if vVlrDesc > vVlrBrt then
        begin
          MessageDlg('O valor do desconto não pode ser maior que o Valor bruto!', mtWarning, [mbOk], 0);
          dmCompras.qyOrdItensori_percdesc.Value := 0;
          dmCompras.qyOrdItensori_vlrdesc.Value := 0;
          CalculaTotalOrdItens;
        end;
      end;
      CalculaTotalOrdItens;
    end;
  end;
end;

end.
