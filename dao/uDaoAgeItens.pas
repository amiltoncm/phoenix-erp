unit uDaoAgeItens;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure SetValuesAgeItens(vfCodItem: Integer; vfCodAg: Integer; vfCodProd: Integer);
procedure InsAgeItens;
procedure EdtAgeItens;
procedure PostAgeItens;
procedure DelAgeItens;
procedure ListarAgeItens(vfOrdem: String);
procedure FiltrarAgeItens(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);

const
ctCampos = 'i.agi_codigo, i.agd_codigo, a.agd_dataag, a.agd_horaag, p.pes_nome, ' +
           'i.pro_codigo, s.pro_descricao';
ctTabelas = 'ageitens i, agenda a, produtos s, pessoas p';

implementation

uses dataGestao, uFuncoesDb;

{--- Seta algum valor na tabela -----------------------------------------------}


procedure SetValuesAgeItens(vfCodItem: Integer; vfCodAg: Integer; vfCodProd: Integer);
begin
  if vfCodItem = 0 then
    dmGestao.qyAgeItensagi_codigo.Value := GetCodigo('agi_codigo', 'ageitens');
  dmGestao.qyAgeItensagd_codigo.Value := vfCodAg;
  dmGestao.qyAgeItenspro_codigo.Value := vfCodProd;
end;


{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsAgeItens;
begin
  if dmGestao.qyAgeItens.Active = false then
    dmGestao.qyAgeItens.Active := True;
  dmGestao.qyAgeItens.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtAgeItens;
begin
  dmGestao.qyAgeItens.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostAgeItens;
begin
  try
    dmGestao.qyAgeItens.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmGestao.qyAgeItens.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelAgeItens;
begin
  try
    dmGestao.qyAgeItens.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                 E.Message,mtError,[mbOk],0);
      dmGestao.qyAgeItens.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarAgeItens(vfOrdem: String);
begin
  dmGestao.qyAgeItens.Close;
  dmGestao.qyAgeItens.SQL.Clear;
  dmGestao.qyAgeItens.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  dmGestao.qyAgeItens.SQL.Add(' where i.agd_codigo = a.agd_codigo ' +
                           'and i.pro_codigo = s.pro_codigo ' +
                           'and a.pes_codigo = p.pes_codigo ');
  if vfOrdem <> '0' then
    dmGestao.qyAgeItens.SQL.Add(' order by ' + vfOrdem);
  dmGestao.qyAgeItens.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarAgeItens(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmGestao.qyAgeItens.Close;
  dmGestao.qyAgeItens.SQL.Clear;
  dmGestao.qyAgeItens.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmGestao.qyAgeItens.SQL.Add(' where i.agd_codigo = a.agd_codigo ' +
                           'and i.pro_codigo = s.pro_codigo ' +
                           'and a.pes_codigo = p.pes_codigo and ');
  dmGestao.qyAgeItens.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmGestao.qyAgeItens.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmGestao.qyAgeItens.SQL.Add(' order by ' + vfOrdem);
  dmGestao.qyAgeItens.Open;
end;

end.
