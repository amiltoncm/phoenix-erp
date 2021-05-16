unit uDaoPessoas;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassPessoas, uClassPessoasend, uClassCep;

procedure SetValuesPessoas(vfPessoas: TPessoas);
procedure SetValuesPessoasCep(vfCep: TCep);
procedure InsPessoas;
procedure PostPessoas;
procedure ListarPessoas(vfOrdem: String);
procedure FiltrarPessoas(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
function VerifCadCNPJ(vfCNPJ: String): Integer;
procedure GetEndereco(vfCodigo: Integer);
function GetNumFone(vfCodPessoa: Integer): String;
function GetNameCont(vfCodPessoa: Integer): String;
function GetCodPessoa(vfNomeCompleto: String): String;
function GetCNPJPes: String;
function GetNomePes: String;
function GetIEPes: String;
function GetMail: String;

const
ctCampos = 'p.pes_codigo, p.pes_nome, p.pes_nomefantasia, p.pes_documento, ' +
           'p.pes_identificacao, p.tpl_codigo, l.tpl_descricao,  p.pes_logradouro, ' +
           'p.pes_numero, p.pes_complemento, p.pes_bairro, p.cid_codigo, c.cid_municipio, c.uf_sigla, ' +
           'p.pes_ptreferencia, p.pes_fone, p.pes_cep, p.pes_cliente, p.pes_fornecedor, ' +
           'p.pes_transportadora, p.pes_tipo, p.pes_ativo, p.pes_datacad, p.pes_email';
ctTabelas = 'pessoas p, logradourostipo l, cidades c';

implementation

uses dataPessoas, uFuncoesDB, uFuncoesFormatacao, uFuncoesString, uVarGlobal;

procedure SetValuesPessoas(vfPessoas: TPessoas);
begin
  dmPessoas.qyPessoasPES_CODIGO.Value := vfPessoas.Codigo;
  dmPessoas.qyPessoasPES_NOME.Text := vfPessoas.Nome;
  dmPessoas.qyPessoasPES_NOMEFANTASIA.Text := vfPessoas.Fantasia;
  dmPessoas.qyPessoasPES_DOCUMENTO.Text := vfPessoas.Documento;
  dmPessoas.qyPessoasPES_IDENTIFICACAO.Text := vfPessoas.Identificacao;
  dmPessoas.qyPessoasPES_LOGRADOURO.Text := vfPessoas.Logradouro;
  dmPessoas.qyPessoasPES_NUMERO.Value := vfPessoas.Numero;
  dmPessoas.qyPessoasPES_BAIRRO.Value := vfPessoas.Bairro;
  dmPessoas.qyPessoasCID_CODIGO.Value := vfPessoas.CodCidade;
  dmPessoas.qyPessoasCID_MUNICIPIO.Text := vfPessoas.Cidade;
  dmPessoas.qyPessoasPES_FONE.Text := vfPessoas.Fone;
  dmPessoas.qyPessoasPES_CEP.Text := vfPessoas.Cep;
  dmPessoas.qyPessoasUF_SIGLA.Text := vfPessoas.Uf;
  dmPessoas.qyPessoasPES_CLIENTE.Text := 'S';
  dmPessoas.qyPessoasPES_FORNECEDOR.Text := 'S';
  dmPessoas.qyPessoasPES_TRANSPORTADORA.Text := 'N';
  dmPessoas.qyPessoasPES_ATIVO.Text := vfPessoas.Ativo;
  dmPessoas.qyPessoasPES_TIPO.Text := vfPessoas.Tipo;
end;

procedure SetValuesPessoasCep(vfCep: TCep);
begin
  dmPessoas.qyPessoasPES_LOGRADOURO.Text := vfCep.Logradouro;
  dmPessoas.qyPessoasPES_BAIRRO.Text := vfCep.Bairro;
  dmPessoas.qyPessoasCID_CODIGO.Text := vfCep.Codcidade;
  dmPessoas.qyPessoasCID_MUNICIPIO.Text := vfCep.Cidade;
  dmPessoas.qyPessoasUF_SIGLA.Text := vfCep.Uf;
  dmPessoas.qyPessoasPES_CEP.Text := vfCep.Cep;
end;

procedure InsPessoas;
begin
  if dmPessoas.qyPessoas.Active = false then
    dmPessoas.qyPessoas.Active := True;
  dmPessoas.qyPessoas.Insert;
end;

procedure PostPessoas;
begin
  try
    if dmPessoas.qyPessoas.State in [dsInsert] then
      dmPessoas.qyPessoasPES_CODIGO.Value := GetCodigo('PES_CODIGO', 'PESSOAS');
    dmPessoas.qyPessoas.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmPessoas.qyPessoas.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarPessoas(vfOrdem: String);
begin
  dmPessoas.qyPessoas.Close;
  dmPessoas.qyPessoas.SQL.Clear;
  dmPessoas.qyPessoas.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmPessoas.qyPessoas.SQL.Add(' WHERE P.TPL_CODIGO = L.TPL_CODIGO ' +
                              'AND P.CID_CODIGO = C.CID_CODIGO ');
  dmPessoas.qyPessoas.SQL.Add('AND PES_CODIGO > 0');
  if vfOrdem <> '0' then
    dmPessoas.qyPessoas.SQL.Add(' ORDER BY ' + vfOrdem);
  dmPessoas.qyPessoas.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarPessoas(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmPessoas.qyPessoas.Close;
  dmPessoas.qyPessoas.SQL.Clear;
  dmPessoas.qyPessoas.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmPessoas.qyPessoas.SQL.Add(' WHERE P.TPL_CODIGO = L.TPL_CODIGO ' +
                              'AND P.CID_CODIGO = C.CID_CODIGO AND ');
  dmPessoas.qyPessoas.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmPessoas.qyPessoas.SQL.Add(QuotedStr(vfParametro));
  dmPessoas.qyPessoas.SQL.Add('AND PES_CODIGO > 0');
  if vfOrdem <> '0' then
    dmPessoas.qyPessoas.SQL.Add(' ORDER BY ' + vfOrdem);
  dmPessoas.qyPessoas.Open;
end;

function VerifCadCNPJ(vfCNPJ: String): Integer;
Var
vDoc: String;
begin
  vDoc := vfCNPJ;
  if Length(vfCNPJ) = 11 then
    vDoc := PontuaCPF(vfCNPJ);
  if Length(vfCNPJ) = 14 then
    vDoc := PontuaCNPJ(Trim(vfCNPJ));
  FiltrarPessoas('PES_DOCUMENTO', '=', vDoc, '0');
  if dmPessoas.qyPessoasPES_CODIGO.IsNull then
    Result := 0
  else
    Result := dmPessoas.qyPessoasPES_CODIGO.Value;
end;

function GetNumFone(vfCodPessoa: Integer): String;
begin
  dmPessoas.QTemp.Close;
  dmPessoas.QTemp.SQL.Clear;
  dmPessoas.QTemp.SQL.Add('SELECT PES_FONE FROM PESSOAS');
  dmPessoas.QTemp.SQL.Add('WHERE PES_CODIGO = ' + IntToStr(vfCodPessoa));
  dmPessoas.QTemp.Open;
  if dmPessoas.QTemp.Fields[0].IsNull then
    Result := ''
  else
    Result := dmPessoas.QTemp.Fields[0].Text;
end;

function GetNameCont(vfCodPessoa: Integer): String;
Var
vNome: String;
begin
  vNome := '';
  dmPessoas.QTemp.Close;
  dmPessoas.QTemp.SQL.Clear;
  dmPessoas.QTemp.SQL.Add('SELECT PES_NOME, PES_TIPO FROM PESSOAS');
  dmPessoas.QTemp.SQL.Add('WHERE PES_CODIGO = ' + IntToStr(vfCodPessoa));
  dmPessoas.QTemp.Open;
  if dmPessoas.QTemp.Fields[0].IsNull then
    Result := ''
  else
  begin
    if dmPessoas.QTemp.Fields[1].Text = 'F' then
      vNome := PrimeiroNome(dmPessoas.QTemp.Fields[0].Text);
    Result := vNome;
  end;
end;

function GetCodPessoa(vfNomeCompleto: String): String;
begin
  dmPessoas.QTemp.Close;
  dmPessoas.QTemp.SQL.Clear;
  dmPessoas.QTemp.SQL.Add('SELECT PES_CODIGO FROM PESSOAS WHERE PES_NOME = ' + QuotedStr(vfNomeCompleto));
  dmPessoas.QTemp.Open;
  if dmPessoas.QTemp.Fields[0].IsNull then
    Result := '0'
  else
    Result := dmPessoas.QTemp.Fields[0].Text;
end;

procedure GetEndereco(vfCodigo: Integer);
begin
  FiltrarPessoas('PES_CODIGO', '=', IntToStr(vfCodigo), '0');
  vgPessoasEnd.Logradouro := dmPessoas.qyPessoasPES_LOGRADOURO.Text;
  vgPessoasEnd.Bairro := dmPessoas.qyPessoasPES_BAIRRO.Text;
  vgPessoasEnd.Codcidade := dmPessoas.qyPessoasCID_CODIGO.Value;
  vgPessoasEnd.Cidade := dmPessoas.qyPessoasCID_MUNICIPIO.Text;
  vgPessoasEnd.Uf := dmPessoas.qyPessoasUF_SIGLA.Text;
  vgPessoasEnd.Cep := dmPessoas.qyPessoasPES_CEP.Text;
  vgPessoasEnd.Numero := dmPessoas.qyPessoasPES_NUMERO.Value;
end;

function GetCNPJPes: String;
begin
  Result := dmPessoas.qyPessoasPES_DOCUMENTO.Text;
end;

function GetNomePes: String;
begin
  Result := dmPessoas.qyPessoasPES_NOME.Text;
end;

function GetIEPes: String;
begin
  Result := dmPessoas.qyPessoasPES_IDENTIFICACAO.Text;
end;

function GetMail: String;
begin
  Result := dmPessoas.qyPessoaspes_email.Text;
end;

end.
