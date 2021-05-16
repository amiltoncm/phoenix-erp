unit uCadPessoaMov;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormalMov, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls, wwdblook, wwdbedit, Wwdotdot,
  Wwdbcomb, Vcl.Mask;

type
  TfrmCadPessoaMov = class(TfrmTmpFormNormalMov)
    Label1: TLabel;
    dbCodigo: TDBEdit;
    Label2: TLabel;
    cbTipo: TwwDBComboBox;
    Label3: TLabel;
    dbNome: TDBEdit;
    Label17: TLabel;
    cbAtivo: TwwDBComboBox;
    dbFantasia: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    dbDocumento: TDBEdit;
    Label6: TLabel;
    dbIdentificacao: TDBEdit;
    Label7: TLabel;
    cbTpLogradouro: TwwDBLookupCombo;
    dbLogradouro: TDBEdit;
    Label8: TLabel;
    dbNumero: TDBEdit;
    Label9: TLabel;
    dbComplemento: TDBEdit;
    Label10: TLabel;
    dbBairro: TDBEdit;
    Label11: TLabel;
    cbCidade: TwwDBLookupCombo;
    Label13: TLabel;
    dbUf: TDBEdit;
    Label12: TLabel;
    dbCodMunicipio: TDBEdit;
    Label14: TLabel;
    dbPtRefer: TDBEdit;
    Label15: TLabel;
    dbFone: TDBEdit;
    Label16: TLabel;
    dbCep: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    btGravar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btGravarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure cbTipoExit(Sender: TObject);
    procedure dbNomeExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPessoaMov: TfrmCadPessoaMov;

implementation

{$R *.dfm}

uses dataPessoas, uDaoPessoas, uDaoLookups, uVarGlobal, uDaoConfig, uFuncoesWeb,
  uBuscaCEP, uFuncoesValidacao, uFuncoesDB;

procedure TfrmCadPessoaMov.btFecharClick(Sender: TObject);
begin
  vgNomeCliCad := dbNome.Text;
  inherited;
end;

procedure TfrmCadPessoaMov.btGravarClick(Sender: TObject);
Var
vValida: Boolean;
begin
  vValida := False;
  //Verifica CPF
  if dsMovimento.DataSet.FieldByName('PES_TIPO').Text = 'F' then
  begin
    if Cpf(dsMovimento.DataSet.FieldByName('PES_DOCUMENTO').Text) = True then
      vValida := True
    else
    begin
      vValida := False;
      MessageDlg('Número de CPF inválido!', mtWarning, [mbOk], 0);
    end;
  end;
  //Verifica CNPJ
  if dsMovimento.DataSet.FieldByName('PES_TIPO').Text = 'J' then
  begin
    if Cnpj(dsMovimento.DataSet.FieldByName('PES_DOCUMENTO').Text) = True then
      vValida := True
    else
    begin
      vValida := False;
      MessageDlg('Número de CNPJ inválido!', mtWarning, [mbOk], 0);
    end;
  end;
  //Verifica CEP
  if VerificaCEP(dsMovimento.DataSet.FieldByName('PES_CEP').Text, dsMovimento.DataSet.FieldByName('UF_SIGLA').Text) = False then
  begin
    vValida := False;
    MessageDlg('O CEP: ' + dbCep.Text +' está fora da área selecionada: ' + dbUf.Text, mtWarning, [mbOk], 0);
  end;
  if vValida = True then
  begin
    if dsMovimento.DataSet.State in [dsInsert] then
      dsMovimento.DataSet.FieldByName('PES_CODIGO').Value := GetCodigo('PES_CODIGO', 'PESSOAS');
    PostPessoas;
    AtualizarLookup('PESSOAS');
    //Atualizar lookup da Requisição de Serviços
    vgNomeCliCad := dbNome.Text;
    Close;
  end;
end;

procedure TfrmCadPessoaMov.cbTipoExit(Sender: TObject);
begin
  if dsMovimento.DataSet.State in [dsInsert] then
  begin
    if dsMovimento.DataSet.FieldByName('pes_tipo').Text = 'F' then
      dmPessoas.qyPessoasPES_DOCUMENTO.EditMask := '000.000.000-00'
    else
      dmPessoas.qyPessoasPES_DOCUMENTO.EditMask := '00.000.000/0000-00';
  end;
end;

procedure TfrmCadPessoaMov.dbNomeExit(Sender: TObject);
begin
  if dsMovimento.DataSet.State in [dsInsert] then
    if dsMovimento.DataSet.FieldByName('pes_nomefantasia').IsNull then
      dsMovimento.DataSet.FieldByName('pes_nomefantasia').Text := dsMovimento.DataSet.FieldByName('pes_nome').Text;
end;

procedure TfrmCadPessoaMov.FormActivate(Sender: TObject);
begin
  inherited;
  vgBuscaCEP := BuscaCEP;
  cbTipo.Text := 'Pessoa Jurídica';
  cbTpLogradouro.Text := dsMovimento.DataSet.FieldByName('TPL_DESCRICAO').Text;
  cbTpLogradouro.PerformSearch;
  if vgBuscaCEP = 'S' then
    if ConectadoWeb = True then
      frmBuscaCEP.ShowModal;
  cbTipo.SetFocus;
end;

procedure TfrmCadPessoaMov.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if dsMovimento.DataSet.State in [dsInsert, dsEdit] then
    dsMovimento.DataSet.Cancel;
end;

end.
