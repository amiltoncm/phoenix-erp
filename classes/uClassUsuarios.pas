unit uClassUsuarios;

interface

Type TUsuarios = class

  private
    FAtivo: String;
    FCodigo: Integer;
    FSenha: String;
    FNome: String;
    FAcesso: Integer;
    procedure SetAtivo(const Value: String);
    procedure SetCodigo(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetSenha(const Value: String);
    procedure SetAcesso(const Value: Integer);

  public

    property Codigo: Integer read FCodigo write SetCodigo;
    property Ativo: String read FAtivo write SetAtivo;
    property Senha: String read FSenha write SetSenha;
    property Nome: String read FNome write SetNome;
    property Acesso: Integer read FAcesso write SetAcesso;

end;

implementation

{ TUsuarios }

procedure TUsuarios.SetAcesso(const Value: Integer);
begin
  FAcesso := Value;
end;

procedure TUsuarios.SetAtivo(const Value: String);
begin
  FAtivo := Value;
end;

procedure TUsuarios.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TUsuarios.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TUsuarios.SetSenha(const Value: String);
begin
  FSenha := Value;
end;

end.
