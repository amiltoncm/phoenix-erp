unit uClassOrcitens;

interface

Type TOrcitens = class

  private
    FPercdesc: Real;
    FVlrtotal: Real;
    FOrcamento: Integer;
    FCodigo: Integer;
    FMargemperc: Real;
    FVlrdesc: Real;
    FVlrbruto: Real;
    FVlrcusto: Real;
    FQuantidade: Real;
    FVlrliq: Real;
    FCodproduto: Integer;
    procedure SetCodigo(const Value: Integer);
    procedure SetCodproduto(const Value: Integer);
    procedure SetMargemperc(const Value: Real);
    procedure SetOrcamento(const Value: Integer);
    procedure SetPercdesc(const Value: Real);
    procedure SetQuantidade(const Value: Real);
    procedure SetVlrbruto(const Value: Real);
    procedure SetVlrcusto(const Value: Real);
    procedure SetVlrdesc(const Value: Real);
    procedure SetVlrliq(const Value: Real);
    procedure SetVlrtotal(const Value: Real);

  public

    property Codigo: Integer read FCodigo write SetCodigo;
    property Orcamento: Integer read FOrcamento write SetOrcamento;
    property Quantidade: Real read FQuantidade write SetQuantidade;
    property Codproduto: Integer read FCodproduto write SetCodproduto;
    property Vlrcusto: Real read FVlrcusto write SetVlrcusto;
    property Vlrbruto: Real read FVlrbruto write SetVlrbruto;
    property Vlrdesc: Real read FVlrdesc write SetVlrdesc;
    property Percdesc: Real read FPercdesc write SetPercdesc;
    property Vlrliq: Real read FVlrliq write SetVlrliq;
    property Vlrtotal: Real read FVlrtotal write SetVlrtotal;
    property Margemperc: Real read FMargemperc write SetMargemperc;

end;

implementation

{ TOrcitens }

procedure TOrcitens.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TOrcitens.SetCodproduto(const Value: Integer);
begin
  FCodproduto := Value;
end;

procedure TOrcitens.SetMargemperc(const Value: Real);
begin
  FMargemperc := Value;
end;

procedure TOrcitens.SetOrcamento(const Value: Integer);
begin
  FOrcamento := Value;
end;

procedure TOrcitens.SetPercdesc(const Value: Real);
begin
  FPercdesc := Value;
end;

procedure TOrcitens.SetQuantidade(const Value: Real);
begin
  FQuantidade := Value;
end;

procedure TOrcitens.SetVlrbruto(const Value: Real);
begin
  FVlrbruto := Value;
end;

procedure TOrcitens.SetVlrcusto(const Value: Real);
begin
  FVlrcusto := Value;
end;

procedure TOrcitens.SetVlrdesc(const Value: Real);
begin
  FVlrdesc := Value;
end;

procedure TOrcitens.SetVlrliq(const Value: Real);
begin
  FVlrliq := Value;
end;

procedure TOrcitens.SetVlrtotal(const Value: Real);
begin
  FVlrtotal := Value;
end;

end.
