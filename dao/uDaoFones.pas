unit uDaoFones;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure InsFones;
procedure EdtFones;
procedure PostFones;
procedure DelFones;
procedure ListarFones(vfOrdem: String);
procedure FiltrarFones(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
function GetSetorPadrao: String;
function GetTipoFonePadrao: String;
function GetTpEndEletroPadrao: String;

const
ctCampos = 'F.FON_CODIGO, F.SET_CODIGO, S.SET_DESCRICAO, F.TPF_CODIGO, ' +
           'T.TPF_DESCRICAO, F.FON_NUMERO,  F.PES_CODIGO, F.FON_CONTATO';
ctTabelas = 'FONES F, FONESTIPO T, SETOR S';

implementation

uses dataPessoas, uFuncoesDB;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsFones;
begin
  if dmPessoas.qyFones.Active = false then
    dmPessoas.qyFones.Active := True;
  dmPessoas.qyFones.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtFones;
begin
  dmPessoas.qyFones.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostFones;
begin
  try
    if dmPessoas.qyFones.State in [dsInsert] then
      dmPessoas.qyFonesFON_CODIGO.Value := GetCodigo('FON_CODIGO', 'FONES');
    dmPessoas.qyFones.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmPessoas.qyFones.Refresh;
    end;
  end;
end;

procedure DelFones;
begin
  try
    dmPessoas.qyFones.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmPessoas.qyFones.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarFones(vfOrdem: String);
begin
  dmPessoas.qyFones.Close;
  dmPessoas.qyFones.SQL.Clear;
  dmPessoas.qyFones.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmPessoas.qyFones.SQL.Add(' WHERE F.TPF_CODIGO = T.TPF_CODIGO ' +
                            'AND F.SET_CODIGO = S.SET_CODIGO ');
  if vfOrdem <> '0' then
    dmPessoas.qyFones.SQL.Add(' ORDER BY ' + vfOrdem);
  dmPessoas.qyFones.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarFones(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmPessoas.qyFones.Close;
  dmPessoas.qyFones.SQL.Clear;
  dmPessoas.qyFones.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmPessoas.qyFones.SQL.Add(' WHERE F.TPF_CODIGO = T.TPF_CODIGO ' +
                            'AND F.SET_CODIGO = S.SET_CODIGO AND ');
  dmPessoas.qyFones.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmPessoas.qyFones.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmPessoas.qyFones.SQL.Add(' ORDER BY ' + vfOrdem);
  dmPessoas.qyFones.Open;
end;

function GetSetorPadrao: String;
begin
  dmPessoas.QTemp.Close;
  dmPessoas.QTemp.SQL.Clear;
  dmPessoas.QTemp.SQL.Add('SELECT SET_DESCRICAO FROM SETOR');
  dmPessoas.QTemp.SQL.Add('WHERE SET_CODIGO = 0');
  dmPessoas.QTemp.Open;
  Result := dmPessoas.QTemp.Fields[0].Text;
end;

function GetTipoFonePadrao: String;
begin
  dmPessoas.QTemp.Close;
  dmPessoas.QTemp.SQL.Clear;
  dmPessoas.QTemp.SQL.Add('SELECT TPF_DESCRICAO FROM FONESTIPO');
  dmPessoas.QTemp.SQL.Add('WHERE TPF_CODIGO = 0');
  dmPessoas.QTemp.Open;
  Result := dmPessoas.QTemp.Fields[0].Text;
end;

function GetTpEndEletroPadrao: String;
begin
  dmPessoas.QTemp.Close;
  dmPessoas.QTemp.SQL.Clear;
  dmPessoas.QTemp.SQL.Add('SELECT TPN_DESCRICAO FROM ENDELETROTIPO');
  dmPessoas.QTemp.SQL.Add('WHERE TPN_CODIGO = 0');
  dmPessoas.QTemp.Open;
  Result := dmPessoas.QTemp.Fields[0].Text;
end;

end.
