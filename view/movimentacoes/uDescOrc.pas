unit uDescOrc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons;

type
  TfrmDescOrc = class(TfrmTmpFormNormal)
    Label1: TLabel;
    edSubTotal: TEdit;
    Label2: TLabel;
    edDescP: TEdit;
    Label3: TLabel;
    edVlrDesc: TEdit;
    Label4: TLabel;
    edVlrLiq: TEdit;
    btGravar: TBitBtn;
    procedure Calcular(vfTipo: String);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure edDescPKeyPress(Sender: TObject; var Key: Char);
    procedure edVlrDescKeyPress(Sender: TObject; var Key: Char);
    procedure edDescPExit(Sender: TObject);
    procedure edVlrDescExit(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDescOrc: TfrmDescOrc;
  vlDescMax: Real;
  vlMgMin: Real;
  vlCusto: Real;

implementation

{$R *.dfm}

uses uDaoOrcamentos, uVarGlobal, uFuncoesFormatacao, uDaoConfig, uSenhaDescOrcTot,
  uSenhaMgMin;

procedure TfrmDescOrc.btGravarClick(Sender: TObject);
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
    EdtOrcamentos;
    SetDescP(vPercDesc);
    SetDescVlr(vVlrDesc);
    SetVlrLiq(vTotal);
    SetMargem(vMargem);
    PostOrcamentos;
    Close;
  end
  else
    MessageDlg('Não foi possível liberar a venda!' + #13 +
               'Por favor verifique os descontos!', mtWarning, [mbOk], 0);
end;

procedure TfrmDescOrc.Calcular(vfTipo: String);
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
  end;
  if vfTipo = 'D' then
  begin
    vVlrDesc := StrToFloat(LimpaReal(edVlrDesc.Text));
    vTotal := vBruto - vVlrDesc;
    vPercDesc := (vVlrDesc / vBruto) * 100;
    edVlrLiq.Text := FormatFloat(vgMaskReal, vTotal);
    edDescP.Text := FormatFloat('#0.0', vPercDesc);
    if vPercDesc > vlDescMax then
      MessageDlg('O desconto concedido é maior que o % máximo (' + FormatFloat('#0.0', vlDescMax) + ' %)!',  mtInformation, [mbOk], 0);
  end;
end;

procedure TfrmDescOrc.edDescPExit(Sender: TObject);
begin
  inherited;
  edDescP.Text := FormatFloat('#0.0', StrToFloat(LimpaReal(edDescP.Text)));
  Calcular('P');
end;

procedure TfrmDescOrc.edDescPKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := NumeroReal(key);
end;

procedure TfrmDescOrc.edVlrDescExit(Sender: TObject);
begin
  inherited;
  edVlrDesc.Text := FormatFloat(vgMaskReal, StrToFloat(LimpaReal(edVlrDesc.Text)));
  Calcular('D');
end;

procedure TfrmDescOrc.edVlrDescKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := NumeroReal(key);
end;

procedure TfrmDescOrc.FormActivate(Sender: TObject);
begin
  vlDescMax := GetDescMax;
  vlMgMin := GetMgMin;
  edSubTotal.Clear;
  edDescP.Clear;
  edVlrDesc.Clear;
  edVlrLiq.Clear;
  inherited;
  vlCusto := GetCusto;
  edSubTotal.Text := FormatFloat(vgMaskReal, GetSubtotal);
  edDescP.Text := FormatFloat(vgMaskReal, GetDescP);
  edVlrDesc.Text := FormatFloat(vgMaskReal, GetDescVlr);
  edVlrLiq.Text := FormatFloat(vgMaskReal, GetVlrTot);
  edDescP.SetFocus;
end;

procedure TfrmDescOrc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

end.
