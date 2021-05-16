unit uDaoProdutosEst;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassProdutosest;

procedure SetValuesProdutosEst(vfProdutosEst: TProdutosEst);
procedure InsProdutosEst;
procedure EdtProdutosEst;
procedure PostProdutosEst;
procedure DelProdutosEst;
procedure ListarProdutosEst(vfOrdem: String);
procedure FiltrarProdutosEst(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
procedure AtualizaReservas(vfCodProduto: Integer);
procedure EntradaEstoque(vfCodProduto: Integer; vfQuantidade: Real);
procedure SaidaEstoque(vfCodProduto: Integer; vfQuantidade: Real);
procedure ConsProdutosEst(vfCodProduto: String);

const
ctCampos = 'PRO_CODIGO, EST_FISICO, EST_RESERVAS, EST_DISPONIVEL';
ctTabelas = 'PRODUTOSEST';

implementation

uses dataEstoque, uDaoPrevRes, dataConsultas;

{--- Seta algum valor na tabela -----------------------------------------------}

procedure SetValuesProdutosEst(vfProdutosEst: TProdutosEst);
begin
  dmEstoque.qyProdutosEstPRO_CODIGO.Value := vfProdutosEst.Codigo;
  dmEstoque.qyProdutosEstEST_FISICO.Value := vfProdutosEst.Fisico;
  dmEstoque.qyProdutosEstEST_RESERVAS.Value := vfProdutosEst.Reservas;
  dmEstoque.qyProdutosEstEST_DISPONIVEL.Value := vfProdutosEst.Disponivel;
end;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsProdutosEst;
begin
  if dmEstoque.qyProdutosEst.Active = false then
    dmEstoque.qyProdutosEst.Active := True;
  dmEstoque.qyProdutosEst.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtProdutosEst;
begin
  dmEstoque.qyProdutosEst.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostProdutosEst;
begin
  try
    dmEstoque.qyProdutosEst.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmEstoque.qyProdutosEst.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelProdutosEst;
begin
  try
    dmEstoque.qyProdutosEst.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                  E.Message,mtError,[mbOk],0);
      dmEstoque.qyProdutosEst.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarProdutosEst(vfOrdem: String);
begin
  dmEstoque.qyProdutosEst.Close;
  dmEstoque.qyProdutosEst.SQL.Clear;
  dmEstoque.qyProdutosEst.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  if vfOrdem <> '0' then
    dmEstoque.qyProdutosEst.SQL.Add(' ORDER BY ' + vfOrdem);
  dmEstoque.qyProdutosEst.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarProdutosEst(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmEstoque.qyProdutosEst.Close;
  dmEstoque.qyProdutosEst.SQL.Clear;
  dmEstoque.qyProdutosEst.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmEstoque.qyProdutosEst.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmEstoque.qyProdutosEst.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmEstoque.qyProdutosEst.SQL.Add(' ORDER BY ' + vfOrdem);
  dmEstoque.qyProdutosEst.Open;
end;

procedure AtualizaReservas(vfCodProduto: Integer);
Var
vFisico, vReservas, vDisponivel: Real;
begin
  FiltrarProdutosEst('PRO_CODIGO', '=', IntToStr(vfCodProduto), '0');
  vReservas := SomaProdutoRes(vfCodProduto);
  if dmEstoque.qyProdutosEstPRO_CODIGO.IsNull then
  begin
    vFisico := 0;
    vDisponivel := vFisico - vReservas;
    InsProdutosEst;
    dmEstoque.qyProdutosEstPRO_CODIGO.Value := vfCodProduto;
    dmEstoque.qyProdutosEstEST_FISICO.Value := vFisico;
    dmEstoque.qyProdutosEstEST_RESERVAS.Value := vReservas;
    dmEstoque.qyProdutosEstEST_DISPONIVEL.Value := vDisponivel;
    PostProdutosEst;
  end
  else
  begin
    vFisico := dmEstoque.qyProdutosEstEST_FISICO.Value;
    vDisponivel := vFisico - vReservas;
    EdtProdutosEst;
    dmEstoque.qyProdutosEstEST_FISICO.Value := vFisico;
    dmEstoque.qyProdutosEstEST_RESERVAS.Value := vReservas;
    dmEstoque.qyProdutosEstEST_DISPONIVEL.Value := vDisponivel;
    PostProdutosEst;
  end;
end;

procedure EntradaEstoque(vfCodProduto: Integer; vfQuantidade: Real);
Var
vQuantAnt: Real;
begin
  FiltrarProdutosEst('PRO_CODIGO', '=', IntToStr(vfCodProduto), '0');
  vQuantAnt := dmEstoque.qyProdutosEstEST_FISICO.Value;
  if dmEstoque.qyProdutosEstPRO_CODIGO.IsNull then
  begin
    InsProdutosEst;
    dmEstoque.qyProdutosEstPRO_CODIGO.Value := vfCodProduto;
    dmEstoque.qyProdutosEstEST_FISICO.Value := vQuantAnt + vfQuantidade;
    dmEstoque.qyProdutosEstEST_RESERVAS.Value := 0;
    dmEstoque.qyProdutosEstEST_DISPONIVEL.Value := 0;
  end
  else
  begin
    EdtProdutosEst;
    dmEstoque.qyProdutosEstPRO_CODIGO.Value := vfCodProduto;
    dmEstoque.qyProdutosEstEST_FISICO.Value := vQuantAnt + vfQuantidade;
  end;
  PostProdutosEst;
  AtualizaReservas(vfCodProduto);
end;

procedure SaidaEstoque(vfCodProduto: Integer; vfQuantidade: Real);
Var
vQuantAnt: Real;
begin
  FiltrarProdutosEst('PRO_CODIGO', '=', IntToStr(vfCodProduto), '0');
  vQuantAnt := dmEstoque.qyProdutosEstEST_FISICO.Value;
  if dmEstoque.qyProdutosEstPRO_CODIGO.IsNull then
  begin
    InsProdutosEst;
    dmEstoque.qyProdutosEstPRO_CODIGO.Value := vfCodProduto;
    dmEstoque.qyProdutosEstEST_FISICO.Value := vQuantAnt - vfQuantidade;
    dmEstoque.qyProdutosEstEST_RESERVAS.Value := 0;
    dmEstoque.qyProdutosEstEST_DISPONIVEL.Value := 0;
  end
  else
  begin
    EdtProdutosEst;
    dmEstoque.qyProdutosEstPRO_CODIGO.Value := vfCodProduto;
    dmEstoque.qyProdutosEstEST_FISICO.Value := vQuantAnt - vfQuantidade;
  end;
  PostProdutosEst;
  AtualizaReservas(vfCodProduto);
end;

procedure ConsProdutosEst(vfCodProduto: String);
begin
  dmConsultas.qyConsProdutosEst.Close;
  dmConsultas.qyConsProdutosEst.SQL.Clear;
  dmConsultas.qyConsProdutosEst.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmConsultas.qyConsProdutosEst.SQL.Add('WHERE PRO_CODIGO = ' + vfCodProduto);
  dmConsultas.qyConsProdutosEst.Open;
end;

end.
