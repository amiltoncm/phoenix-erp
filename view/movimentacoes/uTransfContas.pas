unit uTransfContas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormalMov, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, wwdblook, Vcl.ComCtrls, Vcl.Mask,
  Vcl.DBCtrls;

type
  TfrmTransfContas = class(TfrmTmpFormNormalMov)
    Panel1: TPanel;
    Label1: TLabel;
    cbContaDeb: TwwDBLookupCombo;
    Panel2: TPanel;
    Label2: TLabel;
    cbContaCred: TwwDBLookupCombo;
    Panel3: TPanel;
    Label3: TLabel;
    dtpData: TDateTimePicker;
    Label4: TLabel;
    Edit1: TEdit;
    edValor: TEdit;
    btTransferir: TBitBtn;
    function TestaCampos: Boolean;
    procedure Limpar;
    procedure FormActivate(Sender: TObject);
    procedure edValorKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btTransferirClick(Sender: TObject);
    procedure edValorExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTransfContas: TfrmTransfContas;

implementation

{$R *.dfm}

uses dataFinanceiro, dataLookups, uDaoCaixa, uFuncoesFormatacao, uVarGlobal,
  uFuncoesDB;

function TfrmTransfContas.TestaCampos: Boolean;
Var
vTeste: Boolean;
begin
  vTeste := True;
  if ((cbContaDeb.Text = '') or (cbContaDeb.Text = ' ')) then
  begin
    MessageDlg('O campo "Conta de Débito" é obrigatório!', mtWarning, [mbOk], 0);
    vTeste := False;
  end;
  if ((cbContaCred.Text = '') or (cbContaCred.Text = ' ')) then
  begin
    MessageDlg('O campo "Conta de Crédito" é obrigatório!', mtWarning, [mbOk], 0);
    vTeste := False;
  end;
  if ((edValor.Text = '') or (edValor.Text = ' ')) then
  begin
    MessageDlg('O campo "Valor" é obrigatório!', mtWarning, [mbOk], 0);
    vTeste := False;
  end;
  Result := vTeste;
end;

procedure TfrmTransfContas.Limpar;
begin
  InsCaixa;
  dtpData.Date := GetDateServerPG;
  cbContaDeb.Text := dmLookups.qyLkContaDebCON_Descricao.Text;
  cbContaDeb.PerformSearch;
  cbContaCred.Text := dmLookups.qyLkContaCredCON_Descricao.Text;
  cbContaCred.PerformSearch;
  dtpData.Date := now;
  edValor.Clear;
  cbContaDeb.SetFocus;
end;

procedure TfrmTransfContas.btTransferirClick(Sender: TObject);
Var
vTransacao: Integer;
vValor: Currency;
begin
  if TestaCampos = True then
  begin
    vTransacao := GetNumTransf;
    vValor := StrToFloat(LimpaReal(edValor.Text));
    //Lança débito
    dsMovimento.DataSet.FieldByName('cai_id').Value := vgIDCaixa;
    dsMovimento.DataSet.FieldByName('cai_data').Text := FormatDateTime('dd/MM/yyyy', dtpData.Date);
    dsMovimento.DataSet.FieldByName('cai_dataefet').Text := FormatDateTime('dd/MM/yyyy', dtpData.Date);
    dsMovimento.DataSet.FieldByName('con_codigo').Value := dmLookups.qyLkContaDebCON_CODIGO.Value;
    dsMovimento.DataSet.FieldByName('plc_codigo').Value := 4;
    dsMovimento.DataSet.FieldByName('cai_valor').Value := vValor * -1;
    dsMovimento.DataSet.FieldByName('cai_numdoc').Value := vTransacao;
    dsMovimento.DataSet.FieldByName('cai_descricao').Value := 'TRANSFERÊNCIA ENTRE CONTAS (D)';
    dsMovimento.DataSet.FieldByName('usu_codigo').Text := vgCodUsuarioLog;
    PostCaixa;
    //Lança Crédito
    InsCaixa;
    dsMovimento.DataSet.FieldByName('cai_id').Value := vgIDCaixa;
    dsMovimento.DataSet.FieldByName('cai_data').Text := FormatDateTime('dd/MM/yyyy', dtpData.Date);
    dsMovimento.DataSet.FieldByName('cai_dataefet').Text := FormatDateTime('dd/MM/yyyy', dtpData.Date);
    dsMovimento.DataSet.FieldByName('con_codigo').Value := dmLookups.qyLkContaCredCON_CODIGO.Value;
    dsMovimento.DataSet.FieldByName('plc_codigo').Value := 5;
    dsMovimento.DataSet.FieldByName('cai_valor').Value := vValor;
    dsMovimento.DataSet.FieldByName('cai_numdoc').Value := vTransacao;
    dsMovimento.DataSet.FieldByName('cai_descricao').Value := 'TRANSFERÊNCIA ENTRE CONTAS (C)';
    dsMovimento.DataSet.FieldByName('usu_codigo').Text := vgCodUsuarioLog;
    PostCaixa;
    if MessageDlg('Transferência efetuada com sucesso!' + #13 + 'Deseja efetuar outra?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Limpar
    else
      Close;
  end;
end;

procedure TfrmTransfContas.edValorExit(Sender: TObject);
begin
  if edValor.Text <> '' then
    edValor.Text := FormatFloat(vgMaskReal, StrToFloat(LimpaReal(edValor.Text)));
end;

procedure TfrmTransfContas.edValorKeyPress(Sender: TObject; var Key: Char);
begin
  key := NumeroReal(key);
end;

procedure TfrmTransfContas.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmTransfContas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

end.
