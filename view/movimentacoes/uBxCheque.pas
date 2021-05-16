unit uBxCheque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Vcl.Mask, Vcl.DBCtrls, wwdblook, uClasscaixa;

type
  TfrmBxCheque = class(TfrmTmpFormNormal)
    dsConsulta: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dbTitular: TDBEdit;
    dbBanco: TDBEdit;
    dbAgencia: TDBEdit;
    dbConta: TDBEdit;
    dbNumero: TDBEdit;
    dbValor: TDBEdit;
    btAlterar: TBitBtn;
    dbVencimento: TDBEdit;
    Label8: TLabel;
    cbProcura: TwwDBLookupCombo;
    Label9: TLabel;
    edDestino: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cbProcuraExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBxCheque: TfrmBxCheque;

implementation

{$R *.dfm}

uses dataConsultas, uDaoCheques, dataLookups, uDaoCaixa, uFuncoesDB, uVarGlobal;

procedure TfrmBxCheque.btAlterarClick(Sender: TObject);
Var
vCaixa: TCaixa;
begin
  FiltrarCheques('chq_lancamento', '=', IntToStr(dsConsulta.DataSet.FieldByName('chq_lancamento').Value), '0');
  // Caso necessário lança na conta --------------------------------------------
  if ((cbProcura.Text <> '') and (cbProcura.Text <> ' ')) then
  begin
    vCaixa := TCaixa.Create;
    vCaixa.Codigo := 0;
    vCaixa.ID := 0; // Saindo da conta cheques = 0
    vCaixa.CodConta := dmLookups.qyLkContasCON_CODIGO.Value; // Caso seja depositado
    vCaixa.Descricao := 'Depósito em cheque recebido';
    vCaixa.Numdoc := dsConsulta.DataSet.FieldByName('chq_valor').Value;
    vCaixa.Valor := dsConsulta.DataSet.FieldByName('chq_valor').Value;
    vCaixa.CodPlano := 4;
    vCaixa.CodUsuario := StrToInt(vgCodUsuarioLog);
    vCaixa.Data := GetDateServerPG;
    vCaixa.DataEfet := vCaixa.Data;
    vCaixa.CodPag := 0;
    vCaixa.CodRec := 0;
    vCaixa.CodMdc := '0';
    InsCaixa;
    SetValuesCaixa(vCaixa);
    PostCaixa;
    vCaixa.Free;
  end;
  // Baixa o cheque ------------------------------------------------------------
  EdtCheques;
  SetStatusChq(3);
  PostCheques;
  MessageDlg('Cheque baixado com sucesso!', mtInformation, [mbOk], 0);
  Close;
end;

procedure TfrmBxCheque.cbProcuraExit(Sender: TObject);
begin
  if ((cbProcura.Text <> '') or (cbProcura.Text <> ' ')) then
    edDestino.Text := dmLookups.qyLkContasBAN_CODIGO.Text + ' - ' +
                      dmLookups.qyLkContasCON_DESCRICAO.Text;
end;

procedure TfrmBxCheque.FormActivate(Sender: TObject);
begin
  inherited;
  edDestino.Clear;
  dsConsulta.DataSet.Active := True;
  cbProcura.Text := '';
  cbProcura.PerformSearch;
  cbProcura.SetFocus;
end;

procedure TfrmBxCheque.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

end.
