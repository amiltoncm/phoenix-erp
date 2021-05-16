unit uDaoFuncoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure InsFuncoes;
procedure EdtFuncoes;
procedure PostFuncoes;
procedure ListarFuncoes(vfOrdem: String);
procedure FiltrarFuncoes(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);

const
ctCampos = 'FNC_CODIGO, FNC_DESCRICAO';
ctTabelas = 'FUNCOES';

implementation

uses dataCadastros;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsFuncoes;
begin
  if dmCadastros.qyFuncoes.Active = false then
    dmCadastros.qyFuncoes.Active := True;
  dmCadastros.qyFuncoes.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtFuncoes;
begin
  dmCadastros.qyFuncoes.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostFuncoes;
begin
  try
    //if dmCadastros.qyFuncoes.State in [dsInsert] then
      //dmCadastros.qyFuncoesFNC_CODIGO.Value := GetCodigo('FNC_CODIGO', 'Funcoes');
    dmCadastros.qyFuncoes.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmCadastros.qyFuncoes.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarFuncoes(vfOrdem: String);
begin
  dmCadastros.qyFuncoes.Close;
  dmCadastros.qyFuncoes.SQL.Clear;
  dmCadastros.qyFuncoes.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  if vfOrdem <> '0' then
    dmCadastros.qyFuncoes.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyFuncoes.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarFuncoes(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmCadastros.qyFuncoes.Close;
  dmCadastros.qyFuncoes.SQL.Clear;
  dmCadastros.qyFuncoes.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmCadastros.qyFuncoes.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qyFuncoes.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmCadastros.qyFuncoes.SQL.Add(' ORDER BY ' + vfOrdem);
  dmCadastros.qyFuncoes.Open;
end;

end.
