unit uClassBancos;

interface

Type TBancos = class

  private
    FDescricao: String;
    FCodigo: Integer;
    procedure SetCodigo(const Value: Integer);
    procedure SetDescricao(const Value: String);

  public

    property Codigo: Integer read FCodigo write SetCodigo;
    property Descricao: String read FDescricao write SetDescricao;

end;

implementation

{ TBancos }

procedure TBancos.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TBancos.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

end.
