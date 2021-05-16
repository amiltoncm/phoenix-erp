unit uDaoProdutosComp;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassProdutosComp;

procedure SetValuesProdutosComp(vfProdutosComp: TProdutosComp);
procedure InsProdutosComp;
procedure EdtProdutosComp;
procedure PostProdutosComp;
procedure DelProdutosComp;
procedure ListarProdutosComp(vfOrdem: String);
procedure FiltrarProdutosComp(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
function TestaProdComp(vfCodProd: String; vfCodComp: String): boolean;

const
ctCampos = 'c.pro_codcomp, c.pro_codigo, p.pro_descricao, p.uni_codigo, ' +
           'p.pro_vlratac, p.pro_vlrvar';
ctTabelas = 'produtoscomp c, produtos p';

implementation

uses dataEstoque;

{--- Seta algum valor na tabela -----------------------------------------------}

procedure SetValuesProdutosComp(vfProdutosComp: TProdutosComp);
begin
  dmEstoque.qyProdutosComppro_codigo.Value := vfProdutoscomp.Codigo;
  dmEstoque.qyProdutosComppro_codcomp.Value := vfProdutoscomp.CodComp;
end;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsProdutosComp;
begin
  if dmEstoque.qyProdutosComp.Active = false then
    dmEstoque.qyProdutosComp.Active := True;
  dmEstoque.qyProdutosComp.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtProdutosComp;
begin
  dmEstoque.qyProdutosComp.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostProdutosComp;
begin
  try
    dmEstoque.qyProdutosComp.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmEstoque.qyProdutosComp.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelProdutosComp;
begin
  try
    dmEstoque.qyProdutosComp.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                 E.Message,mtError,[mbOk],0);
      dmEstoque.qyProdutosComp.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarProdutosComp(vfOrdem: String);
begin
  dmEstoque.qyProdutosComp.Close;
  dmEstoque.qyProdutosComp.SQL.Clear;
  dmEstoque.qyProdutosComp.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  dmEstoque.qyProdutosComp.SQL.Add(' where c.pro_codcomp = p.pro_codigo ');
  if vfOrdem <> '0' then
    dmEstoque.qyProdutosComp.SQL.Add(' order by ' + vfOrdem);
  dmEstoque.qyProdutosComp.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarProdutosComp(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);
begin
  dmEstoque.qyProdutosComp.Close;
  dmEstoque.qyProdutosComp.SQL.Clear;
  dmEstoque.qyProdutosComp.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmEstoque.qyProdutosComp.SQL.Add(' where c.pro_codcomp = p.pro_codigo and ');
  dmEstoque.qyProdutosComp.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmEstoque.qyProdutosComp.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmEstoque.qyProdutosComp.SQL.Add(' order by ' + vfOrdem);
  dmEstoque.qyProdutosComp.Open;
end;

function TestaProdComp(vfCodProd: String; vfCodComp: String): boolean;
begin
  dmEstoque.QTemp.Close;
  dmEstoque.QTemp.SQL.Clear;
  dmEstoque.QTemp.SQL.Add('select pro_codigo from produtoscomp ');
  dmEstoque.QTemp.SQL.Add('where pro_codigo = ' + vfCodProd);
  dmEstoque.QTemp.SQL.Add(' and pro_codcomp = ' + vfCodComp);
  dmEstoque.QTemp.Open;
  if dmEstoque.QTemp.Fields[0].IsNull then
    Result := false
  else
    Result := true;
end;

end.

