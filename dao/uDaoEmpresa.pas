unit uDaoEmpresa;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassCep;

procedure SetValuesEmpresaCep(vfCep: TCep);
procedure InsEmpresa;
procedure EdtEmpresa;
procedure PostEmpresa;
procedure ListarEmpresa(vfOrdem: String);
procedure FiltrarEmpresa(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
function GetCNPJ: String;
function GetCidadeEmp: String;
function GetNameEmp: String;
function GetUFOrig: String;
function GetIeEmp: String;
function GetEnderecoEmp: String;
function GetNumeroEmp: String;
function GetCRT: Integer;
function GetFantasia: String;
function GetFoneEmp: String;
function GetCepEmp: String;
function GetCplEmp: String;
function GetBairroEmp: String;
function GetCodCidadeEmp: Integer;
function GetDescCidadeEmp: String;
function GetUfEmp: String;
function GetCodPais: Integer;
function GetDescPais: String;
function GetIdeMunFG: Integer;

const
ctCampos = 'E.EMP_CODIGO, E.EMP_RAZAO, E.EMP_FANTASIA, E.EMP_CNPJ, E.EMP_IE, E.EMP_IMUN, ' +
           'E.EMP_LOGRADOURO, E.EMP_NUMERO, E.EMP_COMPLEMENTO, E.EMP_BAIRRO, ' +
           'E.EMP_CIDADE, E.EMP_CODCIDADE, E.EMP_UF, E.EMP_CODPAIS, E.EMP_CEP, E.EMP_FONE, E.EMP_EMAIL, ' +
           'E.EMP_HOMEPAGE, E.REG_CODIGO, R.REG_DESCRICAO';
ctTabelas = 'EMPRESA E, REGIME R';

implementation

uses dataConfig, uFuncoesDB;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure SetValuesEmpresaCep(vfCep: TCep);
begin
  dmConfig.qyEmpresaEMP_LOGRADOURO.Text := vfCep.Logradouro;
  dmConfig.qyEmpresaEMP_BAIRRO.Text := vfCep.Bairro;
  dmConfig.qyEmpresaEMP_CIDADE.Text := vfCep.Cidade;
  dmConfig.qyEmpresaEMP_UF.Text := vfCep.Uf;
  dmConfig.qyEmpresaEMP_CEP.Text := vfCep.Cep;
  dmConfig.qyEmpresaEMP_CODCIDADE.Text := vfCep.Codcidade;
end;

procedure InsEmpresa;
begin
  if dmConfig.qyEmpresa.Active = false then
    dmConfig.qyEmpresa.Active := True;
  dmConfig.qyEmpresa.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtEmpresa;
begin
  dmConfig.qyEmpresa.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostEmpresa;
begin
  try
    if dmConfig.qyEmpresa.State in [dsInsert] then
      dmConfig.qyEmpresaEMP_CODIGO.Value := GetCodigo('EMP_CODIGO', 'empresa');
    dmConfig.qyEmpresa.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmConfig.qyEmpresa.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarEmpresa(vfOrdem: String);
begin
  dmConfig.qyEmpresa.Close;
  dmConfig.qyEmpresa.SQL.Clear;
  dmConfig.qyEmpresa.SQL.Add('SELECT '+ ctCampos + ' FROM ' + ctTabelas);
  dmConfig.qyEmpresa.SQL.Add('WHERE E.REG_CODIGO = R.REG_CODIGO');
  dmConfig.qyEmpresa.SQL.Add('AND EMP_CODIGO = 1 ');
  if vfOrdem <> '0' then
    dmConfig.qyEmpresa.SQL.Add(' ORDER BY ' + vfOrdem);
  dmConfig.qyEmpresa.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarEmpresa(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmConfig.qyEmpresa.Close;
  dmConfig.qyEmpresa.SQL.Clear;
  dmConfig.qyEmpresa.SQL.Add('SELECT ' + ctCampos + ' FROM ' + ctTabelas);
  dmConfig.qyEmpresa.SQL.Add('WHERE E.REG_CODIGO = R.REG_CODIGO');
  dmConfig.qyEmpresa.SQL.Add('AND EMP_CODIGO = 1 ');
  dmConfig.qyEmpresa.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmConfig.qyEmpresa.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmConfig.qyEmpresa.SQL.Add(' ORDER BY ' + vfOrdem);
  dmConfig.qyEmpresa.Open;
end;

function GetCNPJ: String;
begin
  Result := dmConfig.qyEmpresaEMP_CNPJ.Text;
end;

function GetCidadeEmp: String;
begin
  Result := dmConfig.qyEmpresaEMP_CIDADE.Text + '/' + dmConfig.qyEmpresaEMP_UF.Text;
end;

function GetNameEmp;
begin
  Result := dmConfig.qyEmpresaEMP_RAZAO.Text;
end;

function GetUFOrig: String;
begin
  Result := dmConfig.qyEmpresaEMP_UF.Text;
end;

function GetIeEmp: String;
begin
  Result := dmConfig.qyEmpresaEMP_IE.Text;
end;

function GetEnderecoEmp: String;
begin
  Result := dmConfig.qyEmpresaEMP_LOGRADOURO.Text;
end;

function GetNumeroEmp: String;
begin
  Result := dmConfig.qyEmpresaEMP_NUMERO.Text;
end;

function GetCRT: Integer;
begin
  Result := dmConfig.qyEmpresaREG_CODIGO.Value;
end;

function GetFantasia: String;
begin
  Result := dmConfig.qyEmpresaEMP_FANTASIA.Text;
end;

function GetFoneEmp: String;
begin
  Result := dmConfig.qyEmpresaEMP_FONE.Text;
end;

function GetCepEmp: String;
begin
  Result := dmConfig.qyEmpresaEMP_CEP.Text;
end;

function GetCplEmp: String;
begin
  Result := dmConfig.qyEmpresaEMP_COMPLEMENTO.Text;
end;

function GetBairroEmp: String;
begin
  Result := dmConfig.qyEmpresaEMP_BAIRRO.Text;
end;

function GetCodCidadeEmp: Integer;
begin
  Result := dmConfig.qyEmpresaEMP_CODCIDADE.Value;
end;

function GetDescCidadeEmp: String;
begin
  Result := dmConfig.qyEmpresaEMP_CIDADE.Text;
end;

function GetUfEmp: String;
begin
  Result := dmConfig.qyEmpresaEMP_UF.Text;
end;

function GetCodPais: Integer;
begin
  Result := dmConfig.qyEmpresaEMP_CODPAIS.Value;
end;

function GetDescPais: String;
begin
  Result := 'BRASIL';
end;

function GetIdeMunFG: Integer;
begin
  Result := dmConfig.qyEmpresaEMP_CODCIDADE.Value;
end;

end.
