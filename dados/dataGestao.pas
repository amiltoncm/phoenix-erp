unit dataGestao;

interface

uses
  System.SysUtils, System.Classes, dataTmpConexao, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, ZSqlUpdate;

type
  TdmGestao = class(TdmTmpConexao)
    qyAgenda: TZQuery;
    qyAgendaagd_codigo: TIntegerField;
    qyAgendapes_codigo: TIntegerField;
    qyAgendapes_nome: TWideStringField;
    qyAgendapes_fone: TWideStringField;
    qyAgendaagd_dataag: TDateField;
    qyAgendaagd_horaag: TTimeField;
    qyAgendaagd_datalanc: TDateField;
    qyAgendaagd_horalanc: TTimeField;
    qyAgendaqda_codigo: TIntegerField;
    qyAgendaqda_descricao: TWideStringField;
    qyAgendaagd_atendimento: TIntegerField;
    qyAgendaagd_obs: TWideStringField;
    qyAgendausu_codigo: TIntegerField;
    updAgenda: TZUpdateSQL;
    qyAgeItens: TZQuery;
    updAgeItens: TZUpdateSQL;
    qyAgeItensagi_codigo: TIntegerField;
    qyAgeItensagd_codigo: TIntegerField;
    qyAgeItensagd_dataag: TDateField;
    qyAgeItensagd_horaag: TTimeField;
    qyAgeItenspes_nome: TWideStringField;
    qyAgeItenspro_codigo: TIntegerField;
    qyAgeItenspro_descricao: TWideStringField;
    qyConsAgenda: TZQuery;
    qyConsAgendahor_horas: TTimeField;
    qyConsAgendaagd_dataag: TDateField;
    qyConsAgendaagd_codigo: TIntegerField;
    qyConsAgendapes_codigo: TIntegerField;
    qyConsAgendapes_nome: TWideStringField;
    qyConsAgendapes_fone: TWideStringField;
    qyConsAgendaagd_datalanc: TDateField;
    qyConsAgendaagd_horalanc: TTimeField;
    qyConsAgendaagd_atendimento: TIntegerField;
    qyConsAgendaqda_codigo: TIntegerField;
    qyQuadras: TZQuery;
    qyQuadrasqda_codigo: TIntegerField;
    qyQuadrasqda_descricao: TWideStringField;
    updQuadras: TZUpdateSQL;
    qyQuadraspro_codigo: TIntegerField;
    qyComandas: TZQuery;
    qyComandascma_codigo: TIntegerField;
    qyComandascma_descricao: TWideStringField;
    qyComandascma_ativa: TIntegerField;
    updComandas: TZUpdateSQL;
    qyComandasItens: TZQuery;
    updComandasItens: TZUpdateSQL;
    qyComandasItenscmi_codigo: TIntegerField;
    qyComandasItenscma_codigo: TIntegerField;
    qyComandasItenscmi_quantidade: TFloatField;
    qyComandasItenspro_codigo: TIntegerField;
    qyComandasItenspro_descricao: TWideStringField;
    qyComandasItensuni_codigo: TWideStringField;
    qyComandasItenscmi_vlrunitario: TFloatField;
    qyComandasItenscmi_vlrtotal: TFloatField;
    qyComandasItensprv_numero: TIntegerField;
    qyMesas: TZQuery;
    qyMesasmes_codigo: TIntegerField;
    qyMesasmes_descricao: TWideStringField;
    qyMesasmes_ativa: TIntegerField;
    updMesas: TZUpdateSQL;
    qyComandasAtend: TZQuery;
    qyComandasAtendcmu_codigo: TIntegerField;
    qyComandasAtendcma_codigo: TIntegerField;
    qyComandasAtendmes_codigo: TIntegerField;
    qyComandasAtendprv_numero: TIntegerField;
    updComandasAtend: TZUpdateSQL;
    qyComandasAtendcmu_valortotal: TFloatField;
    qyComandasAtendcmu_vlrtotcusto: TFloatField;
    qyComandasItenscmi_copa: TIntegerField;
    qyComandasItenscmi_cozinha: TIntegerField;
    qyComandasItenscmi_datetime: TDateTimeField;
    qyComandasItenssat_codigo: TIntegerField;
    qyComandasItenscmi_vlrtotcusto: TFloatField;
    qyProdComanda: TZQuery;
    qyProdComandapro_codigo: TIntegerField;
    qyProdComandaprd_copa: TIntegerField;
    qyProdComandaprd_cozinha: TIntegerField;
    updProdComanda: TZUpdateSQL;
    qyScriptComandasItens: TZQuery;
    updScriptComandasItens: TZUpdateSQL;
    qyComandasAtendcma_descricao: TWideStringField;
    qyHorarios: TZQuery;
    qyHorarioshor_horas: TTimeField;
    updHorarios: TZUpdateSQL;
    scriptDelHorarios: TZQuery;
    procedure qyAgendaAfterDelete(DataSet: TDataSet);
    procedure qyAgendaAfterPost(DataSet: TDataSet);
    procedure qyAgendaBeforeDelete(DataSet: TDataSet);
    procedure qyAgendaBeforePost(DataSet: TDataSet);
    procedure qyAgendaPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyAgeItensAfterDelete(DataSet: TDataSet);
    procedure qyAgeItensAfterPost(DataSet: TDataSet);
    procedure qyAgeItensBeforeDelete(DataSet: TDataSet);
    procedure qyAgeItensBeforePost(DataSet: TDataSet);
    procedure qyAgeItensPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyQuadrasAfterDelete(DataSet: TDataSet);
    procedure qyQuadrasAfterPost(DataSet: TDataSet);
    procedure qyQuadrasBeforeDelete(DataSet: TDataSet);
    procedure qyQuadrasBeforePost(DataSet: TDataSet);
    procedure qyQuadrasPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyComandasAfterDelete(DataSet: TDataSet);
    procedure qyComandasAfterPost(DataSet: TDataSet);
    procedure qyComandasBeforeDelete(DataSet: TDataSet);
    procedure qyComandasBeforePost(DataSet: TDataSet);
    procedure qyComandasPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyComandasItensAfterDelete(DataSet: TDataSet);
    procedure qyComandasItensAfterPost(DataSet: TDataSet);
    procedure qyComandasItensBeforeDelete(DataSet: TDataSet);
    procedure qyComandasItensBeforePost(DataSet: TDataSet);
    procedure qyComandasItensPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyComandasAfterInsert(DataSet: TDataSet);
    procedure qyMesasAfterDelete(DataSet: TDataSet);
    procedure qyMesasAfterPost(DataSet: TDataSet);
    procedure qyMesasBeforeDelete(DataSet: TDataSet);
    procedure qyMesasBeforePost(DataSet: TDataSet);
    procedure qyMesasPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyMesasAfterInsert(DataSet: TDataSet);
    procedure qyComandasAtendAfterDelete(DataSet: TDataSet);
    procedure qyComandasAtendAfterPost(DataSet: TDataSet);
    procedure qyComandasAtendBeforeDelete(DataSet: TDataSet);
    procedure qyComandasAtendBeforePost(DataSet: TDataSet);
    procedure qyComandasAtendPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyComandasAtendAfterInsert(DataSet: TDataSet);
    procedure qyProdComandaAfterDelete(DataSet: TDataSet);
    procedure qyProdComandaAfterPost(DataSet: TDataSet);
    procedure qyProdComandaBeforeDelete(DataSet: TDataSet);
    procedure qyProdComandaBeforePost(DataSet: TDataSet);
    procedure qyProdComandaPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyScriptComandasItensAfterDelete(DataSet: TDataSet);
    procedure qyScriptComandasItensAfterPost(DataSet: TDataSet);
    procedure qyScriptComandasItensBeforeDelete(DataSet: TDataSet);
    procedure qyScriptComandasItensBeforePost(DataSet: TDataSet);
    procedure qyScriptComandasItensPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmGestao: TdmGestao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{--- qyAgeItens ---------------------------------------------------------------}

procedure TdmGestao.qyAgeItensAfterDelete(DataSet: TDataSet);
begin
  qyAgeItens.ApplyUpdates;
  database.Commit;
  qyAgeItens.CommitUpdates;
end;

procedure TdmGestao.qyAgeItensAfterPost(DataSet: TDataSet);
begin
  qyAgeItens.ApplyUpdates;
  database.Commit;
  qyAgeItens.CommitUpdates;
end;

procedure TdmGestao.qyAgeItensBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmGestao.qyAgeItensBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmGestao.qyAgeItensPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyAgenda -----------------------------------------------------------------}

procedure TdmGestao.qyAgendaAfterDelete(DataSet: TDataSet);
begin
  qyAgenda.ApplyUpdates;
  database.Commit;
  qyAgenda.CommitUpdates;
end;

procedure TdmGestao.qyAgendaAfterPost(DataSet: TDataSet);
begin
  qyAgenda.ApplyUpdates;
  database.Commit;
  qyAgenda.CommitUpdates;
end;

procedure TdmGestao.qyAgendaBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmGestao.qyAgendaBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmGestao.qyAgendaPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyComandas ---------------------------------------------------------------}

procedure TdmGestao.qyComandasAfterDelete(DataSet: TDataSet);
begin
  qyComandas.ApplyUpdates;
  database.Commit;
  qyComandas.CommitUpdates;
end;

procedure TdmGestao.qyComandasAfterInsert(DataSet: TDataSet);
begin
  qyComandascma_ativa.Value := 1;
end;

procedure TdmGestao.qyComandasAfterPost(DataSet: TDataSet);
begin
  qyComandas.ApplyUpdates;
  database.Commit;
  qyComandas.CommitUpdates;
end;

procedure TdmGestao.qyComandasBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmGestao.qyComandasBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmGestao.qyComandasPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyComandasAtend ----------------------------------------------------------}

procedure TdmGestao.qyComandasAtendAfterDelete(DataSet: TDataSet);
begin
  qyComandasAtend.ApplyUpdates;
  database.Commit;
  qyComandasAtend.CommitUpdates;
end;

procedure TdmGestao.qyComandasAtendAfterInsert(DataSet: TDataSet);
begin
  qyComandasAtendcmu_valortotal.Value := 0;
end;

procedure TdmGestao.qyComandasAtendAfterPost(DataSet: TDataSet);
begin
  qyComandasAtend.ApplyUpdates;
  database.Commit;
  qyComandasAtend.CommitUpdates;
end;

procedure TdmGestao.qyComandasAtendBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmGestao.qyComandasAtendBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmGestao.qyComandasAtendPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyComandasItens ----------------------------------------------------------}

procedure TdmGestao.qyComandasItensAfterDelete(DataSet: TDataSet);
begin
  qyComandasItens.ApplyUpdates;
  database.Commit;
  qyComandasItens.CommitUpdates;
end;

procedure TdmGestao.qyComandasItensAfterPost(DataSet: TDataSet);
begin
  qyComandasItens.ApplyUpdates;
  database.Commit;
  qyComandasItens.CommitUpdates;
end;

procedure TdmGestao.qyComandasItensBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmGestao.qyComandasItensBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmGestao.qyComandasItensPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyMesas ------------------------------------------------------------------}

procedure TdmGestao.qyMesasAfterDelete(DataSet: TDataSet);
begin
  qyMesas.ApplyUpdates;
  database.Commit;
  qyMesas.CommitUpdates;
end;

procedure TdmGestao.qyMesasAfterInsert(DataSet: TDataSet);
begin
  qyMesasmes_ativa.Value := 1;
end;

procedure TdmGestao.qyMesasAfterPost(DataSet: TDataSet);
begin
  qyMesas.ApplyUpdates;
  database.Commit;
  qyMesas.CommitUpdates;
end;

procedure TdmGestao.qyMesasBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmGestao.qyMesasBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmGestao.qyMesasPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyProdComanda ------------------------------------------------------------}

procedure TdmGestao.qyProdComandaAfterDelete(DataSet: TDataSet);
begin
  qyProdComanda.ApplyUpdates;
  database.Commit;
  qyProdComanda.CommitUpdates;
end;

procedure TdmGestao.qyProdComandaAfterPost(DataSet: TDataSet);
begin
  qyProdComanda.ApplyUpdates;
  database.Commit;
  qyProdComanda.CommitUpdates;
end;

procedure TdmGestao.qyProdComandaBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmGestao.qyProdComandaBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmGestao.qyProdComandaPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyQuadras ----------------------------------------------------------------}

procedure TdmGestao.qyQuadrasAfterDelete(DataSet: TDataSet);
begin
  qyQuadras.ApplyUpdates;
  database.Commit;
  qyQuadras.CommitUpdates;
end;

procedure TdmGestao.qyQuadrasAfterPost(DataSet: TDataSet);
begin
  qyQuadras.ApplyUpdates;
  database.Commit;
  qyQuadras.CommitUpdates;
end;

procedure TdmGestao.qyQuadrasBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmGestao.qyQuadrasBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmGestao.qyQuadrasPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyScriptComandasItens ----------------------------------------------------}

procedure TdmGestao.qyScriptComandasItensAfterDelete(DataSet: TDataSet);
begin
  qyScriptComandasItens.ApplyUpdates;
  database.Commit;
  qyScriptComandasItens.CommitUpdates;
end;

procedure TdmGestao.qyScriptComandasItensAfterPost(DataSet: TDataSet);
begin
  qyScriptComandasItens.ApplyUpdates;
  database.Commit;
  qyScriptComandasItens.CommitUpdates;
end;

procedure TdmGestao.qyScriptComandasItensBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmGestao.qyScriptComandasItensBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmGestao.qyScriptComandasItensPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

end.
