unit uFuncoesRegistro;

interface

uses System.Win.Registry, Vcl.Dialogs, Vcl.Forms, System.SysUtils, Winapi.Windows;

const

ctBase = 1974;
ctSysReg = 'Phoenix';
ctSysId = 'PhoenixID';
ctSysSerial = 'PhoenixReg';

procedure VerRegistro;

implementation

uses uDaoSistema, dataCadastros, uPrincipal, uFuncoesSistema;

procedure VerRegistro;
Var
vID, vSerial, vRegSys, vRegReg: String;
vRegistro: TRegistry;
vDataReg: String;
vDataTeste: TDate;
vNomeReg: String;
begin
  //Verifica registro
  vNomeReg := NomeComputador;
  FiltrarSistema('SIS_MAQUINA', '=', vNomeReg, '0');
  if dmCadastros.qySistemaSIS_CODIGO.IsNull then
  begin
    MessageDlg('Sistema não registrado!' + #13 + #13 + 'Favor entrar em contato com o fornecedor do Software!',
               mtWarning, [mbOk], 0);
    Application.Terminate;
  end
  else
  begin
    vID := GetIDSistema;
    vSerial := GetSerialSistema;
    vDataReg := GetDataSistema;
    //Verifica data de validade do sistema
    if vDataReg <> '01/01/2000' then
    begin
      vDataTeste := StrToDate(vDataReg);
      if vDataTeste <= now then
      begin
        MessageDlg('A data de validade (' + vDataReg + ') do sistema expirou!' + #13 + #13 +
                   'Favor entrar em contato com o representante do Software!',
                   mtWarning, [mbOk], 0);
        //Apaga registro no windows
        vRegistro := TRegistry.Create;
        vRegistro.RootKey := HKEY_CURRENT_USER;
        vRegistro.DeleteKey(ctSysReg);
        vRegistro.CloseKey;
        vRegistro.Free;
        DelSistema;
        Application.Terminate;
      end;
      if vDataTeste >= (now - 10) then
      begin
        MessageDlg('A data de validade do sistema irá expirar em ' + vDataReg + '!'  + #13 + #13 +
                   'Favor entrar em contato com o representante do Software!',
                   mtWarning, [mbOk], 0);
      end;
    end;
    frmPrincipal.JvSerialMaker1.Base := ctBase;
    frmPrincipal.JvSerialMaker1.UserName := vID;
    if vSerial <> frmPrincipal.JvSerialMaker1.Serial then
    begin
      MessageDlg('O ID do sistema não confere com o Serial.' + #13 + #13 + 'Favor entrar em contato com o fornecedor do Software!',
                 mtWarning, [mbOk], 0);
      Application.Terminate;
    end;
    vRegistro := TRegistry.Create;
    vRegistro.RootKey := HKEY_CURRENT_USER;
    if vRegistro.OpenKey(ctSysReg, true) then
    begin
      vRegSys := vRegistro.ReadString(ctSysId);
      vRegReg := vRegistro.ReadString(ctSysSerial);
    end;
    vRegistro.Free;
    if vID <> vRegSys then
    begin
      MessageDlg('O ID do sistema não confere com o Registro.' + #13 + #13 + 'Favor entrar em contato com o fornecedor do Software!',
                 mtWarning, [mbOk], 0);
      Application.Terminate;
    end;
    if vSerial <> vRegReg then
    begin
      MessageDlg('O Serial do sistema não confere com o Registro.' + #13 + #13 + 'Favor entrar em contato com o fornecedor do Software!',
                 mtWarning, [mbOk], 0);
      Application.Terminate;
    end;
  end;
end;

end.
