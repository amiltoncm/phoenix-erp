unit uClassPrevendas;

interface

Type TPrevendas = class

  private
    FFone: String;
    FLogradouro: String;
    FPercdesc: Real;
    FObs: String;
    FVlrtotal: Real;
    FFuncionario: String;
    FCodcliente: Integer;
    FBairro: String;
    FCodprazo: Integer;
    FEntrega: String;
    FUf: String;
    FNumorc: Integer;
    FSubtotal: Real;
    FCodstatus: Integer;
    FCliente: String;
    FPrazo: String;
    FCodforma: Integer;
    FPermg: Real;
    FNumero: Integer;
    FReferente: String;
    FTabvenda: Integer;
    FModfrete: Integer;
    FVlrdesc: Real;
    FCodcidade: Integer;
    FForma: String;
    FVlrcusto: Real;
    FCidade: String;
    FVlrlucro: Real;
    FCodfuncionario: Integer;
    FData: TDate;
    FFrete: String;
    FCodEntrega: Integer;
    FPet: String;
    FCodpet: Integer;
    FCep: String;
    procedure SetBairro(const Value: String);
    procedure SetCidade(const Value: String);
    procedure SetCliente(const Value: String);
    procedure SetCodcidade(const Value: Integer);
    procedure SetCodcliente(const Value: Integer);
    procedure SetCodforma(const Value: Integer);
    procedure SetCodfuncionario(const Value: Integer);
    procedure SetCodprazo(const Value: Integer);
    procedure SetCodstatus(const Value: Integer);
    procedure SetData(const Value: TDate);
    procedure SetEntrega(const Value: String);
    procedure SetFone(const Value: String);
    procedure SetForma(const Value: String);
    procedure SetFuncionario(const Value: String);
    procedure SetLogradouro(const Value: String);
    procedure SetModfrete(const Value: Integer);
    procedure SetNumero(const Value: Integer);
    procedure SetNumorc(const Value: Integer);
    procedure SetObs(const Value: String);
    procedure SetPercdesc(const Value: Real);
    procedure SetPermg(const Value: Real);
    procedure SetPrazo(const Value: String);
    procedure SetReferente(const Value: String);
    procedure SetSubtotal(const Value: Real);
    procedure SetTabvenda(const Value: Integer);
    procedure SetUf(const Value: String);
    procedure SetVlrcusto(const Value: Real);
    procedure SetVlrdesc(const Value: Real);
    procedure SetVlrlucro(const Value: Real);
    procedure SetVlrtotal(const Value: Real);
    procedure SetFrete(const Value: String);
    procedure SetCodEntrega(const Value: Integer);
    procedure SetCodpet(const Value: Integer);
    procedure SetPet(const Value: String);
    procedure SetCep(const Value: String);

  public

    property Numero: Integer read FNumero write SetNumero;
    property Data: TDate read FData write SetData;
    property Codcliente: Integer read FCodcliente write SetCodcliente;
    property Cliente: String read FCliente write SetCliente;
    property Logradouro: String read FLogradouro write SetLogradouro;
    property Bairro: String read FBairro write SetBairro;
    property Codcidade: Integer read FCodcidade write SetCodcidade;
    property Cidade: String read FCidade write SetCidade;
    property Uf: String read FUf write SetUf;
    property Fone: String read FFone write SetFone;
    property Codfuncionario: Integer read FCodfuncionario write SetCodfuncionario;
    property Funcionario: String read FFuncionario write SetFuncionario;
    property Tabvenda: Integer read FTabvenda write SetTabvenda;
    property Referente: String read FReferente write SetReferente;
    property Obs: String read FObs write SetObs;
    property Vlrcusto: Real read FVlrcusto write SetVlrcusto;
    property Subtotal: Real read FSubtotal write SetSubtotal;
    property Vlrdesc: Real read FVlrdesc write SetVlrdesc;
    property Percdesc: Real read FPercdesc write SetPercdesc;
    property Vlrtotal: Real read FVlrtotal write SetVlrtotal;
    property Permg: Real read FPermg write SetPermg;
    property Codprazo: Integer read FCodprazo write SetCodprazo;
    property Prazo: String read FPrazo write SetPrazo;
    property Codforma: Integer read FCodforma write SetCodforma;
    property Forma: String read FForma write SetForma;
    property Vlrlucro: Real read FVlrlucro write SetVlrlucro;
    property Modfrete: Integer read FModfrete write SetModfrete;
    property Frete: String read FFrete write SetFrete;
    property CodEntrega: Integer read FCodEntrega write SetCodEntrega;
    property Entrega: String read FEntrega write SetEntrega;
    property Codstatus: Integer read FCodstatus write SetCodstatus;
    property Numorc: Integer read FNumorc write SetNumorc;
    property Cep: String read FCep write SetCep;

end;

implementation

{ TPrevendas }

procedure TPrevendas.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TPrevendas.SetCep(const Value: String);
begin
  FCep := Value;
end;

procedure TPrevendas.SetCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TPrevendas.SetCliente(const Value: String);
begin
  FCliente := Value;
end;

procedure TPrevendas.SetCodcidade(const Value: Integer);
begin
  FCodcidade := Value;
end;

procedure TPrevendas.SetCodcliente(const Value: Integer);
begin
  FCodcliente := Value;
end;

procedure TPrevendas.SetCodEntrega(const Value: Integer);
begin
  FCodEntrega := Value;
end;

procedure TPrevendas.SetCodforma(const Value: Integer);
begin
  FCodforma := Value;
end;

procedure TPrevendas.SetCodfuncionario(const Value: Integer);
begin
  FCodfuncionario := Value;
end;

procedure TPrevendas.SetCodpet(const Value: Integer);
begin
  FCodpet := Value;
end;

procedure TPrevendas.SetCodprazo(const Value: Integer);
begin
  FCodprazo := Value;
end;

procedure TPrevendas.SetCodstatus(const Value: Integer);
begin
  FCodstatus := Value;
end;

procedure TPrevendas.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TPrevendas.SetEntrega(const Value: String);
begin
  FEntrega := Value;
end;

procedure TPrevendas.SetFone(const Value: String);
begin
  FFone := Value;
end;

procedure TPrevendas.SetForma(const Value: String);
begin
  FForma := Value;
end;

procedure TPrevendas.SetFrete(const Value: String);
begin
  FFrete := Value;
end;

procedure TPrevendas.SetFuncionario(const Value: String);
begin
  FFuncionario := Value;
end;

procedure TPrevendas.SetLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

procedure TPrevendas.SetModfrete(const Value: Integer);
begin
  FModfrete := Value;
end;

procedure TPrevendas.SetNumero(const Value: Integer);
begin
  FNumero := Value;
end;

procedure TPrevendas.SetNumorc(const Value: Integer);
begin
  FNumorc := Value;
end;

procedure TPrevendas.SetObs(const Value: String);
begin
  FObs := Value;
end;

procedure TPrevendas.SetPercdesc(const Value: Real);
begin
  FPercdesc := Value;
end;

procedure TPrevendas.SetPermg(const Value: Real);
begin
  FPermg := Value;
end;

procedure TPrevendas.SetPet(const Value: String);
begin
  FPet := Value;
end;

procedure TPrevendas.SetPrazo(const Value: String);
begin
  FPrazo := Value;
end;

procedure TPrevendas.SetReferente(const Value: String);
begin
  FReferente := Value;
end;

procedure TPrevendas.SetSubtotal(const Value: Real);
begin
  FSubtotal := Value;
end;

procedure TPrevendas.SetTabvenda(const Value: Integer);
begin
  FTabvenda := Value;
end;

procedure TPrevendas.SetUf(const Value: String);
begin
  FUf := Value;
end;

procedure TPrevendas.SetVlrcusto(const Value: Real);
begin
  FVlrcusto := Value;
end;

procedure TPrevendas.SetVlrdesc(const Value: Real);
begin
  FVlrdesc := Value;
end;

procedure TPrevendas.SetVlrlucro(const Value: Real);
begin
  FVlrlucro := Value;
end;

procedure TPrevendas.SetVlrtotal(const Value: Real);
begin
  FVlrtotal := Value;
end;

end.
