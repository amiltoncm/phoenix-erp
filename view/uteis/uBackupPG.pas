unit uBackupPG;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons;

type
  TfrmBackupPG = class(TfrmTmpFormNormal)
    MemoBackup: TMemo;
    btBackup: TBitBtn;
    procedure CaptureConsoleOutput(const ACommand, AParameters: String; AMemo: TMemo);
    procedure FormActivate(Sender: TObject);
    procedure btBackupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBackupPG: TfrmBackupPG;

implementation

{$R *.dfm}

uses uVarGlobal;

procedure TfrmBackupPG.btBackupClick(Sender: TObject);
begin
  if MessageDlg('Deseja efetuar o backup agora?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    CaptureConsoleOutput(vgBackupPG, '', MemoBackup);
    Close;
  end;
end;

procedure TfrmBackupPG.CaptureConsoleOutput(const ACommand, AParameters: String; AMemo: TMemo);
const
ctCReadBuffer = 2400;
var
vsaSecurity: TSecurityAttributes;
vhRead: THandle;
vhWrite: THandle;
vsuiStartup: TStartupInfo;
vpiProcess: TProcessInformation;
vpBuffer: array[0..ctCReadBuffer] of AnsiChar;
vdRead: DWord;
vdRunning: DWord;
begin
  vsaSecurity.nLength := SizeOf(TSecurityAttributes);
  vsaSecurity.bInheritHandle := True;
  vsaSecurity.lpSecurityDescriptor := nil;
  if CreatePipe(vhRead, vhWrite, @vsaSecurity, 0) then
  begin
    FillChar(vsuiStartup, SizeOf(TStartupInfo), #0);
    vsuiStartup.cb := SizeOf(TStartupInfo);
    vsuiStartup.hStdInput := vhRead;
    vsuiStartup.hStdOutput := vhWrite;
    vsuiStartup.hStdError := vhWrite;
    vsuiStartup.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
    vsuiStartup.wShowWindow := SW_HIDE;
    if CreateProcess(nil, PChar(ACommand + ' ' + AParameters), @vsaSecurity,
       @vsaSecurity, True, NORMAL_PRIORITY_CLASS, nil, nil, vsuiStartup, vpiProcess) then
    begin
      repeat
        vdRunning  := WaitForSingleObject(vpiProcess.hProcess, 100);
        Application.ProcessMessages();
        repeat
          vdRead := 0;
          ReadFile(vhRead, vpBuffer[0], ctCReadBuffer, vdRead, nil);
          vpBuffer[vdRead] := #0;
          OemToAnsi(vpBuffer, vpBuffer);
          AMemo.Lines.Add(String(vpBuffer));
        until (vdRead < ctCReadBuffer);
      until (vdRunning <> WAIT_TIMEOUT);
      CloseHandle(vpiProcess.hProcess);
      CloseHandle(vpiProcess.hThread);
    end;
    CloseHandle(vhRead);
    CloseHandle(vhWrite);
  end;
end;

procedure TfrmBackupPG.FormActivate(Sender: TObject);
begin
  inherited;
  MemoBackup.Clear;
end;

end.
