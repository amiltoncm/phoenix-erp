unit uClassProdutosfor;

interface

Type TProdutosfor = class

  private
    FCodfornecedor: Integer;
    FFornecedor: String;
    FCodproduto: Integer;
    FCodbarras: String;
    FReferencia: String;
    FProduto: String;
    FUniCp: Real;
    FUniVd: Real;
    procedure SetCodbarras(const Value: String);
    procedure SetCodfornecedor(const Value: Integer);
    procedure SetCodproduto(const Value: Integer);
    procedure SetFornecedor(const Value: String);
    procedure SetReferencia(const Value: String);
    procedure SetProduto(const Value: String);
    procedure SetUniCp(const Value: Real);
    procedure SetUniVd(const Value: Real);

  public

    property Codproduto: Integer read FCodproduto write SetCodproduto;
    property Produto: String read FProduto write SetProduto;
    property Codfornecedor: Integer read FCodfornecedor write SetCodfornecedor;
    property Fornecedor: String read FFornecedor write SetFornecedor;
    property Referencia: String read FReferencia write SetReferencia;
    property Codbarras: String read FCodbarras write SetCodbarras;
    property UniCp: Real read FUniCp write SetUniCp;
    property UniVd: Real read FUniVd write SetUniVd;

end;

implementation

{ TProdutosfor }

procedure TProdutosfor.SetCodbarras(const Value: String);
begin
  FCodbarras := Value;
end;

procedure TProdutosfor.SetCodfornecedor(const Value: Integer);
begin
  FCodfornecedor := Value;
end;

procedure TProdutosfor.SetCodproduto(const Value: Integer);
begin
  FCodproduto := Value;
end;

procedure TProdutosfor.SetFornecedor(const Value: String);
begin
  FFornecedor := Value;
end;

procedure TProdutosfor.SetProduto(const Value: String);
begin
  FProduto := Value;
end;

procedure TProdutosfor.SetReferencia(const Value: String);
begin
  FReferencia := Value;
end;

procedure TProdutosfor.SetUniCp(const Value: Real);
begin
  FUniCp := Value;
end;

procedure TProdutosfor.SetUniVd(const Value: Real);
begin
  FUniVd := Value;
end;

end.
