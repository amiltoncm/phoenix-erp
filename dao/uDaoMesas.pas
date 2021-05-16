unit uDaoMesas;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure InsMesas;
procedure EdtMesas;
procedure PostMesas;
procedure DelMesas;
procedure ListarMesas(vfOrdem: String);
procedure FiltrarMesas(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);

const
ctCampos = 'mes_codigo, mes_descricao, mes_ativa';
ctTabelas = 'mesas';

implementation

uses dataGestao;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsMesas;
begin
  if dmGestao.qyMesas.Active = false then
    dmGestao.qyMesas.Active := True;
  dmGestao.qyMesas.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtMesas;
begin
  dmGestao.qyMesas.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostMesas;
begin
  try
    dmGestao.qyMesas.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmGestao.qyMesas.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelMesas;
begin
  try
    dmGestao.qyMesas.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                  E.Message,mtError,[mbOk],0);
      dmGestao.qyMesas.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarMesas(vfOrdem: String);
begin
  dmGestao.qyMesas.Close;
  dmGestao.qyMesas.SQL.Clear;
  dmGestao.qyMesas.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  dmGestao.qyMesas.SQL.Add('where mes_codigo > 0');
  if vfOrdem <> '0' then
    dmGestao.qyMesas.SQL.Add(' order by ' + vfOrdem);
  dmGestao.qyMesas.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarMesas(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmGestao.qyMesas.Close;
  dmGestao.qyMesas.SQL.Clear;
  dmGestao.qyMesas.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmGestao.qyMesas.SQL.Add('where mes_codigo > 0 and ');
  dmGestao.qyMesas.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmGestao.qyMesas.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmGestao.qyMesas.SQL.Add(' order by ' + vfOrdem);
  dmGestao.qyMesas.Open;
end;

end.
