unit uClassUsumails;

interface

Type TUsumails = class

  private
    FCodigo: Integer;
    FNamefrom: String;
    FPassword: String;
    FSslmethod: Integer;
    FAdressfrom: String;
    FSslmode: Integer;
    FHost: String;
    FPorta: Integer;
    FAuthtype: Integer;
    FUsername: String;
    FUsetls: Integer;
    procedure SetAdressfrom(const Value: String);
    procedure SetAuthtype(const Value: Integer);
    procedure SetCodigo(const Value: Integer);
    procedure SetHost(const Value: String);
    procedure SetNamefrom(const Value: String);
    procedure SetPassword(const Value: String);
    procedure SetPorta(const Value: Integer);
    procedure SetSslmethod(const Value: Integer);
    procedure SetSslmode(const Value: Integer);
    procedure SetUsername(const Value: String);
    procedure SetUsetls(const Value: Integer);

  public

    property Codigo: Integer read FCodigo write SetCodigo;
    property Host: String read FHost write SetHost;
    property Username: String read FUsername write SetUsername;
    property Password: String read FPassword write SetPassword;
    property Namefrom: String read FNamefrom write SetNamefrom;
    property Adressfrom: String read FAdressfrom write SetAdressfrom;
    property Porta: Integer read FPorta write SetPorta;
    property Authtype: Integer read FAuthtype write SetAuthtype;
    property Sslmethod: Integer read FSslmethod write SetSslmethod;
    property Sslmode: Integer read FSslmode write SetSslmode;
    property Usetls: Integer read FUsetls write SetUsetls;

end;

implementation

{ TUsumails }

procedure TUsumails.SetAdressfrom(const Value: String);
begin
  FAdressfrom := Value;
end;

procedure TUsumails.SetAuthtype(const Value: Integer);
begin
  FAuthtype := Value;
end;

procedure TUsumails.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TUsumails.SetHost(const Value: String);
begin
  FHost := Value;
end;

procedure TUsumails.SetNamefrom(const Value: String);
begin
  FNamefrom := Value;
end;

procedure TUsumails.SetPassword(const Value: String);
begin
  FPassword := Value;
end;

procedure TUsumails.SetPorta(const Value: Integer);
begin
  FPorta := Value;
end;

procedure TUsumails.SetSslmethod(const Value: Integer);
begin
  FSslmethod := Value;
end;

procedure TUsumails.SetSslmode(const Value: Integer);
begin
  FSslmode := Value;
end;

procedure TUsumails.SetUsername(const Value: String);
begin
  FUsername := Value;
end;

procedure TUsumails.SetUsetls(const Value: Integer);
begin
  FUsetls := Value;
end;

end.
