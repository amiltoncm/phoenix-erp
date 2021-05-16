unit uDaoPessoasFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure InsPessoasFinanc;
procedure EdtPessoasFinanc;
procedure PostPessoasFinanc;
procedure DelPessoasFinanc;
procedure ListarPessoasFinanc(vfOrdem: String);
procedure FiltrarPessoasFinanc(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
procedure SetCodPessoaFin(vfCodPessoa: Integer);
function GetTabVen(vfCodPessoa: Integer): Integer;
function GetIndFinal(vfCodPessoa: Integer): Integer;
function GetIndIeDest(vfCodPes: Integer): Integer;

const
ctCampos = 'pes_codigo, pef_tabvenda, pef_limcred, pef_inadimplente, pef_consfin, ' +
           'pef_salorcap, pef_indest';
ctTabelas = 'pessoasfinanc';

implementation

uses dataPessoas;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsPessoasFinanc;
begin
  if dmPessoas.qyPessoasFinanc.Active = false then
    dmPessoas.qyPessoasFinanc.Active := True;
  dmPessoas.qyPessoasFinanc.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtPessoasFinanc;
begin
  dmPessoas.qyPessoasFinanc.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostPessoasFinanc;
begin
  try
    dmPessoas.qyPessoasFinanc.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmPessoas.qyPessoasFinanc.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelPessoasFinanc;
begin
  try
    dmPessoas.qyPessoasFinanc.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                  E.Message,mtError,[mbOk],0);
      dmPessoas.qyPessoasFinanc.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarPessoasFinanc(vfOrdem: String);
begin
  dmPessoas.qyPessoasFinanc.Close;
  dmPessoas.qyPessoasFinanc.SQL.Clear;
  dmPessoas.qyPessoasFinanc.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  if vfOrdem <> '0' then
    dmPessoas.qyPessoasFinanc.SQL.Add(' order by ' + vfOrdem);
  dmPessoas.qyPessoasFinanc.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarPessoasFinanc(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);
begin
  dmPessoas.qyPessoasFinanc.Close;
  dmPessoas.qyPessoasFinanc.SQL.Clear;
  dmPessoas.qyPessoasFinanc.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas + ' where ');
  dmPessoas.qyPessoasFinanc.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmPessoas.qyPessoasFinanc.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmPessoas.qyPessoasFinanc.SQL.Add(' order by ' + vfOrdem);
  dmPessoas.qyPessoasFinanc.Open;
end;

procedure SetCodPessoaFin(vfCodPessoa: Integer);
begin
  dmPessoas.qyPessoasFinancpes_codigo.Value := vfCodPessoa;
end;

function GetTabVen(vfCodPessoa: Integer): Integer;
begin
  dmPessoas.QTemp.Close;
  dmPessoas.QTemp.SQL.Clear;
  dmPessoas.QTemp.SQL.Add('select pef_tabvenda from pessoasfinanc');
  dmPessoas.QTemp.SQL.Add('where pes_codigo = ' + IntToStr(vfCodPessoa));
  dmPessoas.QTemp.Open;
  if dmPessoas.QTemp.Fields[0].IsNull then
    Result := 2
  else
    Result := dmPessoas.QTemp.Fields[0].Value;
end;

function GetIndFinal(vfCodPessoa: Integer): Integer;
begin
  dmPessoas.QTemp.Close;
  dmPessoas.QTemp.SQL.Clear;
  dmPessoas.QTemp.SQL.Add('select pef_consfin from pessoasfinanc');
  dmPessoas.QTemp.SQL.Add('where pes_codigo = ' + IntToStr(vfCodPessoa));
  dmPessoas.QTemp.Open;
  if dmPessoas.QTemp.Fields[0].IsNull then
    Result := 1
  else
    Result := dmPessoas.QTemp.Fields[0].Value;
end;

function GetIndIeDest(vfCodPes: Integer): Integer;
begin
  FiltrarPessoasFinanc('pes_codigo', '=', IntToStr(vfCodPes), '0');
  if dmPessoas.qyPessoasFinancpes_codigo.IsNull then
    Result := 0
  else
    Result := dmPessoas.qyPessoasFinancpef_indest.Value;
end;

end.
