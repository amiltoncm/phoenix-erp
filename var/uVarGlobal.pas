unit uVarGlobal;

interface

uses uClassPreVendas, uClassCfgMail, uClassPessoasend, uClassEnderecoEnt,
     uClassUsuMails;

Var
//Dados do usuário -------------------------------------------------------------
vgCodUsuarioLog: String;
vgNomeUsuarioLog: String;

//Variáveis padrões ------------------------------------------------------------
vgPath: String;
vgArqIni: String;
vgDirTemp: String;
vgDirImagens: String;
vgFundo: String;
vgSenhaMaster: String;
vgServerType: String;
vgTemp: String;
vgHistory: String;
vgIDCaixa: Integer;

//Variável de controle para executar a primeira vez que entra no sistema -------
vgFirst: Integer;

//Imagens ----------------------------------------------------------------------
vgLogoRel: String;

//Máscaras ---------------------------------------------------------------------
vgMaskData: String;
vgMaskReal: String;
vgMaskHora: String;
vgSimbolo: String;
vgInteiro: String;

//Variáveis de classes ---------------------------------------------------------
vgCfgMail: TCfgMail;
vgPessoasEnd: TPessoasend;
vgPreVenda: TPrevendas;
vgUsuMail: TUsumails;

// Código de barras ------------------------------------------------------------
vgCodBarPV: String;

//Backup
vgBackupPG: String;

//Config -----------------------------------------------------------------------
vgBuscaCEP: String;

//XML --------------------------------------------------------------------------
vgPathXML: String;

//Relatório de contas à pagar --------------------------------------------------
vgPagar: String; // R - Pagar / S - Pagas

//Cadastro de e-mail's por usuário ---------------------------------------------
vgCodUsuMail: Integer;

//Busca PETS no Orçamento ------------------------------------------------------
vgCodCliente: String;
vgNomeCliente: String;

//Utilizado para verificar tabela de venda no orcamento
vgNumOrc: Integer;
vgTabOrc: Integer;

//Utilizado para verificar tabela de venda na pre-venda
vgNumPev: Integer;
vgTabPev: Integer;

//Pega número do orçamento para calcular total
vgNumOrcDelItem: Integer;

//Desconto no final do orcamento
vgNumOrcDesc: Integer;

//Libera desconto no orçamento
vgVarLib: Boolean;
vgVarLibItem: Boolean;

//Pega número da Prévenda para calcular total
vgNumPVDelItem: Integer;

//Abre PV em determinado número / 0 para vazio
vgNumPVOpen: String;

//Desconto no final da Pré-venda
vgNumPVDesc: Integer;

//Libera desconto na Prévenda
vgVarPVLib: Boolean;
vgVarPVLibItem: Boolean;

//Cadastro de endereço na PV ou NFe
vgCodClienteEnd: Integer;

//Busca endereco de entrega e joga nos edits - frmCondicoesPV
vgEnderecoEnt: TEnderecoEnt;

//Filtro para consulta produtos - frmConsProdutos
vgConsProdutos: String;

//Variável para pegar o path do xml para importar os itens
vgCodFornecedor: Integer;
vgDescProdFor: String;

//Trabalha com NFe / Verifica Certificado Digital
vgUtilizaNFe: String;

//Cadastro PessoasMov
vgNomeCliCad: String;

//Variáveis para agendamento
vgAgQda: String;
vgAgCodQda: String;
vgAgData: TDate;
vgAgHora: TTime;

//Utilizado para replicação de horários de agendamento
vgCodCliAge: String;
vgCliAge: String;

// Utilizado para lançar item na replicação do agendamento
vgNewCodAge: Integer;

//Variáveis para lançar cheque
vgCodCaixaChq: Integer;
vgCodClienteChq: Integer;
vgValorPVChq: Real;

//Variáveis para gerar recebimento
// Loja ou Boleto
vgPVRec: Integer;
vgCodClienteRec: Integer;
vgValorPVRec: Real;
vgFormaRec: Integer;
vgPrazoRec: Integer;
// Cartões de Crédito e Débito
vgPVCt: Integer;
vgCodClienteCt: Integer;
vgValorPVCt: Real;
vgFormaCt: Integer;
vgPrazoCt: Integer;

// Efetivar PV sem pagamento
vgLibPvCob: boolean;

// Controle para zerar juros frmPrazo
vgZeraJuros: boolean;

// Reimpressão de Pré-venda
vgReimpPV: boolean;

// Detalhe da movimentação do produto
vgDetProdMov: Integer;
vgDescProdMov: String;

// Senha para excluir PV impressa
vgDelPVImp: boolean;

// Controla quantidade CodBar na Pré-venda
vgQdtEmbPV: Real;

// Controle de comanda / itens
vgComanda: String;
vgMesa: String;
vgDelItemComanda: boolean;
vgNumPVGer: Integer;

implementation

end.
