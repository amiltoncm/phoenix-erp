unit uClassEmailsdest;

interface

Type TEmailsdest = class

  private
    FCodigo: Integer;
    FEndereco: String;
    procedure SetCodigo(const Value: Integer);
    procedure SetEndereco(const Value: String);

  public

    property Endereco: String read FEndereco write SetEndereco;
    property Codigo: Integer read FCodigo write SetCodigo;

end;

implementation

{ TEmailsdest }

procedure TEmailsdest.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TEmailsdest.SetEndereco(const Value: String);
begin
  FEndereco := Value;
end;

end.
