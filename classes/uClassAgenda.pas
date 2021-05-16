unit uClassAgenda;

interface

Type TAgenda = class

  private
    FHoralanc: TTime;
    FObs: String;
    FCodQuadra: Integer;
    FCodigo: Integer;
    FCodusuario: Integer;
    FDataag: TDate;
    FDatalanc: TDate;
    FCodpes: Integer;
    FHoraag: TTime;
    FAtendimento: Integer;
    procedure SetAtendimento(const Value: Integer);
    procedure SetCodigo(const Value: Integer);
    procedure SetCodpes(const Value: Integer);
    procedure SetCodQuadra(const Value: Integer);
    procedure SetCodusuario(const Value: Integer);
    procedure SetDataag(const Value: TDate);
    procedure SetDatalanc(const Value: TDate);
    procedure SetHoraag(const Value: TTime);
    procedure SetHoralanc(const Value: TTime);
    procedure SetObs(const Value: String);

  public

    property Codigo: Integer read FCodigo write SetCodigo;
    property Codpes: Integer read FCodpes write SetCodpes;
    property CodQuadra: Integer read FCodQuadra write SetCodQuadra;
    property Dataag: TDate read FDataag write SetDataag;
    property Horaag: TTime read FHoraag write SetHoraag;
    property Datalanc: TDate read FDatalanc write SetDatalanc;
    property Horalanc: TTime read FHoralanc write SetHoralanc;
    property Obs: String read FObs write SetObs;
    property Atendimento: Integer read FAtendimento write SetAtendimento;
    property Codusuario: Integer read FCodusuario write SetCodusuario;

end;

implementation

{ TAgenda }

procedure TAgenda.SetAtendimento(const Value: Integer);
begin
  FAtendimento := Value;
end;

procedure TAgenda.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TAgenda.SetCodpes(const Value: Integer);
begin
  FCodpes := Value;
end;

procedure TAgenda.SetCodQuadra(const Value: Integer);
begin
  FCodQuadra := Value;
end;

procedure TAgenda.SetCodusuario(const Value: Integer);
begin
  FCodusuario := Value;
end;

procedure TAgenda.SetDataag(const Value: TDate);
begin
  FDataag := Value;
end;

procedure TAgenda.SetDatalanc(const Value: TDate);
begin
  FDatalanc := Value;
end;

procedure TAgenda.SetHoraag(const Value: TTime);
begin
  FHoraag := Value;
end;

procedure TAgenda.SetHoralanc(const Value: TTime);
begin
  FHoralanc := Value;
end;

procedure TAgenda.SetObs(const Value: String);
begin
  FObs := Value;
end;

end.
