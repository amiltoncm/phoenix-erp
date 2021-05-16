unit uClassPessoasend;

interface

Type TPessoasend = class

  private
    FLogradouro: String;
    FBairro: String;
    FUf: String;
    FCep: String;
    FCodcidade: Integer;
    FCidade: String;
    FNumero: Integer;
    procedure SetBairro(const Value: String);
    procedure SetCep(const Value: String);
    procedure SetCidade(const Value: String);
    procedure SetCodcidade(const Value: Integer);
    procedure SetLogradouro(const Value: String);
    procedure SetUf(const Value: String);
    procedure SetNumero(const Value: Integer);

  public

    property Logradouro: String read FLogradouro write SetLogradouro;
    property Bairro: String read FBairro write SetBairro;
    property Codcidade: Integer read FCodcidade write SetCodcidade;
    property Cidade: String read FCidade write SetCidade;
    property Uf: String read FUf write SetUf;
    property Cep: String read FCep write SetCep;
    property Numero: Integer read FNumero write SetNumero;

end;

implementation

{ TPessoasend }

procedure TPessoasend.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TPessoasend.SetCep(const Value: String);
begin
  FCep := Value;
end;

procedure TPessoasend.SetCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TPessoasend.SetCodcidade(const Value: Integer);
begin
  FCodcidade := Value;
end;

procedure TPessoasend.SetLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

procedure TPessoasend.SetNumero(const Value: Integer);
begin
  FNumero := Value;
end;

procedure TPessoasend.SetUf(const Value: String);
begin
  FUf := Value;
end;

end.
