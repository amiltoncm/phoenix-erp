unit uClassConexao;

interface

Type

  TConexao = class

  private
    FClientCodePage: String;
    FProtocol: String;
    FPort: Integer;
    FDatabase: String;
    FPassword: String;
    FLibraryLocation: String;
    FUser: String;
    FHostName: String;
    procedure SetClientCodePage(const Value: String);
    procedure SetDatabase(const Value: String);
    procedure SetHostName(const Value: String);
    procedure SetLibraryLocation(const Value: String);
    procedure SetPassword(const Value: String);
    procedure SetPort(const Value: Integer);
    procedure SetProtocol(const Value: String);
    procedure SetUser(const Value: String);

  public

    property Protocol: String read FProtocol write SetProtocol;
    property HostName: String read FHostName write SetHostName;
    property User: String read FUser write SetUser;
    property Password: String read FPassword write SetPassword;
    property Port: Integer read FPort write SetPort;
    property Database: String read FDatabase write SetDatabase;
    property ClientCodePage: String read FClientCodePage write SetClientCodePage;
    property LibraryLocation: String read FLibraryLocation write SetLibraryLocation;

  end;

implementation

{ TConexao }

procedure TConexao.SetClientCodePage(const Value: String);
begin
  FClientCodePage := Value;
end;

procedure TConexao.SetDatabase(const Value: String);
begin
  FDatabase := Value;
end;

procedure TConexao.SetHostName(const Value: String);
begin
  FHostName := Value;
end;

procedure TConexao.SetLibraryLocation(const Value: String);
begin
  FLibraryLocation := Value;
end;

procedure TConexao.SetPassword(const Value: String);
begin
  FPassword := Value;
end;

procedure TConexao.SetPort(const Value: Integer);
begin
  FPort := Value;
end;

procedure TConexao.SetProtocol(const Value: String);
begin
  FProtocol := Value;
end;

procedure TConexao.SetUser(const Value: String);
begin
  FUser := Value;
end;

end.
