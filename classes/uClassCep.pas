unit uClassCep;

interface

Type TCep = class

  private
    FLogradouro: String;
    FCoduf: String;
    FBairro: String;
    FUf: String;
    FCep: String;
    FCodcidade: String;
    FCidade: String;
    procedure SetBairro(const Value: String);
    procedure SetCep(const Value: String);
    procedure SetCidade(const Value: String);
    procedure SetCodcidade(const Value: String);
    procedure SetCoduf(const Value: String);
    procedure SetLogradouro(const Value: String);
    procedure SetUf(const Value: String);

  public

    property Cep: String read FCep write SetCep;
    property Logradouro: String read FLogradouro write SetLogradouro;
    property Bairro: String read FBairro write SetBairro;
    property Cidade: String read FCidade write SetCidade;
    property Codcidade: String read FCodcidade write SetCodcidade;
    property Uf: String read FUf write SetUf;
    property Coduf: String read FCoduf write SetCoduf;

end;

implementation

{ TCep }

procedure TCep.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TCep.SetCep(const Value: String);
begin
  FCep := Value;
end;

procedure TCep.SetCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TCep.SetCodcidade(const Value: String);
begin
  FCodcidade := Value;
end;

procedure TCep.SetCoduf(const Value: String);
begin
  FCoduf := Value;
end;

procedure TCep.SetLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

procedure TCep.SetUf(const Value: String);
begin
  FUf := Value;
end;

end.
