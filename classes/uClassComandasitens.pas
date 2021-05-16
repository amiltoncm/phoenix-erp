unit uClassComandasitens;

interface

Type TComandasitens = class

  private
    FPrevenda: Integer;
    FVlrtotal: Real;
    FCodigo: Integer;
    FCodcomanda: Integer;
    FQuantidade: Real;
    FCodproduto: Integer;
    FVlrunitario: Real;
    FCodStatus: Integer;
    FCozinha: Integer;
    FCopa: Integer;
    FVlrCustoTotal: Real;
    procedure SetCodcomanda(const Value: Integer);
    procedure SetCodigo(const Value: Integer);
    procedure SetCodproduto(const Value: Integer);
    procedure SetPrevenda(const Value: Integer);
    procedure SetQuantidade(const Value: Real);
    procedure SetVlrtotal(const Value: Real);
    procedure SetVlrunitario(const Value: Real);
    procedure SetCodStatus(const Value: Integer);
    procedure SetCopa(const Value: Integer);
    procedure SetCozinha(const Value: Integer);
    procedure SetVlrCustoTotal(const Value: Real);

  public

    property Codigo: Integer read FCodigo write SetCodigo;
    property Codcomanda: Integer read FCodcomanda write SetCodcomanda;
    property Quantidade: Real read FQuantidade write SetQuantidade;
    property Codproduto: Integer read FCodproduto write SetCodproduto;
    property Vlrunitario: Real read FVlrunitario write SetVlrunitario;
    property VlrCustoTotal: Real read FVlrCustoTotal write SetVlrCustoTotal;
    property Vlrtotal: Real read FVlrtotal write SetVlrtotal;
    property Prevenda: Integer read FPrevenda write SetPrevenda;
    property Copa: Integer read FCopa write SetCopa;
    property Cozinha: Integer read FCozinha write SetCozinha;
    property CodStatus: Integer read FCodStatus write SetCodStatus;

end;

implementation

{ TComandasitens }

procedure TComandasitens.SetCodcomanda(const Value: Integer);
begin
  FCodcomanda := Value;
end;

procedure TComandasitens.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TComandasitens.SetCodproduto(const Value: Integer);
begin
  FCodproduto := Value;
end;

procedure TComandasitens.SetCodStatus(const Value: Integer);
begin
  FCodStatus := Value;
end;

procedure TComandasitens.SetCopa(const Value: Integer);
begin
  FCopa := Value;
end;

procedure TComandasitens.SetCozinha(const Value: Integer);
begin
  FCozinha := Value;
end;

procedure TComandasitens.SetPrevenda(const Value: Integer);
begin
  FPrevenda := Value;
end;

procedure TComandasitens.SetQuantidade(const Value: Real);
begin
  FQuantidade := Value;
end;

procedure TComandasitens.SetVlrCustoTotal(const Value: Real);
begin
  FVlrCustoTotal := Value;
end;

procedure TComandasitens.SetVlrtotal(const Value: Real);
begin
  FVlrtotal := Value;
end;

procedure TComandasitens.SetVlrunitario(const Value: Real);
begin
  FVlrunitario := Value;
end;

end.
