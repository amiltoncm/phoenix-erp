unit dataOrcamentos;

interface

uses
  System.SysUtils, System.Classes, dataTmpConexao, ZSqlUpdate, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection;

type
  TdmOrcamentos = class(TdmTmpConexao)
    ScriptDelPrevRes: TZQuery;
    updScriptDelPrevRes: TZUpdateSQL;
    ScriptDelPrevItens: TZQuery;
    updScriptDelPrevItens: TZUpdateSQL;
    qyCalcItensPV: TZQuery;
    qyAtualizaTotalORC: TZQuery;
    qyAtualizaTotalPREV: TZQuery;
    qySomaProdutoRes: TZQuery;
    qyRelEndEnt: TZQuery;
    qyCalcItensPVpri_codigo: TIntegerField;
    qyCalcItensPVprv_numero: TIntegerField;
    qyCalcItensPVpri_quantidade: TFloatField;
    qyCalcItensPVpro_codigo: TIntegerField;
    qyCalcItensPVpro_descricao: TWideStringField;
    qyCalcItensPVloc_descricao: TWideStringField;
    qyCalcItensPVuni_codigo: TWideStringField;
    qyCalcItensPVpri_vlrcusto: TFloatField;
    qyCalcItensPVpri_vlrbrt: TFloatField;
    qyCalcItensPVpri_vlrdesc: TFloatField;
    qyCalcItensPVpri_percdesc: TFloatField;
    qyCalcItensPVpri_vlrliq: TFloatField;
    qyCalcItensPVpri_vlrtotal: TFloatField;
    qyCalcItensPVpri_percmg: TFloatField;
    qyAtualizaTotalORCtotcusto: TFloatField;
    qyAtualizaTotalORCtotal: TFloatField;
    qyAtualizaTotalPREVtotcusto: TFloatField;
    qyAtualizaTotalPREVtotal: TFloatField;
    qySomaProdutoRessum: TFloatField;
    qyRelEndEntend_logradouro: TWideStringField;
    qyRelEndEntend_numero: TIntegerField;
    qyRelEndEntend_complemento: TWideStringField;
    qyRelEndEntend_bairro: TWideStringField;
    qyRelEndEntcid_municipio: TWideStringField;
    qyRelEndEntuf_sigla: TWideStringField;
    qyRelEndEntend_cep: TWideStringField;
    qyRelEndEntend_ptreferencia: TWideStringField;
    qyOrcamentos: TZQuery;
    qyOrcItens: TZQuery;
    qyStatusOrc: TZQuery;
    qyPrevendas: TZQuery;
    qyPrevItens: TZQuery;
    qyPrevEndEnt: TZQuery;
    qyPrevRes: TZQuery;
    updOrcamentos: TZUpdateSQL;
    updOrcItens: TZUpdateSQL;
    updStatusOrc: TZUpdateSQL;
    updPrevendas: TZUpdateSQL;
    updPrevItens: TZUpdateSQL;
    updPrevEndEnt: TZUpdateSQL;
    updPrevRes: TZUpdateSQL;
    qyOrcamentosorc_numero: TIntegerField;
    qyOrcamentosorc_data: TDateField;
    qyOrcamentospes_codigo: TIntegerField;
    qyOrcamentospes_nome: TWideStringField;
    qyOrcamentospes_fone: TWideStringField;
    qyOrcamentosorc_contato: TWideStringField;
    qyOrcamentosfun_codigo: TIntegerField;
    qyOrcamentosfun_nome: TWideStringField;
    qyOrcamentosorc_tabvenda: TIntegerField;
    qyOrcamentosorc_referente: TWideStringField;
    qyOrcamentosorc_obs: TWideStringField;
    qyOrcamentosorc_vlrcusto: TFloatField;
    qyOrcamentosorc_subtotal: TFloatField;
    qyOrcamentosorc_vlrdesc: TFloatField;
    qyOrcamentosorc_percdesc: TFloatField;
    qyOrcamentosorc_vlrtotal: TFloatField;
    qyOrcamentosorc_percmg: TFloatField;
    qyOrcamentosorc_validade: TIntegerField;
    qyOrcamentosprz_codigo: TIntegerField;
    qyOrcamentosprz_descricao: TWideStringField;
    qyOrcamentosfrp_codigo: TIntegerField;
    qyOrcamentosfrp_descricao: TWideStringField;
    qyOrcamentosorc_vlrlucro: TFloatField;
    qyOrcamentosmdf_codigo: TIntegerField;
    qyOrcamentosmdf_descricao: TWideStringField;
    qyOrcamentossto_codigo: TIntegerField;
    qyOrcamentossto_descricao: TWideStringField;
    qyOrcamentosprv_numero: TIntegerField;
    qyOrcamentosent_codigo: TIntegerField;
    qyOrcamentosent_descricao: TWideStringField;
    qyOrcItensort_codigo: TIntegerField;
    qyOrcItensorc_numero: TIntegerField;
    qyOrcItensort_quantidade: TFloatField;
    qyOrcItenspro_codigo: TIntegerField;
    qyOrcItenspro_descricao: TWideStringField;
    qyOrcItensuni_codigo: TWideStringField;
    qyOrcItensort_vlrcusto: TFloatField;
    qyOrcItensort_vlrbrt: TFloatField;
    qyOrcItensort_vlrdesc: TFloatField;
    qyOrcItensort_percdesc: TFloatField;
    qyOrcItensort_vlrliq: TFloatField;
    qyOrcItensort_vlrtotal: TFloatField;
    qyOrcItensort_percmg: TFloatField;
    qyStatusOrcsto_codigo: TIntegerField;
    qyStatusOrcsto_descricao: TWideStringField;
    qyPrevItenspri_codigo: TIntegerField;
    qyPrevItensprv_numero: TIntegerField;
    qyPrevItenspri_quantidade: TFloatField;
    qyPrevItenspro_codigo: TIntegerField;
    qyPrevItenspro_descricao: TWideStringField;
    qyPrevItensloc_descricao: TWideStringField;
    qyPrevItensuni_codigo: TWideStringField;
    qyPrevItenspri_vlrcusto: TFloatField;
    qyPrevItenspri_vlrbrt: TFloatField;
    qyPrevItenspri_vlrdesc: TFloatField;
    qyPrevItenspri_percdesc: TFloatField;
    qyPrevItenspri_vlrliq: TFloatField;
    qyPrevItenspri_vlrtotal: TFloatField;
    qyPrevItenspri_percmg: TFloatField;
    qyPrevEndEntprv_numero: TIntegerField;
    qyPrevEndEntend_codigo: TIntegerField;
    qyPrevRespri_codigo: TIntegerField;
    qyPrevResprv_numero: TIntegerField;
    qyPrevRespro_codigo: TIntegerField;
    qyPrevRespri_quantidade: TFloatField;
    qyPrevendasprv_numero: TIntegerField;
    qyPrevendasprv_data: TDateField;
    qyPrevendaspes_codigo: TIntegerField;
    qyPrevendaspes_nome: TWideStringField;
    qyPrevendaspes_logradouro: TWideStringField;
    qyPrevendaspes_bairro: TWideStringField;
    qyPrevendaspes_numero: TIntegerField;
    qyPrevendascid_codigo: TIntegerField;
    qyPrevendascid_municipio: TWideStringField;
    qyPrevendasuf_sigla: TWideStringField;
    qyPrevendaspes_cep: TWideStringField;
    qyPrevendaspes_fone: TWideStringField;
    qyPrevendasfun_codigo: TIntegerField;
    qyPrevendasfun_nome: TWideStringField;
    qyPrevendasprv_tabvenda: TIntegerField;
    qyPrevendasprv_referente: TWideStringField;
    qyPrevendasprv_obs: TWideStringField;
    qyPrevendasprv_vlrcusto: TFloatField;
    qyPrevendasprv_subtotal: TFloatField;
    qyPrevendasprv_vlrdesc: TFloatField;
    qyPrevendasprv_percdesc: TFloatField;
    qyPrevendasprv_vlrtotal: TFloatField;
    qyPrevendasprv_percmg: TFloatField;
    qyPrevendasprz_codigo: TIntegerField;
    qyPrevendasprz_descricao: TWideStringField;
    qyPrevendasfrp_codigo: TIntegerField;
    qyPrevendasfrp_descricao: TWideStringField;
    qyPrevendasprv_vlrlucro: TFloatField;
    qyPrevendasmdf_codigo: TIntegerField;
    qyPrevendasmdf_descricao: TWideStringField;
    qyPrevendassto_codigo: TIntegerField;
    qyPrevendassto_descricao: TWideStringField;
    qyPrevendasorc_numero: TIntegerField;
    qyPrevendasent_codigo: TIntegerField;
    qyPrevendasent_descricao: TWideStringField;
    qyConsPrevRes: TZQuery;
    qyConsPrevRespri_codigo: TIntegerField;
    qyConsPrevResprv_numero: TIntegerField;
    qyConsPrevRespro_codigo: TIntegerField;
    qyConsPrevRespri_quantidade: TFloatField;
    procedure qyOrcamentosAfterDelete(DataSet: TDataSet);
    procedure qyOrcamentosAfterPost(DataSet: TDataSet);
    procedure qyOrcamentosBeforeDelete(DataSet: TDataSet);
    procedure qyOrcamentosBeforePost(DataSet: TDataSet);
    procedure qyOrcamentosPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyOrcItensAfterDelete(DataSet: TDataSet);
    procedure qyOrcItensAfterPost(DataSet: TDataSet);
    procedure qyOrcItensBeforeDelete(DataSet: TDataSet);
    procedure qyOrcItensBeforePost(DataSet: TDataSet);
    procedure qyOrcItensPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyStatusOrcAfterDelete(DataSet: TDataSet);
    procedure qyStatusOrcAfterPost(DataSet: TDataSet);
    procedure qyStatusOrcBeforeDelete(DataSet: TDataSet);
    procedure qyStatusOrcBeforePost(DataSet: TDataSet);
    procedure qyStatusOrcPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyPrevendasAfterDelete(DataSet: TDataSet);
    procedure qyPrevendasAfterPost(DataSet: TDataSet);
    procedure qyPrevendasBeforeDelete(DataSet: TDataSet);
    procedure qyPrevendasBeforePost(DataSet: TDataSet);
    procedure qyPrevendasPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyPrevItensAfterDelete(DataSet: TDataSet);
    procedure qyPrevItensAfterPost(DataSet: TDataSet);
    procedure qyPrevItensBeforeDelete(DataSet: TDataSet);
    procedure qyPrevItensBeforePost(DataSet: TDataSet);
    procedure qyPrevItensPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyPrevEndEntAfterDelete(DataSet: TDataSet);
    procedure qyPrevEndEntAfterPost(DataSet: TDataSet);
    procedure qyPrevEndEntBeforeDelete(DataSet: TDataSet);
    procedure qyPrevEndEntBeforePost(DataSet: TDataSet);
    procedure qyPrevEndEntPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyPrevResAfterDelete(DataSet: TDataSet);
    procedure qyPrevResAfterPost(DataSet: TDataSet);
    procedure qyPrevResBeforeDelete(DataSet: TDataSet);
    procedure qyPrevResBeforePost(DataSet: TDataSet);
    procedure qyPrevResPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyOrcamentosAfterInsert(DataSet: TDataSet);
    procedure qyOrcItensAfterInsert(DataSet: TDataSet);
    procedure qyPrevendasAfterInsert(DataSet: TDataSet);
    procedure qyPrevItensAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmOrcamentos: TdmOrcamentos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uFuncoesDB, uDaoConfig, uDaoPrevendas, uDaoOrcamentos;

{$R *.dfm}

{--- qyOrcamentos -------------------------------------------------------------}

procedure TdmOrcamentos.qyOrcamentosAfterDelete(DataSet: TDataSet);
begin
  qyOrcamentos.ApplyUpdates;
  database.Commit;
  qyOrcamentos.CommitUpdates;
end;

procedure TdmOrcamentos.qyOrcamentosAfterInsert(DataSet: TDataSet);
begin
  qyOrcamentosorc_data.Text := FormatDateTime('dd/MM/yyyy', GetDateServerPG);
  qyOrcamentospes_codigo.Value := 0;
  qyOrcamentosorc_tabvenda.Value := 2;
  qyOrcamentosfun_codigo.Value := 0;
  qyOrcamentosfun_nome.Text := 'NÃO DEFINIDO';
  qyOrcamentosprz_codigo.Value := 0;
  qyOrcamentosprz_descricao.Text := 'À COMBINAR';
  qyOrcamentosfrp_codigo.Value := -1;
  qyOrcamentosfrp_descricao.Text := 'À COMBINAR';
  qyOrcamentosorc_vlrcusto.Value := 0;
  qyOrcamentosorc_subtotal.Value := 0;
  qyOrcamentosorc_vlrdesc.Value := 0;
  qyOrcamentosorc_percdesc.Value := 0;
  qyOrcamentosorc_vlrtotal.Value := 0;
  qyOrcamentosorc_percmg.Value := 0;
  qyOrcamentosorc_vlrlucro.Value := 0;
  qyOrcamentosorc_validade.Value := GetValOrc;
  qyOrcamentosent_codigo.Value := 0;
  qyOrcamentosent_descricao.Text := 'À COMBINAR';
  qyOrcamentosmdf_codigo.Value := -1;
  qyOrcamentosmdf_descricao.Text := 'À COMBINAR';
  qyOrcamentossto_codigo.Value := 1;
  qyOrcamentossto_descricao.Text := 'EM ABERTO';
  qyOrcamentosorc_referente.Text := 'ORÇAMENTO SOLICITADO';
end;

procedure TdmOrcamentos.qyOrcamentosAfterPost(DataSet: TDataSet);
begin
  qyOrcamentos.ApplyUpdates;
  database.Commit;
  qyOrcamentos.CommitUpdates;
end;

procedure TdmOrcamentos.qyOrcamentosBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmOrcamentos.qyOrcamentosBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmOrcamentos.qyOrcamentosPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyOrcItens ---------------------------------------------------------------}

procedure TdmOrcamentos.qyOrcItensAfterDelete(DataSet: TDataSet);
begin
  qyOrcItens.ApplyUpdates;
  database.Commit;
  qyOrcItens.CommitUpdates;
end;

procedure TdmOrcamentos.qyOrcItensAfterInsert(DataSet: TDataSet);
begin
  qyOrcItensORC_NUMERO.Value := qyOrcamentosorc_numero.Value;
  qyOrcItensORT_QUANTIDADE.Value := 1;
  qyOrcItensORT_VLRCUSTO.Value := 0;
  qyOrcItensORT_VLRBRT.Value := 0;
  qyOrcItensORT_VLRLIQ.Value := 0;
  qyOrcItensORT_VLRDESC.Value := 0;
  qyOrcItensORT_PERCDESC.Value := 0;
  qyOrcItensORT_VLRTOTAL.Value := 0;
  qyOrcItensORT_PERCMG.Value := 0;
end;

procedure TdmOrcamentos.qyOrcItensAfterPost(DataSet: TDataSet);
begin
  qyOrcItens.ApplyUpdates;
  database.Commit;
  qyOrcItens.CommitUpdates;
  AtualizaTotalORC(qyPrevItensprv_numero.Value);
end;

procedure TdmOrcamentos.qyOrcItensBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmOrcamentos.qyOrcItensBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmOrcamentos.qyOrcItensPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyPrevendas --------------------------------------------------------------}

procedure TdmOrcamentos.qyPrevendasAfterDelete(DataSet: TDataSet);
begin
  qyPrevendas.ApplyUpdates;
  database.Commit;
  qyPrevendas.CommitUpdates;
end;

procedure TdmOrcamentos.qyPrevendasAfterInsert(DataSet: TDataSet);
begin
  qyPrevendasprv_data.Text := FormatDateTime('dd/MM/yyyy', GetDateServerPG);
  qyPrevendaspes_codigo.Value := 0;
  qyPrevendasprv_tabvenda.Value := 2;
  qyPrevendasfun_codigo.Value := 0;
  qyPrevendasfun_nome.Text := 'NÃO DEFINIDO';
  qyPrevendasprz_codigo.Value := 1;
  qyPrevendasprz_descricao.Text := 'À VISTA';
  qyPrevendasfrp_codigo.Value := 0;
  qyPrevendasfrp_descricao.Text := 'DINHEIRO';
  qyPrevendasprv_vlrcusto.Value := 0;
  qyPrevendasprv_subtotal.Value := 0;
  qyPrevendasprv_vlrdesc.Value := 0;
  qyPrevendasprv_percdesc.Value := 0;
  qyPrevendasprv_vlrtotal.Value := 0;
  qyPrevendasprv_percmg.Value := 0;
  qyPrevendasprv_vlrlucro.Value := 0;
  qyPrevendasent_codigo.Value := 3;
  qyPrevendasent_descricao.Text := 'CLIENTE LEVA NA HORA';
  qyPrevendasmdf_codigo.Value := 1;
  qyPrevendasmdf_descricao.Text := 'FOB';
  qyPrevendassto_codigo.Value := 1;
  qyPrevendassto_descricao.Text := 'EM ABERTO';
  qyPrevendasprv_referente.Text := 'VENDA SOLICITADA';
end;

procedure TdmOrcamentos.qyPrevendasAfterPost(DataSet: TDataSet);
begin
  qyPrevendas.ApplyUpdates;
  database.Commit;
  qyPrevendas.CommitUpdates;
end;

procedure TdmOrcamentos.qyPrevendasBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmOrcamentos.qyPrevendasBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmOrcamentos.qyPrevendasPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyPrevEndEnt -------------------------------------------------------------}

procedure TdmOrcamentos.qyPrevEndEntAfterDelete(DataSet: TDataSet);
begin
  qyPrevEndEnt.ApplyUpdates;
  database.Commit;
  qyPrevEndEnt.CommitUpdates;
end;

procedure TdmOrcamentos.qyPrevEndEntAfterPost(DataSet: TDataSet);
begin
  qyPrevEndEnt.ApplyUpdates;
  database.Commit;
  qyPrevEndEnt.CommitUpdates;
end;

procedure TdmOrcamentos.qyPrevEndEntBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmOrcamentos.qyPrevEndEntBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmOrcamentos.qyPrevEndEntPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyPrevItens --------------------------------------------------------------}

procedure TdmOrcamentos.qyPrevItensAfterDelete(DataSet: TDataSet);
begin
  qyPrevItens.ApplyUpdates;
  database.Commit;
  qyPrevItens.CommitUpdates;
end;

procedure TdmOrcamentos.qyPrevItensAfterInsert(DataSet: TDataSet);
begin
  if qyPrevItens.State in [dsInsert] then  //Incluído devid ao controle de status do orçamento
  begin
    qyPrevItensPRV_NUMERO.Value := qyPrevendasPRV_NUMERO.Value;
    qyPrevItensPRI_QUANTIDADE.Value := 1;
    qyPrevItensPRI_VLRCUSTO.Value := 0;
    qyPrevItensPRI_VLRBRT.Value := 0;
    qyPrevItensPRI_VLRLIQ.Value := 0;
    qyPrevItensPRI_VLRDESC.Value := 0;
    qyPrevItensPRI_PERCDESC.Value := 0;
    qyPrevItensPRI_VLRTOTAL.Value := 0;
    qyPrevItensPRI_PERCMG.Value := 0;
  end;
end;

procedure TdmOrcamentos.qyPrevItensAfterPost(DataSet: TDataSet);
begin
  qyPrevItens.ApplyUpdates;
  database.Commit;
  qyPrevItens.CommitUpdates;
end;

procedure TdmOrcamentos.qyPrevItensBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmOrcamentos.qyPrevItensBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmOrcamentos.qyPrevItensPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyPrevRes ----------------------------------------------------------------}

procedure TdmOrcamentos.qyPrevResAfterDelete(DataSet: TDataSet);
begin
  qyPrevRes.ApplyUpdates;
  database.Commit;
  qyPrevRes.CommitUpdates;
end;

procedure TdmOrcamentos.qyPrevResAfterPost(DataSet: TDataSet);
begin
  qyPrevRes.ApplyUpdates;
  database.Commit;
  qyPrevRes.CommitUpdates;
end;

procedure TdmOrcamentos.qyPrevResBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmOrcamentos.qyPrevResBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmOrcamentos.qyPrevResPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyStatusOrc --------------------------------------------------------------}

procedure TdmOrcamentos.qyStatusOrcAfterDelete(DataSet: TDataSet);
begin
  qyStatusOrc.ApplyUpdates;
  database.Commit;
  qyStatusOrc.CommitUpdates;
end;

procedure TdmOrcamentos.qyStatusOrcAfterPost(DataSet: TDataSet);
begin
  qyStatusOrc.ApplyUpdates;
  database.Commit;
  qyStatusOrc.CommitUpdates;
end;

procedure TdmOrcamentos.qyStatusOrcBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmOrcamentos.qyStatusOrcBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmOrcamentos.qyStatusOrcPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

end.
