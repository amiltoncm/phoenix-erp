unit uClassProdutosmov;

interface

Type TProdutosmov = class

  private
    FCodigo: Integer;
    FSerie: Integer;
    FNota: Integer;
    FQuantidade: Real;
    FCodproduto: Integer;
    FTipo: String;
    FCodpessoa: Integer;
    FData: TDate;
    FModelo: Integer;
    FValor: Real;
    procedure SetCodigo(const Value: Integer);
    procedure SetCodpessoa(const Value: Integer);
    procedure SetCodproduto(const Value: Integer);
    procedure SetData(const Value: TDate);
    procedure SetNota(const Value: Integer);
    procedure SetQuantidade(const Value: Real);
    procedure SetSerie(const Value: Integer);
    procedure SetTipo(const Value: String);
    procedure SetModelo(const Value: Integer);
    procedure SetValor(const Value: Real);

  public

    property Codigo: Integer read FCodigo write SetCodigo;
    property Codproduto: Integer read FCodproduto write SetCodproduto;
    property Data: TDate read FData write SetData;
    property Quantidade: Real read FQuantidade write SetQuantidade;
    property Codpessoa: Integer read FCodpessoa write SetCodpessoa;
    property Tipo: String read FTipo write SetTipo;
    property Nota: Integer read FNota write SetNota;
    property Serie: Integer read FSerie write SetSerie;
    property Modelo: Integer read FModelo write SetModelo;
    property Valor: Real read FValor write SetValor;

end;

implementation

{ TProdutosmov }

procedure TProdutosmov.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TProdutosmov.SetCodpessoa(const Value: Integer);
begin
  FCodpessoa := Value;
end;

procedure TProdutosmov.SetCodproduto(const Value: Integer);
begin
  FCodproduto := Value;
end;

procedure TProdutosmov.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TProdutosmov.SetModelo(const Value: Integer);
begin
  FModelo := Value;
end;

procedure TProdutosmov.SetNota(const Value: Integer);
begin
  FNota := Value;
end;

procedure TProdutosmov.SetQuantidade(const Value: Real);
begin
  FQuantidade := Value;
end;

procedure TProdutosmov.SetSerie(const Value: Integer);
begin
  FSerie := Value;
end;

procedure TProdutosmov.SetTipo(const Value: String);
begin
  FTipo := Value;
end;

procedure TProdutosmov.SetValor(const Value: Real);
begin
  FValor := Value;
end;

end.
