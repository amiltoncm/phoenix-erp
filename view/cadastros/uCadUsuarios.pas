unit uCadUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, 
  Vcl.ImgList, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, 
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook,
  System.ImageList, System.Actions;

const
InputBoxMessage = WM_USER + 200;

type
  TfrmCadUsuarios = class(TfrmTmpCadastro)
    lbCodigo: TLabel;
    dbCodigo: TDBEdit;
    lbDescricao: TLabel;
    dbDescricao: TDBEdit;
    Label1: TLabel;
    dbSenha: TDBEdit;
    cbAtivo: TwwDBComboBox;
    cbAcesso: TwwDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    btMail: TBitBtn;
    btUserApp: TBitBtn;
    btModulos: TBitBtn;
    procedure InputBoxSetPasswordChar(var Msg: TMessage); Message InputBoxMessage;
    procedure FormDestroy(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actAtualizarExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
    procedure actProcurarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure cbAcessoExit(Sender: TObject);
    procedure btMailClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btUserAppClick(Sender: TObject);
    procedure btModulosClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUsuarios: TfrmCadUsuarios;

implementation

{$R *.dfm}

uses dataCadastros, uDaoUsuarios, uProcUsuarios, uFuncoesDB, uFuncoesSeguranca,
  dataLookups, uDaoLookups, uDaoUsuMails, uCfgMail, uVarGlobal, uDaoConfig,
  uUserApp, uDaoUsuariosMod, uUsuariosMod;

procedure TfrmCadUsuarios.InputBoxSetPasswordChar(var Msg: TMessage);
Var
hInputForm, hEdit: HWND;
Begin
  hInputForm := Screen.Forms[0].Handle;
  if (hInputForm <> 0) then
  Begin
    hEdit := FindWindowEx(hInputForm, 0, 'TEdit', nil);
    SendMessage(hEdit, EM_SETPASSWORDCHAR, Ord('*'),0);
  end;
end;

procedure TfrmCadUsuarios.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadUsuarios <> nil then
    frmCadUsuarios := nil;
end;

procedure TfrmCadUsuarios.actGravarExecute(Sender: TObject);
Var
vSenha: string;
vOK: Boolean;
begin
  PostMessage(Handle, InputBoxMessage, 0, 0);
  vOK := InputQuery('Confirmação da senha', 'Digite a senha novamente', vSenha);
  if vOK then
  begin
    if vSenha = dbSenha.Text then
    begin
      dmCadastros.qyUsuariosace_codigo.Value := dmLookups.qyLkAcessoace_codigo.Value;
      dmCadastros.qyUsuariosusu_senha.Text := EncryptMsg((vSenha), Length(vSenha));
      if dsCadastro.DataSet.State in [dsInsert] then
        dsCadastro.DataSet.FieldByName('USU_CODIGO').Value := GetCodigo('USU_CODIGO', 'USUARIOS');
      inherited;
      AtualizarLookup('USUARIOS');
    end
    else
    begin
      Messagedlg('A senha não foi confirmada!', mtError, [mbok],0);
      dbSenha.SetFocus;
    end;
  end;
end;

procedure TfrmCadUsuarios.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbSenha.Clear;
  dbDescricao.SetFocus;
end;

procedure TfrmCadUsuarios.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadUsuarios.actExcluirExecute(Sender: TObject);
begin
  if dsCadastro.DataSet.FieldByName('USU_CODIGO').Value > 0 then
    inherited
  else
    MessageDlg('O usuário MASTER não pode ser apagado!', mtWarning, [mbOk], 0);
end;

procedure TfrmCadUsuarios.actLimparExecute(Sender: TObject);
begin
  ListarUsuarios('USU_NOME');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadUsuarios.actNovoExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
  cbAcesso.Text := dsCadastro.DataSet.FieldByName('ACE_DESCRICAO').Text;
end;

procedure TfrmCadUsuarios.FormActivate(Sender: TObject);
begin
  inherited;
  ListarUsuarios('USU_NOME');
  dbDescricao.SetFocus;
end;

procedure TfrmCadUsuarios.FormCreate(Sender: TObject);
begin
  inherited;
  if GetUserApp = 0 then
    btUserApp.Visible := false
  else
    btUserApp.Visible := true;
end;

procedure TfrmCadUsuarios.actProcurarExecute(Sender: TObject);
begin
  ListarUsuarios('USU_NOME');
  frmProcUsuarios.ShowModal;
end;

procedure TfrmCadUsuarios.btMailClick(Sender: TObject);
begin
  if dsCadastro.DataSet.FieldByName('USU_CODIGO').IsNull then
    MessageDlg('É necessário estar gravado os dados do Usuário!', mtWarning, [mbOk], 0)
  else
  begin
    FiltrarUsuMails('USU_CODIGO', '=', dbCodigo.Text, '0');
    vgCodUsuMail := dsCadastro.DataSet.FieldByName('USU_CODIGO').Value;
    if dmCadastros.qyUsuMailsUSU_CODIGO.IsNull then
      InsUsuMails
    else
      EdtUsuMails;
    frmCfgMail.ShowModal;
  end;
end;

procedure TfrmCadUsuarios.btModulosClick(Sender: TObject);
begin
  FiltrarUsuariosMod('u.usu_codigo', '=', IntToStr(dsCadastro.DataSet.FieldByName('usu_codigo').Value));
  frmUsuariosMod.ShowModal;
end;

procedure TfrmCadUsuarios.btUserAppClick(Sender: TObject);
begin
  if dsCadastro.DataSet.FieldByName('usu_codigo').IsNull then
    MessageDlg('É necessário selecionar um usuário válido!', mtWarning, [mbOk], 0)
  else
    frmUserApp.ShowModal;
end;

procedure TfrmCadUsuarios.cbAcessoExit(Sender: TObject);
begin
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    dsCadastro.DataSet.FieldByName('ACE_CODIGO').Value := dmLookups.qyLkAcessoACE_CODIGO.Value;
end;

end.
