unit uClassPrevres;

interface

Type TPrevres = class

  private
    FProduto: Integer;
    FPrevenda: Integer;
    FItem: Integer;
    FQuantidade: Real;
    procedure SetItem(const Value: Integer);
    procedure SetPrevenda(const Value: Integer);
    procedure SetProduto(const Value: Integer);
    procedure SetQuantidade(const Value: Real);

  public

    property Item: Integer read FItem write SetItem;
    property Prevenda: Integer read FPrevenda write SetPrevenda;
    property Produto: Integer read FProduto write SetProduto;
    property Quantidade: Real read FQuantidade write SetQuantidade;

end;

implementation

{ TPrevres }

procedure TPrevres.SetItem(const Value: Integer);
begin
  FItem := Value;
end;

procedure TPrevres.SetPrevenda(const Value: Integer);
begin
  FPrevenda := Value;
end;

procedure TPrevres.SetProduto(const Value: Integer);
begin
  FProduto := Value;
end;

procedure TPrevres.SetQuantidade(const Value: Real);
begin
  FQuantidade := Value;
end;

end.
