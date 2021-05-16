unit uNewComandaItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, vcl.wwdblook, System.Actions, Vcl.ActnList;

type
  TfrmNewComandaItem = class(TfrmTmpFormNormal)
    Label1: TLabel;
    Label2: TLabel;
    btConfirmar: TBitBtn;
    edComanda: TEdit;
    edMesa: TEdit;
    Label5: TLabel;
    edQuantidade: TEdit;
    Label6: TLabel;
    edCodigo: TEdit;
    Label7: TLabel;
    cbProduto: TwwDBLookupCombo;
    Label8: TLabel;
    edVlrUnit: TEdit;
    Label9: TLabel;
    edVlrDesc: TEdit;
    Label10: TLabel;
    edPDesc: TEdit;
    Label11: TLabel;
    edVlrLiq: TEdit;
    Label12: TLabel;
    edVlrTot: TEdit;
    ActionList: TActionList;
    actInserir: TAction;
    procedure Limpar;
    procedure VerifDesc;
    procedure CalcularLiquido;
    procedure CalcularTotal;
    procedure CalcularPercentual;
    procedure CalcularDesconto;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actInserirExecute(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure cbProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edPDescExit(Sender: TObject);
    procedure edPDescKeyPress(Sender: TObject; var Key: Char);
    procedure edVlrDescKeyPress(Sender: TObject; var Key: Char);
    procedure edVlrDescExit(Sender: TObject);
    procedure cbProdutoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNewComandaItem: TfrmNewComandaItem;

implementation

{$R *.dfm}

uses uVarGlobal, dataLookups, uDaoProdutos, uFuncoesFormatacao, uSenhaDescItem,
  uSenhaMgOrc, uClassComandasitens, uDaoComandasItens;

procedure TfrmNewComandaItem.Limpar;
begin
  edComanda.Text := vgComanda;
  edMesa.Text := vgMesa;
  edQuantidade.Text := '1';
  edCodigo.Clear;
  cbProduto.Text := '';
  cbProduto.PerformSearch;
  edVlrUnit.Text := '0,00';
  edVlrDesc.Text := '0,00';
  edPDesc.Text := '0,000';
  edVlrLiq.Text := '0,00';
  edVlrTot.Text := '0,00';
  edCodigo.SetFocus;
end;

procedure TfrmNewComandaItem.VerifDesc;
Var
vPercMax, vMgMin: Real;
vVlrDesc, vVlrBrt, vVlrLiq: Real;
vPercDes, vCusto, vMargem: Real;
begin
  vgVarLibItem := true;
  vgVarLib := true;
  vPercMax := GetDescMax(StrToInt(edCodigo.Text));
  vMgMin := GetMgMin(StrToInt(edCodigo.Text));
  vVlrBrt := StrToFloat(LimpaReal(edVlrUnit.Text));
  vVlrDesc := StrToFloat(LimpaReal(edVlrDesc.Text));
  vVlrLiq := StrToFloat(LimpaReal(edVlrLiq.Text));
  vPercDes := ((((vVlrLiq / vVlrBrt) - 1) * 100) * -1);
  //Verifica desconto máximo
  if vPercMax <> 0 then
    if vPercDes > vPercMax then
      frmSenhaDescItem.ShowModal;
  //Verifica margem mínima
  if vMgMin <> 0 then
  begin
    vCusto := GetCustoProd;
    vMargem := (((vVlrLiq / vCusto) - 1) * 100);
    if vMargem < vMgMin then
      frmSenhaMgOrc.ShowModal;
  end;
  if vVlrDesc > vVlrBrt then
  begin
    MessageDlg('O valor do desconto não pode ser maior que o Valor bruto!', mtWarning, [mbOk], 0);
    vgVarLibItem := False;
  end;
  if ((vgVarLibItem = false) or (vgVarLib = false)) then
  begin
    MessageDlg('Não foi possível liberar o desconto!', mtWarning, [mbOk], 0);
    edVlrDesc.Text := '0,00';
    edPDesc.Text := '0,000';
    CalcularLiquido;
    CalcularTotal;
  end;
end;

procedure TfrmNewComandaItem.CalcularTotal;
Var
vQuant, vVlrLiq, vVlrTotal: real;
begin
  if ((edQuantidade.Text <> '') and (edQuantidade.Text <> ' ')) then
    vQuant := StrToFloat(LimpaReal(edQuantidade.Text))
  else
    vQuant := 1;
  if ((edVlrLiq.Text <> '') and (edVlrLiq.Text <> ' ')) then
    vVlrLiq := StrToFloat(LimpaReal(edVlrLiq.Text))
  else
    vVlrLiq := 0;
  vVlrTotal := vQuant * vVlrLiq;
  edVlrTot.Text := FormatFloat(vgMaskReal, vVlrTotal);
end;

procedure TfrmNewComandaItem.cbProdutoExit(Sender: TObject);
begin
  if ((cbProduto.Text <> '') and (cbProduto.Text <> ' ')) then
  begin
    if ((edCodigo.Text = '') or (edCodigo.Text = ' ')) then
      edCodigo.Text := '0';
    if dmLookups.qyLkProdutosVendapro_codigo.Value <> StrToInt(edCodigo.Text) then
    begin
      edCodigo.Text := IntToStr(dmLookups.qyLkProdutosVendapro_codigo.Value);
      FiltrarProdutos('pro_codigo', '=', edCodigo.Text, '0');
      // Preço de varejo
      edVlrUnit.Text := FormatFloat(vgMaskReal, (GetTab2Prod));
      edVlrLiq.Text := edVlrUnit.Text;
      CalcularTotal;
    end;
    edVlrDesc.SetFocus;
  end
  else
    MessageDlg('É necessário selecionar um produto ou serviço!', mtWarning, [mbOk], 0);
end;

procedure TfrmNewComandaItem.cbProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if ((cbProduto.Text <> '') and (cbProduto.Text <> ' ')) then
    begin
      if ((edCodigo.Text = '') or (edCodigo.Text = ' ')) then
        edCodigo.Text := '0';
      if dmLookups.qyLkProdutospro_codigo.Value <> StrToInt(edCodigo.Text) then
      begin
        edCodigo.Text := IntToStr(dmLookups.qyLkProdutospro_codigo.Value);
        FiltrarProdutos('pro_codigo', '=', edCodigo.Text, '0');
        // Preço de varejo
        edVlrUnit.Text := FormatFloat(vgMaskReal, (GetTab2Prod));
        edVlrLiq.Text := edVlrUnit.Text;
        CalcularTotal;
      end;
      edVlrDesc.SetFocus;
    end
    else
      MessageDlg('É necessário selecionar um produto ou serviço!', mtWarning, [mbOk], 0);
  end;
end;

procedure TfrmNewComandaItem.edCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if ((edCodigo.Text <> '') and (edCodigo.Text <> ' ')) then
    begin
      if FiltrarProdutosCodBar(edCodigo.Text, 1) = true then
      begin
        cbProduto.Text := GetDescProd;
        cbProduto.PerformSearch;
        // Preço de varejo
        edVlrUnit.Text := FormatFloat(vgMaskReal, (GetTab2Prod));
      end;
      edVlrLiq.Text := edVlrUnit.Text;
      CalcularTotal;
      cbProduto.SetFocus;
    end
    else
      cbProduto.SetFocus;
  end;
end;

procedure TfrmNewComandaItem.edPDescExit(Sender: TObject);
var
vVlrUnit: real;
begin
  vVlrUnit := StrToFloat(LimpaReal(edVlrUnit.Text));
  if vVlrUnit > 0 then
  begin
    if ((edPDesc.Text = '') or (edPDesc.Text = ' ')) then
      edPDesc.Text := '0,0';
    edPDesc.Text := FormatFloat('#0.000', StrToFloat(LimpaReal(edPDesc.Text)));
    CalcularDesconto;
    CalcularLiquido;
    CalcularTotal;
    VerifDesc;
  end
  else
    MessageDlg('Verifique o valor do produto selecionado!', mtWarning, [mbOk], 0);
end;

procedure TfrmNewComandaItem.edPDescKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btConfirmar.SetFocus;
end;

procedure TfrmNewComandaItem.edVlrDescExit(Sender: TObject);
var
vVlrUnit: real;
begin
  vVlrUnit := StrToFloat(LimpaReal(edVlrUnit.Text));
  if vVlrUnit > 0 then
  begin
    if ((edVlrDesc.Text = '') or (edVlrDesc.Text = ' ')) then
      edVlrDesc.Text := '0,00';
    edVlrDesc.Text := FormatFloat(vgMaskReal, StrToFloat(LimpaReal(edVlrDesc.Text)));
    CalcularPercentual;
    CalcularLiquido;
    CalcularTotal;
    VerifDesc;
  end
  else
    MessageDlg('Verifique o valor do produto selecionado!', mtWarning, [mbOk], 0);
end;

procedure TfrmNewComandaItem.edVlrDescKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    edPDesc.SetFocus;
end;

procedure TfrmNewComandaItem.actInserirExecute(Sender: TObject);
Var
vComandaItem: TComandasitens;
begin
  btConfirmar.SetFocus;
  FiltrarProdutos('pro_codigo', '=', LimpaReal(edCodigo.Text), '0');
  vComandaItem := TComandasitens.Create;
  vComandaItem.Codigo := 0;
  vComandaItem.Codcomanda := StrToInt(edComanda.Text);
  vComandaItem.Quantidade := StrToFloat(LimpaReal(edQuantidade.Text));
  vComandaItem.Codproduto := StrToInt(edCodigo.Text);
  vComandaItem.Vlrunitario := StrToFloat(LimpaReal(edVlrLiq.Text));
  vComandaItem.VlrCustoTotal := GetCustoProd;
  vComandaItem.Vlrtotal := StrToFloat(LimpaReal(edVlrTot.Text));;
  vComandaItem.Prevenda := 0;
  if vComandaItem.Vlrunitario > 0 then
  begin
    InsComandasItens;
    SetValuesComandasItens(vComandaItem);
    PostComandasItens;
  end
  else
    MessageDlg('Não foi possível inserir o produto devido ao valor unitário zerado!',
               mtWarning, [mbOK], 0);
  vComandaItem.Free;
  Close;
end;

procedure TfrmNewComandaItem.btConfirmarClick(Sender: TObject);
var
vVlrUnit: real;
begin
  vVlrUnit := StrToFloat(LimpaReal(edVlrUnit.Text));
  if vVlrUnit > 0 then
  begin
    actInserir.Execute;
  end
  else
    MessageDlg('Verifique o valor do produto selecionado!', mtWarning, [mbOk], 0);
end;

procedure TfrmNewComandaItem.CalcularPercentual;
Var
vVlrUnit, vVlrDesc, vPercDesc, vCalc: real;
begin
  vVlrUnit := StrToFloat(LimpaReal(edVlrUnit.Text));
  vVlrDesc := StrToFloat(LimpaReal(edVlrDesc.Text));
  vPercDesc := StrToFloat(LimpaReal(edPDesc.Text));
  vCalc := (vVlrDesc / vVlrUnit) * 100;
  if vCalc <> vPercDesc then
    edPDesc.Text := FormatFloat('#0.000', vCalc);
end;

procedure TfrmNewComandaItem.CalcularDesconto;
Var
vVlrUnit, vVlrDesc, vPercDesc, vCalc: real;
begin
  vVlrUnit := StrToFloat(LimpaReal(edVlrUnit.Text));
  vVlrDesc := StrToFloat(LimpaReal(edVlrDesc.Text));
  vPercDesc := StrToFloat(LimpaReal(edPDesc.Text));
  vCalc := (vVlrUnit * vPercDesc) / 100;
  if vCalc <> vVlrDesc then
    edVlrDesc.Text := FormatFloat(vgMaskReal, vCalc);
end;

procedure TfrmNewComandaItem.CalcularLiquido;
Var
vVlrUnit, vVlrDesc, vVlrLiq: real;
begin
  vVlrUnit := StrToFloat(LimpaReal(edVlrUnit.Text));
  vVlrDesc := StrToFloat(LimpaReal(edVlrDesc.Text));
  vVlrLiq := vVlrUnit - vVlrDesc;
  edVlrLiq.Text := FloatToStrF((vVlrLiq), fffixed, 10, 2);
end;

procedure TfrmNewComandaItem.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmNewComandaItem.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

end.
