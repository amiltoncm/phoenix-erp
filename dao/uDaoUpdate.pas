unit uDaoUpdate;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure InsUpdate;
procedure EdtUpdate;
procedure PostUpdate;
procedure DelUpdate;
procedure ListarUpdate(vfOrdem: String);
procedure FiltrarUpdate(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
procedure setUpdate(vfUpdate: Integer);
function getUpdate: Integer;

const
ctCampos = 'upd_codigo';
ctTabelas = 'update';

implementation

uses dataConfig;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsUpdate;
begin
  if dmConfig.qyUpdate.Active = false then
    dmConfig.qyUpdate.Active := True;
  dmConfig.qyUpdate.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtUpdate;
begin
  dmConfig.qyUpdate.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostUpdate;
begin
  try
    dmConfig.qyUpdate.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmConfig.qyUpdate.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelUpdate;
begin
  try
    dmConfig.qyUpdate.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                  E.Message,mtError,[mbOk],0);
      dmConfig.qyUpdate.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarUpdate(vfOrdem: String);
begin
  dmConfig.qyUpdate.Close;
  dmConfig.qyUpdate.SQL.Clear;
  dmConfig.qyUpdate.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  if vfOrdem <> '0' then
    dmConfig.qyUpdate.SQL.Add(' order by ' + vfOrdem);
  dmConfig.qyUpdate.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarUpdate(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmConfig.qyUpdate.Close;
  dmConfig.qyUpdate.SQL.Clear;
  dmConfig.qyUpdate.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas + ' where ');
  dmConfig.qyUpdate.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmConfig.qyUpdate.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmConfig.qyUpdate.SQL.Add(' order by ' + vfOrdem);
  dmConfig.qyUpdate.Open;
end;

procedure setUpdate(vfUpdate: Integer);
begin
  EdtUpdate;
  dmConfig.qyUpdateupd_codigo.Value := vfUpdate;
  PostUpdate;
end;

function getUpdate: Integer;
begin
  ListarUpdate('0');
  result := dmConfig.qyUpdateupd_codigo.Value;
end;


end.
