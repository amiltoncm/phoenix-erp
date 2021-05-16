unit dataTemp;

interface

uses
  System.SysUtils, System.Classes, Data.DB, JvMemoryDataset;

type
  TdmTemp = class(TDataModule)
    mdPagar: TJvMemoryData;
    mdPagarCodigo: TIntegerField;
    mdPagarVencimento: TDateField;
    mdPagarEmissao: TDateField;
    mdPagarNumero: TIntegerField;
    mdPagarSerie: TIntegerField;
    mdPagarModelo: TStringField;
    mdPagarParcela: TIntegerField;
    mdPagarDuplicata: TStringField;
    mdPagarPesCodigo: TIntegerField;
    mdPagarValor: TFloatField;
    mdPagarPago: TFloatField;
    mdPagarAcrescimo: TFloatField;
    mdPagarDesconto: TFloatField;
    mdPagarSaldo: TFloatField;
    mdPagarChaveNFE: TStringField;
    mdPagarStaCodigo: TIntegerField;
    mdPagarNome: TStringField;
    mdServico: TJvMemoryData;
    mdServicopro_codigo: TIntegerField;
    mdServicouni_codigo: TStringField;
    mdServicopro_descricao: TStringField;
    mdReceber: TJvMemoryData;
    mdReceberEmissao: TDateField;
    mdReceberVencimento: TDateField;
    mdReceberNumero: TIntegerField;
    mdReceberSerie: TIntegerField;
    mdReceberMod: TStringField;
    mdReceberParcela: TIntegerField;
    mdReceberDuplicata: TStringField;
    mdReceberPesCodigo: TIntegerField;
    mdReceberValor: TFloatField;
    mdReceberPago: TFloatField;
    mdReceberAcrescimo: TFloatField;
    mdReceberDesconto: TFloatField;
    mdReceberSaldo: TFloatField;
    mdReceberCodStatus: TIntegerField;
    mdReceberCodForma: TIntegerField;
    mdReceberCodigo: TIntegerField;
    mdCartoes: TJvMemoryData;
    mdCartoesLancamento: TIntegerField;
    mdCartoesData: TDateField;
    mdCartoesCodConta: TIntegerField;
    mdCartoesConta: TStringField;
    mdCartoesValor: TFloatField;
    mdEntManual: TJvMemoryData;
    mdEntManualLancamento: TIntegerField;
    mdEntManualCodigo: TIntegerField;
    mdEntManualDescricao: TStringField;
    mdEntManualQuantidade: TFloatField;
    mdEntManualValor: TFloatField;
    mdAgendaTemp: TJvMemoryData;
    mdAgendaTempDataAg: TDateField;
    mdAgendaTempHoraAg: TTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmTemp: TdmTemp;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
