unit uClassCaixa;

interface

Type TCaixa = class

  private
    FNumdoc: Integer;
    FValor: Real;
    FCodPag: Integer;
    FCodPlano: Integer;
    FDescricao: String;
    FCodigo: Integer;
    FCodConta: Integer;
    FCodUsuario: Integer;
    FData: TDateTime;
    FCodRec: Integer;
    FCodMdc: String;
    FID: Integer;
    FDataEfet: TDateTime;
    procedure SetCodConta(const Value: Integer);
    procedure SetCodigo(const Value: Integer);
    procedure SetCodPag(const Value: Integer);
    procedure SetCodPlano(const Value: Integer);
    procedure SetCodUsuario(const Value: Integer);
    procedure SetData(const Value: TDateTime);
    procedure SetDescricao(const Value: String);
    procedure SetNumdoc(const Value: Integer);
    procedure SetValor(const Value: Real);
    procedure SetCodMdc(const Value: String);
    procedure SetCodRec(const Value: Integer);
    procedure SetID(const Value: Integer);
    procedure SetDataEfet(const Value: TDateTime);

  public

    property Codigo: Integer read FCodigo write SetCodigo;
    property ID: Integer read FID write SetID;
    property CodConta: Integer read FCodConta write SetCodConta;
    property Descricao: String read FDescricao write SetDescricao;
    property Numdoc: Integer read FNumdoc write SetNumdoc;
    property Valor: Real read FValor write SetValor;
    property CodPlano: Integer read FCodPlano write SetCodPlano;
    property CodUsuario: Integer read FCodUsuario write SetCodUsuario;
    property Data: TDateTime read FData write SetData;
    property DataEfet: TDateTime read FDataEfet write SetDataEfet;
    property CodPag: Integer read FCodPag write SetCodPag;
    property CodRec: Integer read FCodRec write SetCodRec;
    property CodMdc: String read FCodMdc write SetCodMdc;

end;

implementation

{ TCaixa }

procedure TCaixa.SetCodConta(const Value: Integer);
begin
  FCodConta := Value;
end;

procedure TCaixa.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TCaixa.SetCodMdc(const Value: String);
begin
  FCodMdc := Value;
end;

procedure TCaixa.SetCodPag(const Value: Integer);
begin
  FCodPag := Value;
end;

procedure TCaixa.SetCodPlano(const Value: Integer);
begin
  FCodPlano := Value;
end;

procedure TCaixa.SetCodRec(const Value: Integer);
begin
  FCodRec := Value;
end;

procedure TCaixa.SetCodUsuario(const Value: Integer);
begin
  FCodUsuario := Value;
end;

procedure TCaixa.SetData(const Value: TDateTime);
begin
  FData := Value;
end;

procedure TCaixa.SetDataEfet(const Value: TDateTime);
begin
  FDataEfet := Value;
end;

procedure TCaixa.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TCaixa.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TCaixa.SetNumdoc(const Value: Integer);
begin
  FNumdoc := Value;
end;

procedure TCaixa.SetValor(const Value: Real);
begin
  FValor := Value;
end;

end.
