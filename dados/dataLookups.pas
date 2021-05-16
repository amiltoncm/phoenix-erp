unit dataLookups;

interface

uses
  System.SysUtils, System.Classes, dataTmpConexao, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection;

type
  TdmLookups = class(TdmTmpConexao)
    qyLkSubGruposCad: TZQuery;
    qyLkSubGruposCadsgr_descricao: TWideStringField;
    qyLkSubGruposCadsgr_codigo: TIntegerField;
    qyLkSubGruposCadgrp_codigo: TIntegerField;
    qyLkSubGruposCadsgr_mkpatac: TFloatField;
    qyLkSubGruposCadsgr_mkpvar: TFloatField;
    qyLkClientes: TZQuery;
    qyLkClientespes_nome: TWideStringField;
    qyLkClientespes_nomefantasia: TWideStringField;
    qyLkClientespes_documento: TWideStringField;
    qyLkClientespes_codigo: TIntegerField;
    qyLkClientespes_logradouro: TWideStringField;
    qyLkAcesso: TZQuery;
    qyLkBancos: TZQuery;
    qyLkCidades: TZQuery;
    qyLkContas: TZQuery;
    qyLkContaDeb: TZQuery;
    qyLkContaCred: TZQuery;
    qyLkContaLanc: TZQuery;
    qyLkEmailsDest: TZQuery;
    qyLkEntrega: TZQuery;
    qyLkTpEndereco: TZQuery;
    qyLkEndEletroTipo: TZQuery;
    qyLkFornecedores: TZQuery;
    qyLkFormPag: TZQuery;
    qyLkFuncionarios: TZQuery;
    qyLkFuncoes: TZQuery;
    qyLkGrupos: TZQuery;
    qyLkLocalizacao: TZQuery;
    qyLkMarcas: TZQuery;
    qyLkModDoc: TZQuery;
    qyLkModFrete: TZQuery;
    qyLkPais: TZQuery;
    qyLkPessoas: TZQuery;
    qyLkPlanoContas: TZQuery;
    qyLkPlanoContasEnt: TZQuery;
    qyLkPlanoContasSai: TZQuery;
    qyLkPrazos: TZQuery;
    qyLkPrazosFrp: TZQuery;
    qyLkProdutos: TZQuery;
    qyLkServicos: TZQuery;
    qyLkRegime: TZQuery;
    qyLkSetor: TZQuery;
    qyLkStatusMov: TZQuery;
    qyLkStatusOrc: TZQuery;
    qyLkSubGrupos: TZQuery;
    qyLkTipoItem: TZQuery;
    qyLkTpFone: TZQuery;
    qyLkTpLogradouro: TZQuery;
    qyLkTransportadoras: TZQuery;
    qyLkUnidades: TZQuery;
    qyLkUf: TZQuery;
    qyLkUsuarios: TZQuery;
    qyLkVendedores: TZQuery;
    qyLkAcessoace_codigo: TIntegerField;
    qyLkAcessoace_descricao: TWideStringField;
    qyLkBancosban_descricao: TWideStringField;
    qyLkBancosban_codigo: TIntegerField;
    qyLkCidadescid_municipio: TWideStringField;
    qyLkCidadescid_codigo: TIntegerField;
    qyLkCidadesuf_sigla: TWideStringField;
    qyLkCidadescid_ceppadrao: TWideStringField;
    qyLkContascon_descricao: TWideStringField;
    qyLkContascon_codigo: TIntegerField;
    qyLkContasban_codigo: TIntegerField;
    qyLkContaDebcon_descricao: TWideStringField;
    qyLkContaDebcon_codigo: TIntegerField;
    qyLkContaDebban_codigo: TIntegerField;
    qyLkContaCredcon_descricao: TWideStringField;
    qyLkContaCredcon_codigo: TIntegerField;
    qyLkContaCredban_codigo: TIntegerField;
    qyLkContaLanccon_descricao: TWideStringField;
    qyLkContaLanccon_codigo: TIntegerField;
    qyLkContaLancban_codigo: TIntegerField;
    qyLkEmailsDestemd_endereco: TWideStringField;
    qyLkEmailsDestemd_codigo: TIntegerField;
    qyLkEntregaent_descricao: TWideStringField;
    qyLkEntregaent_codigo: TIntegerField;
    qyLkTpEnderecotpe_descricao: TWideStringField;
    qyLkTpEnderecotpe_codigo: TIntegerField;
    qyLkEndEletroTipotpn_descricao: TWideStringField;
    qyLkEndEletroTipotpn_codigo: TIntegerField;
    qyLkFornecedorespes_nome: TWideStringField;
    qyLkFornecedorespes_nomefantasia: TWideStringField;
    qyLkFornecedorespes_codigo: TIntegerField;
    qyLkFormPagfrp_descricao: TWideStringField;
    qyLkFormPagfrp_codigo: TIntegerField;
    qyLkFuncionariosfun_nome: TWideStringField;
    qyLkFuncionariosfun_codigo: TIntegerField;
    qyLkFuncoesfnc_descricao: TWideStringField;
    qyLkFuncoesfnc_codigo: TIntegerField;
    qyLkGruposgrp_descricao: TWideStringField;
    qyLkGruposgrp_codigo: TIntegerField;
    qyLkLocalizacaoloc_descricao: TWideStringField;
    qyLkLocalizacaoloc_codigo: TIntegerField;
    qyLkMarcasmar_descricao: TWideStringField;
    qyLkMarcasmar_codigo: TIntegerField;
    qyLkModDocmdc_descricao: TWideStringField;
    qyLkModDocmdc_codigo: TWideStringField;
    qyLkModFretemdf_descricao: TWideStringField;
    qyLkModFretemdf_codigo: TIntegerField;
    qyLkModFretemdf_fiscal: TWideStringField;
    qyLkPaispai_pais: TWideStringField;
    qyLkPaispai_codigo: TIntegerField;
    qyLkPessoaspes_nome: TWideStringField;
    qyLkPessoaspes_nomefantasia: TWideStringField;
    qyLkPessoaspes_codigo: TIntegerField;
    qyLkPlanoContasplc_descricao: TWideStringField;
    qyLkPlanoContasplc_codigo: TIntegerField;
    qyLkPlanoContasplc_tipo: TWideStringField;
    qyLkPlanoContasEntplc_descricao: TWideStringField;
    qyLkPlanoContasEntplc_codigo: TIntegerField;
    qyLkPlanoContasEntplc_tipo: TWideStringField;
    qyLkPlanoContasSaiplc_descricao: TWideStringField;
    qyLkPlanoContasSaiplc_codigo: TIntegerField;
    qyLkPlanoContasSaiplc_tipo: TWideStringField;
    qyLkPrazosprz_codigo: TIntegerField;
    qyLkPrazosprz_descricao: TWideStringField;
    qyLkPrazosprz_parcelas: TIntegerField;
    qyLkPrazosprz_juros: TFloatField;
    qyLkPrazosFrpprz_codigo: TIntegerField;
    qyLkPrazosFrpfrp_codigo: TIntegerField;
    qyLkPrazosFrpfrp_descricao: TWideStringField;
    qyLkProdutospro_descricao: TWideStringField;
    qyLkProdutospro_codigo: TIntegerField;
    qyLkProdutosuni_codigo: TWideStringField;
    qyLkServicospro_descricao: TWideStringField;
    qyLkServicospro_codigo: TIntegerField;
    qyLkServicosuni_codigo: TWideStringField;
    qyLkRegimereg_descricao: TWideStringField;
    qyLkRegimereg_codigo: TIntegerField;
    qyLkSetorset_descricao: TWideStringField;
    qyLkSetorset_codigo: TIntegerField;
    qyLkStatusMovsta_descricao: TWideStringField;
    qyLkStatusMovsta_codigo: TIntegerField;
    qyLkStatusOrcsto_descricao: TWideStringField;
    qyLkStatusOrcsto_codigo: TIntegerField;
    qyLkSubGrupossgr_descricao: TWideStringField;
    qyLkSubGrupossgr_codigo: TIntegerField;
    qyLkSubGruposgrp_codigo: TIntegerField;
    qyLkSubGrupossgr_mkpatac: TFloatField;
    qyLkSubGrupossgr_mkpvar: TFloatField;
    qyLkTipoItemtip_descricao: TWideStringField;
    qyLkTipoItemtip_codigo: TIntegerField;
    qyLkTpFonetpf_descricao: TWideStringField;
    qyLkTpFonetpf_codigo: TIntegerField;
    qyLkTpFonetpf_mascara: TWideStringField;
    qyLkTpLogradourotpl_descricao: TWideStringField;
    qyLkTpLogradourotpl_codigo: TIntegerField;
    qyLkTransportadoraspes_nome: TWideStringField;
    qyLkTransportadoraspes_nomefantasia: TWideStringField;
    qyLkTransportadoraspes_codigo: TIntegerField;
    qyLkUnidadesuni_descricao: TWideStringField;
    qyLkUnidadesuni_codigo: TWideStringField;
    qyLkUfuf_estado: TWideStringField;
    qyLkUfuf_sigla: TWideStringField;
    qyLkUfuf_codigo: TIntegerField;
    qyLkUsuariosusu_nome: TWideStringField;
    qyLkUsuariosusu_codigo: TIntegerField;
    qyLkVendedoresfun_nome: TWideStringField;
    qyLkVendedoresfun_codigo: TIntegerField;
    qyLkPlanoContasTp: TZQuery;
    qyLkPlanoContasTpplt_codigo: TWideStringField;
    qyLkPlanoContasTpplt_descricao: TWideStringField;
    qyLkIndPag: TZQuery;
    qyLkIndPaginp_codigo: TIntegerField;
    qyLkIndPaginp_descricao: TWideStringField;
    qyLkQuadras: TZQuery;
    qyLkQuadrasqda_descricao: TWideStringField;
    qyLkQuadrasqda_codigo: TIntegerField;
    qyLkComandas: TZQuery;
    qyLkComandascma_descricao: TWideStringField;
    qyLkComandascma_codigo: TIntegerField;
    qyLkComandascma_ativa: TIntegerField;
    qyLkMesas: TZQuery;
    qyLkMesasmes_descricao: TWideStringField;
    qyLkMesasmes_codigo: TIntegerField;
    qyLkMesasmes_ativa: TIntegerField;
    qyLkProdutosVenda: TZQuery;
    qyLkProdutosVendapro_descricao: TWideStringField;
    qyLkProdutosVendapro_codigo: TIntegerField;
    qyLkProdutosVendauni_codigo: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmLookups: TdmLookups;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDaoLookups;

{$R *.dfm}

procedure TdmLookups.DataModuleCreate(Sender: TObject);
begin
  inherited;
  AtualizarLookup('0');
end;

end.
