unit uClassPagar;

interface

Type TPagar = class

  private
    FAcrescimo: Real;
    FDesconto: Real;
    FDuplicata: String;
    FValor: Real;
    FStaCodigo: Integer;
    FPesCodigo: Integer;
    FDescricao: String;
    FCodigo: Integer;
    FVencimento: TDateTime;
    FNumero: Integer;
    FPago: Real;
    FEmissao: TDateTime;
    FSaldo: Real;
    FChavenfe: String;
    FParcela: Integer;
    FSerie: Integer;
    FModelo: String;
    FNome: String;
    procedure SetAcrescimo(const Value: Real);
    procedure SetChavenfe(const Value: String);
    procedure SetCodigo(const Value: Integer);
    procedure SetDesconto(const Value: Real);
    procedure SetDescricao(const Value: String);
    procedure SetDuplicata(const Value: String);
    procedure SetEmissao(const Value: TDateTime);
    procedure SetNumero(const Value: Integer);
    procedure SetPago(const Value: Real);
    procedure SetParcela(const Value: Integer);
    procedure SetPesCodigo(const Value: Integer);
    procedure SetSaldo(const Value: Real);
    procedure SetStaCodigo(const Value: Integer);
    procedure SetValor(const Value: Real);
    procedure SetVencimento(const Value: TDateTime);
    procedure SetModelo(const Value: String);
    procedure SetSerie(const Value: Integer);
    procedure SetNome(const Value: String);

  public

    property Descricao: String read FDescricao write SetDescricao;
    property Codigo: Integer read FCodigo write SetCodigo;
    property Chavenfe: String read FChavenfe write SetChavenfe;
    property Saldo: Real read FSaldo write SetSaldo;
    property Desconto: Real read FDesconto write SetDesconto;
    property Acrescimo: Real read FAcrescimo write SetAcrescimo;
    property Pago: Real read FPago write SetPago;
    property Valor: Real read FValor write SetValor;
    property PesCodigo: Integer read FPesCodigo write SetPesCodigo;
    property Nome: String read FNome write SetNome;
    property Duplicata: String read FDuplicata write SetDuplicata;
    property Parcela: Integer read FParcela write SetParcela;
    property Numero: Integer read FNumero write SetNumero;
    property Vencimento: TDateTime read FVencimento write SetVencimento;
    property Emissao: TDateTime read FEmissao write SetEmissao;
    property StaCodigo: Integer read FStaCodigo write SetStaCodigo;
    property Serie: Integer read FSerie write SetSerie;
    property Modelo: String read FModelo write SetModelo;

end;

implementation

{ TPagar }

procedure TPagar.SetAcrescimo(const Value: Real);
begin
  FAcrescimo := Value;
end;

procedure TPagar.SetChavenfe(const Value: String);
begin
  FChavenfe := Value;
end;

procedure TPagar.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TPagar.SetDesconto(const Value: Real);
begin
  FDesconto := Value;
end;

procedure TPagar.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TPagar.SetDuplicata(const Value: String);
begin
  FDuplicata := Value;
end;

procedure TPagar.SetEmissao(const Value: TDateTime);
begin
  FEmissao := Value;
end;

procedure TPagar.SetModelo(const Value: String);
begin
  FModelo := Value;
end;

procedure TPagar.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TPagar.SetNumero(const Value: Integer);
begin
  FNumero := Value;
end;

procedure TPagar.SetPago(const Value: Real);
begin
  FPago := Value;
end;

procedure TPagar.SetParcela(const Value: Integer);
begin
  FParcela := Value;
end;

procedure TPagar.SetPesCodigo(const Value: Integer);
begin
  FPesCodigo := Value;
end;

procedure TPagar.SetSaldo(const Value: Real);
begin
  FSaldo := Value;
end;

procedure TPagar.SetSerie(const Value: Integer);
begin
  FSerie := Value;
end;

procedure TPagar.SetStaCodigo(const Value: Integer);
begin
  FStaCodigo := Value;
end;

procedure TPagar.SetValor(const Value: Real);
begin
  FValor := Value;
end;

procedure TPagar.SetVencimento(const Value: TDateTime);
begin
  FVencimento := Value;
end;

end.
