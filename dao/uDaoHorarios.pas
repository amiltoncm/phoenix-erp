unit uDaoHorarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure InsHorarios;
procedure EdtHorarios;
procedure PostHorarios;
procedure DelHorarios;
procedure DelAllHorarios;
procedure ListarHorarios(vfOrdem: String);
procedure FiltrarHorarios(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);

const
ctCampos = 'hor_horas';
ctTabelas = 'horarios';

implementation

uses dataGestao;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsHorarios;
begin
  if dmGestao.qyHorarios.Active = false then
    dmGestao.qyHorarios.Active := True;
  dmGestao.qyHorarios.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtHorarios;
begin
  dmGestao.qyHorarios.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostHorarios;
begin
  try
    //if dmGestao.qyHorarios.State in [dsInsert] then
      //dmGestao.qyHorarioshor_horas.Value := GetCodigo('hor_horas', 'Horarios');
    dmGestao.qyHorarios.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmGestao.qyHorarios.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelHorarios;
begin
  try
    dmGestao.qyHorarios.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                  E.Message,mtError,[mbOk],0);
      dmGestao.qyHorarios.Refresh;
    end;
  end;
end;

procedure DelAllHorarios;
begin
  dmGestao.scriptDelHorarios.SQL.Clear;
  dmGestao.scriptDelHorarios.SQL.Add('delete from horarios');
  dmGestao.scriptDelHorarios.ExecSQL;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarHorarios(vfOrdem: String);
begin
  dmGestao.qyHorarios.Close;
  dmGestao.qyHorarios.SQL.Clear;
  dmGestao.qyHorarios.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  if vfOrdem <> '0' then
    dmGestao.qyHorarios.SQL.Add(' order by ' + vfOrdem);
  dmGestao.qyHorarios.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarHorarios(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);
begin
  dmGestao.qyHorarios.Close;
  dmGestao.qyHorarios.SQL.Clear;
  dmGestao.qyHorarios.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas + ' where ');
  dmGestao.qyHorarios.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmGestao.qyHorarios.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmGestao.qyHorarios.SQL.Add(' order by ' + vfOrdem);
  dmGestao.qyHorarios.Open;
end;

end.
