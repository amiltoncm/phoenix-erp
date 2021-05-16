unit uClassPrevendent;

interface

Type TPrevendent = class

  private
    FCodigo: Integer;
    FNumero: Integer;
    procedure SetCodigo(const Value: Integer);
    procedure SetNumero(const Value: Integer);

  public

    property Codigo: Integer read FCodigo write SetCodigo;
    property Numero: Integer read FNumero write SetNumero;

end;

implementation

{ TPrevendent }

procedure TPrevendent.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TPrevendent.SetNumero(const Value: Integer);
begin
  FNumero := Value;
end;

end.
