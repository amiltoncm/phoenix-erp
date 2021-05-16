unit uDaoEnderecos;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassCep, uClassEnderecoent;

procedure SetValuesEndCep(vfCep: TCep);
procedure InsEnderecos;
procedure EdtEnderecos;
procedure PostEnderecos;
procedure DelEnderecos;
procedure ListarEnderecos(vfOrdem: String);
procedure FiltrarEnderecos(vfCampoFil: String; vfOperador: String; vfParametro:
		                       String; vfOrdem: String);
function GetEnderecoEnt(vfCodigo: String): TEnderecoent;

const
ctCampos = 'E.END_CODIGO, E.PES_CODIGO, E.TPE_CODIGO, T.TPE_DESCRICAO, E.TPL_CODIGO, ' +
           'L.TPL_DESCRICAO, E.END_LOGRADOURO, E.END_NUMERO, E.END_COMPLEMENTO, ' +
           'E.END_BAIRRO, E.END_PTREFERENCIA, E.CID_CODIGO, C.CID_MUNICIPIO, C.UF_SIGLA, E.END_CEP';
ctTabelas = 'ENDERECOS E, ENDERECOSTIPO T, LOGRADOUROSTIPO L, CIDADES C';

implementation

uses dataPessoas, uFuncoesDB, uVarGlobal;

procedure SetValuesEndCep(vfCep: TCep);
begin
  dmPessoas.qyEnderecosEND_LOGRADOURO.Text := vfCep.Logradouro;
  dmPessoas.qyEnderecosEND_BAIRRO.Text := vfCep.Bairro;
  dmPessoas.qyEnderecosCID_CODIGO.Text := vfCep.Codcidade;
  dmPessoas.qyEnderecosCID_MUNICIPIO.Text := vfCep.Cidade;
  dmPessoas.qyEnderecosUF_SIGLA.Text := vfCep.Uf;
  dmPessoas.qyEnderecosEND_CEP.Text := vfCep.Cep;
end;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsEnderecos;
begin
  if dmPessoas.qyEnderecos.Active = false then
    dmPessoas.qyEnderecos.Active := True;
  dmPessoas.qyEnderecos.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtEnderecos;
begin
  dmPessoas.qyEnderecos.Edit;
end;

procedure DelEnderecos;
begin
  try
    dmPessoas.qyEnderecos.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Não foi possível excluir o registro!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmPessoas.qyEnderecos.Refresh;
    end;
  end;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostEnderecos;
begin
  try
    if dmPessoas.qyEnderecos.State in [dsInsert] then
      dmPessoas.qyEnderecosEND_CODIGO.Value := GetCodigo('END_CODIGO', 'ENDERECOS');
    dmPessoas.qyEnderecos.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmPessoas.qyEnderecos.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarEnderecos(vfOrdem: String);
begin
  dmPessoas.qyEnderecos.Close;
  dmPessoas.qyEnderecos.SQL.Clear;
  dmPessoas.qyEnderecos.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmPessoas.qyEnderecos.SQL.Add(' WHERE E.TPE_CODIGO = T.TPE_CODIGO ' +
                                'AND E.TPL_CODIGO = L.TPL_CODIGO ' +
                                'AND E.CID_CODIGO = C.CID_CODIGO ');
  if vfOrdem <> '0' then
    dmPessoas.qyEnderecos.SQL.Add(' ORDER BY ' + vfOrdem);
  dmPessoas.qyEnderecos.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarEnderecos(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmPessoas.qyEnderecos.Close;
  dmPessoas.qyEnderecos.SQL.Clear;
  dmPessoas.qyEnderecos.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmPessoas.qyEnderecos.SQL.Add(' WHERE E.TPE_CODIGO = T.TPE_CODIGO ' +
                                'AND E.TPL_CODIGO = L.TPL_CODIGO ' +
                                'AND E.CID_CODIGO = C.CID_CODIGO AND ');
  dmPessoas.qyEnderecos.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmPessoas.qyEnderecos.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmPessoas.qyEnderecos.SQL.Add(' ORDER BY ' + vfOrdem);
  dmPessoas.qyEnderecos.Open;
end;

function GetEnderecoEnt(vfCodigo: String): TEnderecoent;
begin
  FiltrarEnderecos('END_CODIGO', '=', vfCodigo, '0');
  vgEnderecoEnt.Codigo := dmPessoas.qyEnderecosEND_CODIGO.Value;
  vgEnderecoEnt.Logradouro := dmPessoas.qyEnderecosEND_LOGRADOURO.Text;
  vgEnderecoEnt.Numero := dmPessoas.qyEnderecosEND_NUMERO.Value;
  vgEnderecoEnt.Bairro := dmPessoas.qyEnderecosEND_BAIRRO.Text;
  vgEnderecoEnt.Cidade := dmPessoas.qyEnderecosCID_MUNICIPIO.Text;
  vgEnderecoEnt.Uf := dmPessoas.qyEnderecosUF_SIGLA.Text;
end;

end.
