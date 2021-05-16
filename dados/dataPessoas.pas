unit dataPessoas;

interface

uses
  System.SysUtils, System.Classes, dataTmpConexao, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, ZSqlUpdate;

type
  TdmPessoas = class(TdmTmpConexao)
    qyPessoas: TZQuery;
    qyPessoasObs: TZQuery;
    qyPessoasFinanc: TZQuery;
    qyEndEletro: TZQuery;
    qyEnderecos: TZQuery;
    qyFones: TZQuery;
    updPessoas: TZUpdateSQL;
    updPessoasObs: TZUpdateSQL;
    updPessoasFinanc: TZUpdateSQL;
    updEndEletro: TZUpdateSQL;
    updEnderecos: TZUpdateSQL;
    updFones: TZUpdateSQL;
    qyFonesfon_codigo: TIntegerField;
    qyFonesset_codigo: TIntegerField;
    qyFonesset_descricao: TWideStringField;
    qyFonestpf_codigo: TIntegerField;
    qyFonestpf_descricao: TWideStringField;
    qyFonesfon_numero: TWideStringField;
    qyFonespes_codigo: TIntegerField;
    qyFonesfon_contato: TWideStringField;
    qyEnderecosend_codigo: TIntegerField;
    qyEnderecospes_codigo: TIntegerField;
    qyEnderecostpe_codigo: TIntegerField;
    qyEnderecostpe_descricao: TWideStringField;
    qyEnderecostpl_codigo: TIntegerField;
    qyEnderecostpl_descricao: TWideStringField;
    qyEnderecosend_logradouro: TWideStringField;
    qyEnderecosend_numero: TIntegerField;
    qyEnderecosend_complemento: TWideStringField;
    qyEnderecosend_bairro: TWideStringField;
    qyEnderecosend_ptreferencia: TWideStringField;
    qyEnderecoscid_codigo: TIntegerField;
    qyEnderecoscid_municipio: TWideStringField;
    qyEnderecosuf_sigla: TWideStringField;
    qyEnderecosend_cep: TWideStringField;
    qyEndEletrotpn_codigo: TIntegerField;
    qyEndEletrotpn_descricao: TWideStringField;
    qyEndEletroenl_codigo: TIntegerField;
    qyEndEletroenl_endereco: TWideStringField;
    qyEndEletropes_codigo: TIntegerField;
    qyEndEletroset_codigo: TIntegerField;
    qyEndEletroset_descricao: TWideStringField;
    qyEndEletroenl_contato: TWideStringField;
    qyPessoaspes_codigo: TIntegerField;
    qyPessoaspes_nome: TWideStringField;
    qyPessoaspes_nomefantasia: TWideStringField;
    qyPessoaspes_documento: TWideStringField;
    qyPessoaspes_identificacao: TWideStringField;
    qyPessoastpl_codigo: TIntegerField;
    qyPessoastpl_descricao: TWideStringField;
    qyPessoaspes_logradouro: TWideStringField;
    qyPessoaspes_numero: TIntegerField;
    qyPessoaspes_complemento: TWideStringField;
    qyPessoaspes_bairro: TWideStringField;
    qyPessoascid_codigo: TIntegerField;
    qyPessoascid_municipio: TWideStringField;
    qyPessoasuf_sigla: TWideStringField;
    qyPessoaspes_ptreferencia: TWideStringField;
    qyPessoaspes_fone: TWideStringField;
    qyPessoaspes_cep: TWideStringField;
    qyPessoaspes_cliente: TWideStringField;
    qyPessoaspes_fornecedor: TWideStringField;
    qyPessoaspes_transportadora: TWideStringField;
    qyPessoaspes_tipo: TWideStringField;
    qyPessoaspes_ativo: TWideStringField;
    qyPessoaspes_datacad: TDateField;
    qyPessoaspes_email: TWideStringField;
    qyPessoasObspes_codigo: TIntegerField;
    qyPessoasObspes_obs: TWideStringField;
    qyPessoasFinancpes_codigo: TIntegerField;
    qyPessoasFinancpef_tabvenda: TIntegerField;
    qyPessoasFinancpef_limcred: TFloatField;
    qyPessoasFinancpef_inadimplente: TWideStringField;
    qyPessoasFinancpef_consfin: TIntegerField;
    qyPessoasFinancpef_salorcap: TFloatField;
    qyPessoasFinancpef_indest: TIntegerField;
    procedure qyPessoasAfterDelete(DataSet: TDataSet);
    procedure qyPessoasAfterPost(DataSet: TDataSet);
    procedure qyPessoasBeforeDelete(DataSet: TDataSet);
    procedure qyPessoasBeforePost(DataSet: TDataSet);
    procedure qyPessoasPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyPessoasObsAfterDelete(DataSet: TDataSet);
    procedure qyPessoasObsAfterPost(DataSet: TDataSet);
    procedure qyPessoasObsBeforeDelete(DataSet: TDataSet);
    procedure qyPessoasObsBeforePost(DataSet: TDataSet);
    procedure qyPessoasObsPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyPessoasFinancAfterDelete(DataSet: TDataSet);
    procedure qyPessoasFinancAfterPost(DataSet: TDataSet);
    procedure qyPessoasFinancBeforeDelete(DataSet: TDataSet);
    procedure qyPessoasFinancBeforePost(DataSet: TDataSet);
    procedure qyPessoasFinancPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyEndEletroAfterDelete(DataSet: TDataSet);
    procedure qyEndEletroAfterPost(DataSet: TDataSet);
    procedure qyEndEletroBeforeDelete(DataSet: TDataSet);
    procedure qyEndEletroBeforePost(DataSet: TDataSet);
    procedure qyEndEletroPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyEnderecosAfterDelete(DataSet: TDataSet);
    procedure qyEnderecosAfterPost(DataSet: TDataSet);
    procedure qyEnderecosBeforeDelete(DataSet: TDataSet);
    procedure qyEnderecosBeforePost(DataSet: TDataSet);
    procedure qyEnderecosPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyFonesAfterDelete(DataSet: TDataSet);
    procedure qyFonesAfterPost(DataSet: TDataSet);
    procedure qyFonesBeforeDelete(DataSet: TDataSet);
    procedure qyFonesBeforePost(DataSet: TDataSet);
    procedure qyFonesPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyEndEletroAfterInsert(DataSet: TDataSet);
    procedure qyEnderecosAfterInsert(DataSet: TDataSet);
    procedure qyFonesAfterInsert(DataSet: TDataSet);
    procedure qyPessoasAfterInsert(DataSet: TDataSet);
    procedure qyPessoasFinancAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPessoas: TdmPessoas;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDaoConfig, uDaoCidades, uFuncoesDB;

{$R *.dfm}

{--- qyEndEletro --------------------------------------------------------------}

procedure TdmPessoas.qyEndEletroAfterDelete(DataSet: TDataSet);
begin
  qyEndEletro.ApplyUpdates;
  database.Commit;
  qyEndEletro.CommitUpdates;
end;

procedure TdmPessoas.qyEndEletroAfterInsert(DataSet: TDataSet);
begin
  qyEndEletroTPN_CODIGO.Value := 0;
  qyEndEletroSET_CODIGO.Value := 0;
end;

procedure TdmPessoas.qyEndEletroAfterPost(DataSet: TDataSet);
begin
  qyEndEletro.ApplyUpdates;
  database.Commit;
  qyEndEletro.CommitUpdates;
end;

procedure TdmPessoas.qyEndEletroBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmPessoas.qyEndEletroBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmPessoas.qyEndEletroPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyEndereco ---------------------------------------------------------------}

procedure TdmPessoas.qyEnderecosAfterDelete(DataSet: TDataSet);
begin
  qyEnderecos.ApplyUpdates;
  database.Commit;
  qyEnderecos.CommitUpdates;
end;

procedure TdmPessoas.qyEnderecosAfterInsert(DataSet: TDataSet);
begin
  qyEnderecosTPE_CODIGO.Value := 0;
  qyEnderecosTPE_DESCRICAO.Text := 'ENTREGA';
  qyEnderecosTPL_CODIGO.Value := 0;
  qyEnderecosTPL_DESCRICAO.Text := 'Rua';
  qyEnderecosCID_CODIGO.Value := GetCidPadrao;
  qyEnderecosCID_MUNICIPIO.Value := GetDescCidade(qyEnderecosCID_CODIGO.Text);
end;

procedure TdmPessoas.qyEnderecosAfterPost(DataSet: TDataSet);
begin
  qyEnderecos.ApplyUpdates;
  database.Commit;
  qyEnderecos.CommitUpdates;
end;

procedure TdmPessoas.qyEnderecosBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmPessoas.qyEnderecosBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmPessoas.qyEnderecosPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyFones ------------------------------------------------------------------}

procedure TdmPessoas.qyFonesAfterDelete(DataSet: TDataSet);
begin
  qyFones.ApplyUpdates;
  database.Commit;
  qyFones.CommitUpdates;
end;

procedure TdmPessoas.qyFonesAfterInsert(DataSet: TDataSet);
begin
  qyFonesTPF_CODIGO.Value := 0;
  qyFonesSET_CODIGO.Value :=  0;
end;

procedure TdmPessoas.qyFonesAfterPost(DataSet: TDataSet);
begin
  qyFones.ApplyUpdates;
  database.Commit;
  qyFones.CommitUpdates;
end;

procedure TdmPessoas.qyFonesBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmPessoas.qyFonesBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmPessoas.qyFonesPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyPessoas ----------------------------------------------------------------}

procedure TdmPessoas.qyPessoasAfterDelete(DataSet: TDataSet);
begin
  qyPessoas.ApplyUpdates;
  database.Commit;
  qyPessoas.CommitUpdates;
end;

procedure TdmPessoas.qyPessoasAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qyPessoasTPL_CODIGO.Value := 0;
  qyPessoasTPL_DESCRICAO.Text := 'RUA';
  qyPessoasCID_CODIGO.Value := GetCidPadrao;
  qyPessoasCID_MUNICIPIO.Value := GetDescCidade(qyPessoasCID_CODIGO.Text);
  qyPessoasPES_CLIENTE.Value := 'S';
  qyPessoasPES_FORNECEDOR.Value := 'N';
  qyPessoasPES_TRANSPORTADORA.Value := 'N';
  qyPessoasPES_ATIVO.Value := 'S';
  qyPessoasPES_TIPO.Value := 'F';
  qyPessoaspes_datacad.Text := FormatDateTime('dd/MM/yyyy', GetDateServerPG);
end;

procedure TdmPessoas.qyPessoasAfterPost(DataSet: TDataSet);
begin
  qyPessoas.ApplyUpdates;
  database.Commit;
  qyPessoas.CommitUpdates;
end;

procedure TdmPessoas.qyPessoasBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmPessoas.qyPessoasBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmPessoas.qyPessoasPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyPessoasFinanc ----------------------------------------------------------}

procedure TdmPessoas.qyPessoasFinancAfterDelete(DataSet: TDataSet);
begin
  qyPessoasFinanc.ApplyUpdates;
  database.Commit;
  qyPessoasFinanc.CommitUpdates;
end;

procedure TdmPessoas.qyPessoasFinancAfterInsert(DataSet: TDataSet);
begin
  qyPessoasFinancpef_tabvenda.Value := 2;
  qyPessoasFinancpef_limcred.Value := 0;
  qyPessoasFinancpef_inadimplente.Text := 'S';
  qyPessoasFinancpef_consfin.Value := 0;
  qyPessoasFinancpef_salorcap.Value := 0;
  qyPessoasFinancpef_indest.Value := 1;
end;

procedure TdmPessoas.qyPessoasFinancAfterPost(DataSet: TDataSet);
begin
  qyPessoasFinanc.ApplyUpdates;
  database.Commit;
  qyPessoasFinanc.CommitUpdates;
end;

procedure TdmPessoas.qyPessoasFinancBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmPessoas.qyPessoasFinancBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmPessoas.qyPessoasFinancPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyPessoasObs -------------------------------------------------------------}

procedure TdmPessoas.qyPessoasObsAfterDelete(DataSet: TDataSet);
begin
  qyPessoasObs.ApplyUpdates;
  database.Commit;
  qyPessoasObs.CommitUpdates;
end;

procedure TdmPessoas.qyPessoasObsAfterPost(DataSet: TDataSet);
begin
  qyPessoasObs.ApplyUpdates;
  database.Commit;
  qyPessoasObs.CommitUpdates;
end;

procedure TdmPessoas.qyPessoasObsBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmPessoas.qyPessoasObsBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmPessoas.qyPessoasObsPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

end.
