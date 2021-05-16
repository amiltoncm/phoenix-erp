unit uCfgMail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Inifiles, Vcl.Mask, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, IdServerIOHandler, IdSSL, IdSSLOpenSSL, wwdbedit,
  Wwdotdot, Wwdbcomb, Vcl.DBCtrls, Data.DB;

type
  TfrmCfgMail = class(TfrmTmpFormNormal)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    btAlterar: TBitBtn;
    dbHost: TDBEdit;
    dbUserName: TDBEdit;
    dbSenha: TDBEdit;
    dbName: TDBEdit;
    dbAdress: TDBEdit;
    cbDoor: TwwDBComboBox;
    cbAuthType: TwwDBComboBox;
    cbSSLMethod: TwwDBComboBox;
    cbSSLMode: TwwDBComboBox;
    cbUseTLS: TwwDBComboBox;
    dsUsuMails: TDataSource;
    sbDefault: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btAlterarClick(Sender: TObject);
    procedure sbDefaultClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCfgMail: TfrmCfgMail;

implementation

{$R *.dfm}

uses uVarGlobal, uFuncoesSeguranca, uFuncoesMail, uFuncoesSistema,
  dataCadastros, uDaoUsuMails, uClassUsumails;

procedure TfrmCfgMail.btAlterarClick(Sender: TObject);
begin
  dsUsuMails.DataSet.FieldByName('USU_CODIGO').Value := vgCodUsuMail;
  PostUsuMails;
  inherited;
  Close;
end;

procedure TfrmCfgMail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsUsuMails.DataSet.State in [dsInsert, dsEdit] then
    dsUsuMails.DataSet.Cancel;
  inherited;
end;

procedure TfrmCfgMail.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

procedure TfrmCfgMail.sbDefaultClick(Sender: TObject);
begin
  vgUsuMail := TUsumails.Create;
  GetMailDefault;
  vgUsuMail.Free;
end;

end.
