unit uClassPrevitens;

interface

Type TPrevitens = class

  private
    FProduto: String;
    FPercdesc: Real;
    FVlrtotal: Real;
    FCodigo: Integer;
    FPermg: Real;
    FNumero: Integer;
    FVlrdesc: Real;
    FVlrbruto: Real;
    FVlrcusto: Real;
    FQuantidade: Real;
    FVlrliq: Real;
    FCodproduto: Integer;
    FUnidade: String;
    FLocalizacao: String;
    procedure SetCodigo(const Value: Integer);
    procedure SetCodproduto(const Value: Integer);
    procedure SetNumero(const Value: Integer);
    procedure SetPercdesc(const Value: Real);
    procedure SetPermg(const Value: Real);
    procedure SetProduto(const Value: String);
    procedure SetQuantidade(const Value: Real);
    procedure SetVlrbruto(const Value: Real);
    procedure SetVlrcusto(const Value: Real);
    procedure SetVlrdesc(const Value: Real);
    procedure SetVlrliq(const Value: Real);
    procedure SetVlrtotal(const Value: Real);
    procedure SetUnidade(const Value: String);
    procedure SetLocalizacao(const Value: String);

  public

    property Codigo: Integer read FCodigo write SetCodigo;
    property Numero: Integer read FNumero write SetNumero;
    property Quantidade: Real read FQuantidade write SetQuantidade;
    property Codproduto: Integer read FCodproduto write SetCodproduto;
    property Produto: String read FProduto write SetProduto;
    property Unidade: String read FUnidade write SetUnidade;
    property Vlrcusto: Real read FVlrcusto write SetVlrcusto;
    property Vlrbruto: Real read FVlrbruto write SetVlrbruto;
    property Vlrdesc: Real read FVlrdesc write SetVlrdesc;
    property Percdesc: Real read FPercdesc write SetPercdesc;
    property Vlrliq: Real read FVlrliq write SetVlrliq;
    property Vlrtotal: Real read FVlrtotal write SetVlrtotal;
    property Permg: Real read FPermg write SetPermg;
    property Localizacao: String read FLocalizacao write SetLocalizacao;

end;

implementation

{ TPrevitens }

procedure TPrevitens.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TPrevitens.SetCodproduto(const Value: Integer);
begin
  FCodproduto := Value;
end;

procedure TPrevitens.SetLocalizacao(const Value: String);
begin
  FLocalizacao := Value;
end;

procedure TPrevitens.SetNumero(const Value: Integer);
begin
  FNumero := Value;
end;

procedure TPrevitens.SetPercdesc(const Value: Real);
begin
  FPercdesc := Value;
end;

procedure TPrevitens.SetPermg(const Value: Real);
begin
  FPermg := Value;
end;

procedure TPrevitens.SetProduto(const Value: String);
begin
  FProduto := Value;
end;

procedure TPrevitens.SetQuantidade(const Value: Real);
begin
  FQuantidade := Value;
end;

procedure TPrevitens.SetUnidade(const Value: String);
begin
  FUnidade := Value;
end;

procedure TPrevitens.SetVlrbruto(const Value: Real);
begin
  FVlrbruto := Value;
end;

procedure TPrevitens.SetVlrcusto(const Value: Real);
begin
  FVlrcusto := Value;
end;

procedure TPrevitens.SetVlrdesc(const Value: Real);
begin
  FVlrdesc := Value;
end;

procedure TPrevitens.SetVlrliq(const Value: Real);
begin
  FVlrliq := Value;
end;

procedure TPrevitens.SetVlrtotal(const Value: Real);
begin
  FVlrtotal := Value;
end;

end.
