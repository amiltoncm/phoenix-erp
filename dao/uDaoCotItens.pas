unit uDaoCotItens;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

//procedure SetValuesCotItens(vfCotItens: TCotItens);
procedure InsCotItens;
procedure EdtCotItens;
procedure PostCotItens;
procedure DelCotItens;
procedure ListarCotItens(vfOrdem: String);
procedure FiltrarCotItens(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
procedure CalculaTotalCotItens;
procedure CalcularItemCotItens(vfPosicao: Integer);

const
ctCampos = 'i.cti_codigo, i.cot_numero, i.cti_quantidade, i.pro_codigo, p.pro_descricao, ' +
           'p.uni_codigo, i.cti_vlrbrt, i.cti_percdesc, i.cti_vlrdesc, i.cti_vlrliq, i.cti_vlrtotal';
ctTabelas = 'cotitens i, produtos p';

implementation

uses dataCompras, uFuncoesDB;

{--- Seta algum valor na tabela -----------------------------------------------}

{
procedure SetValuesCotItens(vfCotItens: TCotItens);
begin
  //@VINCULAR
end;
}

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsCotItens;
begin
  if dmCompras.qyCotItens.Active = false then
    dmCompras.qyCotItens.Active := True;
  dmCompras.qyCotItens.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtCotItens;
begin
  dmCompras.qyCotItens.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostCotItens;
begin
  try
    if dmCompras.qyCotItens.State in [dsInsert] then
      dmCompras.qyCotItenscti_codigo.Value := GetCodigo('cti_codigo', 'cotitens');
    dmCompras.qyCotItens.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmCompras.qyCotItens.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelCotItens;
begin
  try
    dmCompras.qyCotItens.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                 E.Message,mtError,[mbOk],0);
      dmCompras.qyCotItens.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarCotItens(vfOrdem: String);
begin
  dmCompras.qyCotItens.Close;
  dmCompras.qyCotItens.SQL.Clear;
  dmCompras.qyCotItens.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  dmCompras.qyCotItens.SQL.Add(' where i.pro_codigo = p.pro_codigo ');
  if vfOrdem <> '0' then
    dmCompras.qyCotItens.SQL.Add(' order by ' + vfOrdem);
  dmCompras.qyCotItens.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarCotItens(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmCompras.qyCotItens.Close;
  dmCompras.qyCotItens.SQL.Clear;
  dmCompras.qyCotItens.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmCompras.qyCotItens.SQL.Add(' where i.pro_codigo = p.pro_codigo and ');
  dmCompras.qyCotItens.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCompras.qyCotItens.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmCompras.qyCotItens.SQL.Add(' order by ' + vfOrdem);
  dmCompras.qyCotItens.Open;
end;

procedure CalculaTotalCotItens;
Var
vQuant, vVlrLiq, vVlrTotal: Real;
begin
  vQuant := dmCompras.qyCotItenscti_quantidade.Value;
  vVlrLiq := dmCompras.qyCotItenscti_vlrliq.Value;
  vVlrTotal := vQuant * vVlrLiq;
  dmCompras.qyCotItenscti_vlrtotal.Value := vVlrTotal;
end;

procedure CalcularItemCotItens(vfPosicao: Integer);
Var
vQuant, vVlrTotal, vVlrLiq: Real;
vVlrBrt, vVlrDesc, vPercDes: Real;
begin
  if dmCompras.qyCotItens.State in [dsInsert, dsEdit] then
  begin
    if vfPosicao = 1 then //Quantidade ---------------------------
      CalculaTotalCotItens;
    if vfPosicao = 5 then //Vlr. Bruto ---------------------------
    begin
      if dmCompras.qyCotItenscti_vlrliq.Value = 0 then
        dmCompras.qyCotItenscti_vlrliq.Value := dmCompras.qyCotItenscti_vlrbrt.Value;
      CalculaTotalCotItens;
    end;
    if vfPosicao = 6 then //Vlr. Desconto --------------------------------------
    begin
      vVlrDesc := dmCompras.qyCotItenscti_vlrdesc.Value;
      vVlrBrt := dmCompras.qyCotItenscti_vlrbrt.Value;
      if vVlrDesc = 0  then
      begin
        dmCompras.qyCotItenscti_vlrliq.Value := dmCompras.qyCotItenscti_vlrbrt.Value;
        dmCompras.qyCotItenscti_percdesc.Value := 0;
      end
      else
      begin
        vVlrLiq := dmCompras.qyCotItenscti_vlrbrt.Value -
                   dmCompras.qyCotItenscti_vlrdesc.Value;
        vPercDes := ((((vVlrLiq / vVlrBrt) - 1) * 100) * -1);
        dmCompras.qyCotItenscti_vlrliq.Value := vVlrLiq;
        dmCompras.qyCotItenscti_percdesc.Value := vPercDes;
      end;
      CalculaTotalCotItens;
    end;
    if vfPosicao = 7 then //Perc. Desconto -------------------------------------
    begin
      if dmCompras.qyCotItenscti_percdesc.Value = 0 then
      begin
        dmCompras.qyCotItenscti_vlrliq.Value := dmCompras.qyCotItenscti_vlrbrt.Value;
        dmCompras.qyCotItenscti_vlrdesc.Value := 0;
      end
      else
      begin
        vPercDes := dmCompras.qyCotItenscti_percdesc.Value;
        vVlrBrt := dmCompras.qyCotItenscti_vlrbrt.Value;
        vVlrDesc := ((vVlrBrt * vPercDes) / 100);
        vVlrLiq := vVlrBrt - vVlrDesc;
        dmCompras.qyCotItenscti_vlrdesc.Value := vVlrDesc;
        dmCompras.qyCotItenscti_vlrliq.Value := vVlrLiq;
      end;
      CalculaTotalCotItens;
    end;
    if vfPosicao = 8 then //Vlr. Líquido ---------------------------------------
    begin
      vVlrLiq := dmCompras.qyCotItenscti_vlrliq.Value;
      vVlrBrt := dmCompras.qyCotItenscti_vlrbrt.Value;
      if vVlrLiq = vVlrBrt then
      begin
        dmCompras.qyCotItenscti_vlrdesc.Value := 0;
        dmCompras.qyCotItenscti_percdesc.Value := 0;
      end
      else
      begin
        vVlrDesc := vVlrBrt - vVlrLiq;
        vPercDes := ((((vVlrLiq / vVlrBrt) - 1) * 100) * -1);
        if vVlrDesc > vVlrBrt then
        begin
          MessageDlg('O valor do desconto não pode ser maior que o Valor bruto!', mtWarning, [mbOk], 0);
          dmCompras.qyCotItenscti_percdesc.Value := 0;
          dmCompras.qyCotItenscti_vlrdesc.Value := 0;
          CalculaTotalCotItens;
        end;
      end;
      CalculaTotalCotItens;
    end;
  end;
end;

end.
