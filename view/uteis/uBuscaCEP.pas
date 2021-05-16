unit uBuscaCEP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Data.DB;

type
  TfrmBuscaCEP = class(TfrmTmpFormNormal)
    Label1: TLabel;
    meCep: TMaskEdit;
    btBuscar: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    edLogradouro: TEdit;
    Label3: TLabel;
    edBairro: TEdit;
    Label4: TLabel;
    edCidade: TEdit;
    edCodCidade: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edUf: TEdit;
    Label7: TLabel;
    edCodUf: TEdit;
    btConfirmar: TBitBtn;
    procedure btBuscarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscaCEP: TfrmBuscaCEP;

implementation

{$R *.dfm}

uses uConsultaCEP, uDaoUf, uDaoCidades, uClassCep, dataPessoas, uDaoEnderecos,
  dataConfig, uDaoEmpresa, uDaoPessoas, dataCadastros;

procedure TfrmBuscaCEP.btBuscarClick(Sender: TObject);
var
vWs: AtendeCliente;
vEndereco: TEndereco;
begin
  vWs := GetAtendeCliente();
  try
    vEndereco := vWs.consultaCEP(meCEP.Text);
    edLogradouro.Text := UpperCase(vEndereco.logradouro);
    edBairro.Text := UpperCase(vEndereco.bairro);
    edCidade.Text := UpperCase(vEndereco.cidade);
    edUf.Text := UpperCase(vEndereco.uf);
    edCodUf.Text := GetCodUf(edUf.Text);
    edCodCidade.Text := GetCodCidade(edCidade.Text, edUf.Text);
    btConfirmar.SetFocus;
  except
    on E: Exception do
    begin
      MessageDlg('Não foi possível eefetuar a busca pelo CEP!' + #13 +
          E.Message, mtError,[mbOk], 0);
      btBuscar.SetFocus;
    end;
  end;
end;

procedure TfrmBuscaCEP.btConfirmarClick(Sender: TObject);
Var
vCep: TCep;
begin
  //Verifica endereço principal do cadastro de pessoas
  if dmPessoas.qyPessoas.State in [dsInsert] then
  begin
    vCep := TCep.Create;
    vCep.Cep := meCep.Text;
    vCep.Logradouro := edLogradouro.Text;
    vCep.Bairro := edBairro.Text;
    vCep.Cidade := edCidade.Text;
    vCep.Codcidade := edCodCidade.Text;
    vCep.Uf := edUf.Text;
    vCep.Coduf := edCodUf.Text;
    SetValuesPessoasCep(vCep);
    vCep.Free;
  end;
  //Verifica tabela Endereços
  if dmPessoas.qyEnderecos.State in [dsInsert] then
  begin
    vCep := TCep.Create;
    vCep.Cep := meCep.Text;
    vCep.Logradouro := edLogradouro.Text;
    vCep.Bairro := edBairro.Text;
    vCep.Cidade := edCidade.Text;
    vCep.Codcidade := edCodCidade.Text;
    vCep.Uf := edUf.Text;
    vCep.Coduf := edCodUf.Text;
    SetValuesEndCep(vCep);
    vCep.Free;
  end;
  //Verifica Cadastro de Empresa
  if dmConfig.qyEmpresa.State in [dsInsert, dsEdit] then
  begin
    vCep := TCep.Create;
    vCep.Cep := meCep.Text;
    vCep.Logradouro := edLogradouro.Text;
    vCep.Bairro := edBairro.Text;
    vCep.Cidade := edCidade.Text;
    vCep.Codcidade := edCodCidade.Text;
    vCep.Uf := edUf.Text;
    vCep.Coduf := edCodUf.Text;
    SetValuesEmpresaCep(vCep);
    vCep.Free;
  end;
  Close;
end;

procedure TfrmBuscaCEP.FormActivate(Sender: TObject);
begin
  inherited;
  meCep.Clear;
  edLogradouro.Clear;
  edBairro.Clear;
  edCidade.Clear;
  edUf.Clear;
  edCodCidade.Clear;
  edCodUf.Clear;
  meCep.SetFocus;
end;

end.
