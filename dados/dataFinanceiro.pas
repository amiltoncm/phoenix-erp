unit dataFinanceiro;

interface

uses
  System.SysUtils, System.Classes, dataTmpConexao, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, ZSqlUpdate;

type
  TdmFinanceiro = class(TdmTmpConexao)
    qyCaixa: TZQuery;
    qyCheques: TZQuery;
    qyFormPag: TZQuery;
    qyPagar: TZQuery;
    qyPrazos: TZQuery;
    qyPrazosfrp: TZQuery;
    qyReceber: TZQuery;
    updCaixa: TZUpdateSQL;
    updCheques: TZUpdateSQL;
    updFormPag: TZUpdateSQL;
    updPagar: TZUpdateSQL;
    updPrazos: TZUpdateSQL;
    updPrazosfrp: TZUpdateSQL;
    updReceber: TZUpdateSQL;
    qyCaixacai_codigo: TIntegerField;
    qyCaixacai_id: TIntegerField;
    qyCaixacai_data: TDateField;
    qyCaixacai_dataefet: TDateField;
    qyCaixacon_codigo: TIntegerField;
    qyCaixaplc_codigo: TIntegerField;
    qyCaixacai_valor: TFloatField;
    qyCaixacai_numdoc: TIntegerField;
    qyCaixacai_descricao: TWideStringField;
    qyCaixapag_codigo: TIntegerField;
    qyCaixarec_codigo: TIntegerField;
    qyCaixamdc_codigo: TWideStringField;
    qyCaixausu_codigo: TIntegerField;
    qyChequeschq_lancamento: TIntegerField;
    qyChequesban_codigo: TIntegerField;
    qyChequeschq_agencia: TIntegerField;
    qyChequeschq_conta: TIntegerField;
    qyChequeschq_cheque: TIntegerField;
    qyChequeschq_valor: TFloatField;
    qyChequeschq_documento: TWideStringField;
    qyChequeschq_titular: TWideStringField;
    qyChequeschq_datalanc: TDateField;
    qyChequeschq_vencimento: TDateField;
    qyChequespes_codigo: TIntegerField;
    qyChequeschq_endosso: TWideStringField;
    qyChequeschq_telefone: TWideStringField;
    qyChequeschq_destino: TWideStringField;
    qyChequescai_codigo: TIntegerField;
    qyChequessta_codigo: TIntegerField;
    qyChequessta_descricao: TWideStringField;
    qyFormPagfrp_codigo: TIntegerField;
    qyFormPagfrp_descricao: TWideStringField;
    qyFormPagfrp_tpag: TIntegerField;
    qyFormPagfrp_ativo: TWideStringField;
    qyFormPagcon_codigo: TIntegerField;
    qyFormPagfrp_dias: TIntegerField;
    qyPagarpag_codigo: TIntegerField;
    qyPagarpag_emissao: TDateField;
    qyPagarpag_vencimento: TDateField;
    qyPagarpag_numero: TIntegerField;
    qyPagarpag_serie: TIntegerField;
    qyPagarpag_modelo: TWideStringField;
    qyPagarpag_parcela: TIntegerField;
    qyPagarpag_duplicata: TWideStringField;
    qyPagarpes_codigo: TIntegerField;
    qyPagarpag_valor: TFloatField;
    qyPagarpag_pago: TFloatField;
    qyPagarpag_acrescimo: TFloatField;
    qyPagarpag_desconto: TFloatField;
    qyPagarpag_saldo: TFloatField;
    qyPagarpag_chavenfe: TWideStringField;
    qyPagarsta_codigo: TIntegerField;
    qyPagarsta_descricao: TWideStringField;
    qyPagarpes_nome: TWideStringField;
    qyPrazosprz_codigo: TIntegerField;
    qyPrazosprz_descricao: TWideStringField;
    qyPrazosprz_parcelas: TIntegerField;
    qyPrazosprz_juros: TFloatField;
    qyPrazosprz_periodo: TIntegerField;
    qyPrazosfrpprz_codigo: TIntegerField;
    qyPrazosfrpfrp_codigo: TIntegerField;
    qyPrazosfrpfrp_descricao: TWideStringField;
    qyReceberrec_codigo: TIntegerField;
    qyReceberrec_emissao: TDateField;
    qyReceberrec_vencimento: TDateField;
    qyReceberpes_codigo: TIntegerField;
    qyReceberpes_nome: TWideStringField;
    qyReceberrec_numero: TIntegerField;
    qyReceberrec_serie: TIntegerField;
    qyRecebermdc_codigo: TWideStringField;
    qyReceberrec_parcela: TIntegerField;
    qyReceberrec_duplicata: TWideStringField;
    qyReceberrec_valor: TFloatField;
    qyReceberrec_pago: TFloatField;
    qyReceberrec_acrescimo: TFloatField;
    qyReceberrec_desconto: TFloatField;
    qyReceberrec_saldo: TFloatField;
    qyRecebersta_codigo: TIntegerField;
    qyReceberfrp_codigo: TIntegerField;
    qyRecebersta_descricao: TWideStringField;
    qyPrazosprz_indpag: TIntegerField;
    procedure qyCaixaAfterDelete(DataSet: TDataSet);
    procedure qyCaixaAfterPost(DataSet: TDataSet);
    procedure qyCaixaBeforeDelete(DataSet: TDataSet);
    procedure qyCaixaBeforePost(DataSet: TDataSet);
    procedure qyCaixaPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyChequesAfterDelete(DataSet: TDataSet);
    procedure qyChequesAfterPost(DataSet: TDataSet);
    procedure qyChequesBeforeDelete(DataSet: TDataSet);
    procedure qyChequesBeforePost(DataSet: TDataSet);
    procedure qyChequesPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyFormPagAfterDelete(DataSet: TDataSet);
    procedure qyFormPagAfterPost(DataSet: TDataSet);
    procedure qyFormPagBeforeDelete(DataSet: TDataSet);
    procedure qyFormPagBeforePost(DataSet: TDataSet);
    procedure qyFormPagPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyPagarAfterDelete(DataSet: TDataSet);
    procedure qyPagarAfterPost(DataSet: TDataSet);
    procedure qyPagarBeforeDelete(DataSet: TDataSet);
    procedure qyPagarBeforePost(DataSet: TDataSet);
    procedure qyPagarPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyPrazosAfterDelete(DataSet: TDataSet);
    procedure qyPrazosAfterPost(DataSet: TDataSet);
    procedure qyPrazosBeforeDelete(DataSet: TDataSet);
    procedure qyPrazosBeforePost(DataSet: TDataSet);
    procedure qyPrazosPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyPrazosfrpAfterDelete(DataSet: TDataSet);
    procedure qyPrazosfrpAfterPost(DataSet: TDataSet);
    procedure qyPrazosfrpBeforeDelete(DataSet: TDataSet);
    procedure qyPrazosfrpBeforePost(DataSet: TDataSet);
    procedure qyPrazosfrpPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyReceberAfterDelete(DataSet: TDataSet);
    procedure qyReceberAfterPost(DataSet: TDataSet);
    procedure qyReceberBeforeDelete(DataSet: TDataSet);
    procedure qyReceberBeforePost(DataSet: TDataSet);
    procedure qyReceberPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyPrazosAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFinanceiro: TdmFinanceiro;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{--- qyCaixa ------------------------------------------------------------------}

procedure TdmFinanceiro.qyCaixaAfterDelete(DataSet: TDataSet);
begin
  qyCaixa.ApplyUpdates;
  database.Commit;
  qyCaixa.CommitUpdates;
end;

procedure TdmFinanceiro.qyCaixaAfterPost(DataSet: TDataSet);
begin
  qyCaixa.ApplyUpdates;
  database.Commit;
  qyCaixa.CommitUpdates;
end;

procedure TdmFinanceiro.qyCaixaBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmFinanceiro.qyCaixaBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmFinanceiro.qyCaixaPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyCheques ----------------------------------------------------------------}

procedure TdmFinanceiro.qyChequesAfterDelete(DataSet: TDataSet);
begin
  qyCheques.ApplyUpdates;
  database.Commit;
  qyCheques.CommitUpdates;
end;

procedure TdmFinanceiro.qyChequesAfterPost(DataSet: TDataSet);
begin
  qyCheques.ApplyUpdates;
  database.Commit;
  qyCheques.CommitUpdates;
end;

procedure TdmFinanceiro.qyChequesBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmFinanceiro.qyChequesBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmFinanceiro.qyChequesPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyFormPag ----------------------------------------------------------------}

procedure TdmFinanceiro.qyFormPagAfterDelete(DataSet: TDataSet);
begin
  qyFormPag.ApplyUpdates;
  database.Commit;
  qyFormPag.CommitUpdates;
end;

procedure TdmFinanceiro.qyFormPagAfterPost(DataSet: TDataSet);
begin
  qyFormPag.ApplyUpdates;
  database.Commit;
  qyFormPag.CommitUpdates;
end;

procedure TdmFinanceiro.qyFormPagBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmFinanceiro.qyFormPagBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmFinanceiro.qyFormPagPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyPagar ------------------------------------------------------------------}

procedure TdmFinanceiro.qyPagarAfterDelete(DataSet: TDataSet);
begin
  qyPagar.ApplyUpdates;
  database.Commit;
  qyPagar.CommitUpdates;
end;

procedure TdmFinanceiro.qyPagarAfterPost(DataSet: TDataSet);
begin
  qyPagar.ApplyUpdates;
  database.Commit;
  qyPagar.CommitUpdates;
end;

procedure TdmFinanceiro.qyPagarBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmFinanceiro.qyPagarBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmFinanceiro.qyPagarPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyPrazos -----------------------------------------------------------------}

procedure TdmFinanceiro.qyPrazosAfterDelete(DataSet: TDataSet);
begin
  qyPrazos.ApplyUpdates;
  database.Commit;
  qyPrazos.CommitUpdates;
end;

procedure TdmFinanceiro.qyPrazosAfterInsert(DataSet: TDataSet);
begin
  qyPrazosprz_parcelas.Value := 1;
  qyPrazosprz_juros.Value := 0;
  qyPrazosprz_indpag.Value := 1;
end;

procedure TdmFinanceiro.qyPrazosAfterPost(DataSet: TDataSet);
begin
  qyPrazos.ApplyUpdates;
  database.Commit;
  qyPrazos.CommitUpdates;
end;

procedure TdmFinanceiro.qyPrazosBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmFinanceiro.qyPrazosBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmFinanceiro.qyPrazosPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyPrazosfrp --------------------------------------------------------------}

procedure TdmFinanceiro.qyPrazosfrpAfterDelete(DataSet: TDataSet);
begin
  qyPrazosfrp.ApplyUpdates;
  database.Commit;
  qyPrazosfrp.CommitUpdates;
end;

procedure TdmFinanceiro.qyPrazosfrpAfterPost(DataSet: TDataSet);
begin
  qyPrazosfrp.ApplyUpdates;
  database.Commit;
  qyPrazosfrp.CommitUpdates;
end;

procedure TdmFinanceiro.qyPrazosfrpBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmFinanceiro.qyPrazosfrpBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmFinanceiro.qyPrazosfrpPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyReceber ----------------------------------------------------------------}

procedure TdmFinanceiro.qyReceberAfterDelete(DataSet: TDataSet);
begin
  qyReceber.ApplyUpdates;
  database.Commit;
  qyReceber.CommitUpdates;
end;

procedure TdmFinanceiro.qyReceberAfterPost(DataSet: TDataSet);
begin
  qyReceber.ApplyUpdates;
  database.Commit;
  qyReceber.CommitUpdates;
end;

procedure TdmFinanceiro.qyReceberBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmFinanceiro.qyReceberBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmFinanceiro.qyReceberPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

end.
