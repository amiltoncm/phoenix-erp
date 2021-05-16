unit uConfBxReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormalMov, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids,
  wwDataInspector, wwrcdpnl, wwdbdatetimepicker, wwdblook;

type
  TfrmConfBxReceber = class(TfrmTmpFormNormalMov)
    btBaixar: TBitBtn;
    wwDataInspector1: TwwDataInspector;
    Label1: TLabel;
    edValor: TEdit;
    Label2: TLabel;
    cbConta: TwwDBLookupCombo;
    Label3: TLabel;
    edDtPagamento: TwwDBDateTimePicker;
    Label4: TLabel;
    cbPlanoContas: TwwDBLookupCombo;
    procedure FormActivate(Sender: TObject);
    procedure btBaixarClick(Sender: TObject);
    procedure edValorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfBxReceber: TfrmConfBxReceber;

implementation

{$R *.dfm}

uses dataFinanceiro, dataLookups, uFuncoesFormatacao, uClassCaixa, uClassReceber,
  uDaoReceber, uDaoCaixa, uVarGlobal;

procedure TfrmConfBxReceber.btBaixarClick(Sender: TObject);
Var
vDescricao: String;
vPagoAnt, vAcrescimo, vSaldo, vPago, vValor, vDesconto: Currency;
vCaixa: TCaixa;
vReceber: TReceber;
begin
  vDescricao := dmFinanceiro.qyReceberpes_nome.Text;
  vPagoAnt := dmFinanceiro.qyReceberrec_pago.Value;
  vValor := dmFinanceiro.qyReceberrec_saldo.Value;
  vPago := StrToFloat(LimpaReal(edValor.Text));
  vCaixa := TCaixa.Create;
  vCaixa.ID := vgIDCaixa;
  vCaixa.Valor := StrToFloat(LimpaReal(edValor.Text));
  vCaixa.CodPlano := dmLookups.qyLkPlanoContasEntPLC_CODIGO.Value;
  vCaixa.CodConta := dmLookups.qyLkContasCON_CODIGO.Value;
  vReceber := TReceber.Create;
  vReceber.Valor := dmFinanceiro.qyReceberrec_valor.Value;
  vReceber.Acrescimo := dmFinanceiro.qyReceberrec_acrescimo.Value;
  vReceber.Desconto := dmFinanceiro.qyReceberrec_desconto.Value;
  vReceber.Pago := dmFinanceiro.qyReceberrec_pago.Value;
  vReceber.Saldo := dmFinanceiro.qyReceberrec_saldo.Value;
  vReceber.Codstatus := dmFinanceiro.qyReceberSTA_CODIGO.Value;
  //Se o Saldo for igual ao Pago -----------------------------------------------
  if vValor = vPago Then
  Begin
    vReceber.Pago := vPago + vPagoAnt;
    vReceber.Saldo := 0;
    vReceber.Codstatus := 2; //Pago
  end
  else
    //Se o Valor for menor ao Pago -----------------------------------------------
    if vValor < vPago then
    Begin
      if Messagedlg('O valor pago é maior que o saldo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Begin
        vAcrescimo := vPago - vValor;
        vReceber.Saldo := 0;
        vReceber.Pago := vPago + vPagoAnt;
        vReceber.Acrescimo := vAcrescimo;
        vReceber.Codstatus := 2;  //Pago
      end
      else
      Begin
        vReceber.Pago := vValor + vPagoAnt;
        vReceber.Saldo := 0;
        vReceber.Codstatus := 2; //Pago
      end;
    end
    else
      //Se o Valor for maior ao Pago -----------------------------------------------
      if vValor > vPago Then
      Begin
        if Messagedlg('O valor pago é menor que o saldo!' + #13 + 'Deseja gravar saldo?',
                      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Begin
          vSaldo := vValor - vPago;
          vReceber.Saldo := vSaldo;
          vReceber.Pago := vPago + vPagoAnt;
          if vSaldo <= 0 then
            vReceber.Codstatus := 2; //Pago
        end
        else
        Begin
          vDesconto := vValor - vPago;
          vReceber.Desconto := vDesconto;
          vReceber.Pago := vPago + vPagoAnt;
          vReceber.Saldo := 0;
          vReceber.Codstatus := 2; //Pago
        end;
      end;
  EdtReceber;
  SetValuesRcto(vReceber);
  PostReceber;
  InsCaixa;
  vCaixa.Numdoc := dsMovimento.DataSet.FieldByName('rec_numero').Value;
  vCaixa.Data := edDtPagamento.Date;
  vCaixa.DataEfet := edDtPagamento.Date;
  vCaixa.Descricao := vDescricao;
  vCaixa.CodPag := 0;
  vCaixa.CodRec := dsMovimento.DataSet.FieldByName('rec_codigo').Value;
  vCaixa.CodMdc := dsMovimento.DataSet.FieldByName('mdc_codigo').Value;
  SetValuesCaixa(vCaixa);
  PostCaixa;
  vCaixa.Free;
  vReceber.Free;
  dmFinanceiro.qyReceber.Refresh;
  Close;
end;

procedure TfrmConfBxReceber.edValorKeyPress(Sender: TObject; var Key: Char);
begin
  Key := NumeroReal(Key);
end;

procedure TfrmConfBxReceber.FormActivate(Sender: TObject);
begin
  dsMovimento.DataSet.Active := true;
  dsMovimento.DataSet.Edit;
  edValor.Text := dsMovimento.DataSet.FieldByName('rec_saldo').Text;
  edDtPagamento.Date := now;
  cbConta.Text := dmLookups.qyLkContasCON_DESCRICAO.Text;
  cbConta.PerformSearch;
  cbPlanoContas.Text := 'REC. CLIENTE';
  cbPlanoContas.PerformSearch;
  edValor.SetFocus;
end;

end.
