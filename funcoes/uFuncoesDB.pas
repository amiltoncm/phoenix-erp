unit uFuncoesDB;

interface

uses SysUtils, Dialogs;

function GetCodigo(vfCampo, vfTabela: String): Integer;
function GetCodigoComposto(vfCampo, vfTabela, vfCampoKey, vfValorKey: String): Integer;
function GetDateTimeServer: TDateTime;
function GetDateServerPG: TDateTime;
function GetTimeServerPG: TDateTime;
function GetCodCidade(vfCidade, vfUF: String): integer;
function TestNumGer(vfCodigo: Integer): Boolean;

implementation

uses dataTmpConexao, dataCadastros, dataConfig, uVarGlobal;

function GetCodigo(vfCampo, vfTabela: String): Integer;
Var
vCodigo: Integer;
begin
  dmTmpConexao.QGeraCodigo.Close;
  dmTmpConexao.QGeraCodigo.Sql.Clear;
  dmTmpConexao.QGeraCodigo.Sql.Add('SELECT MAX(');
  dmTmpConexao.QGeraCodigo.Sql.Add(vfCampo);
  dmTmpConexao.QGeraCodigo.Sql.Add(') FROM ');
  dmTmpConexao.QGeraCodigo.Sql.Add(vfTabela);
  dmTmpConexao.QGeraCodigo.Open;
  if dmTmpConexao.QGeraCodigo.Fields[0].Text <> '' then
     vCodigo := StrToInt(dmTmpConexao.QGeraCodigo.Fields[0].Text) + 1
  else
     vCodigo := 1;
  Result := vCodigo;
end;

function GetCodigoComposto(vfCampo, vfTabela, vfCampoKey, vfValorKey: String): Integer;
Var
vCodigo: Integer;
begin
  dmTmpConexao.QGeraCodigo.Close;
  dmTmpConexao.QGeraCodigo.Sql.Clear;
  dmTmpConexao.QGeraCodigo.Sql.Add('SELECT MAX(');
  dmTmpConexao.QGeraCodigo.Sql.Add(vfCampo);
  dmTmpConexao.QGeraCodigo.Sql.Add(') FROM ');
  dmTmpConexao.QGeraCodigo.Sql.Add(vfTabela);
  dmTmpConexao.QGeraCodigo.SQL.Add(' WHERE ' + vfCampoKey + ' = ' + QuotedStr(vfValorKey));
  dmTmpConexao.QGeraCodigo.Open;
  if dmTmpConexao.QGeraCodigo.Fields[0].Text <> '' then
     vCodigo := StrToInt(dmTmpConexao.QGeraCodigo.Fields[0].Text) + 1
  else
     vCodigo := 1;
  Result := vCodigo;
end;

function GetDateTimeServer: TDateTime;
begin
  dmConfig.qyDateTimePG.Close;
  dmConfig.qyDateTimePG.SQL.Clear;
  dmConfig.qyDateTimePG.SQL.Add('select current_date, current_timestamp');
  dmConfig.qyDateTimePG.Open;
  if dmConfig.qyDateTimePGdate.IsNull then
    Result := Now
  else
    Result := dmConfig.qyDateTimePGdate.Value;
end;

function GetDateServerPG: TDateTime;
begin
  dmConfig.qyDateTimePG.Close;
  dmConfig.qyDateTimePG.SQL.Clear;
  dmConfig.qyDateTimePG.SQL.Add('select current_date, current_timestamp');
  dmConfig.qyDateTimePG.Open;
  if dmConfig.qyDateTimePGdate.IsNull then
    Result := Now
  else
    Result := dmConfig.qyDateTimePGdate.Value;
end;

function GetTimeServerPG: TDateTime;
begin
  dmConfig.qyDateTimePG.Close;
  dmConfig.qyDateTimePG.SQL.Clear;
  dmConfig.qyDateTimePG.SQL.Add('select current_date, current_timestamp');
  dmConfig.qyDateTimePG.Open;
  if dmConfig.qyDateTimePGnow.IsNull then
    Result := Now
  else
    Result := dmConfig.qyDateTimePGnow.Value;
end;

function GetCodCidade(vfCidade, vfUF: String): integer;
begin
  dmCadastros.QTemp.Close;
  dmCadastros.QTemp.SQL.Clear;
  dmCadastros.QTemp.SQL.Add('SELECT CID_CODIGO FROM CIDADES WHERE CID_MUNICIPIO = ');
  dmCadastros.QTemp.SQL.Add(QuotedStr(vfCidade));
  dmCadastros.QTemp.SQL.Add(' AND UF_SIGLA = ');
  dmCadastros.QTemp.SQL.Add(QuotedStr(vfUF));
  dmCadastros.QTemp.Open;
  if dmCadastros.QTemp.Fields[0].IsNull then
  begin
    MessageDlg('Código da cidade não encontrado!', mtWarning, [mbok], 0);
    Result := (4202404);
  end
  else
    Result := (dmCadastros.QTemp.Fields[0].Value);
end;

// Usado para testar se existe codNF
function TestNumGer(vfCodigo: Integer): Boolean;
begin
  dmCadastros.QTemp.Close;
  dmCadastros.QTemp.SQL.Clear;
  dmCadastros.QTemp.SQL.Add('select nid_codnf from nfeide ');
  dmCadastros.QTemp.SQL.Add('where nid_codnf = ' + IntToStr(vfCodigo));
  dmCadastros.QTemp.Open;
  if dmCadastros.QTemp.Fields[0].IsNull then
    Result := False
  else
    Result := True;
end;

end.
