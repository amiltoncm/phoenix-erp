unit uClassProdutossim;

interface

Type TProdutossim = class

  private
    FCodigo: Integer;
    FCodsim: Integer;
    procedure SetCodigo(const Value: Integer);
    procedure SetCodsim(const Value: Integer);

  public

    property Codigo: Integer read FCodigo write SetCodigo;
    property Codsim: Integer read FCodsim write SetCodsim;

end;

implementation

{ TProdutossim }

procedure TProdutossim.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TProdutossim.SetCodsim(const Value: Integer);
begin
  FCodsim := Value;
end;

end.
