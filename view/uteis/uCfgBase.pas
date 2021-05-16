unit uCfgBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Inifiles, uClassConexao;

type
  TfrmCfgBase = class(TfrmTmpFormNormal)
    Label1: TLabel;
    cbSGDB: TComboBox;
    Label2: TLabel;
    edServer: TEdit;
    Label3: TLabel;
    edDatabase: TEdit;
    sbDatabase: TSpeedButton;
    odDatabase: TOpenDialog;
    Label5: TLabel;
    edUserName: TEdit;
    mePassword: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    btGravar: TBitBtn;
    edPorta: TEdit;
    Label4: TLabel;
    edClientCode: TEdit;
    edLibraryLocation: TEdit;
    Label8: TLabel;
    SpeedButton1: TSpeedButton;
    odLibrary: TOpenDialog;
    procedure PostCfg(vfConexao: TConexao);
    procedure sbDatabaseClick(Sender: TObject);
    procedure cbSGDBExit(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCfgBase: TfrmCfgBase;

implementation

{$R *.dfm}

uses uVarGlobal, uFuncoesSeguranca, dataTestSGDB, uErConexao;

procedure TfrmCfgBase.PostCfg(vfConexao: TConexao);
Var
vControl: TInifile;
begin
  vfConexao.Password := EncryptMsg(vfConexao.Password, Length(vfConexao.Password));
  vControl := TIniFile.Create(vgArqIni);
  vControl.WriteString('Base', 'Protocol', vfConexao.Protocol);
  vControl.WriteString('Base', 'HostName', vfConexao.HostName);
  vControl.WriteString('Base', 'User', vfConexao.User);
  vControl.WriteString('Base', 'Password', vfConexao.Password);
  vControl.WriteInteger('Base', 'Port', vfConexao.Port);
  vControl.WriteString('Base', 'Database', vfConexao.Database);
  vControl.WriteString('Base', 'ClientCodePage', vfConexao.ClientCodePage);
  vControl.WriteString('Base', 'LibraryLocation', vfConexao.LibraryLocation);
  vControl.Free;
end;

procedure TfrmCfgBase.btGravarClick(Sender: TObject);
Var
vConexao: TConexao;
vMsg: String;
begin
  //Cria obj de conexão
  vConexao := TConexao.Create;
  if cbSGDB.ItemIndex = 0 then
    vConexao.Protocol := 'postgresql';

  vConexao.HostName := edServer.Text;
  vConexao.Database := edDatabase.Text;
  vConexao.User := edUserName.Text;
  vConexao.Password := mePassword.Text;
  if edPorta.Text = '' then
    vConexao.Port := 0;
  vConexao.Port := StrToInt(edPorta.Text);
  vConexao.ClientCodePage := edClientCode.Text;
  vConexao.LibraryLocation := edLibraryLocation.Text;
  if dmTestSGDB.TestaConexao(vConexao) = true then
  begin
    PostCfg(vConexao);
    MessageDlg('Configuração efetuada com sucesso!' + #13 + #13 + 'O sistema deve ser reiniciado!', mtInformation, [mbok], 0);
    vConexao.Free;
    Close;
  end
  else
  begin
    MessageDlg('Problemas na configuração!', mtWarning, [mbok], 0);
    vConexao.Free;
  end;
end;

procedure TfrmCfgBase.cbSGDBExit(Sender: TObject);
begin
  if cbSGDB.ItemIndex = 0 then
    sbDatabase.Enabled := False
  else
    sbDatabase.Enabled := True;
end;

procedure TfrmCfgBase.FormCreate(Sender: TObject);
Var
vControl: TInifile;
vServerType: String;
begin
  inherited;
  cbSGDB.ItemIndex := 0;
  edServer.Clear;
  edDatabase.Clear;
  edUserName.Clear;
  mePassword.Clear;
  edPorta.Clear;
  edClientCode.Clear;
  edLibraryLocation.Clear;
  //Verifica se existe o arquivo ini
  if FileExists(vgArqIni) then
  begin
    vControl := Tinifile.create(vgArqIni);
    cbSGDB.ItemIndex := 0;
    sbDatabase.Enabled := False;
    edServer.Text :=  vControl.readstring('Base', 'HostName', '');
    edUserName.Text :=  vControl.readstring('Base', 'User', '');
    mePassword.Text :=  vControl.readstring('Base', 'Password', '');
    edPorta.Text := IntToStr(vControl.ReadInteger('Base', 'Port', 5432));
    edDatabase.Text :=  vControl.readstring('Base', 'Database', '');
    edClientCode.Text := vControl.readstring('Base', 'ClientCodePage', '');
    edLibraryLocation.Text := vControl.readstring('Base', 'LibraryLocation', '');
    //Descriptografa senha
    mePassword.Text := DecryptMsg(mePassword.Text, Length(mePassword.Text));
  end;
  vControl.Free;
end;

procedure TfrmCfgBase.sbDatabaseClick(Sender: TObject);
begin
  if odDatabase.Execute then
    edDatabase.Text := odDatabase.FileName;
end;

procedure TfrmCfgBase.SpeedButton1Click(Sender: TObject);
begin
  if odLibrary.Execute then
    edLibraryLocation.Text := odLibrary.FileName;
end;

end.
