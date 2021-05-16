unit uEnvMailOrc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, wwdblook, JvGIF, Vcl.ExtCtrls, JvExControls, JvAnimatedImage,
  JvGIFCtrl;

type
  TfrmEnvMailOrc = class(TfrmTmpFormNormal)
    Label1: TLabel;
    cbEndereco: TwwDBLookupCombo;
    btEnviar: TBitBtn;
    pnAguarde: TPanel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure cbEnderecoExit(Sender: TObject);
    procedure btEnviarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnvMailOrc: TfrmEnvMailOrc;

implementation

{$R *.dfm}

uses dataLookups, uDaoEmailsdest, uClassEmailsdest, uFuncoesMail,
  uClassConexao, uClassSendmail, uClassCfgmail, uDaoUsuMails, uVarGlobal,
  dataOrcamentos, uFuncoesFormatacao, uFuncoesString,
  uDaoEmpresa, uRelOrcamento, uDaoOrcamentos;

procedure TfrmEnvMailOrc.btEnviarClick(Sender: TObject);
Var
vMail: TSendmail;
vAnexo: String;
begin
  if cbEndereco.Text <> '' then
  begin
    try
      pnAguarde.Visible := True;
      Self.Cursor := crHourGlass;
      vgCfgMail := TCfgmail.Create;
      GetCfgMail;
      vMail := TSendmail.Create;
      vMail.Host := vgCfgMail.Host;
      vMail.Username := vgCfgMail.Username;
      vMail.Password := vgCfgMail.Password;
      vMail.Name := PrimeiroNome(vgCfgMail.Namefrom) + ' - (' + GetNameEmp + ')';
      vMail.Adress := vgCfgMail.Adressfrom;
      vMail.Door := vgCfgMail.Door;
      vMail.Authtype := vgCfgMail.Authtype;
      vMail.Sslmethod := vgCfgMail.Sslmethod;
      vMail.Sslmode := vgCfgMail.Sslmode;
      vMail.Usetls := vgCfgMail.Usetls;
      vMail.Sendto := cbEndereco.Text;
      vMail.Subject := 'Orçamento solicitado';
      vMail.Message := '<html><body>Anexo orçamento solicitado!<br><br>' +
                       'Atenciosamente,<br><br>' + '<B>' +
                       vgCfgMail.Namefrom + '</B></body></hmtl>';
      //Gerar anexo
      vAnexo := vgTemp + '\ORC' + LimpaReal(dmOrcamentos.qyOrcamentosORC_NUMERO.Text) + '.pdf';
      frmRelOrcamento.ImgLogoRel.Picture.LoadFromFile(vgLogoRel);
      frmRelOrcamento.lbSimb01.Caption := vgSimbolo;
      frmRelOrcamento.lbSimb02.Caption := vgSimbolo;
      frmRelOrcamento.lbSimb03.Caption := vgSimbolo;
      frmRelOrcamento.lbData.Caption := DataExtenso(GetCidadeEmp, now);
      frmRelOrcamento.lbTotExt.Caption := '(' + ValorPorExtenso(dmOrcamentos.qyOrcamentosORC_VLRTOTAL.Value) + ')';
      frmRelOrcamento.Relatorio.ShowPrintDialog := false;
      frmRelOrcamento.Relatorio.DefaultFileDeviceType := 'PDF';
      frmRelOrcamento.Relatorio.DeviceType := 'PDF';
      frmRelorcamento.Relatorio.TextFileName := vAnexo;
      frmRelOrcamento.Relatorio.Print;
      vMail.Attachment := vAnexo;
      vMail.TipoAnexo := 'application/pdf;';
      vMail.Msg := True;
      Self.Repaint;
      pnAguarde.Repaint;
      SendMailIndyClass(vMail);
      pnAguarde.Visible := False;
      Self.Repaint;
      SetStatusOrc(2);
      vMail.Free;
      vgCfgMail.Free;
      Self.Cursor := crDefault;
      Close;
    except
      on E: Exception do
      begin
        if vMail <> nil then
          vMail.Free;
        if vgCfgMail <> nil then
          vgCfgMail.Free;
        Self.Cursor := crDefault;
        MessageDlg('Erro ao enviar o e-mail!' + #13 +
                    E.Message,mtError,[mbOk],0);
        Close;
      end;
    end;
  end
  else
    MessageDlg('Você deve digitar ou selecionar um endereço de e-mail!', mtWarning, [mbOk], 0);
end;

procedure TfrmEnvMailOrc.cbEnderecoExit(Sender: TObject);
Var
vEndereco: TEmailsdest;
begin
  if TestaEmailsDest(cbEndereco.Text) = False then
  begin
    vEndereco := TEmailsdest.Create;
    InsEmailsdest;
    vEndereco.Codigo := 0;
    vEndereco.Endereco := cbEndereco.Text;
    SetValuesEmailsdest(vEndereco);
    PostEmailsdest;
    vEndereco.Free;
  end;

end;

procedure TfrmEnvMailOrc.FormActivate(Sender: TObject);
begin
  pnAguarde.Visible := False;
  inherited;
  cbEndereco.Text := '';
  cbEndereco.SetFocus;
end;

procedure TfrmEnvMailOrc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #27 then
    Close;
end;

end.
