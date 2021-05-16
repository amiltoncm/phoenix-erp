unit uFuncoesMsg;

interface

uses SysUtils, Windows, Consts;

procedure SetResourceString(AResString: PResStringRec; ANewValue: PChar);
procedure TraduzMensagens();

implementation

procedure SetResourceString(AResString: PResStringRec; ANewValue: PChar);
var
vPOldProtect: DWORD;
begin
  VirtualProtect(AResString, SizeOf(AResString^), PAGE_EXECUTE_READWRITE, @vPOldProtect);
  AResString^.Identifier := Integer(ANewValue);
  VirtualProtect(AResString, SizeOf(AResString^), vPOldProtect, @vPOldProtect);
end;

procedure TraduzMensagens();
begin
  SetResourceString(@SMsgDlgYes, 'Sim');
  SetResourceString(@SMsgDlgNo, 'N�o');
  SetResourceString(@SMsgDlgInformation, 'Informa��o');
  SetResourceString(@SMsgDlgError, 'Erro');
  SetResourceString(@SMsgDlgWarning, 'Aviso');
  SetResourceString(@SMsgDlgConfirm, 'Confirma��o');
  SetResourceString(@SMsgDlgOK, 'Ok');
  SetResourceString(@SMsgDlgCancel, 'Cancelar');
  SetResourceString(@SMsgDlgHelp, 'Ajuda');
  SetResourceString(@SMsgDlgHelpNone, 'Ajuda indispon�vel');
  SetResourceString(@SMsgDlgHelpHelp, 'Ajuda');
  SetResourceString(@SMsgDlgAbort, 'Abortar');
  SetResourceString(@SMsgDlgRetry, 'Repetir');
  SetResourceString(@SMsgDlgIgnore, 'Ignorar');
  SetResourceString(@SMsgDlgAll, 'Todos');
  SetResourceString(@SMsgDlgNoToAll, 'N�o para todos');
  SetResourceString(@SMsgDlgYesToAll, 'Sim para todos');
  SetResourceString(@SMsgDlgClose, 'Fechar');
end;

end.
