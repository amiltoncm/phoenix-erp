unit uClassPessoas;

interface

Type TPessoas = class
  private
    FFone: String;
    FLogradouro: String;
    FCodUf: Integer;
    FFantasia: String;
    FBairro: String;
    FAtivo: String;
    FUf: String;
    FCodTipoLog: Integer;
    FCodigo: Integer;
    FCep: String;
    FDocumento: String;
    FNumero: Integer;
    FPontoRef: String;
    FTipoLog: String;
    FIdentificacao: String;
    FCodCidade: Integer;
    FCodTipo: Integer;
    FComplemento: String;
    FNome: String;
    FCidade: String;
    FTipo: String;
    procedure SeCodtUf(const Value: Integer);
    procedure SetAitvo(const Value: String);
    procedure SetBairro(const Value: String);
    procedure SetCep(const Value: String);
    procedure SetCidade(const Value: String);
    procedure SetCodCidade(const Value: Integer);
    procedure SetCodigo(const Value: Integer);
    procedure SetCodTipo(const Value: Integer);
    procedure SetCodTipoLog(const Value: Integer);
    procedure SetComplemento(const Value: String);
    procedure SetDocumento(const Value: String);
    procedure SetFantasia(const Value: String);
    procedure SetFone(const Value: String);
    procedure SetIdentificacao(const Value: String);
    procedure SetLogradouro(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetNumero(const Value: Integer);
    procedure SetPontoRef(const Value: String);
    procedure SetTipo(const Value: String);
    procedure SetTipoLog(const Value: String);
    procedure SetUf(const Value: String);

  public

    property Codigo: Integer read FCodigo write SetCodigo;
    property CodTipo: Integer read FCodTipo write SetCodTipo;
    property Tipo: String read FTipo write SetTipo;
    property Nome: String read FNome write SetNome;
    property Ativo: String read FAtivo write SetAitvo;
    property Fantasia: String read FFantasia write SetFantasia;
    property Documento: String read FDocumento write SetDocumento;
    property Identificacao: String read FIdentificacao write SetIdentificacao;
    property CodTipoLog: Integer read FCodTipoLog write SetCodTipoLog;
    property TipoLog: String read FTipoLog write SetTipoLog;
    property Logradouro: String read FLogradouro write SetLogradouro;
    property Numero: Integer read FNumero write SetNumero;
    property Complemento: String read FComplemento write SetComplemento;
    property Bairro: String read FBairro write SetBairro;
    property CodCidade: Integer read FCodCidade write SetCodCidade;
    property Cidade: String read FCidade write SetCidade;
    property CodUf: Integer read FCodUf write SeCodtUf;
    property Uf: String read FUf write SetUf;
    property PontoRef: String read FPontoRef write SetPontoRef;
    property Fone: String read FFone write SetFone;
    property Cep: String read FCep write SetCep;

end;

implementation

{ TPessoas }

procedure TPessoas.SeCodtUf(const Value: Integer);
begin
  FCodUf := Value;
end;

procedure TPessoas.SetAitvo(const Value: String);
begin
  FAtivo := Value;
end;

procedure TPessoas.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TPessoas.SetCep(const Value: String);
begin
  FCep := Value;
end;

procedure TPessoas.SetCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TPessoas.SetCodCidade(const Value: Integer);
begin
  FCodCidade := Value;
end;

procedure TPessoas.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TPessoas.SetCodTipo(const Value: Integer);
begin
  FCodTipo := Value;
end;

procedure TPessoas.SetCodTipoLog(const Value: Integer);
begin
  FCodTipoLog := Value;
end;

procedure TPessoas.SetComplemento(const Value: String);
begin
  FComplemento := Value;
end;

procedure TPessoas.SetDocumento(const Value: String);
begin
  FDocumento := Value;
end;

procedure TPessoas.SetFantasia(const Value: String);
begin
  FFantasia := Value;
end;

procedure TPessoas.SetFone(const Value: String);
begin
  FFone := Value;
end;

procedure TPessoas.SetIdentificacao(const Value: String);
begin
  FIdentificacao := Value;
end;

procedure TPessoas.SetLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

procedure TPessoas.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TPessoas.SetNumero(const Value: Integer);
begin
  FNumero := Value;
end;

procedure TPessoas.SetPontoRef(const Value: String);
begin
  FPontoRef := Value;
end;

procedure TPessoas.SetTipo(const Value: String);
begin
  FTipo := Value;
end;

procedure TPessoas.SetTipoLog(const Value: String);
begin
  FTipoLog := Value;
end;

procedure TPessoas.SetUf(const Value: String);
begin
  FUf := Value;
end;

end.
