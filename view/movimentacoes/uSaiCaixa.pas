unit uSaiCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormalMov, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, wwdbdatetimepicker, Vcl.Mask,
  Vcl.DBCtrls, wwdblook, Vcl.ComCtrls;

type
  TfrmSaiCaixa = class(TfrmTmpFormNormalMov)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cbConta: TwwDBLookupCombo;
    cbPlanoContas: TwwDBLookupCombo;
    Label3: TLabel;
    Label4: TLabel;
    dbDescricao: TDBEdit;
    Label5: TLabel;
    dbDocumento: TDBEdit;
    Label6: TLabel;
    dbValor: TDBEdit;
    btLancar: TBitBtn;
    dtpData: TDateTimePicker;
    function TestaCampos: Boolean;
    procedure Limpar;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btLancarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSaiCaixa: TfrmSaiCaixa;

implementation

{$R *.dfm}

uses dataFinanceiro, dataLookups, uDaoCaixa, uVarGlobal, uFuncoesDB;

function TfrmSaiCaixa.TestaCampos: Boolean;
Var
vTeste: Boolean;
begin
  vTeste := True;
  if ((cbConta.Text = '') or (cbConta.Text = ' ')) then
  begin
    MessageDlg('O campo "Conta" é obrigatório!', mtWarning, [mbok], 0);
    vTeste := False;
  end;
  if ((cbPlanoContas.Text = '') or (cbPlanoContas.Text = ' ')) then
  begin
    MessageDlg('O campo "Plano de Contas" é obrigatório!', mtWarning, [mbok], 0);
    vTeste := False;
  end;
  if ((dbDocumento.Text = '') or (dbDocumento.Text = ' ')) then
  begin
    MessageDlg('O campo "Documento" é obrigatório!', mtWarning, [mbok], 0);
    vTeste := False;
  end;
  if ((dbValor.Text = '') or (dbValor.Text = ' ')) then
  begin
    MessageDlg('O campo "Valor" é obrigatório!', mtWarning, [mbok], 0);
    vTeste := False;
  end;
  Result := vTeste;
end;

procedure TfrmSaiCaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

procedure TfrmSaiCaixa.Limpar;
begin
  InsCaixa;
  dtpData.Date := GetDateServerPG;
  dsMovimento.DataSet.FieldByName('cai_data').Value := now;
  cbConta.Text := dmLookups.qyLkContasCON_DESCRICAO.Text;
  cbConta.PerformSearch;
  cbPlanoContas.Text := dmLookups.qyLkPlanoContasSaiPLC_DESCRICAO.Text;
  cbPlanoContas.PerformSearch;
  dtpData.SetFocus;
end;

procedure TfrmSaiCaixa.btLancarClick(Sender: TObject);
begin
  if TestaCampos = True then
  begin
    dsMovimento.DataSet.FieldByName('cai_id').Value := vgIDCaixa;
    dsMovimento.DataSet.FieldByName('cai_data').Text := FormatDateTime('dd/MM/yyyy', dtpData.Date);
    dsMovimento.DataSet.FieldByName('cai_dataefet').Text := FormatDateTime('dd/MM/yyyy', dtpData.Date);
    dsMovimento.DataSet.FieldByName('con_codigo').Value := dmLookups.qyLkContasCON_CODIGO.Value;
    dsMovimento.DataSet.FieldByName('plc_codigo').Value := dmLookups.qyLkPlanoContasSaiPLC_CODIGO.Value;
    if dsMovimento.DataSet.FieldByName('cai_valor').Value > 0 then
      dsMovimento.DataSet.FieldByName('cai_valor').Value := dsMovimento.DataSet.FieldByName('CAI_VALOR').Value * -1;
    dsMovimento.DataSet.FieldByName('usu_codigo').Text := vgCodUsuarioLog;
    PostCaixa;
    if MessageDlg('Lançamento efetuado com sucesso!' + #13 + 'Deseja efetuar outro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Limpar
    else
      Close;
  end;
end;

procedure TfrmSaiCaixa.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

end.
