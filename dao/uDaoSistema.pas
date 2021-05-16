unit uDaoSistema;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassSistema;

procedure SetValuesSistema(vfSistema: TSistema);
procedure InsSistema;
procedure EdtSistema;
procedure PostSistema;
procedure DelSistema;
procedure ListarSistema(vfOrdem: String);
procedure FiltrarSistema(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
function GetIDSistema: String;
function GetSerialSistema: String;
function GetDataSistema: String;

const
ctCampos = 'SIS_CODIGO, SIS_MAQUINA, SIS_ID, SIS_SERIAL, SIS_VALIDATE';
ctTabelas = 'SISTEMA';

implementation

uses dataCadastros, uFuncoesDB;

{--- Seta algum valor na tabela -----------------------------------------------}

procedure SetValuesSistema(vfSistema: TSistema);
begin
  dmCadastros.qySistemaSIS_CODIGO.Value := GetCodigo('SIS_CODIGO', 'SISTEMA');
  dmCadastros.qySistemaSIS_MAQUINA.Text := vfSistema.Maquina;
  dmCadastros.qySistemaSIS_ID.Text := vfSistema.Id;
  dmCadastros.qySistemaSIS_SERIAL.Text := vfSistema.Serial;
  dmCadastros.qySistemaSIS_VALIDATE.Value := vfSistema.Validate;
end;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsSistema;
begin
  if dmCadastros.qySistema.Active = false then
    dmCadastros.qySistema.Active := True;
  dmCadastros.qySistema.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtSistema;
begin
  dmCadastros.qySistema.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostSistema;
begin
  try
    dmCadastros.qySistema.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmCadastros.qySistema.Refresh;
    end;
  end;
end;

procedure DelSistema;
begin
  try
    dmCadastros.qySistema.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmCadastros.qySistema.Refresh;
    end;
  end;
end;
{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarSistema(vfOrdem: String);
begin
  dmCadastros.qySistema.Close;
  dmCadastros.qySistema.SQL.Clear;
  dmCadastros.qySistema.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  if vfOrdem <> '0' then
    dmCadastros.qySistema.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qySistema.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarSistema(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);
begin
  dmCadastros.qySistema.Close;
  dmCadastros.qySistema.SQL.Clear;
  dmCadastros.qySistema.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmCadastros.qySistema.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qySistema.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmCadastros.qySistema.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qySistema.Open;
end;

function GetIDSistema: String;
begin
  Result := dmCadastros.qySistemaSIS_ID.Text;
end;

function GetSerialSistema: String;
begin
  Result := dmCadastros.qySistemaSIS_SERIAL.Text;
end;

function GetDataSistema: String;
begin
  Result := dmCadastros.qySistemaSIS_VALIDATE.Text;
end;

end.
