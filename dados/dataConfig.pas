unit dataConfig;

interface

uses
  System.SysUtils, System.Classes, dataTmpConexao, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, ZSqlUpdate;

type
  TdmConfig = class(TdmTmpConexao)
    qyEmpresa: TZQuery;
    updEmpresa: TZUpdateSQL;
    qyDateTimePG: TZQuery;
    qyConfig: TZQuery;
    updConfig: TZUpdateSQL;
    qyDateTimePGdate: TDateField;
    qyDateTimePGnow: TDateTimeField;
    qyConfigcfg_codigo: TIntegerField;
    qyConfigcfg_versao: TWideStringField;
    qyConfigcfg_codcidadepadrao: TIntegerField;
    qyConfigcfg_buscacep: TWideStringField;
    qyConfigcfg_lannfter: TWideStringField;
    qyConfigcfg_valorc: TIntegerField;
    qyConfigcfg_descmax: TFloatField;
    qyConfigcfg_mgmin: TFloatField;
    qyConfigcfg_prodcase: TWideStringField;
    qyConfigcfg_pis: TFloatField;
    qyConfigcfg_cofins: TFloatField;
    qyConfigcfg_efetprv: TIntegerField;
    qyEmpresaemp_codigo: TIntegerField;
    qyEmpresaemp_razao: TWideStringField;
    qyEmpresaemp_fantasia: TWideStringField;
    qyEmpresaemp_cnpj: TWideStringField;
    qyEmpresaemp_ie: TWideStringField;
    qyEmpresaemp_imun: TWideStringField;
    qyEmpresaemp_logradouro: TWideStringField;
    qyEmpresaemp_numero: TIntegerField;
    qyEmpresaemp_complemento: TWideStringField;
    qyEmpresaemp_bairro: TWideStringField;
    qyEmpresaemp_codcidade: TIntegerField;
    qyEmpresaemp_cidade: TWideStringField;
    qyEmpresaemp_uf: TWideStringField;
    qyEmpresaemp_codpais: TIntegerField;
    qyEmpresaemp_cep: TWideStringField;
    qyEmpresaemp_fone: TWideStringField;
    qyEmpresaemp_email: TWideStringField;
    qyEmpresaemp_homepage: TWideStringField;
    qyEmpresareg_codigo: TIntegerField;
    qyEmpresareg_descricao: TWideStringField;
    qyConfigcfg_divcomanda: TIntegerField;
    qyConfigcfg_efetprvaut: TIntegerField;
    qyConfigcfg_fechaprvaut: TIntegerField;
    qyConfigcfg_userapp: TIntegerField;
    qyConfigcfg_autupdcom: TIntegerField;
    qyUpdate: TZQuery;
    updUpdate: TZUpdateSQL;
    qyUpdateupd_codigo: TIntegerField;
    qyConfigcfg_delivery: TIntegerField;
    procedure qyConfigAfterDelete(DataSet: TDataSet);
    procedure qyConfigAfterPost(DataSet: TDataSet);
    procedure qyConfigBeforeDelete(DataSet: TDataSet);
    procedure qyConfigBeforePost(DataSet: TDataSet);
    procedure qyConfigPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyEmpresaAfterDelete(DataSet: TDataSet);
    procedure qyEmpresaAfterPost(DataSet: TDataSet);
    procedure qyEmpresaBeforeDelete(DataSet: TDataSet);
    procedure qyEmpresaBeforePost(DataSet: TDataSet);
    procedure qyEmpresaPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyUpdateAfterDelete(DataSet: TDataSet);
    procedure qyUpdateAfterPost(DataSet: TDataSet);
    procedure qyUpdateBeforeDelete(DataSet: TDataSet);
    procedure qyUpdateBeforePost(DataSet: TDataSet);
    procedure qyUpdatePostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConfig: TdmConfig;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{--- qyConfig -----------------------------------------------------------------}

procedure TdmConfig.qyConfigAfterDelete(DataSet: TDataSet);
begin
  qyConfig.ApplyUpdates;
  database.Commit;
  qyConfig.CommitUpdates;
end;

procedure TdmConfig.qyConfigAfterPost(DataSet: TDataSet);
begin
  qyConfig.ApplyUpdates;
  database.Commit;
  qyConfig.CommitUpdates;
end;

procedure TdmConfig.qyConfigBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmConfig.qyConfigBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmConfig.qyConfigPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyEmpresa ----------------------------------------------------------------}

procedure TdmConfig.qyEmpresaAfterDelete(DataSet: TDataSet);
begin
  qyEmpresa.ApplyUpdates;
  database.Commit;
  qyEmpresa.CommitUpdates;
end;

procedure TdmConfig.qyEmpresaAfterPost(DataSet: TDataSet);
begin
  qyEmpresa.ApplyUpdates;
  database.Commit;
  qyEmpresa.CommitUpdates;
end;

procedure TdmConfig.qyEmpresaBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmConfig.qyEmpresaBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmConfig.qyEmpresaPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyUpdate -----------------------------------------------------------------}

procedure TdmConfig.qyUpdateAfterDelete(DataSet: TDataSet);
begin
  qyUpdate.ApplyUpdates;
  database.Commit;
  qyUpdate.CommitUpdates;
end;

procedure TdmConfig.qyUpdateAfterPost(DataSet: TDataSet);
begin
  qyUpdate.ApplyUpdates;
  database.Commit;
  qyUpdate.CommitUpdates;
end;

procedure TdmConfig.qyUpdateBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmConfig.qyUpdateBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmConfig.qyUpdatePostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

end.
