unit uClassComandasatend;

interface

Type TComandasatend = class

  private
    FCodigo: integer;
    FCodmesa: Integer;
    FCodcomanda: Integer;
    FCodprevenda: Integer;
    procedure SetCodcomanda(const Value: Integer);
    procedure SetCodigo(const Value: integer);
    procedure SetCodmesa(const Value: Integer);
    procedure SetCodprevenda(const Value: Integer);

  public

    property Codigo: integer read FCodigo write SetCodigo;
    property Codcomanda: Integer read FCodcomanda write SetCodcomanda;
    property Codmesa: Integer read FCodmesa write SetCodmesa;
    property Codprevenda: Integer read FCodprevenda write SetCodprevenda;

end;

implementation

{ TComandasatend }

procedure TComandasatend.SetCodcomanda(const Value: Integer);
begin
  FCodcomanda := Value;
end;

procedure TComandasatend.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TComandasatend.SetCodmesa(const Value: Integer);
begin
  FCodmesa := Value;
end;

procedure TComandasatend.SetCodprevenda(const Value: Integer);
begin
  FCodprevenda := Value;
end;

end.
