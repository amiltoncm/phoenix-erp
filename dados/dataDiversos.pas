unit dataDiversos;

interface

uses
  System.SysUtils, System.Classes, dataTmpConexao, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, ZSqlUpdate;

type
  TdmDiversos = class(TdmTmpConexao)
    qyEmailsDest: TZQuery;
    qyEmailsDestemd_codigo: TIntegerField;
    qyEmailsDestemd_endereco: TWideStringField;
    updEmailsDest: TZUpdateSQL;
    qyEndEletroTipo: TZQuery;
    updEndEletroTipo: TZUpdateSQL;
    qyEndEletroTipotpn_codigo: TIntegerField;
    qyEndEletroTipotpn_descricao: TWideStringField;
    qyEnderecosTipo: TZQuery;
    updEnderecosTipo: TZUpdateSQL;
    qyEnderecosTipotpe_codigo: TIntegerField;
    qyEnderecosTipotpe_descricao: TWideStringField;
    qyFonesTipo: TZQuery;
    updFonesTipo: TZUpdateSQL;
    qyFonesTipotpf_codigo: TIntegerField;
    qyFonesTipotpf_descricao: TWideStringField;
    qyFonesTipotpf_mascara: TWideStringField;
    qyLogradourosTipo: TZQuery;
    updLogradourosTipo: TZUpdateSQL;
    qyLogradourosTipotpl_codigo: TIntegerField;
    qyLogradourosTipotpl_descricao: TWideStringField;
    qyPais: TZQuery;
    qySetor: TZQuery;
    qyUf: TZQuery;
    updPais: TZUpdateSQL;
    updSetor: TZUpdateSQL;
    updUf: TZUpdateSQL;
    qyPaispai_codigo: TIntegerField;
    qyPaispai_pais: TWideStringField;
    qyPaispai_alpha3: TWideStringField;
    qySetorset_codigo: TIntegerField;
    qySetorset_descricao: TWideStringField;
    qyUfuf_sigla: TWideStringField;
    qyUfuf_estado: TWideStringField;
    qyUfuf_codigo: TIntegerField;
    qyUfpai_codigo: TIntegerField;
    qyUfpai_pais: TWideStringField;
    qyUfuf_icmsint: TFloatField;
    procedure qyEmailsDestAfterDelete(DataSet: TDataSet);
    procedure qyEmailsDestAfterPost(DataSet: TDataSet);
    procedure qyEmailsDestBeforeDelete(DataSet: TDataSet);
    procedure qyEmailsDestBeforePost(DataSet: TDataSet);
    procedure qyEmailsDestPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyEndEletroTipoAfterDelete(DataSet: TDataSet);
    procedure qyEndEletroTipoAfterPost(DataSet: TDataSet);
    procedure qyEndEletroTipoBeforeDelete(DataSet: TDataSet);
    procedure qyEndEletroTipoBeforePost(DataSet: TDataSet);
    procedure qyEndEletroTipoPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyEnderecosTipoAfterDelete(DataSet: TDataSet);
    procedure qyEnderecosTipoAfterPost(DataSet: TDataSet);
    procedure qyEnderecosTipoBeforeDelete(DataSet: TDataSet);
    procedure qyEnderecosTipoBeforePost(DataSet: TDataSet);
    procedure qyEnderecosTipoPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyFonesTipoAfterDelete(DataSet: TDataSet);
    procedure qyFonesTipoAfterPost(DataSet: TDataSet);
    procedure qyFonesTipoBeforeDelete(DataSet: TDataSet);
    procedure qyFonesTipoBeforePost(DataSet: TDataSet);
    procedure qyFonesTipoPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyLogradourosTipoAfterDelete(DataSet: TDataSet);
    procedure qyLogradourosTipoAfterPost(DataSet: TDataSet);
    procedure qyLogradourosTipoBeforeDelete(DataSet: TDataSet);
    procedure qyLogradourosTipoBeforePost(DataSet: TDataSet);
    procedure qyLogradourosTipoPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyPaisAfterDelete(DataSet: TDataSet);
    procedure qyPaisAfterPost(DataSet: TDataSet);
    procedure qyPaisBeforeDelete(DataSet: TDataSet);
    procedure qyPaisBeforePost(DataSet: TDataSet);
    procedure qyPaisPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qySetorAfterDelete(DataSet: TDataSet);
    procedure qySetorAfterPost(DataSet: TDataSet);
    procedure qySetorBeforeDelete(DataSet: TDataSet);
    procedure qySetorBeforePost(DataSet: TDataSet);
    procedure qySetorPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyUfAfterDelete(DataSet: TDataSet);
    procedure qyUfAfterPost(DataSet: TDataSet);
    procedure qyUfBeforeDelete(DataSet: TDataSet);
    procedure qyUfBeforePost(DataSet: TDataSet);
    procedure qyUfPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyUfAfterInsert(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDiversos: TdmDiversos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{--- qyEmailsDest -------------------------------------------------------------}

procedure TdmDiversos.qyEmailsDestAfterDelete(DataSet: TDataSet);
begin
  qyEmailsDest.ApplyUpdates;
  database.Commit;
  qyEmailsDest.CommitUpdates;
end;

procedure TdmDiversos.qyEmailsDestAfterPost(DataSet: TDataSet);
begin
  qyEmailsDest.ApplyUpdates;
  database.Commit;
  qyEmailsDest.CommitUpdates;
end;

procedure TdmDiversos.qyEmailsDestBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmDiversos.qyEmailsDestBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmDiversos.qyEmailsDestPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyEndEletroTipo ----------------------------------------------------------}

procedure TdmDiversos.qyEndEletroTipoAfterDelete(DataSet: TDataSet);
begin
  qyEndEletroTipo.ApplyUpdates;
  database.Commit;
  qyEndEletroTipo.CommitUpdates;
end;

procedure TdmDiversos.qyEndEletroTipoAfterPost(DataSet: TDataSet);
begin
  qyEndEletroTipo.ApplyUpdates;
  database.Commit;
  qyEndEletroTipo.CommitUpdates;
end;

procedure TdmDiversos.qyEndEletroTipoBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmDiversos.qyEndEletroTipoBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmDiversos.qyEndEletroTipoPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyEnderecosTipo ----------------------------------------------------------}

procedure TdmDiversos.qyEnderecosTipoAfterDelete(DataSet: TDataSet);
begin
  qyEnderecosTipo.ApplyUpdates;
  database.Commit;
  qyEnderecosTipo.CommitUpdates;
end;

procedure TdmDiversos.qyEnderecosTipoAfterPost(DataSet: TDataSet);
begin
  qyEnderecosTipo.ApplyUpdates;
  database.Commit;
  qyEnderecosTipo.CommitUpdates;
end;

procedure TdmDiversos.qyEnderecosTipoBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmDiversos.qyEnderecosTipoBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmDiversos.qyEnderecosTipoPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyFonesTipo --------------------------------------------------------------}

procedure TdmDiversos.qyFonesTipoAfterDelete(DataSet: TDataSet);
begin
  qyFonesTipo.ApplyUpdates;
  database.Commit;
  qyFonesTipo.CommitUpdates;
end;

procedure TdmDiversos.qyFonesTipoAfterPost(DataSet: TDataSet);
begin
  qyFonesTipo.ApplyUpdates;
  database.Commit;
  qyFonesTipo.CommitUpdates;
end;

procedure TdmDiversos.qyFonesTipoBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmDiversos.qyFonesTipoBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmDiversos.qyFonesTipoPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyLogradourosTipo --------------------------------------------------------}

procedure TdmDiversos.qyLogradourosTipoAfterDelete(DataSet: TDataSet);
begin
  qyLogradourosTipo.ApplyUpdates;
  database.Commit;
  qyLogradourosTipo.CommitUpdates;
end;

procedure TdmDiversos.qyLogradourosTipoAfterPost(DataSet: TDataSet);
begin
  qyLogradourosTipo.ApplyUpdates;
  database.Commit;
  qyLogradourosTipo.CommitUpdates;
end;

procedure TdmDiversos.qyLogradourosTipoBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmDiversos.qyLogradourosTipoBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmDiversos.qyLogradourosTipoPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyPais -------------------------------------------------------------------}

procedure TdmDiversos.qyPaisAfterDelete(DataSet: TDataSet);
begin
  qyPais.ApplyUpdates;
  database.Commit;
  qyPais.CommitUpdates;
end;

procedure TdmDiversos.qyPaisAfterPost(DataSet: TDataSet);
begin
  qyPais.ApplyUpdates;
  database.Commit;
  qyPais.CommitUpdates;
end;

procedure TdmDiversos.qyPaisBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmDiversos.qyPaisBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmDiversos.qyPaisPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qySetor ------------------------------------------------------------------}

procedure TdmDiversos.qySetorAfterDelete(DataSet: TDataSet);
begin
  qySetor.ApplyUpdates;
  database.Commit;
  qySetor.CommitUpdates;
end;

procedure TdmDiversos.qySetorAfterPost(DataSet: TDataSet);
begin
  qySetor.ApplyUpdates;
  database.Commit;
  qySetor.CommitUpdates;
end;

procedure TdmDiversos.qySetorBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmDiversos.qySetorBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmDiversos.qySetorPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyUf ---------------------------------------------------------------------}

procedure TdmDiversos.qyUfAfterDelete(DataSet: TDataSet);
begin
  qyUf.ApplyUpdates;
  database.Commit;
  qyUf.CommitUpdates;
end;

procedure TdmDiversos.qyUfAfterInsert(DataSet: TDataSet);
begin
  qyUfpai_codigo.Value := 76;
  qyUfpai_pais.Text := 'BRASIL';
end;

procedure TdmDiversos.qyUfAfterPost(DataSet: TDataSet);
begin
  qyUf.ApplyUpdates;
  database.Commit;
  qyUf.CommitUpdates;
end;

procedure TdmDiversos.qyUfBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmDiversos.qyUfBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmDiversos.qyUfPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

end.
