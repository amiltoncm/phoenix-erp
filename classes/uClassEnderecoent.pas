unit uClassEnderecoent;

interface

Type TEnderecoent = class

  private
    FLogradouro: String;
    FBairro: String;
    FUf: String;
    FCodigo: Integer;
    FNumero: Integer;
    FCidade: String;
    procedure SetBairro(const Value: String);
    procedure SetCidade(const Value: String);
    procedure SetCodigo(const Value: Integer);
    procedure SetLogradouro(const Value: String);
    procedure SetNumero(const Value: Integer);
    procedure SetUf(const Value: String);

  public

    property Codigo: Integer read FCodigo write SetCodigo;
    property Logradouro: String read FLogradouro write SetLogradouro;
    property Numero: Integer read FNumero write SetNumero;
    property Bairro: String read FBairro write SetBairro;
    property Cidade: String read FCidade write SetCidade;
    property Uf: String read FUf write SetUf;

end;

implementation

{ TEnderecoent }

procedure TEnderecoent.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TEnderecoent.SetCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TEnderecoent.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TEnderecoent.SetLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

procedure TEnderecoent.SetNumero(const Value: Integer);
begin
  FNumero := Value;
end;

procedure TEnderecoent.SetUf(const Value: String);
begin
  FUf := Value;
end;

end.
