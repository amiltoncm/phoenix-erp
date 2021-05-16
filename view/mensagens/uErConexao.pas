unit uErConexao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Menus, Inifiles, uClassSendMail;

type
  TfrmErConexao = class(TForm)
    btFechar: TBitBtn;
    memLogErro: TMemo;
    Image1: TImage;
    Image2: TImage;
    memMsgErro: TMemo;
    Label1: TLabel;
    lbMail: TLabel;
    sbCfgBase: TSpeedButton;
    procedure btFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure lbMailClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbCfgBaseClick(Sender: TObject);
  private

  ComponentePro: TComponent;
  procedure ProCode(Sender: TObject);

  public
    { Public declarations }
  end;

var
  frmErConexao: TfrmErConexao;

implementation

uses uFuncoesSistema, uFuncoesMail, uFuncoesLogs, uVarGlobal, uClassConexao,
  uCfgBase, uFuncoesSeguranca;

{$R *.DFM}

procedure TfrmErConexao.ProCode(Sender: TObject);
begin
  if Assigned(ComponentePro) then
    TEdit(ComponentePro).Color := clWindow; // cor ao sair
  if (ActiveControl is TCustomEdit) or
     (ActiveControl is TComboBox) or
     (ActiveControl is TMemo) then
  begin
    TEdit(ActiveControl).Color := clSkyBlue;  // cor ao focar
    ComponentePro := ActiveControl;
  end;
end;

procedure TfrmErConexao.sbCfgBaseClick(Sender: TObject);
begin
  frmCfgBase.ShowModal;
end;

procedure TfrmErConexao.btFecharClick(Sender: TObject);
begin
  GravaLog('Erro', 'Erro de conexão!');
  Application.Terminate;
end;

procedure TfrmErConexao.FormActivate(Sender: TObject);
begin
  Screen.OnActiveControlChange := ProCode;
end;

procedure TfrmErConexao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  GravaLog('Erro', 'Erro de conexão!');
  Application.Terminate;
end;

procedure TfrmErConexao.FormDestroy(Sender: TObject);
begin
  Screen.OnActiveControlChange := nil;
end;

procedure TfrmErConexao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
  if key = #27 then
    Close;
end;

procedure TfrmErConexao.lbMailClick(Sender: TObject);
Var
vLocErr, vLogError: String;
vEndSuporte: String;
vControl: TInifile;
vDoor: Integer;
vSendMail: TSendMail;
vPassword: String;
begin
  vControl := Tinifile.create(vgArqIni);
  vEndSuporte := vControl.ReadString('suporte', 'email', '');
  //Pega pasta e mesnagem de erro e cria arquivo de log
  vLocErr := vgPath + '\Erro.log';
  vLogError := memLogErro.Text;
  GravaArqText(vLocErr, vLogError);
  //Cria objeto, pega dados do ini e envia e-mail do erro
  vSendMail := TSendmail.Create;
  vSendMail.Host := vControl.ReadString('emails', 'host', '');
  vSendMail.Username := vControl.ReadString('emails', 'username', '');
  vPassword := vControl.ReadString('emails', 'password', '');
  vSendMail.Password := DecryptMsg(vPassword, Length(vPassword));
  vSendMail.Name := vControl.ReadString('emails', 'namefrom', '');
  vSendMail.Adress := vControl.ReadString('emails', 'adressfrom', '');
  vSendMail.Door := StrToInt(vControl.ReadString('emails', 'door', ''));
  vSendMail.Authtype := StrToInt(vControl.ReadString('provedor', 'authtype', ''));
  vSendMail.Sslmethod := StrToInt(vControl.ReadString('provedor', 'sslmethod', ''));
  vSendMail.Sslmode := StrToInt( vControl.ReadString('provedor', 'sslmode', ''));
  vSendMail.Usetls := StrToInt( vControl.ReadString('provedor', 'usetls', ''));
  vSendMail.Sendto :=  vControl.ReadString('suporte', 'email', '');
  vSendMail.Subject := 'Erro conexão no sistema ' + Application.Title;
  vSendMail.Message := 'Erro de conexão no sistema ' + Application.Title;
  vSendMail.Attachment := vLocErr;
  vSendMail.TipoAnexo := '.txt';
  vSendMail.Msg := True;
  vControl.Free;
  SendMailIndyClass(vSendMail);
  vSendMail.Free;
end;

end.
