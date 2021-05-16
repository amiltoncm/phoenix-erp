unit uClassProdutoscomp;

interface

Type TProdutoscomp = class

  private
    FCodcomp: Integer;
    FCodigo: Integer;
    procedure SetCodcomp(const Value: Integer);
    procedure SetCodigo(const Value: Integer);

  public

    property Codigo: Integer read FCodigo write SetCodigo;
    property Codcomp: Integer read FCodcomp write SetCodcomp;

end;

implementation

{ TProdutoscomp }

procedure TProdutoscomp.SetCodcomp(const Value: Integer);
begin
  FCodcomp := Value;
end;

procedure TProdutoscomp.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

end.
