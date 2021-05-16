unit uClassProdutosest;

interface

Type TProdutosest = class

  private
    FCodigo: Integer;
    FFisico: Real;
    FDisponivel: Real;
    FReservas: Real;
    procedure SetCodigo(const Value: Integer);
    procedure SetDisponivel(const Value: Real);
    procedure SetFisico(const Value: Real);
    procedure SetReservas(const Value: Real);

  public

    property Codigo: Integer read FCodigo write SetCodigo;
    property Fisico: Real read FFisico write SetFisico;
    property Reservas: Real read FReservas write SetReservas;
    property Disponivel: Real read FDisponivel write SetDisponivel;

end;

implementation

{ TProdutosest }

procedure TProdutosest.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TProdutosest.SetDisponivel(const Value: Real);
begin
  FDisponivel := Value;
end;

procedure TProdutosest.SetFisico(const Value: Real);
begin
  FFisico := Value;
end;

procedure TProdutosest.SetReservas(const Value: Real);
begin
  FReservas := Value;
end;

end.
