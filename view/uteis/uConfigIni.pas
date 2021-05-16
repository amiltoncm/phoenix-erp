unit uConfigIni;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ComCtrls, Inifiles, Vcl.Mask, wwdbedit, Wwdotdot, Wwdbcomb;

type
  TfrmConfigIni = class(TfrmTmpFormNormal)
    PageControl1: TPageControl;
    tsLogs: TTabSheet;
    tsImagens: TTabSheet;
    tsCaixa: TTabSheet;
    tsUsuario: TTabSheet;
    tsTemp: TTabSheet;
    tsXML: TTabSheet;
    tsMascaras: TTabSheet;
    tsEmail: TTabSheet;
    Label1: TLabel;
    edLogErros: TEdit;
    Label2: TLabel;
    edLogsLogin: TEdit;
    Label3: TLabel;
    edPastaImg: TEdit;
    Label4: TLabel;
    edLogo: TEdit;
    Label5: TLabel;
    edLogorel: TEdit;
    Label6: TLabel;
    edImgND: TEdit;
    Label7: TLabel;
    edImgBase: TEdit;
    Label8: TLabel;
    edIDCaixa: TEdit;
    Label10: TLabel;
    cbTipoUser: TComboBox;
    Label11: TLabel;
    edLastUser: TEdit;
    Label12: TLabel;
    edPastaTemp: TEdit;
    edPastaXML: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edMaskHora: TEdit;
    Label16: TLabel;
    edMaskMoeda: TEdit;
    Label17: TLabel;
    edSimbolo: TEdit;
    edMaskData: TEdit;
    Label18: TLabel;
    edHost: TEdit;
    Label19: TLabel;
    edUserName: TEdit;
    Label20: TLabel;
    edPassword: TEdit;
    Label21: TLabel;
    edFrom: TEdit;
    Label22: TLabel;
    edAdressFrom: TEdit;
    Label23: TLabel;
    edPorta: TEdit;
    Label24: TLabel;
    cbAuthType: TwwDBComboBox;
    cbSSLMethod: TwwDBComboBox;
    cbSSLMode: TwwDBComboBox;
    cbUseTLS: TwwDBComboBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    sbSalvar: TSpeedButton;
    tsCodBar: TTabSheet;
    Label28: TLabel;
    cbCodBarPV: TwwDBComboBox;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbSalvarClick(Sender: TObject);
    procedure edIDCaixaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigIni: TfrmConfigIni;

implementation

{$R *.dfm}

uses uVarGlobal, uFuncoesSistema, uFuncoesSeguranca;

procedure TfrmConfigIni.edIDCaixaExit(Sender: TObject);
begin
  if ((edIDCaixa.Text = '') or (edIDCaixa.Text = ' ')) then
    edIDCaixa.Text := '0';
end;

procedure TfrmConfigIni.FormActivate(Sender: TObject);
Var
vControl: TInifile;
vPassword: String;
begin
  inherited;
  PageControl1.ActivePage := tsLogs;
  vgArqIni := (vgPath + '\' + RetornaExecutavelSemExtensao + '.ini');
  vControl := Tinifile.create(vgArqIni);
  //Logs
  edLogErros.Text := vControl.ReadString('Logs', 'erro', '');
  edLogsLogin.Text := vControl.ReadString('Logs', 'conexao', '');
  //Imagens
  edPastaImg.Text := vControl.ReadString('Imagens', 'Diretorio', '');
  edLogo.Text := vControl.ReadString('Imagens', 'Logo', '');
  edLogorel.Text := vControl.ReadString('Imagens', 'LogoRel', '');
  edImgND.Text := vControl.ReadString('Imagens', 'ND', '');
  edImgBase.Text := vControl.ReadString('Imagens', 'LogoBase', '');
  //Caixa
  edIDCaixa.Text := vControl.ReadString('Caixa', 'ID', '');
  //Usuário
  cbTipoUser.Text := vControl.ReadString('Usuario', 'Busca', '');
  edLastUser.Text := vControl.ReadString('Usuario', 'ultimo', '');
  //Temp
  edPastaTemp.Text := vControl.ReadString('Temp', 'Diretorio', '');
  //XML
  edPastaXML.Text := vControl.ReadString('XML', 'Path', '');
  //Máscaras
  edMaskData.Text := vControl.ReadString('Mascaras', 'Data', '');
  edMaskHora.Text := vControl.ReadString('Mascaras', 'Hora', '');
  edMaskMoeda.Text := vControl.ReadString('Mascaras', 'Moeda', '');
  edSimbolo.Text := vControl.ReadString('Mascaras', 'Simbolo', '');
  //e-mail - user
  edHost.Text := vControl.ReadString('emails', 'host', '');
  edUserName.Text := vControl.ReadString('emails', 'username', '');
  edAdressFrom.Text := vControl.ReadString('emails', 'adressfrom', '');
  vPassword := vControl.ReadString('emails', 'password', '');
  edPassword.Text := DecryptMsg(vPassword, Length(vPassword));
  edFrom.Text := vControl.ReadString('emails', 'namefrom', '');
  edPorta.Text := vControl.ReadString('emails', 'door', '');
  //e-mail - provedor
  cbAuthType.ItemIndex := StrToInt(vControl.ReadString('provedor', 'authtype', ''));
  cbSSLMethod.ItemIndex := StrToInt(vControl.ReadString('provedor', 'sslmethod', ''));
  cbSSLMode.ItemIndex := StrToInt(vControl.ReadString('provedor', 'sslmode', ''));
  cbUseTLS.ItemIndex := StrToInt(vControl.ReadString('provedor', 'usetls', ''));
  vControl.Free;
  //Código de barras
  cbCodBarPV.Value := vControl.ReadString('CodBar', 'PV', '0');
end;

procedure TfrmConfigIni.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

procedure TfrmConfigIni.sbSalvarClick(Sender: TObject);
Var
vControl: TInifile;
vPassword: String;
begin
  if MessageDlg('Deseja realmente gravar as alterações?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      vgArqIni := (vgPath + '\' + RetornaExecutavelSemExtensao + '.ini');
      vControl := Tinifile.create(vgArqIni);
      //Logs
      vControl.WriteString('Logs', 'erro', edLogErros.Text);
      vControl.WriteString('Logs', 'conexao', edLogsLogin.Text);
      //Imagens
      vControl.WriteString('Imagens', 'Diretorio', edPastaImg.Text);
      vControl.WriteString('Imagens', 'Logo', edLogo.Text);
      vControl.WriteString('Imagens', 'LogoRel', edLogoRel.Text);
      vControl.WriteString('Imagens', 'ND', edImgND.Text);
      vControl.WriteString('Imagens', 'LogoBase', edImgBase.Text);
      //Caixa
      vControl.WriteString('Caixa', 'ID', edIDCaixa.Text);
      vgIDCaixa := StrToInt(edIDCaixa.Text);
      //Usuário
      vControl.WriteString('Usuario', 'Busca', cbTipoUser.Text);
      vControl.WriteString('Usuario', 'ultimo', edLastUser.Text);
      //Temp
      vControl.WriteString('Temp', 'Diretorio', edPastaTemp.Text);
      //XML
      vControl.WriteString('XML', 'Path', edPastaXML.Text);
      //Máscaras
      vControl.WriteString('Mascaras', 'Data', edMaskData.Text);
      vControl.WriteString('Mascaras', 'Hora', edMaskHora.Text);
      vControl.WriteString('Mascaras', 'Moeda', edMaskMoeda.Text);
      vControl.WriteString('Mascaras', 'Simbolo', edSimbolo.Text);
      //e-mail - user
      vControl.WriteString('emails', 'host', edHost.Text);
      vControl.WriteString('emails', 'username', edUserName.Text);
      vControl.WriteString('emails', 'adressfrom', edAdressFrom.Text);
      vPassword := EncryptMsg(vPassword, Length(vPassword));
      vControl.WriteString('emails', 'password', vPassword);
      vControl.WriteString('emails', 'namefrom', edFrom.Text);
      vControl.WriteString('emails', 'door', edPorta.Text);
      //e-mail - provedor
      vControl.WriteString('provedor', 'authtype', cbAuthType.Value);
      vControl.WriteString('provedor', 'sslmethod', cbSSLMethod.Value);
      vControl.WriteString('provedor', 'sslmode', cbSSLMode.Value);
      vControl.WriteString('provedor', 'usetls', cbUseTLS.Value);
      //Código de barras
      //PV
      vControl.WriteString('CodBar', 'PV', cbCodBarPV.Value);
      vgCodBarPV := cbCodBarPV.Value;
      vControl.Free;
      MessageDlg('Arquivo ini alterado com sucesso!' + #13 + 'É necessário reiniciar o Sistema para as alterações surtirem efeito!', mtInformation, [mbOk], 0);
      Close;
    except
      MessageDlg('Erros ao gravar arquivo ini!', mtError, [mbOk], 0);
      Close;
    end;
  end;
end;

end.
