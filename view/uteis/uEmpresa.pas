unit uEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormalMov, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, wwdblook;

type
  TfrmEmpresa = class(TfrmTmpFormNormalMov)
    Label1: TLabel;
    dbID: TDBEdit;
    Label2: TLabel;
    dbRazao: TDBEdit;
    Label3: TLabel;
    dbCNPJ: TDBEdit;
    Label4: TLabel;
    dbIe: TDBEdit;
    Label5: TLabel;
    dbInscMun: TDBEdit;
    Label6: TLabel;
    dbLogradouro: TDBEdit;
    Label7: TLabel;
    dbNumero: TDBEdit;
    Label8: TLabel;
    dbComplemento: TDBEdit;
    Label9: TLabel;
    dbBairro: TDBEdit;
    Label10: TLabel;
    dbCidade: TDBEdit;
    Label11: TLabel;
    dbUf: TDBEdit;
    Label12: TLabel;
    dbCep: TDBEdit;
    Label13: TLabel;
    dbFone: TDBEdit;
    Label14: TLabel;
    dbEmail: TDBEdit;
    Label15: TLabel;
    dbHomePage: TDBEdit;
    btGravar: TBitBtn;
    dbFantasia: TDBEdit;
    dbCodCidade: TDBEdit;
    dbCodPais: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    cbRegime: TwwDBLookupCombo;
    dbCodRegime: TDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    sbBuscaCep: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure dsMovimentoStateChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cbRegimeExit(Sender: TObject);
    procedure sbBuscaCepClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmpresa: TfrmEmpresa;

implementation

{$R *.dfm}

uses dataConfig, uDaoEmpresa, dataLookups, uVarGlobal, uFuncoesWeb, uBuscaCEP;

procedure TfrmEmpresa.btGravarClick(Sender: TObject);
begin
  PostEmpresa;
  MessageDlg('Alterações gravadas com sucesso!', mtInformation, [mbOk], 0);
  Close;
end;

procedure TfrmEmpresa.cbRegimeExit(Sender: TObject);
begin
  if dsMovimento.DataSet.State in [dsInsert, dsEdit] then
    dsMovimento.DataSet.FieldByName('REG_CODIGO').Value := dmLookups.qyLkRegimeREG_CODIGO.Value;
end;

procedure TfrmEmpresa.dsMovimentoStateChange(Sender: TObject);
begin
  if dsMovimento.DataSet.State in [dsEdit, dsInsert] then
    btGravar.Enabled := True
  else
    btGravar.Enabled := False;
end;

procedure TfrmEmpresa.FormActivate(Sender: TObject);
begin
  inherited;
  ListarEmpresa('0');
  if dmConfig.qyEmpresaEMP_CODIGO.IsNull then
  begin
    InsEmpresa;
    if vgBuscaCEP = 'S' then
      if ConectadoWeb = True then
        frmBuscaCEP.ShowModal;
  end;
  if vgBuscaCEP = 'S' then
    if ConectadoWeb = True then
      sbBuscaCep.Enabled := True
    else
      sbBuscaCep.Enabled := False;
  dbRazao.SetFocus;
end;

procedure TfrmEmpresa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

procedure TfrmEmpresa.sbBuscaCepClick(Sender: TObject);
begin
  if vgBuscaCEP = 'S' then
    if ConectadoWeb = True then
      frmBuscaCEP.ShowModal;
end;

end.
