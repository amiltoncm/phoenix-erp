unit uDaoBancos;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassBancos;

procedure SetValuesBancos(vfBancos: TBancos);
procedure InsBancos;
procedure EdtBancos;
procedure PostBancos;
procedure DelBancos;
procedure ListarBancos(vfOrdem: String);
procedure FiltrarBancos(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
function GetBanco: String;

const
ctCampos = 'ban_codigo, ban_descricao';
ctTabelas = 'bancos';

implementation

uses dataCadastros;

{--- Seta algum valor na tabela -----------------------------------------------}


procedure SetValuesBancos(vfBancos: TBancos);
begin
  dmCadastros.qyBancosban_codigo.Value := vfBancos.Codigo;
  dmCadastros.qyBancosban_descricao.Value := vfBancos.Descricao;
end;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsBancos;
begin
  if dmCadastros.qyBancos.Active = false then
    dmCadastros.qyBancos.Active := True;
  dmCadastros.qyBancos.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtBancos;
begin
  dmCadastros.qyBancos.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostBancos;
begin
  try
    dmCadastros.qyBancos.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmCadastros.qyBancos.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelBancos;
begin
  try
    dmCadastros.qyBancos.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                  E.Message,mtError,[mbOk],0);
      dmCadastros.qyBancos.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarBancos(vfOrdem: String);
begin
  dmCadastros.qyBancos.Close;
  dmCadastros.qyBancos.SQL.Clear;
  dmCadastros.qyBancos.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  if vfOrdem <> '0' then
    dmCadastros.qyBancos.SQL.Add(' order by ' + vfOrdem);
  dmCadastros.qyBancos.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarBancos(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);
begin
  dmCadastros.qyBancos.Close;
  dmCadastros.qyBancos.SQL.Clear;
  dmCadastros.qyBancos.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas + ' where ');
  dmCadastros.qyBancos.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCadastros.qyBancos.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmCadastros.qyBancos.SQL.Add(' order by ' + vfOrdem);
  dmCadastros.qyBancos.Open;
end;

function GetBanco: String;
begin
  Result := dmCadastros.qyBancosBAN_DESCRICAO.Text;
end;

end.

