unit uClassSistema;

interface

Type TSistema = class

  private
    FCodigo: Integer;
    FValidate: TDate;
    FSerial: String;
    FId: String;
    FMaquina: String;
    procedure SetCodigo(const Value: Integer);
    procedure SetId(const Value: String);
    procedure SetSerial(const Value: String);
    procedure SetValidate(const Value: TDate);
    procedure SetMaquina(const Value: String);

  public

    property Codigo: Integer read FCodigo write SetCodigo;
    property Id: String read FId write SetId;
    property Serial: String read FSerial write SetSerial;
    property Validate: TDate read FValidate write SetValidate;
    property Maquina: String read FMaquina write SetMaquina;

end;

implementation

{ TClasssistema }

procedure TSistema.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TSistema.SetId(const Value: String);
begin
  FId := Value;
end;

procedure TSistema.SetMaquina(const Value: String);
begin
  FMaquina := Value;
end;

procedure TSistema.SetSerial(const Value: String);
begin
  FSerial := Value;
end;

procedure TSistema.SetValidate(const Value: TDate);
begin
  FValidate := Value;
end;

end.
