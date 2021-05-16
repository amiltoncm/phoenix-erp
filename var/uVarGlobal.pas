unit uVarGlobal;

interface

uses uClassPreVendas, uClassCfgMail, uClassPessoasend, uClassEnderecoEnt,
     uClassUsuMails;

Var
//Dados do usu�rio -------------------------------------------------------------
vgCodUsuarioLog: String;
vgNomeUsuarioLog: String;

//Vari�veis padr�es ------------------------------------------------------------
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

//Vari�vel de controle para executar a primeira vez que entra no sistema -------
vgFirst: Integer;

//Imagens ----------------------------------------------------------------------
vgLogoRel: String;

//M�scaras ---------------------------------------------------------------------
vgMaskData: String;
vgMaskReal: String;
vgMaskHora: String;
vgSimbolo: String;
vgInteiro: String;

//Vari�veis de classes ---------------------------------------------------------
vgCfgMail: TCfgMail;
vgPessoasEnd: TPessoasend;
vgPreVenda: TPrevendas;
vgUsuMail: TUsumails;

// C�digo de barras ------------------------------------------------------------
vgCodBarPV: String;

//Backup
vgBackupPG: String;

//Config -----------------------------------------------------------------------
vgBuscaCEP: String;

//XML --------------------------------------------------------------------------
vgPathXML: String;

//Relat�rio de contas � pagar --------------------------------------------------
vgPagar: String; // R - Pagar / S - Pagas

//Cadastro de e-mail's por usu�rio ---------------------------------------------
vgCodUsuMail: Integer;

//Busca PETS no Or�amento ------------------------------------------------------
vgCodCliente: String;
vgNomeCliente: String;

//Utilizado para verificar tabela de venda no orcamento
vgNumOrc: Integer;
vgTabOrc: Integer;

//Utilizado para verificar tabela de venda na pre-venda
vgNumPev: Integer;
vgTabPev: Integer;

//Pega n�mero do or�amento para calcular total
vgNumOrcDelItem: Integer;

//Desconto no final do orcamento
vgNumOrcDesc: Integer;

//Libera desconto no or�amento
vgVarLib: Boolean;
vgVarLibItem: Boolean;

//Pega n�mero da Pr�venda para calcular total
vgNumPVDelItem: Integer;

//Abre PV em determinado n�mero / 0 para vazio
vgNumPVOpen: String;

//Desconto no final da Pr�-venda
vgNumPVDesc: Integer;

//Libera desconto na Pr�venda
vgVarPVLib: Boolean;
vgVarPVLibItem: Boolean;

//Cadastro de endere�o na PV ou NFe
vgCodClienteEnd: Integer;

//Busca endereco de entrega e joga nos edits - frmCondicoesPV
vgEnderecoEnt: TEnderecoEnt;

//Filtro para consulta produtos - frmConsProdutos
vgConsProdutos: String;

//Vari�vel para pegar o path do xml para importar os itens
vgCodFornecedor: Integer;
vgDescProdFor: String;

//Trabalha com NFe / Verifica Certificado Digital
vgUtilizaNFe: String;

//Cadastro PessoasMov
vgNomeCliCad: String;

//Vari�veis para agendamento
vgAgQda: String;
vgAgCodQda: String;
vgAgData: TDate;
vgAgHora: TTime;

//Utilizado para replica��o de hor�rios de agendamento
vgCodCliAge: String;
vgCliAge: String;

// Utilizado para lan�ar item na replica��o do agendamento
vgNewCodAge: Integer;

//Vari�veis para lan�ar cheque
vgCodCaixaChq: Integer;
vgCodClienteChq: Integer;
vgValorPVChq: Real;

//Vari�veis para gerar recebimento
// Loja ou Boleto
vgPVRec: Integer;
vgCodClienteRec: Integer;
vgValorPVRec: Real;
vgFormaRec: Integer;
vgPrazoRec: Integer;
// Cart�es de Cr�dito e D�bito
vgPVCt: Integer;
vgCodClienteCt: Integer;
vgValorPVCt: Real;
vgFormaCt: Integer;
vgPrazoCt: Integer;

// Efetivar PV sem pagamento
vgLibPvCob: boolean;

// Controle para zerar juros frmPrazo
vgZeraJuros: boolean;

// Reimpress�o de Pr�-venda
vgReimpPV: boolean;

// Detalhe da movimenta��o do produto
vgDetProdMov: Integer;
vgDescProdMov: String;

// Senha para excluir PV impressa
vgDelPVImp: boolean;

// Controla quantidade CodBar na Pr�-venda
vgQdtEmbPV: Real;

// Controle de comanda / itens
vgComanda: String;
vgMesa: String;
vgDelItemComanda: boolean;
vgNumPVGer: Integer;

implementation

end.
