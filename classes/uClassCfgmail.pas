unit uClassCfgmail;

interface

Type TCfgmail = class

  private
    FDoor: Integer;
    FNamefrom: String;
    FPassword: String;
    FSslmethod: Integer;
    FAdressfrom: String;
    FSslmode: Integer;
    FHost: String;
    FAuthtype: Integer;
    FUsername: String;
    FUsetls: Integer;
    procedure SetAdressfrom(const Value: String);
    procedure SetAuthtype(const Value: Integer);
    procedure SetDoor(const Value: Integer);
    procedure SetHost(const Value: String);
    procedure SetNamefrom(const Value: String);
    procedure SetPassword(const Value: String);
    procedure SetSslmethod(const Value: Integer);
    procedure SetSslmode(const Value: Integer);
    procedure SetUsername(const Value: String);
    procedure SetUsetls(const Value: Integer);

  public

    property Host: String read FHost write SetHost;
    property Username: String read FUsername write SetUsername;
    property Password: String read FPassword write SetPassword;
    property Namefrom: String read FNamefrom write SetNamefrom;
    property Adressfrom: String read FAdressfrom write SetAdressfrom;
    property Door: Integer read FDoor write SetDoor;
    property Authtype: Integer read FAuthtype write SetAuthtype;
    property Sslmethod: Integer read FSslmethod write SetSslmethod;
    property Sslmode: Integer read FSslmode write SetSslmode;
    property Usetls: Integer read FUsetls write SetUsetls;

end;

implementation

{ TCfgmail }

procedure TCfgmail.SetAdressfrom(const Value: String);
begin
  FAdressfrom := Value;
end;

procedure TCfgmail.SetAuthtype(const Value: Integer);
begin
  FAuthtype := Value;
end;

procedure TCfgmail.SetDoor(const Value: Integer);
begin
  FDoor := Value;
end;

procedure TCfgmail.SetHost(const Value: String);
begin
  FHost := Value;
end;

procedure TCfgmail.SetNamefrom(const Value: String);
begin
  FNamefrom := Value;
end;

procedure TCfgmail.SetPassword(const Value: String);
begin
  FPassword := Value;
end;

procedure TCfgmail.SetSslmethod(const Value: Integer);
begin
  FSslmethod := Value;
end;

procedure TCfgmail.SetSslmode(const Value: Integer);
begin
  FSslmode := Value;
end;

procedure TCfgmail.SetUsername(const Value: String);
begin
  FUsername := Value;
end;

procedure TCfgmail.SetUsetls(const Value: Integer);
begin
  FUsetls := Value;
end;

end.
