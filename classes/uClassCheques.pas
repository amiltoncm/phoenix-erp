unit uClassCheques;

interface

Type TCheques = class

  private
    FTitular: String;
    FBanco: Integer;
    FValor: Real;
    FCodcaixa: Integer;
    FCodstatus: Integer;
    FVencimento: TDate;
    FDocumento: String;
    FEndosso: String;
    FConta: Integer;
    FDatalanc: TDate;
    FDestino: String;
    FAgencia: Integer;
    FLancamento: Integer;
    FCheque: Integer;
    FTelefone: String;
    FCodpessoa: Integer;
    procedure SetAgencia(const Value: Integer);
    procedure SetBanco(const Value: Integer);
    procedure SetCheque(const Value: Integer);
    procedure SetCodcaixa(const Value: Integer);
    procedure SetCodpessoa(const Value: Integer);
    procedure SetCodstatus(const Value: Integer);
    procedure SetConta(const Value: Integer);
    procedure SetDatalanc(const Value: TDate);
    procedure SetDestino(const Value: String);
    procedure SetDocumento(const Value: String);
    procedure SetEndosso(const Value: String);
    procedure SetLancamento(const Value: Integer);
    procedure SetTelefone(const Value: String);
    procedure SetTitular(const Value: String);
    procedure SetValor(const Value: Real);
    procedure SetVencimento(const Value: TDate);

  public

    property Lancamento: Integer read FLancamento write SetLancamento;
    property Banco: Integer read FBanco write SetBanco;
    property Agencia: Integer read FAgencia write SetAgencia;
    property Conta: Integer read FConta write SetConta;
    property Cheque: Integer read FCheque write SetCheque;
    property Valor: Real read FValor write SetValor;
    property Documento: String read FDocumento write SetDocumento;
    property Titular: String read FTitular write SetTitular;
    property Datalanc: TDate read FDatalanc write SetDatalanc;
    property Vencimento: TDate read FVencimento write SetVencimento;
    property Codpessoa: Integer read FCodpessoa write SetCodpessoa;
    property Endosso: String read FEndosso write SetEndosso;
    property Telefone: String read FTelefone write SetTelefone;
    property Destino: String read FDestino write SetDestino;
    property Codcaixa: Integer read FCodcaixa write SetCodcaixa;
    property Codstatus: Integer read FCodstatus write SetCodstatus;

end;

implementation

{ TCheques }

procedure TCheques.SetAgencia(const Value: Integer);
begin
  FAgencia := Value;
end;

procedure TCheques.SetBanco(const Value: Integer);
begin
  FBanco := Value;
end;

procedure TCheques.SetCheque(const Value: Integer);
begin
  FCheque := Value;
end;

procedure TCheques.SetCodcaixa(const Value: Integer);
begin
  FCodcaixa := Value;
end;

procedure TCheques.SetCodpessoa(const Value: Integer);
begin
  FCodpessoa := Value;
end;

procedure TCheques.SetCodstatus(const Value: Integer);
begin
  FCodstatus := Value;
end;

procedure TCheques.SetConta(const Value: Integer);
begin
  FConta := Value;
end;

procedure TCheques.SetDatalanc(const Value: TDate);
begin
  FDatalanc := Value;
end;

procedure TCheques.SetDestino(const Value: String);
begin
  FDestino := Value;
end;

procedure TCheques.SetDocumento(const Value: String);
begin
  FDocumento := Value;
end;

procedure TCheques.SetEndosso(const Value: String);
begin
  FEndosso := Value;
end;

procedure TCheques.SetLancamento(const Value: Integer);
begin
  FLancamento := Value;
end;

procedure TCheques.SetTelefone(const Value: String);
begin
  FTelefone := Value;
end;

procedure TCheques.SetTitular(const Value: String);
begin
  FTitular := Value;
end;

procedure TCheques.SetValor(const Value: Real);
begin
  FValor := Value;
end;

procedure TCheques.SetVencimento(const Value: TDate);
begin
  FVencimento := Value;
end;

end.
