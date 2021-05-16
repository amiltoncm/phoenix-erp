unit uFuncoesVersao;
interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, JPeg, Registry, ShellApi, UrlMon;

procedure AtualizaSistemaFunc;
function DownloadFile(Source, Dest: string): Boolean;
function VersaoExe(ArquivoExe : string): String;
procedure VerificaVersao;
procedure VersaoDatabase;

implementation

uses dataConfig, uFuncoesWeb, uPrincipal, uVarGlobal, uFuncoesSistema,
  uDaoConfig, uDaoUpdate, uConstants;

function DownloadFile(Source, Dest: string): Boolean;
Begin
  try
    Result :=  UrlDownloadToFile(nil, PChar(source), PChar(Dest), 0, nil) = 0;
  except
    Result := False;
  end;
end;

procedure AtualizaSistemaFunc;
Var
vPath, vDownloads: String;
Begin
  vPath := DiretorioSemBarra(ExtractFileDir(Application.ExeName));
  vDownloads := vPath + '\AMUpdate.exe';
  if FileExists(vDownloads) then
  Begin
    if MessageDlg('Para continuar com a atualização o Sistema será fechado!' +
    #13 + 'Deseja continuar?', mtConfirmation, [mbYes, mbno], 0) = mrYes then
    Begin
      WinExec(PAnsiChar(vDownloads), SW_SHOWNORMAL);
      Application.Terminate;
    end;
  end
  else
    Messagedlg('Módulo não instalado!', mtInformation,[mbok],0);
end;

function VersaoExe(ArquivoExe : string): String;
type
PFFI = ^vs_FixedFileInfo;
var
F: PFFI;
Handle: Dword;
Len: Longint;
Data: Pchar;
Buffer: Pointer;
Tamanho: Dword;
Parquivo: Pchar;
Arquivo: String;
begin
  Arquivo := ArquivoExe;
  Parquivo := StrAlloc(Length(Arquivo) + 1);
  StrPcopy(Parquivo, Arquivo);
  Len := GetFileVersionInfoSize(Parquivo, Handle);
  Result := '';
  if Len > 0 then
  begin
    Data := StrAlloc(Len + 1);
    if GetFileVersionInfo(Parquivo, Handle, Len, Data) then
    begin
      VerQueryValue(Data, '', Buffer, Tamanho);
      F := PFFI(Buffer);
      Result := Format('%d.%d.%d.%d', [HiWord(F^.dwFileVersionMs), LoWord
          (F^.dwFileVersionMs), HiWord(F^.dwFileVersionLs), LoWord
          (F^.dwFileVersionLs)]);
    end;
    StrDispose(Data);
  end;
  StrDispose(Parquivo);
end;

procedure VerificaVersao;
Var
vVersaoExe, vVersaoBD: String;
vLocUpdate, vDestUpdate: String;
vArqVersao: TextFile;
vValorVersao, vVersaoAtual: String;
Begin
  //Verifica a versão na rede local --------------------------------------------
  //Verifica versao do executavel
  dmConfig.qyConfig.Active := true;
  vVersaoExe := Trim(VersaoSistema(0));
  //Verifica versao salva no Banco
  vVersaoBD := Trim(dmConfig.qyConfigcfg_versao.Text);
  //Verifica se as versões não são iguais
  if (vVersaoExe <> vVersaoBD) then
  Begin
    //Verifica qual versão é maior
    if vVersaoExe > vVersaoBD then
      //caso a versão do executável seja maior, atualiza banco de dados
      setVersao(Trim(vVersaoExe))
    else
    Begin
      //caso a versão do BD seja maior, avisa que existe uma versão maior disponível
      if MessageDlg('Existem máquinas em sua rede com nova versão disponível: ' + vVersaoBD + #13 + #13 + 'Deseja atualizar o sistema via internet?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        AtualizaSistemaFunc;
    end;
  end;
  //Verifica a versão pela internet --------------------------------------------
  //Verifica se o micro possui conexão com a internet
  if ConectadoWeb = true then
  begin
    vLocUpdate := 'https://www.amxsistemas.com.br/suporte/amsoccer/update/phoenix.ver';
    vDestUpdate := vgPath + '\phoenix.ver';
    if DownloadFile(vLocUpdate, vDestUpdate) = true then
    begin
      try
        AssignFile(vArqVersao, vDestUpdate);
        Reset(vArqVersao);
        Readln(vArqVersao, vValorVersao);
        CloseFile(vArqVersao);
        vVersaoAtual := Trim(VersaoSistema(0));
        vValorVersao := Trim(vValorVersao);
        if vVersaoAtual < vValorVersao then
        begin
          if MessageDlg('Existe uma nova versão disponível na internet: ' + vValorVersao + #13 + #13 + 'Deseja atualizar o sistema?',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            AtualizaSistemaFunc;
        end;
      except;
      end;
    end;
  end;
end;

procedure VersaoDatabase;
var
vDataBaseAtual: Integer;
begin
  vDataBaseAtual := getUpdate;
  if vDataBaseAtual < ctDatabaseExe then
  begin
    MessageDlg('A sua versão da base de dados (Sua versão: ' + IntToStr(vDataBaseAtual) +
               ') está desatualizada (Versão atual: ' + IntToStr(ctDatabaseExe) +
               '), favor entrar em contato com o suporte!', mtWarning, [mbOK], 0);
  end;
end;

end.
