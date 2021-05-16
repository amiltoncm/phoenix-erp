unit uConfBxPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormalMov, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids,
  wwDataInspector, wwrcdpnl, wwdbdatetimepicker, wwdblook;

type
  TfrmConfBxPagar = class(TfrmTmpFormNormalMov)
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
    procedure edValorExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfBxPagar: TfrmConfBxPagar;

implementation

{$R *.dfm}

uses dataFinanceiro, dataLookups, uFuncoesFormatacao, uClassCaixa, uClassPagar,
  uDaoPagar, uDaoCaixa, uVarGlobal;

procedure TfrmConfBxPagar.btBaixarClick(Sender: TObject);
Var
vDescricao: String;
vPagoAnt, vAcrescimo, vSaldo, vPago, vValor, vDesconto: Currency;
vCaixa: TCaixa;
vPagar: TPagar;
begin
  vDescricao := dmFinanceiro.qyPagarPES_NOME.Text;
  vPagoAnt := dmFinanceiro.qyPagarPAG_PAGO.Value;
  vValor := dmFinanceiro.qyPagarPAG_SALDO.Value;
  vPago := StrToFloat(LimpaReal(edValor.Text));
  vCaixa := TCaixa.Create;
  vCaixa.ID := vgIDCaixa;
  vCaixa.Valor := StrToFloat('-' + LimpaReal(edValor.Text));
  vCaixa.CodPlano := dmLookups.qyLkPlanoContasSaiPLC_CODIGO.Value;
  vCaixa.CodConta := dmLookups.qyLkContasCON_CODIGO.Value;
  vPagar := TPagar.Create;
  vPagar.Valor := dmFinanceiro.qyPagarPAG_VALOR.Value;
  vPagar.Acrescimo := dmFinanceiro.qyPagarPAG_ACRESCIMO.Value;
  vPagar.Desconto := dmFinanceiro.qyPagarPAG_DESCONTO.Value;
  vPagar.Pago := dmFinanceiro.qyPagarPAG_PAGO.Value;
  vPagar.Saldo := dmFinanceiro.qyPagarPAG_SALDO.Value;
  vPagar.StaCodigo := dmFinanceiro.qyPagarSTA_CODIGO.Value;
  //Se o Saldo for igual ao Pago -----------------------------------------------
  if vValor = vPago Then
  Begin
    vPagar.Pago := vPago + vPagoAnt;
    vPagar.Saldo := 0;
    vPagar.StaCodigo := 2; //Pago
  end
  else
    //Se o Valor for menor ao Pago -----------------------------------------------
    if vValor < vPago then
    Begin
      if Messagedlg('O valor pago é maior que o saldo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Begin
        vAcrescimo := vPago - vValor;
        vPagar.Saldo := 0;
        vPagar.Pago := vPago + vPagoAnt;
        vPagar.Acrescimo := vAcrescimo;
        vPagar.StaCodigo := 2;  //Pago
      end
      else
      Begin
        vPagar.Pago := vValor + vPagoAnt;
        vPagar.Saldo := 0;
        vPagar.StaCodigo := 2; //Pago
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
          vPagar.Saldo := vSaldo;
          vPagar.Pago := vPago + vPagoAnt;
          if vSaldo <= 0 then
            vPagar.StaCodigo := 2; //Saldo
        end
        else
        Begin
          vDesconto := vValor - vPago;
          vPagar.Desconto := vDesconto;
          vPagar.Pago := vPago + vPagoAnt;
          vPagar.Saldo := 0;
          vPagar.StaCodigo := 2; //Pago
        end;
      end;
  EdtPagar;
  SetValuesPgto(vPagar);
  PostPagar;
  InsCaixa;
  vCaixa.Numdoc := dsMovimento.DataSet.FieldByName('pag_numero').Value;
  vCaixa.Data := edDtPagamento.Date;
  vCaixa.DataEfet := edDtPagamento.Date;
  vCaixa.Descricao := vDescricao;
  vCaixa.CodPag := dsMovimento.DataSet.FieldByName('pag_codigo').Value;
  vCaixa.CodRec := 0;
  vCaixa.CodMdc := dsMovimento.DataSet.FieldByName('pag_modelo').Value;
  SetValuesCaixa(vCaixa);
  PostCaixa;
  vCaixa.Free;
  vPagar.Free;
  dmFinanceiro.qyPagar.Refresh;
  Close;
end;

procedure TfrmConfBxPagar.edValorExit(Sender: TObject);
Var
vValorReal: Real;
begin
  if (edValor.Text <> '') and (edValor.Text <> ' ') then
  begin
    vValorReal := StrToFloat(LimpaReal(edValor.Text));
    edValor.Text := FormatFloat(vgMaskReal, vValorReal);
  end
  else
    edValor.Text := '0,00';
end;

procedure TfrmConfBxPagar.edValorKeyPress(Sender: TObject; var Key: Char);
begin
  Key := NumeroReal(Key);
end;

procedure TfrmConfBxPagar.FormActivate(Sender: TObject);
begin
  dsMovimento.DataSet.Active := true;
  dsMovimento.DataSet.Edit;
  edValor.Text := dsMovimento.DataSet.FieldByName('PAG_SALDO').Text;
  edDtPagamento.Date := now;
  cbConta.Text := dmLookups.qyLkContasCON_DESCRICAO.Text;
  cbConta.PerformSearch;
  cbPlanoContas.Text := 'PAG. FORNECEDOR';
  cbPlanoContas.PerformSearch;
  edValor.SetFocus;
end;

end.
