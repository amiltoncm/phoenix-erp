unit dataCadastros;

interface

uses
  System.SysUtils, System.Classes, dataTmpConexao, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, ZSqlUpdate;

type
  TdmCadastros = class(TdmTmpConexao)
    qySistema: TZQuery;
    updSistema: TZUpdateSQL;
    qySistemasis_codigo: TIntegerField;
    qySistemasis_maquina: TWideStringField;
    qySistemasis_id: TWideStringField;
    qySistemasis_serial: TWideStringField;
    qySistemasis_validate: TDateField;
    qyEmailPadrao: TZQuery;
    qyEmailPadraousu_codigo: TIntegerField;
    qyEmailPadraomai_host: TWideStringField;
    qyEmailPadraomai_username: TWideStringField;
    qyEmailPadraomai_password: TWideStringField;
    qyEmailPadraomai_namefrom: TWideStringField;
    qyEmailPadraomai_adressfrom: TWideStringField;
    qyEmailPadraomai_porta: TIntegerField;
    qyEmailPadraomai_authtype: TIntegerField;
    qyEmailPadraomai_sslmethod: TIntegerField;
    qyEmailPadraomai_sslmode: TIntegerField;
    qyEmailPadraomai_usetls: TIntegerField;
    qyBancos: TZQuery;
    updBancos: TZUpdateSQL;
    qyBancosban_codigo: TIntegerField;
    qyBancosban_descricao: TWideStringField;
    qyCidades: TZQuery;
    qyCidadescid_codigo: TIntegerField;
    qyCidadescid_municipio: TWideStringField;
    qyCidadesuf_sigla: TWideStringField;
    qyCidadescid_ceppadrao: TWideStringField;
    qyCidadesuf_estado: TWideStringField;
    updCidades: TZUpdateSQL;
    qyContas: TZQuery;
    qyContascon_codigo: TIntegerField;
    qyContascon_descricao: TWideStringField;
    qyContasban_codigo: TIntegerField;
    qyContasban_descricao: TWideStringField;
    qyContascon_ativa: TWideStringField;
    updContas: TZUpdateSQL;
    qyGrupos: TZQuery;
    qyGruposgrp_codigo: TIntegerField;
    qyGruposgrp_descricao: TWideStringField;
    updGrupos: TZUpdateSQL;
    qySubGrupos: TZQuery;
    updSubGrupos: TZUpdateSQL;
    qySubGrupossgr_codigo: TIntegerField;
    qySubGrupossgr_descricao: TWideStringField;
    qySubGruposgrp_codigo: TIntegerField;
    qySubGrupossgr_mkpatac: TFloatField;
    qySubGrupossgr_mkpvar: TFloatField;
    qyFuncionarios: TZQuery;
    qyFuncionariosfun_codigo: TIntegerField;
    qyFuncionariosfun_nome: TWideStringField;
    qyFuncionariosfun_telefone: TWideStringField;
    qyFuncionariosfun_ativo: TWideStringField;
    qyFuncionariosfnc_codigo: TIntegerField;
    qyFuncionariosfnc_descricao: TWideStringField;
    updFuncionarios: TZUpdateSQL;
    qyFuncoes: TZQuery;
    updFuncoes: TZUpdateSQL;
    qyFuncoesfnc_codigo: TIntegerField;
    qyFuncoesfnc_descricao: TWideStringField;
    qyLocalizacao: TZQuery;
    updLocalizacao: TZUpdateSQL;
    qyLocalizacaoloc_codigo: TIntegerField;
    qyLocalizacaoloc_descricao: TWideStringField;
    qyMarcas: TZQuery;
    updMarcas: TZUpdateSQL;
    qyMarcasmar_codigo: TIntegerField;
    qyMarcasmar_descricao: TWideStringField;
    qyProdutos: TZQuery;
    updProdutos: TZUpdateSQL;
    qyProdutospro_codigo: TIntegerField;
    qyProdutospro_descricao: TWideStringField;
    qyProdutosuni_codigo: TWideStringField;
    qyProdutosuni_descricao: TWideStringField;
    qyProdutosgrp_codigo: TIntegerField;
    qyProdutosgrp_descricao: TWideStringField;
    qyProdutossgr_codigo: TIntegerField;
    qyProdutossgr_descricao: TWideStringField;
    qyProdutosmar_codigo: TIntegerField;
    qyProdutosmar_descricao: TWideStringField;
    qyProdutospro_codbarras: TWideStringField;
    qyProdutostip_codigo: TIntegerField;
    qyProdutostip_descricao: TWideStringField;
    qyProdutospro_classfisc: TIntegerField;
    qyProdutospro_ncm: TWideStringField;
    qyProdutospro_vlrunitario: TFloatField;
    qyProdutospro_credicms: TFloatField;
    qyProdutospro_vlrfrete: TFloatField;
    qyProdutospro_vlroutras: TFloatField;
    qyProdutospro_vlrimport: TFloatField;
    qyProdutospro_vlrcusto: TFloatField;
    qyProdutospro_mkpatac: TFloatField;
    qyProdutospro_mkpvar: TFloatField;
    qyProdutospro_vlratac: TFloatField;
    qyProdutospro_vlrvar: TFloatField;
    qyProdutospro_mgmin: TFloatField;
    qyProdutospro_desmax: TFloatField;
    qyProdutospro_movest: TWideStringField;
    qyProdutosloc_codigo: TIntegerField;
    qyProdutosloc_descricao: TWideStringField;
    qyProdutospro_dtcad: TDateField;
    qyProdutospro_estmin: TFloatField;
    qyProdutospro_estideal: TFloatField;
    qyProdutospro_pesobruto: TFloatField;
    qyProdutospro_pesoliq: TFloatField;
    qyProdutospro_origem: TIntegerField;
    qyProdutospro_inatzerar: TIntegerField;
    qyProdutospro_embalagem: TFloatField;
    qyProdutospro_codbarrasemb: TWideStringField;
    qyProdutospro_cest: TWideStringField;
    qyProdutospro_status: TWideStringField;
    qyPlanoContas: TZQuery;
    updPlanoContas: TZUpdateSQL;
    qyPlanoContasplc_codigo: TIntegerField;
    qyPlanoContasplc_descricao: TWideStringField;
    updUnidades: TZUpdateSQL;
    qyUnidades: TZQuery;
    qyUnidadesuni_codigo: TWideStringField;
    qyUnidadesuni_descricao: TWideStringField;
    qyUsuarios: TZQuery;
    qyUsuMails: TZQuery;
    updUsuarios: TZUpdateSQL;
    updUsuMails: TZUpdateSQL;
    qyUsuMailsusu_codigo: TIntegerField;
    qyUsuMailsmai_host: TWideStringField;
    qyUsuMailsmai_username: TWideStringField;
    qyUsuMailsmai_password: TWideStringField;
    qyUsuMailsmai_namefrom: TWideStringField;
    qyUsuMailsmai_adressfrom: TWideStringField;
    qyUsuMailsmai_porta: TIntegerField;
    qyUsuMailsmai_authtype: TIntegerField;
    qyUsuMailsmai_sslmethod: TIntegerField;
    qyUsuMailsmai_sslmode: TIntegerField;
    qyUsuMailsmai_usetls: TIntegerField;
    qyUsuariosusu_codigo: TIntegerField;
    qyUsuariosusu_nome: TWideStringField;
    qyUsuariosusu_senha: TWideStringField;
    qyUsuariosusu_ativo: TWideStringField;
    qyUsuariosace_codigo: TIntegerField;
    qyUsuariosace_descricao: TWideStringField;
    qyPlanoContasplc_tipo: TWideStringField;
    qyUsuariosusu_userapp: TIntegerField;
    qyUsuariosusu_senhaapp: TWideStringField;
    qyUsuariosMod: TZQuery;
    updUsuariosMod: TZUpdateSQL;
    qyUsuariosModusu_codigo: TIntegerField;
    qyUsuariosModusm_erp: TIntegerField;
    qyUsuariosModusm_comandas: TIntegerField;
    qyUsuariosModusm_delivery: TIntegerField;
    procedure qySistemaAfterDelete(DataSet: TDataSet);
    procedure qySistemaAfterPost(DataSet: TDataSet);
    procedure qySistemaBeforeDelete(DataSet: TDataSet);
    procedure qySistemaBeforePost(DataSet: TDataSet);
    procedure qySistemaPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyBancosAfterDelete(DataSet: TDataSet);
    procedure qyBancosAfterPost(DataSet: TDataSet);
    procedure qyBancosBeforeDelete(DataSet: TDataSet);
    procedure qyBancosBeforePost(DataSet: TDataSet);
    procedure qyBancosPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyCidadesAfterDelete(DataSet: TDataSet);
    procedure qyCidadesAfterPost(DataSet: TDataSet);
    procedure qyCidadesBeforeDelete(DataSet: TDataSet);
    procedure qyCidadesBeforePost(DataSet: TDataSet);
    procedure qyCidadesPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyContasAfterDelete(DataSet: TDataSet);
    procedure qyContasAfterPost(DataSet: TDataSet);
    procedure qyContasBeforeDelete(DataSet: TDataSet);
    procedure qyContasBeforePost(DataSet: TDataSet);
    procedure qyContasPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyGruposAfterDelete(DataSet: TDataSet);
    procedure qyGruposAfterPost(DataSet: TDataSet);
    procedure qyGruposBeforeDelete(DataSet: TDataSet);
    procedure qyGruposBeforePost(DataSet: TDataSet);
    procedure qyGruposPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qySubGruposAfterDelete(DataSet: TDataSet);
    procedure qySubGruposAfterPost(DataSet: TDataSet);
    procedure qySubGruposBeforeDelete(DataSet: TDataSet);
    procedure qySubGruposBeforePost(DataSet: TDataSet);
    procedure qySubGruposPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyFuncionariosAfterDelete(DataSet: TDataSet);
    procedure qyFuncionariosAfterPost(DataSet: TDataSet);
    procedure qyFuncionariosBeforeDelete(DataSet: TDataSet);
    procedure qyFuncionariosBeforePost(DataSet: TDataSet);
    procedure qyFuncionariosPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyLocalizacaoAfterDelete(DataSet: TDataSet);
    procedure qyLocalizacaoAfterPost(DataSet: TDataSet);
    procedure qyLocalizacaoBeforeDelete(DataSet: TDataSet);
    procedure qyLocalizacaoBeforePost(DataSet: TDataSet);
    procedure qyLocalizacaoPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyMarcasAfterDelete(DataSet: TDataSet);
    procedure qyMarcasAfterPost(DataSet: TDataSet);
    procedure qyMarcasBeforeDelete(DataSet: TDataSet);
    procedure qyMarcasBeforePost(DataSet: TDataSet);
    procedure qyMarcasPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyProdutosAfterDelete(DataSet: TDataSet);
    procedure qyProdutosAfterPost(DataSet: TDataSet);
    procedure qyProdutosBeforeDelete(DataSet: TDataSet);
    procedure qyProdutosBeforePost(DataSet: TDataSet);
    procedure qyProdutosPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyPlanoContasAfterDelete(DataSet: TDataSet);
    procedure qyPlanoContasAfterPost(DataSet: TDataSet);
    procedure qyPlanoContasBeforeDelete(DataSet: TDataSet);
    procedure qyPlanoContasBeforePost(DataSet: TDataSet);
    procedure qyPlanoContasPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyUnidadesAfterDelete(DataSet: TDataSet);
    procedure qyUnidadesAfterPost(DataSet: TDataSet);
    procedure qyUnidadesBeforeDelete(DataSet: TDataSet);
    procedure qyUnidadesBeforePost(DataSet: TDataSet);
    procedure qyUnidadesPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyUsuariosAfterDelete(DataSet: TDataSet);
    procedure qyUsuariosAfterPost(DataSet: TDataSet);
    procedure qyUsuariosBeforeDelete(DataSet: TDataSet);
    procedure qyUsuariosBeforePost(DataSet: TDataSet);
    procedure qyUsuariosPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyFuncoesBeforePost(DataSet: TDataSet);
    procedure qyFuncoesAfterDelete(DataSet: TDataSet);
    procedure qyFuncoesAfterPost(DataSet: TDataSet);
    procedure qyFuncoesBeforeDelete(DataSet: TDataSet);
    procedure qyFuncoesPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyUsuMailsAfterDelete(DataSet: TDataSet);
    procedure qyUsuMailsAfterPost(DataSet: TDataSet);
    procedure qyUsuMailsBeforeDelete(DataSet: TDataSet);
    procedure qyUsuMailsBeforePost(DataSet: TDataSet);
    procedure qyUsuMailsPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyContasAfterInsert(DataSet: TDataSet);
    procedure qyFuncionariosAfterInsert(DataSet: TDataSet);
    procedure qyProdutosAfterInsert(DataSet: TDataSet);
    procedure qyUsuariosAfterInsert(DataSet: TDataSet);
    procedure qyUsuariosModAfterDelete(DataSet: TDataSet);
    procedure qyUsuariosModAfterPost(DataSet: TDataSet);
    procedure qyUsuariosModBeforeDelete(DataSet: TDataSet);
    procedure qyUsuariosModBeforePost(DataSet: TDataSet);
    procedure qyUsuariosModPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyUsuariosModAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadastros: TdmCadastros;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uFuncoesDB;

{$R *.dfm}

{--- qyBancos -----------------------------------------------------------------}

procedure TdmCadastros.qyBancosAfterDelete(DataSet: TDataSet);
begin
  qyBancos.ApplyUpdates;
  database.Commit;
  qyBancos.CommitUpdates;
end;

procedure TdmCadastros.qyBancosAfterPost(DataSet: TDataSet);
begin
  qyBancos.ApplyUpdates;
  database.Commit;
  qyBancos.CommitUpdates;
end;

procedure TdmCadastros.qyBancosBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyBancosBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyBancosPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyCidades ----------------------------------------------------------------}

procedure TdmCadastros.qyCidadesAfterDelete(DataSet: TDataSet);
begin
  qyCidades.ApplyUpdates;
  database.Commit;
  qyCidades.CommitUpdates;
end;

procedure TdmCadastros.qyCidadesAfterPost(DataSet: TDataSet);
begin
  qyCidades.ApplyUpdates;
  database.Commit;
  qyCidades.CommitUpdates;
end;

procedure TdmCadastros.qyCidadesBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyCidadesBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyCidadesPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyContas -----------------------------------------------------------------}

procedure TdmCadastros.qyContasAfterDelete(DataSet: TDataSet);
begin
  qyContas.ApplyUpdates;
  database.Commit;
  qyContas.CommitUpdates;
end;

procedure TdmCadastros.qyContasAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qyContascon_ativa.Value := 'S';
end;

procedure TdmCadastros.qyContasAfterPost(DataSet: TDataSet);
begin
  qyContas.ApplyUpdates;
  database.Commit;
  qyContas.CommitUpdates;
end;

procedure TdmCadastros.qyContasBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyContasBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyContasPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyFuncionarios -----------------------------------------------------------}

procedure TdmCadastros.qyFuncionariosAfterDelete(DataSet: TDataSet);
begin
  qyFuncionarios.ApplyUpdates;
  database.Commit;
  qyFuncionarios.CommitUpdates;
end;

procedure TdmCadastros.qyFuncionariosAfterInsert(DataSet: TDataSet);
begin
  qyFuncionariosfun_ativo.Value := 'S';
  qyFuncionariosfnc_codigo.Value := 0;
  qyFuncionariosfnc_descricao.Value := 'NÃO DEFINIDA';
end;

procedure TdmCadastros.qyFuncionariosAfterPost(DataSet: TDataSet);
begin
  qyFuncionarios.ApplyUpdates;
  database.Commit;
  qyFuncionarios.CommitUpdates;
end;

procedure TdmCadastros.qyFuncionariosBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyFuncionariosBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyFuncionariosPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyFuncoes ----------------------------------------------------------------}

procedure TdmCadastros.qyFuncoesAfterDelete(DataSet: TDataSet);
begin
  qyFuncoes.ApplyUpdates;
  database.Commit;
  qyFuncoes.CommitUpdates;
end;

procedure TdmCadastros.qyFuncoesAfterPost(DataSet: TDataSet);
begin
  qyFuncoes.ApplyUpdates;
  database.Commit;
  qyFuncoes.CommitUpdates;
end;

procedure TdmCadastros.qyFuncoesBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyFuncoesBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyFuncoesPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyGrupos -----------------------------------------------------------------}

procedure TdmCadastros.qyGruposAfterDelete(DataSet: TDataSet);
begin
  qyGrupos.ApplyUpdates;
  database.Commit;
  qyGrupos.CommitUpdates;
end;

procedure TdmCadastros.qyGruposAfterPost(DataSet: TDataSet);
begin
  qyGrupos.ApplyUpdates;
  database.Commit;
  qyGrupos.CommitUpdates;
end;

procedure TdmCadastros.qyGruposBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyGruposBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyGruposPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyLocalizacao ------------------------------------------------------------}

procedure TdmCadastros.qyLocalizacaoAfterDelete(DataSet: TDataSet);
begin
  qyLocalizacao.ApplyUpdates;
  database.Commit;
  qyLocalizacao.CommitUpdates;
end;

procedure TdmCadastros.qyLocalizacaoAfterPost(DataSet: TDataSet);
begin
  qyLocalizacao.ApplyUpdates;
  database.Commit;
  qyLocalizacao.CommitUpdates;
end;

procedure TdmCadastros.qyLocalizacaoBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyLocalizacaoBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyLocalizacaoPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyMarcas -----------------------------------------------------------------}

procedure TdmCadastros.qyMarcasAfterDelete(DataSet: TDataSet);
begin
  qyMarcas.ApplyUpdates;
  database.Commit;
  qyMarcas.CommitUpdates;
end;

procedure TdmCadastros.qyMarcasAfterPost(DataSet: TDataSet);
begin
  qyMarcas.ApplyUpdates;
  database.Commit;
  qyMarcas.CommitUpdates;
end;

procedure TdmCadastros.qyMarcasBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyMarcasBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyMarcasPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyPlanoContas ------------------------------------------------------------}

procedure TdmCadastros.qyPlanoContasAfterDelete(DataSet: TDataSet);
begin
  qyPlanoContas.ApplyUpdates;
  database.Commit;
  qyPlanoContas.CommitUpdates;
end;

procedure TdmCadastros.qyPlanoContasAfterPost(DataSet: TDataSet);
begin
  qyPlanoContas.ApplyUpdates;
  database.Commit;
  qyPlanoContas.CommitUpdates;
end;

procedure TdmCadastros.qyPlanoContasBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyPlanoContasBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyPlanoContasPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyProdutos ---------------------------------------------------------------}

procedure TdmCadastros.qyProdutosAfterDelete(DataSet: TDataSet);
begin
  qyProdutos.ApplyUpdates;
  database.Commit;
  qyProdutos.CommitUpdates;
end;

procedure TdmCadastros.qyProdutosAfterInsert(DataSet: TDataSet);
begin
  qyProdutosUNI_CODIGO.Value := 'PÇ';
  qyProdutosUNI_DESCRICAO.Text := 'PEÇA';
  qyProdutosMAR_CODIGO.Value := 0;
  qyProdutosMAR_DESCRICAO.Text := 'NÃO DEFINIDA';
  qyProdutosTIP_CODIGO.Value := 0;
  qyProdutosTIP_DESCRICAO.Text := 'MERCADORIA PARA REVENDA';
  qyProdutosPRO_VLRUNITARIO.Value := 0;
  qyProdutospro_credicms.Value := 0;
  qyProdutosPRO_VLRFRETE.Value := 0;
  qyProdutosPRO_VLROUTRAS.Value := 0;
  qyProdutosPRO_VLRIMPORT.Value := 0;
  qyProdutosPRO_VLRCUSTO.Value := 0;
  qyProdutosPRO_MGMIN.Value := 0;
  qyProdutosPRO_DESMAX.Value := 0;
  qyProdutosPRO_MKPATAC.Value := 0;
  qyProdutosPRO_MKPVAR.Value := 0;
  qyProdutosPRO_VLRATAC.Value := 0;
  qyProdutosPRO_VLRVAR.Value := 0;
  qyProdutosPRO_MOVEST.Text := 'S';
  qyProdutosLOC_CODIGO.Value := 0;
  qyProdutosLOC_DESCRICAO.Text := 'NÃO DEFINIDA';
  qyProdutosPRO_DTCAD.Text := FormatDateTime('dd/MM/yyyy', GetDateServerPG);
  qyProdutosPRO_ESTMIN.Value := 0;
  qyProdutosPRO_ESTIDEAL.Value := 0;
  qyProdutosPRO_PESOBRUTO.Value := 0;
  qyProdutosPRO_PESOLIQ.Value := 0;
  qyProdutosPRO_ORIGEM.Value := 1;
  qyProdutosPRO_INATZERAR.Value := 0;
  qyProdutosPRO_STATUS.Text := 'A';
  qyProdutosPRO_NCM.Text := '0000.00.00';
  qyProdutospro_cest.Text := '0000000';
  qyProdutosPRO_CLASSFISC.Value := 1;
  qyProdutospro_embalagem.Value := 1;
end;

procedure TdmCadastros.qyProdutosAfterPost(DataSet: TDataSet);
begin
  qyProdutos.ApplyUpdates;
  database.Commit;
  qyProdutos.CommitUpdates;
end;

procedure TdmCadastros.qyProdutosBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyProdutosBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyProdutosPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qySistema ----------------------------------------------------------------}

procedure TdmCadastros.qySistemaAfterDelete(DataSet: TDataSet);
begin
  qySistema.ApplyUpdates;
  database.Commit;
  qySistema.CommitUpdates;
end;

procedure TdmCadastros.qySistemaAfterPost(DataSet: TDataSet);
begin
  qySistema.ApplyUpdates;
  database.Commit;
  qySistema.CommitUpdates;
end;

procedure TdmCadastros.qySistemaBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qySistemaBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qySistemaPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qySubGrupos --------------------------------------------------------------}

procedure TdmCadastros.qySubGruposAfterDelete(DataSet: TDataSet);
begin
  qySubGrupos.ApplyUpdates;
  database.Commit;
  qySubGrupos.CommitUpdates;
end;

procedure TdmCadastros.qySubGruposAfterPost(DataSet: TDataSet);
begin
  qySubGrupos.ApplyUpdates;
  database.Commit;
  qySubGrupos.CommitUpdates;
end;

procedure TdmCadastros.qySubGruposBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qySubGruposBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qySubGruposPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyUnidades ---------------------------------------------------------------}

procedure TdmCadastros.qyUnidadesAfterDelete(DataSet: TDataSet);
begin
  qyUnidades.ApplyUpdates;
  database.Commit;
  qyUnidades.CommitUpdates;
end;

procedure TdmCadastros.qyUnidadesAfterPost(DataSet: TDataSet);
begin
  qyUnidades.ApplyUpdates;
  database.Commit;
  qyUnidades.CommitUpdates;
end;

procedure TdmCadastros.qyUnidadesBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyUnidadesBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyUnidadesPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyUsuarios ---------------------------------------------------------------}

procedure TdmCadastros.qyUsuariosAfterDelete(DataSet: TDataSet);
begin
  qyUsuarios.ApplyUpdates;
  database.Commit;
  qyUsuarios.CommitUpdates;
end;

procedure TdmCadastros.qyUsuariosAfterInsert(DataSet: TDataSet);
begin
  qyUsuariosusu_ativo.Value := 'S';
  qyUsuariosace_codigo.Value := 0;
  qyUsuariosace_descricao.Value := 'Acesso total';
  qyUsuariosusu_userapp.Value := 0;
end;

procedure TdmCadastros.qyUsuariosAfterPost(DataSet: TDataSet);
begin
  qyUsuarios.ApplyUpdates;
  database.Commit;
  qyUsuarios.CommitUpdates;
end;

procedure TdmCadastros.qyUsuariosBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyUsuariosBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyUsuariosPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyUsuariosMod ------------------------------------------------------------}

procedure TdmCadastros.qyUsuariosModAfterDelete(DataSet: TDataSet);
begin
  qyUsuariosMod.ApplyUpdates;
  database.Commit;
  qyUsuariosMod.CommitUpdates;
end;

procedure TdmCadastros.qyUsuariosModAfterInsert(DataSet: TDataSet);
begin
  qyUsuariosModusm_erp.Value := 1;
  qyUsuariosModusm_comandas.Value := 1;
end;

procedure TdmCadastros.qyUsuariosModAfterPost(DataSet: TDataSet);
begin
  qyUsuariosMod.ApplyUpdates;
  database.Commit;
  qyUsuariosMod.CommitUpdates;
end;

procedure TdmCadastros.qyUsuariosModBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyUsuariosModBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyUsuariosModPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

{--- qyUsuMails ---------------------------------------------------------------}

procedure TdmCadastros.qyUsuMailsAfterDelete(DataSet: TDataSet);
begin
  qyUsuMails.ApplyUpdates;
  database.Commit;
  qyUsuMails.CommitUpdates;
end;

procedure TdmCadastros.qyUsuMailsAfterPost(DataSet: TDataSet);
begin
  qyUsuMails.ApplyUpdates;
  database.Commit;
  qyUsuMails.CommitUpdates;
end;

procedure TdmCadastros.qyUsuMailsBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyUsuMailsBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmCadastros.qyUsuMailsPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

end.
