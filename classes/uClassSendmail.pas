unit uClassSendmail;

interface

Type TSendmail = class

  private
    FName: String;
    FMessage: String;
    FMsg: Boolean;
    FAttachment: String;
    FDoor: Integer;
    FAdress: String;
    FSubject: String;
    FSendto: String;
    FPassword: String;
    FSslmethod: Integer;
    FSslmode: Integer;
    FHost: String;
    FAuthtype: Integer;
    FUsername: String;
    FUsetls: Integer;
    FTipoAnexo: String;
    procedure SetAdress(const Value: String);
    procedure SetAttachment(const Value: String);
    procedure SetAuthtype(const Value: Integer);
    procedure SetDoor(const Value: Integer);
    procedure SetHost(const Value: String);
    procedure SetMessage(const Value: String);
    procedure SetMsg(const Value: Boolean);
    procedure SetName(const Value: String);
    procedure SetPassword(const Value: String);
    procedure SetSendto(const Value: String);
    procedure SetSslmethod(const Value: Integer);
    procedure SetSslmode(const Value: Integer);
    procedure SetSubject(const Value: String);
    procedure SetUsername(const Value: String);
    procedure SetUsetls(const Value: Integer);
    procedure SetTipoAnexo(const Value: String);

  public

    property Host: String read FHost write SetHost;
    property Username: String read FUsername write SetUsername;
    property Password: String read FPassword write SetPassword;
    property Name: String read FName write SetName;
    property Adress: String read FAdress write SetAdress;
    property Door: Integer read FDoor write SetDoor;
    property Authtype: Integer read FAuthtype write SetAuthtype;
    property Sslmethod: Integer read FSslmethod write SetSslmethod;
    property Sslmode: Integer read FSslmode write SetSslmode;
    property Usetls: Integer read FUsetls write SetUsetls;
    property Sendto: String read FSendto write SetSendto;
    property Subject: String read FSubject write SetSubject;
    property Message: String read FMessage write SetMessage;
    property Attachment: String read FAttachment write SetAttachment;
    property TipoAnexo: String read FTipoAnexo write SetTipoAnexo;
    property Msg: Boolean read FMsg write SetMsg;

end;

implementation

{ TSendmail }

procedure TSendmail.SetAdress(const Value: String);
begin
  FAdress := Value;
end;

procedure TSendmail.SetAttachment(const Value: String);
begin
  FAttachment := Value;
end;

procedure TSendmail.SetAuthtype(const Value: Integer);
begin
  FAuthtype := Value;
end;

procedure TSendmail.SetDoor(const Value: Integer);
begin
  FDoor := Value;
end;

procedure TSendmail.SetHost(const Value: String);
begin
  FHost := Value;
end;

procedure TSendmail.SetMessage(const Value: String);
begin
  FMessage := Value;
end;

procedure TSendmail.SetMsg(const Value: Boolean);
begin
  FMsg := Value;
end;

procedure TSendmail.SetName(const Value: String);
begin
  FName := Value;
end;

procedure TSendmail.SetPassword(const Value: String);
begin
  FPassword := Value;
end;

procedure TSendmail.SetSendto(const Value: String);
begin
  FSendto := Value;
end;

procedure TSendmail.SetSslmethod(const Value: Integer);
begin
  FSslmethod := Value;
end;

procedure TSendmail.SetSslmode(const Value: Integer);
begin
  FSslmode := Value;
end;

procedure TSendmail.SetSubject(const Value: String);
begin
  FSubject := Value;
end;

procedure TSendmail.SetTipoAnexo(const Value: String);
begin
  FTipoAnexo := Value;
end;

procedure TSendmail.SetUsername(const Value: String);
begin
  FUsername := Value;
end;

procedure TSendmail.SetUsetls(const Value: Integer);
begin
  FUsetls := Value;
end;

end.
