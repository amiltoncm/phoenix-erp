unit uDaoPrevendent;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassPrevEndEnt;

procedure SetValuesPrevendent(vfPrevendent: TPrevendent);
procedure InsPrevendent;
procedure EdtPrevendent;
procedure PostPrevendent;
procedure DelPrevendent;
procedure ListarPrevendent(vfOrdem: String);
procedure FiltrarPrevendent(vfCampoFil: String; vfOperador: String; vfParametro:
		                        String; vfOrdem: String);
procedure SetNumeroPEE(vfNumero: Integer);
procedure SetCodigoPEE(vfCodigo: Integer);
procedure RelPevEnd(vfPreVenda: String);

const
ctCampos = 'PRV_NUMERO, END_CODIGO';
ctTabelas = 'PREVENDENT';

implementation

uses dataOrcamentos;

{--- Seta algum valor na tabela -----------------------------------------------}

procedure SetValuesPrevendent(vfPrevendent: TPrevendent);
begin
  dmOrcamentos.qyPrevEndEntPRV_NUMERO.Value := vfPrevendent.Numero;
  dmOrcamentos.qyPrevEndEntEND_CODIGO.Value := vfPrevendent.Codigo;
end;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsPrevendent;
begin
  if dmOrcamentos.qyPrevendent.Active = false then
    dmOrcamentos.qyPrevendent.Active := True;
  dmOrcamentos.qyPrevendent.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtPrevendent;
begin
  dmOrcamentos.qyPrevendent.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostPrevendent;
begin
  try
    dmOrcamentos.qyPrevendent.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmOrcamentos.qyPrevendent.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelPrevendent;
begin
  try
    dmOrcamentos.qyPrevendent.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmOrcamentos.qyPrevendent.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarPrevendent(vfOrdem: String);
begin
  dmOrcamentos.qyPrevendent.Close;
  dmOrcamentos.qyPrevendent.SQL.Clear;
  dmOrcamentos.qyPrevendent.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  if vfOrdem <> '0' then
    dmOrcamentos.qyPrevendent.SQL.Add(' ORDER BY ' + vfOrdem);
  dmOrcamentos.qyPrevendent.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarPrevendent(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmOrcamentos.qyPrevendent.Close;
  dmOrcamentos.qyPrevendent.SQL.Clear;
  dmOrcamentos.qyPrevendent.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas + ' WHERE ');
  dmOrcamentos.qyPrevendent.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmOrcamentos.qyPrevendent.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmOrcamentos.qyPrevendent.SQL.Add(' ORDER BY ' + vfOrdem);
  dmOrcamentos.qyPrevendent.Open;
end;

procedure SetNumeroPEE(vfNumero: Integer);
begin
  dmOrcamentos.qyPrevEndEntPRV_NUMERO.Value := vfNumero;
end;

procedure SetCodigoPEE(vfCodigo: Integer);
begin
  dmOrcamentos.qyPrevEndEntEND_CODIGO.Value := vfCodigo;
end;

procedure RelPevEnd(vfPreVenda: String);
begin
  dmOrcamentos.qyRelEndEnt.Close;
  dmOrcamentos.qyRelEndEnt.SQL.Clear;
  dmOrcamentos.qyRelEndEnt.SQL.Add('SELECT E.END_LOGRADOURO, E.END_NUMERO, E.END_COMPLEMENTO, ');
  dmOrcamentos.qyRelEndEnt.SQL.Add('E.END_BAIRRO, C.CID_MUNICIPIO, C.UF_SIGLA, E.END_CEP, E.END_PTREFERENCIA ');
  dmOrcamentos.qyRelEndEnt.SQL.Add('FROM ENDERECOS E, CIDADES C, PREVENDENT P ');
  dmOrcamentos.qyRelEndEnt.SQL.Add('WHERE E.CID_CODIGO = C.CID_CODIGO AND P.END_CODIGO = E.END_CODIGO ');
  dmOrcamentos.qyRelEndEnt.SQL.Add('AND P.PRV_NUMERO = ' + vfPreVenda);
  dmOrcamentos.qyRelEndEnt.Open;
end;

end.
