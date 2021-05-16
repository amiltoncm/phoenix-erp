unit dataEstoque;

interface

uses
  System.SysUtils, System.Classes, dataTmpConexao, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, ZSqlUpdate;

type
  TdmEstoque = class(TdmTmpConexao)
    qyProdutosEst: TZQuery;
    updProdutosEst: TZUpdateSQL;
    qyProdutosFor: TZQuery;
    updProdutosFor: TZUpdateSQL;
    qyProdutosMov: TZQuery;
    updProdutosMov: TZUpdateSQL;
    qyProdutosComp: TZQuery;
    updProdutosComp: TZUpdateSQL;
    qyProdutosObs: TZQuery;
    updProdutosObs: TZUpdateSQL;
    qyProdutosSim: TZQuery;
    updProdutosSim: TZUpdateSQL;
    qyProdutosEstpro_codigo: TIntegerField;
    qyProdutosEstest_fisico: TFloatField;
    qyProdutosEstest_reservas: TFloatField;
    qyProdutosEstest_disponivel: TFloatField;
    qyProdutosComppro_codcomp: TIntegerField;
    qyProdutosComppro_codigo: TIntegerField;
    qyProdutosComppro_descricao: TWideStringField;
    qyProdutosCompuni_codigo: TWideStringField;
    qyProdutosComppro_vlratac: TFloatField;
    qyProdutosComppro_vlrvar: TFloatField;
    qyProdutosMovprm_codigo: TIntegerField;
    qyProdutosMovpro_codigo: TIntegerField;
    qyProdutosMovprm_data: TDateField;
    qyProdutosMovprm_quantidade: TFloatField;
    qyProdutosMovpes_codigo: TIntegerField;
    qyProdutosMovprm_tipo: TWideStringField;
    qyProdutosMovprm_nota: TIntegerField;
    qyProdutosMovprm_serie: TIntegerField;
    qyProdutosMovprm_modelo: TIntegerField;
    qyProdutosMovprm_valor: TFloatField;
    qyProdutosForpro_codigo: TIntegerField;
    qyProdutosForpro_descricao: TWideStringField;
    qyProdutosForpes_codigo: TIntegerField;
    qyProdutosForpes_nome: TWideStringField;
    qyProdutosForprf_referencia: TWideStringField;
    qyProdutosForpro_codbarras: TWideStringField;
    qyProdutosForprf_unidadecp: TFloatField;
    qyProdutosForprf_unidadevd: TFloatField;
    qyProdutosObspro_codigo: TIntegerField;
    qyProdutosObspro_obs: TWideStringField;
    qyProdutosSimpro_codsim: TIntegerField;
    qyProdutosSimpro_codigo: TIntegerField;
    qyProdutosSimpro_descricao: TWideStringField;
    qyProdutosSimuni_codigo: TWideStringField;
    qyProdutosSimpro_vlratac: TFloatField;
    qyProdutosSimpro_vlrvar: TFloatField;
    procedure qyProdutosEstAfterDelete(DataSet: TDataSet);
    procedure qyProdutosEstAfterPost(DataSet: TDataSet);
    procedure qyProdutosEstBeforeDelete(DataSet: TDataSet);
    procedure qyProdutosEstBeforePost(DataSet: TDataSet);
    procedure qyProdutosEstPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyProdutosForAfterDelete(DataSet: TDataSet);
    procedure qyProdutosForAfterPost(DataSet: TDataSet);
    procedure qyProdutosForBeforeDelete(DataSet: TDataSet);
    procedure qyProdutosForBeforePost(DataSet: TDataSet);
    procedure qyProdutosForPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyProdutosMovAfterDelete(DataSet: TDataSet);
    procedure qyProdutosMovAfterPost(DataSet: TDataSet);
    procedure qyProdutosMovBeforeDelete(DataSet: TDataSet);
    procedure qyProdutosMovBeforePost(DataSet: TDataSet);
    procedure qyProdutosMovPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyProdutosCompAfterDelete(DataSet: TDataSet);
    procedure qyProdutosCompAfterPost(DataSet: TDataSet);
    procedure qyProdutosCompBeforeDelete(DataSet: TDataSet);
    procedure qyProdutosCompBeforePost(DataSet: TDataSet);
    procedure qyProdutosCompPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyProdutosObsAfterDelete(DataSet: TDataSet);
    procedure qyProdutosObsAfterPost(DataSet: TDataSet);
    procedure qyProdutosObsBeforeDelete(DataSet: TDataSet);
    procedure qyProdutosObsBeforePost(DataSet: TDataSet);
    procedure qyProdutosObsPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyProdutosSimAfterDelete(DataSet: TDataSet);
    procedure qyProdutosSimAfterPost(DataSet: TDataSet);
    procedure qyProdutosSimBeforeDelete(DataSet: TDataSet);
    procedure qyProdutosSimBeforePost(DataSet: TDataSet);
    procedure qyProdutosSimPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyProdutosMovAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmEstoque: TdmEstoque;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{--- qyProdutosComp -----------------------------------------------------------}

procedure TdmEstoque.qyProdutosCompAfterDelete(DataSet: TDataSet);
begin
  qyProdutosComp.ApplyUpdates;
  database.Commit;
  qyProdutosComp.CommitUpdates;
end;

procedure TdmEstoque.qyProdutosCompAfterPost(DataSet: TDataSet);
begin
  qyProdutosComp.ApplyUpdates;
  database.Commit;
  qyProdutosComp.CommitUpdates;
end;

procedure TdmEstoque.qyProdutosCompBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmEstoque.qyProdutosCompBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmEstoque.qyProdutosCompPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyProdutosEst ------------------------------------------------------------}

procedure TdmEstoque.qyProdutosEstAfterDelete(DataSet: TDataSet);
begin
  qyProdutosEst.ApplyUpdates;
  database.Commit;
  qyProdutosEst.CommitUpdates;
end;

procedure TdmEstoque.qyProdutosEstAfterPost(DataSet: TDataSet);
begin
  qyProdutosEst.ApplyUpdates;
  database.Commit;
  qyProdutosEst.CommitUpdates;
end;

procedure TdmEstoque.qyProdutosEstBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmEstoque.qyProdutosEstBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmEstoque.qyProdutosEstPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyProdutosFor ------------------------------------------------------------}

procedure TdmEstoque.qyProdutosForAfterDelete(DataSet: TDataSet);
begin
  qyProdutosFor.ApplyUpdates;
  database.Commit;
  qyProdutosFor.CommitUpdates;
end;

procedure TdmEstoque.qyProdutosForAfterPost(DataSet: TDataSet);
begin
  qyProdutosFor.ApplyUpdates;
  database.Commit;
  qyProdutosFor.CommitUpdates;
end;

procedure TdmEstoque.qyProdutosForBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmEstoque.qyProdutosForBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmEstoque.qyProdutosForPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyProdutosMov ------------------------------------------------------------}

procedure TdmEstoque.qyProdutosMovAfterDelete(DataSet: TDataSet);
begin
  qyProdutosMov.ApplyUpdates;
  database.Commit;
  qyProdutosMov.CommitUpdates;
end;

procedure TdmEstoque.qyProdutosMovAfterInsert(DataSet: TDataSet);
begin
  qyProdutosMovprm_valor.Value := 0;
end;

procedure TdmEstoque.qyProdutosMovAfterPost(DataSet: TDataSet);
begin
  qyProdutosMov.ApplyUpdates;
  database.Commit;
  qyProdutosMov.CommitUpdates;
end;

procedure TdmEstoque.qyProdutosMovBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmEstoque.qyProdutosMovBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmEstoque.qyProdutosMovPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyProdutosObs ------------------------------------------------------------}

procedure TdmEstoque.qyProdutosObsAfterDelete(DataSet: TDataSet);
begin
  qyProdutosObs.ApplyUpdates;
  database.Commit;
  qyProdutosObs.CommitUpdates;
end;

procedure TdmEstoque.qyProdutosObsAfterPost(DataSet: TDataSet);
begin
  qyProdutosObs.ApplyUpdates;
  database.Commit;
  qyProdutosObs.CommitUpdates;
end;

procedure TdmEstoque.qyProdutosObsBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmEstoque.qyProdutosObsBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmEstoque.qyProdutosObsPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyProdutosSim ------------------------------------------------------------}

procedure TdmEstoque.qyProdutosSimAfterDelete(DataSet: TDataSet);
begin
  qyProdutosSim.ApplyUpdates;
  database.Commit;
  qyProdutosSim.CommitUpdates;
end;

procedure TdmEstoque.qyProdutosSimAfterPost(DataSet: TDataSet);
begin
  qyProdutosSim.ApplyUpdates;
  database.Commit;
  qyProdutosSim.CommitUpdates;
end;

procedure TdmEstoque.qyProdutosSimBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmEstoque.qyProdutosSimBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmEstoque.qyProdutosSimPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

end.
