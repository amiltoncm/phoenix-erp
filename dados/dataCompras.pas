unit dataCompras;

interface

uses
  System.SysUtils, System.Classes, dataTmpConexao, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, ZSqlUpdate;

type
  TdmCompras = class(TdmTmpConexao)
    qyCotacao: TZQuery;
    qyOrdCompra: TZQuery;
    qyCotItens: TZQuery;
    qyOrdItens: TZQuery;
    updCotacao: TZUpdateSQL;
    updOrdCompra: TZUpdateSQL;
    updCotItens: TZUpdateSQL;
    updOrdItens: TZUpdateSQL;
    qyCotacaocot_numero: TIntegerField;
    qyCotacaocot_data: TDateField;
    qyCotacaopes_codigo: TIntegerField;
    qyCotacaopes_nome: TWideStringField;
    qyCotacaopes_fone: TWideStringField;
    qyCotacaocot_contato: TWideStringField;
    qyCotacaofun_codigo: TIntegerField;
    qyCotacaofun_nome: TWideStringField;
    qyCotacaocot_referente: TWideStringField;
    qyCotacaocot_obs: TWideStringField;
    qyCotacaocot_subtotal: TFloatField;
    qyCotacaocot_vlrdesc: TFloatField;
    qyCotacaocot_percdesc: TFloatField;
    qyCotacaocot_vlrtotal: TFloatField;
    qyCotacaoprz_codigo: TIntegerField;
    qyCotacaoprz_descricao: TWideStringField;
    qyCotacaofrp_codigo: TIntegerField;
    qyCotacaofrp_descricao: TWideStringField;
    qyCotacaomdf_codigo: TIntegerField;
    qyCotacaomdf_descricao: TWideStringField;
    qyCotacaosto_codigo: TIntegerField;
    qyCotacaosto_descricao: TWideStringField;
    qyCotacaoent_codigo: TIntegerField;
    qyCotacaoent_descricao: TWideStringField;
    qyCotacaoord_numero: TIntegerField;
    qyOrdCompraord_numero: TIntegerField;
    qyOrdCompraord_data: TDateField;
    qyOrdComprapes_codigo: TIntegerField;
    qyOrdComprapes_nome: TWideStringField;
    qyOrdComprapes_fone: TWideStringField;
    qyOrdCompraord_contato: TWideStringField;
    qyOrdComprafun_codigo: TIntegerField;
    qyOrdComprafun_nome: TWideStringField;
    qyOrdCompraord_referente: TWideStringField;
    qyOrdCompraord_obs: TWideStringField;
    qyOrdCompraord_subtotal: TFloatField;
    qyOrdCompraord_vlrdesc: TFloatField;
    qyOrdCompraord_percdesc: TFloatField;
    qyOrdCompraord_vlrtotal: TFloatField;
    qyOrdCompraprz_codigo: TIntegerField;
    qyOrdCompraprz_descricao: TWideStringField;
    qyOrdComprafrp_codigo: TIntegerField;
    qyOrdComprafrp_descricao: TWideStringField;
    qyOrdCompramdf_codigo: TIntegerField;
    qyOrdCompramdf_descricao: TWideStringField;
    qyOrdComprasto_codigo: TIntegerField;
    qyOrdComprasto_descricao: TWideStringField;
    qyOrdCompraent_codigo: TIntegerField;
    qyOrdCompraent_descricao: TWideStringField;
    qyOrdCompracot_numero: TIntegerField;
    qyCotItenscti_codigo: TIntegerField;
    qyCotItenscot_numero: TIntegerField;
    qyCotItenscti_quantidade: TFloatField;
    qyCotItenspro_codigo: TIntegerField;
    qyCotItenspro_descricao: TWideStringField;
    qyCotItensuni_codigo: TWideStringField;
    qyCotItenscti_vlrbrt: TFloatField;
    qyCotItenscti_percdesc: TFloatField;
    qyCotItenscti_vlrdesc: TFloatField;
    qyCotItenscti_vlrliq: TFloatField;
    qyCotItenscti_vlrtotal: TFloatField;
    qyOrdItensori_codigo: TIntegerField;
    qyOrdItensord_numero: TIntegerField;
    qyOrdItensori_quantidade: TFloatField;
    qyOrdItenspro_codigo: TIntegerField;
    qyOrdItenspro_descricao: TWideStringField;
    qyOrdItensuni_codigo: TWideStringField;
    qyOrdItensori_vlrbrt: TFloatField;
    qyOrdItensori_vlrdesc: TFloatField;
    qyOrdItensori_percdesc: TFloatField;
    qyOrdItensori_vlrliq: TFloatField;
    qyOrdItensori_vlrtotal: TFloatField;
    procedure qyCotacaoAfterDelete(DataSet: TDataSet);
    procedure qyCotacaoAfterPost(DataSet: TDataSet);
    procedure qyCotacaoBeforeDelete(DataSet: TDataSet);
    procedure qyCotacaoBeforePost(DataSet: TDataSet);
    procedure qyCotacaoPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyOrdCompraAfterDelete(DataSet: TDataSet);
    procedure qyOrdCompraAfterPost(DataSet: TDataSet);
    procedure qyOrdCompraBeforeDelete(DataSet: TDataSet);
    procedure qyOrdCompraBeforePost(DataSet: TDataSet);
    procedure qyOrdCompraPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyCotItensAfterDelete(DataSet: TDataSet);
    procedure qyCotItensAfterPost(DataSet: TDataSet);
    procedure qyCotItensBeforeDelete(DataSet: TDataSet);
    procedure qyCotItensBeforePost(DataSet: TDataSet);
    procedure qyCotItensPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyOrdItensAfterDelete(DataSet: TDataSet);
    procedure qyOrdItensAfterPost(DataSet: TDataSet);
    procedure qyOrdItensBeforeDelete(DataSet: TDataSet);
    procedure qyOrdItensBeforePost(DataSet: TDataSet);
    procedure qyOrdItensPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyCotacaoAfterInsert(DataSet: TDataSet);
    procedure qyCotItensAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCompras: TdmCompras;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uFuncoesDB;

{$R *.dfm}

{--- qyCotacao ----------------------------------------------------------------}

procedure TdmCompras.qyCotacaoAfterDelete(DataSet: TDataSet);
begin
  qyCotacao.ApplyUpdates;
  database.Commit;
  qyCotacao.CommitUpdates;
end;

procedure TdmCompras.qyCotacaoAfterInsert(DataSet: TDataSet);
begin
  qyCotacaocot_data.Text := FormatDateTime('dd/MM/yyyy', GetDateServerPG);
  qyCotacaopes_codigo.Value := 0;
  qyCotacaofun_codigo.Value := 0;
  qyCotacaofun_nome.Text := 'NÃO DEFINIDO';
  qyCotacaoprz_codigo.Value := 0;
  qyCotacaoprz_descricao.Text := 'À COMBINAR';
  qyCotacaofrp_codigo.Value := -1;
  qyCotacaofrp_descricao.Text := 'À COMBINAR';
  qyCotacaocot_subtotal.Value := 0;
  qyCotacaocot_vlrdesc.Value := 0;
  qyCotacaocot_percdesc.Value := 0;
  qyCotacaocot_vlrtotal.Value := 0;
  qyCotacaoent_codigo.Value := 0;
  qyCotacaoent_descricao.Text := 'À COMBINAR';
  qyCotacaomdf_codigo.Value := -1;
  qyCotacaomdf_descricao.Text := 'À COMBINAR';
  qyCotacaosto_codigo.Value := 1;
  qyCotacaosto_descricao.Text := 'EM ABERTO';
  qyCotacaocot_referente.Text := 'ORÇAMENTO SOLICITADO';
end;

procedure TdmCompras.qyCotacaoAfterPost(DataSet: TDataSet);
begin
  qyCotacao.ApplyUpdates;
  database.Commit;
  qyCotacao.CommitUpdates;
end;

procedure TdmCompras.qyCotacaoBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCompras.qyCotacaoBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCompras.qyCotacaoPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyCotItens ---------------------------------------------------------------}

procedure TdmCompras.qyCotItensAfterDelete(DataSet: TDataSet);
begin
  qyCotItens.ApplyUpdates;
  database.Commit;
  qyCotItens.CommitUpdates;
end;

procedure TdmCompras.qyCotItensAfterInsert(DataSet: TDataSet);
begin
  qyCotItenscot_numero.Value := qyCotacaocot_numero.Value;
  qyCotItenscti_quantidade.Value := 1;
  qyCotItenscti_vlrbrt.Value := 0;
  qyCotItenscti_vlrliq.Value := 0;
  qyCotItenscti_vlrdesc.Value := 0;
  qyCotItenscti_percdesc.Value := 0;
  qyCotItenscti_vlrtotal.Value := 0;
end;

procedure TdmCompras.qyCotItensAfterPost(DataSet: TDataSet);
begin
  qyCotItens.ApplyUpdates;
  database.Commit;
  qyCotItens.CommitUpdates;
end;

procedure TdmCompras.qyCotItensBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCompras.qyCotItensBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCompras.qyCotItensPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyOrdCompra --------------------------------------------------------------}

procedure TdmCompras.qyOrdCompraAfterDelete(DataSet: TDataSet);
begin
  qyOrdCompra.ApplyUpdates;
  database.Commit;
  qyOrdCompra.CommitUpdates;
end;

procedure TdmCompras.qyOrdCompraAfterPost(DataSet: TDataSet);
begin
  qyOrdCompra.ApplyUpdates;
  database.Commit;
  qyOrdCompra.CommitUpdates;
end;

procedure TdmCompras.qyOrdCompraBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCompras.qyOrdCompraBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCompras.qyOrdCompraPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyOrdItens ---------------------------------------------------------------}

procedure TdmCompras.qyOrdItensAfterDelete(DataSet: TDataSet);
begin
  qyOrdItens.ApplyUpdates;
  database.Commit;
  qyOrdItens.CommitUpdates;
end;

procedure TdmCompras.qyOrdItensAfterPost(DataSet: TDataSet);
begin
  qyOrdItens.ApplyUpdates;
  database.Commit;
  qyOrdItens.CommitUpdates;
end;

procedure TdmCompras.qyOrdItensBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCompras.qyOrdItensBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCompras.qyOrdItensPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

end.
