unit uDescPrev;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons;

type
  TfrmDescPrev = class(TfrmTmpFormNormal)
    Label1: TLabel;
    edSubTotal: TEdit;
    Label2: TLabel;
    edDescP: TEdit;
    Label3: TLabel;
    edVlrDesc: TEdit;
    Label4: TLabel;
    edVlrLiq: TEdit;
    btGravar: TBitBtn;
    Label5: TLabel;
    edRecebido: TEdit;
    Label6: TLabel;
    edTroco: TEdit;
    procedure Calcular(vfTipo: String);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure edDescPKeyPress(Sender: TObject; var Key: Char);
    procedure edVlrDescKeyPress(Sender: TObject; var Key: Char);
    procedure edDescPExit(Sender: TObject);
    procedure edVlrDescExit(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure edRecebidoKeyPress(Sender: TObject; var Key: Char);
    procedure edRecebidoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDescPrev: TfrmDescPrev;
  vlDescMax: Real;
  vlMgMin: Real;
  vlCusto: Real;

implementation

{$R *.dfm}

uses uVarGlobal, uFuncoesFormatacao, uDaoConfig, uSenhaDescOrcTot, uSenhaMgMin,
     uDaoPrevendas;

procedure TfrmDescPrev.btGravarClick(Sender: TObject);
Var
vVarLib: Boolean;
vVlrDesc: Real;
vPercDesc: Real;
vMargem: Real;
vTotal: Real;
begin
  //Verifica desconto máximo
  vgVarLib := True;
  vVlrDesc := StrToFloat(LimpaReal(edVlrDesc.Text));
  vPercDesc := StrToFloat(LimpaReal(edDescP.Text));
  vTotal := StrToFloat(LimpaReal(edVlrLiq.Text));
  vMargem := (((vTotal / vlCusto) - 1) * 100);
  if vPercdesc > vlDescMax then
    frmSenhaDescOrcTot.ShowModal;
  if vMargem < vlMgMin then
    frmSenhaMgMin.ShowModal;
  if vgVarLib = True then
  begin
    EdtPrevendas;
    SetDescPPV(vPercDesc);
    SetDescVlrPV(vVlrDesc);
    SetVlrLiqPV(vTotal);
    SetMargemPV(vMargem);
    PostPrevendas;
    Close;
  end
  else
    MessageDlg('Não foi possível liberar a venda!' + #13 +
               'Por favor verifique os descontos!', mtWarning, [mbOk], 0);
end;

procedure TfrmDescPrev.Calcular(vfTipo: String);
Var
vBruto, vPercDesc, vVlrDesc, vTotal: Real;
begin
  vBruto := StrToFloat(LimpaReal(edSubTotal.Text));
  if vfTipo = 'P' then
  begin
    vPercDesc := StrToFloat(LimpaReal(edDescP.Text));
    if vPercDesc > vlDescMax then
      MessageDlg('O desconto concedido é maior que o % máximo (' + FormatFloat('#0.0', vlDescMax) + ' %)!',  mtInformation, [mbOk], 0);
    vVlrDesc := vBruto * (vPercDesc / 100);
    vTotal := vBruto - vVlrDesc;
    edVlrDesc.Text := FormatFloat(vgMaskReal, vVlrDesc);
    edVlrLiq.Text := FormatFloat(vgMaskReal, vTotal);
    edRecebido.Text := edVlrLiq.Text;
  end;
  if vfTipo = 'D' then
  begin
    vVlrDesc := StrToFloat(LimpaReal(edVlrDesc.Text));
    vTotal := vBruto - vVlrDesc;
    vPercDesc := (vVlrDesc / vBruto) * 100;
    edVlrLiq.Text := FormatFloat(vgMaskReal, vTotal);
    edRecebido.Text := edVlrLiq.Text;
    edDescP.Text := FormatFloat('#0.0', vPercDesc);
    if vPercDesc > vlDescMax then
      MessageDlg('O desconto concedido é maior que o % máximo (' + FormatFloat('#0.0', vlDescMax) + ' %)!',  mtInformation, [mbOk], 0);
  end;
end;

procedure TfrmDescPrev.edDescPExit(Sender: TObject);
begin
  inherited;
  edDescP.Text := FormatFloat('#0.0', StrToFloat(LimpaReal(edDescP.Text)));
  Calcular('P');
end;

procedure TfrmDescPrev.edDescPKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := NumeroReal(key);
end;

procedure TfrmDescPrev.edRecebidoExit(Sender: TObject);
Var
vRecebido, vValor, vTroco: Real;
begin
  if ((edRecebido.Text = '') or (edRecebido.Text = ' ')) then
    edRecebido.Text := edVlrLiq.Text;
  edRecebido.Text := FormatFloat(vgMaskReal, StrToFloat(LimpaReal(edRecebido.Text)));
  vValor := StrToFloat(LimpaReal(edVlrLiq.Text));
  vRecebido := StrToFloat(LimpaReal(edRecebido.Text));
  vTroco := (vValor - vRecebido) * -1;
  edTroco.Text := FormatFloat(vgMaskReal, vTroco);
end;

procedure TfrmDescPrev.edRecebidoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := NumeroReal(key);
end;

procedure TfrmDescPrev.edVlrDescExit(Sender: TObject);
begin
  inherited;
  edVlrDesc.Text := FormatFloat(vgMaskReal, StrToFloat(LimpaReal(edVlrDesc.Text)));
  Calcular('D');
end;

procedure TfrmDescPrev.edVlrDescKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := NumeroReal(key);
end;

procedure TfrmDescPrev.FormActivate(Sender: TObject);
begin
  vlDescMax := GetDescMax;
  vlMgMin := GetMgMin;
  edSubTotal.Clear;
  edDescP.Clear;
  edVlrDesc.Clear;
  edVlrLiq.Clear;
  edRecebido.Text := '0,00';
  edTroco.Text := '0,00';
  inherited;
  vlCusto := GetCustoPV;
  edSubTotal.Text := FormatFloat(vgMaskReal, GetSubtotalPV);
  edDescP.Text := FormatFloat(vgMaskReal, GetDescPPV);
  edVlrDesc.Text := FormatFloat(vgMaskReal, GetDescVlrPV);
  edVlrLiq.Text := FormatFloat(vgMaskReal, GetVlrTotPV);
  edDescP.SetFocus;
end;

procedure TfrmDescPrev.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

end.
