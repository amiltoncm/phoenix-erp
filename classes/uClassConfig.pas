unit uClassConfig;

interface

Type TConfig = class

  private
    FVersao: String;
    FCodigo: Integer;
    FCodcidade: Integer;
    procedure SetCodcidade(const Value: Integer);
    procedure SetCodigo(const Value: Integer);
    procedure SetVersao(const Value: String);

  public

    property Codigo: Integer read FCodigo write SetCodigo;
    property Versao: String read FVersao write SetVersao;
    property Codcidade: Integer read FCodcidade write SetCodcidade;

end;

implementation

{ TConfig }

procedure TConfig.SetCodcidade(const Value: Integer);
begin
  FCodcidade := Value;
end;

procedure TConfig.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TConfig.SetVersao(const Value: String);
begin
  FVersao := Value;
end;

end.
