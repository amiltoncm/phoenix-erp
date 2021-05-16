unit uClassReceber;

interface

Type TReceber = class

  private
    FDesconto: Real;
    FAcrescimo: Real;
    FDuplicata: String;
    FValor: Real;
    FCoppessoa: Integer;
    FCodstatus: Integer;
    FCodigo: Integer;
    FSerie: Integer;
    FVencimento: TDate;
    FNumero: Integer;
    FPago: Real;
    FCodmdc: String;
    FEmissao: TDate;
    FSaldo: Real;
    FParcela: Integer;
    FCodforma: Integer;
    procedure SetAcrescimo(const Value: Real);
    procedure SetCodigo(const Value: Integer);
    procedure SetCodmdc(const Value: String);
    procedure SetCodstatus(const Value: Integer);
    procedure SetCoppessoa(const Value: Integer);
    procedure SetDesconto(const Value: Real);
    procedure SetDuplicata(const Value: String);
    procedure SetEmissao(const Value: TDate);
    procedure SetNumero(const Value: Integer);
    procedure SetPago(const Value: Real);
    procedure SetParcela(const Value: Integer);
    procedure SetSaldo(const Value: Real);
    procedure SetSerie(const Value: Integer);
    procedure SetValor(const Value: Real);
    procedure SetVencimento(const Value: TDate);
    procedure SetCodforma(const Value: Integer);

  public

    property Codigo: Integer read FCodigo write SetCodigo;
    property Emissao: TDate read FEmissao write SetEmissao;
    property Vencimento: TDate read FVencimento write SetVencimento;
    property Coppessoa: Integer read FCoppessoa write SetCoppessoa;
    property Numero: Integer read FNumero write SetNumero;
    property Serie: Integer read FSerie write SetSerie;
    property Codmdc: String read FCodmdc write SetCodmdc;
    property Parcela: Integer read FParcela write SetParcela;
    property Duplicata: String read FDuplicata write SetDuplicata;
    property Valor: Real read FValor write SetValor;
    property Pago: Real read FPago write SetPago;
    property Acrescimo: Real read FAcrescimo write SetAcrescimo;
    property Desconto: Real read FDesconto write SetDesconto;
    property Saldo: Real read FSaldo write SetSaldo;
    property Codstatus: Integer read FCodstatus write SetCodstatus;
    property Codforma: Integer read FCodforma write SetCodforma;

end;

implementation

{ TReceber }

procedure TReceber.SetAcrescimo(const Value: Real);
begin
  FAcrescimo := Value;
end;

procedure TReceber.SetCodforma(const Value: Integer);
begin
  FCodforma := Value;
end;

procedure TReceber.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TReceber.SetCodmdc(const Value: String);
begin
  FCodmdc := Value;
end;

procedure TReceber.SetCodstatus(const Value: Integer);
begin
  FCodstatus := Value;
end;

procedure TReceber.SetCoppessoa(const Value: Integer);
begin
  FCoppessoa := Value;
end;

procedure TReceber.SetDesconto(const Value: Real);
begin
  FDesconto := Value;
end;

procedure TReceber.SetDuplicata(const Value: String);
begin
  FDuplicata := Value;
end;

procedure TReceber.SetEmissao(const Value: TDate);
begin
  FEmissao := Value;
end;

procedure TReceber.SetNumero(const Value: Integer);
begin
  FNumero := Value;
end;

procedure TReceber.SetPago(const Value: Real);
begin
  FPago := Value;
end;

procedure TReceber.SetParcela(const Value: Integer);
begin
  FParcela := Value;
end;

procedure TReceber.SetSaldo(const Value: Real);
begin
  FSaldo := Value;
end;

procedure TReceber.SetSerie(const Value: Integer);
begin
  FSerie := Value;
end;

procedure TReceber.SetValor(const Value: Real);
begin
  FValor := Value;
end;

procedure TReceber.SetVencimento(const Value: TDate);
begin
  FVencimento := Value;
end;

end.
