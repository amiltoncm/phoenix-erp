unit uDaoEmailsdest;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassEmailsdest;

procedure SetValuesEmailsdest(vfEmailsdest: TEmailsdest);
procedure InsEmailsdest;
procedure EdtEmailsdest;
procedure PostEmailsdest;
procedure ListarEmailsdest(vfOrdem: String);
procedure FiltrarEmailsdest(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
function TestaEmailsDest(vfEndereco: String): Boolean;

const
ctCampos = 'EMD_CODIGO, EMD_ENDERECO';
ctTabelas = 'EMAILSDEST';

implementation

uses dataDiversos, uFuncoesDB;

{--- Seta algum valor na tabela -----------------------------------------------}


procedure SetValuesEmailsdest(vfEmailsdest: TEmailsdest);
begin
  dmDiversos.qyEmailsDestEMD_CODIGO.Value := vfEmailsdest.Codigo;
  dmDiversos.qyEmailsDestEMD_ENDERECO.Text := vfEmailsdest.Endereco;
end;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsEmailsdest;
begin
  if dmDiversos.qyEmailsdest.Active = false then
    dmDiversos.qyEmailsdest.Active := True;
  dmDiversos.qyEmailsdest.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtEmailsdest;
begin
  dmDiversos.qyEmailsdest.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostEmailsdest;
begin
  try
    if dmDiversos.qyEmailsdest.State in [dsInsert] then
      dmDiversos.qyEmailsdestEMD_CODIGO.Value := GetCodigo('EMD_CODIGO', 'Emailsdest');
    dmDiversos.qyEmailsdest.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmDiversos.qyEmailsdest.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarEmailsdest(vfOrdem: String);
begin
  dmDiversos.qyEmailsdest.Close;
  dmDiversos.qyEmailsdest.SQL.Clear;
  dmDiversos.qyEmailsdest.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  if vfOrdem <> '0' then
    dmDiversos.qyEmailsdest.SQL.Add(' ORDER BY ' + vfOrdem);
  dmDiversos.qyEmailsdest.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarEmailsdest(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);
begin
  dmDiversos.qyEmailsdest.Close;
  dmDiversos.qyEmailsdest.SQL.Clear;
  dmDiversos.qyEmailsdest.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmDiversos.qyEmailsdest.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmDiversos.qyEmailsdest.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmDiversos.qyEmailsdest.SQL.Add(' ORDER BY ' + vfOrdem);
  dmDiversos.qyEmailsdest.Open;
end;

function TestaEmailsDest(vfEndereco: String): Boolean;
begin
  dmDiversos.QTemp.Close;
  dmDiversos.QTemp.SQL.Clear;
  dmDiversos.QTemp.SQL.Add('SELECT EMD_ENDERECO FROM EMAILSDEST');
  dmDiversos.QTemp.SQL.Add('WHERE EMD_ENDERECO = ' + QuotedStr(vfEndereco));
  dmDiversos.QTemp.Open;
  if dmDiversos.QTemp.Fields[0].IsNull then
    Result := False
  else
    Result := True;
end;

end.
