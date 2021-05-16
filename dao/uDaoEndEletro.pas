unit uDaoEndEletro;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure InsEndEletro;
procedure EdtEndEletro;
procedure PostEndEletro;
procedure DelEndEletro;
procedure ListarEndEletro(vfOrdem: String);
procedure FiltrarEndEletro(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);

const
ctCampos = 'E.TPN_CODIGO, T.TPN_DESCRICAO, E.ENL_CODIGO, E.ENL_ENDERECO, ' +
           'E.PES_CODIGO, E.SET_CODIGO, S.SET_DESCRICAO, E.ENL_CONTATO';
ctTabelas = 'ENDELETRO E, ENDELETROTIPO T, SETOR S';

implementation

uses dataPessoas, uFuncoesDB;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsEndEletro;
begin
  if dmPessoas.qyEndEletro.Active = false then
    dmPessoas.qyEndEletro.Active := True;
  dmPessoas.qyEndEletro.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtEndEletro;
begin
  dmPessoas.qyEndEletro.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostEndEletro;
begin
  try
    if dmPessoas.qyEndEletro.State in [dsInsert] then
      dmPessoas.qyEndEletroENL_CODIGO.Value := GetCodigo('ENL_CODIGO', 'ENDELETRO');
    dmPessoas.qyEndEletro.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmPessoas.qyEndEletro.Refresh;
    end;
  end;
end;

procedure DelEndEletro;
begin
  try
    dmPessoas.qyEndEletro.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmPessoas.qyEndEletro.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarEndEletro(vfOrdem: String);
begin
  dmPessoas.qyEndEletro.Close;
  dmPessoas.qyEndEletro.SQL.Clear;
  dmPessoas.qyEndEletro.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmPessoas.qyEndEletro.SQL.Add(' WHERE E.TPN_CODIGO = T.TPN_CODIGO ' +
                                'AND E.SET_CODIGO = S.SET_CODIGO ');
  if vfOrdem <> '0' then
    dmPessoas.qyEndEletro.SQL.Add(' ORDER BY ' + vfOrdem);
  dmPessoas.qyEndEletro.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarEndEletro(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmPessoas.qyEndEletro.Close;
  dmPessoas.qyEndEletro.SQL.Clear;
  dmPessoas.qyEndEletro.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmPessoas.qyEndEletro.SQL.Add(' WHERE E.TPN_CODIGO = T.TPN_CODIGO ' +
                                'AND E.SET_CODIGO = S.SET_CODIGO AND ');
  dmPessoas.qyEndEletro.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmPessoas.qyEndEletro.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmPessoas.qyEndEletro.SQL.Add(' ORDER BY ' + vfOrdem);
  dmPessoas.qyEndEletro.Open;
end;

end.
