unit uSelProdutoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, vcl.wwdblook, Data.DB, System.Actions, Vcl.ActnList;

type
  TfrmSelProdutoVenda = class(TfrmTmpFormNormal)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edQuantidade: TEdit;
    edCodigo: TEdit;
    cbProduto: TwwDBLookupCombo;
    edVlrUnit: TEdit;
    edVlrDesc: TEdit;
    edPDesc: TEdit;
    edVlrTot: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edVlrLiq: TEdit;
    Label8: TLabel;
    btConfirmar: TBitBtn;
    ActionList: TActionList;
    actInserir: TAction;
    procedure Limpar;
    procedure VerifDesc;
    procedure CalcularTotal;
    procedure CalcularPercentual;
    procedure CalcularDesconto;
    procedure CalcularLiquido;
    procedure FormActivate(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cbProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edVlrDescKeyPress(Sender: TObject; var Key: Char);
    procedure edPDescKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edVlrDescExit(Sender: TObject);
    procedure actInserirExecute(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure edPDescExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelProdutoVenda: TfrmSelProdutoVenda;

implementation

{$R *.dfm}

uses dataLookups, uDaoProdutos, uVarGlobal, uFuncoesFormatacao, uOrcamento,
  uDaoOrcItens, uClassOrcitens, uSenhaDescItem, uSenhaMgOrc, uPrevenda,
  uDaoPrevItens, uClassPrevitens, uSenhaDescItemPv, uSenhaMgPrev;

procedure TfrmSelProdutoVenda.Limpar;
begin
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

procedure TfrmSelProdutoVenda.VerifDesc;
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
    begin
      if frmOrcamento <> nil then
        if frmOrcamento.dsItens.DataSet.State in [dsInsert] then
          frmSenhaDescItem.ShowModal;
      if frmPrevenda <> nil then
        if frmPrevenda.dsItens.DataSet.State in [dsInsert] then
          frmSenhaDescItemPV.ShowModal;
    end;
  //Verifica margem mínima
  if vMgMin <> 0 then
  begin
    vCusto := GetCustoProd;
    vMargem := (((vVlrLiq / vCusto) - 1) * 100);
    if vMargem < vMgMin then
    begin
      if frmOrcamento <> nil then
        if frmOrcamento.dsItens.DataSet.State in [dsInsert] then
          frmSenhaMgOrc.ShowModal;
      if frmPrevenda <> nil then
        if frmPrevenda.dsItens.DataSet.State in [dsInsert] then
          frmSenhaMgPrev.ShowModal;
    end;
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

procedure TfrmSelProdutoVenda.CalcularTotal;
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

procedure TfrmSelProdutoVenda.CalcularPercentual;
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

procedure TfrmSelProdutoVenda.actInserirExecute(Sender: TObject);
Var
vOrcItem: TOrcItens;
vPrevItem: TPrevItens;
begin
  if frmOrcamento <> nil then
  begin
    if frmOrcamento.dsItens.DataSet.State in [dsInsert] then
    begin
      vOrcItem := TOrcitens.Create;
      vOrcItem.Codigo := 0;
      vOrcItem.Orcamento := vgNumOrc;
      vOrcItem.Quantidade := StrToFloat(edQuantidade.Text);
      vOrcItem.Codproduto := StrToInt(edCodigo.Text);
      vOrcItem.Vlrcusto := 0;
      vOrcItem.Vlrbruto := StrToFloat(LimpaReal(edVlrUnit.Text));
      vOrcItem.Vlrdesc := StrToFloat(LimpaReal(edVlrDesc.Text));
      vOrcItem.Percdesc := StrToFloat(LimpaReal(edPDesc.Text));
      vOrcItem.Vlrliq := StrToFloat(LimpaReal(edVlrLiq.Text));
      vOrcItem.Vlrtotal := StrToFloat(LimpaReal(edVlrTot.Text));
      vOrcItem.Margemperc := 0;
      SetValuesOrcItens(vOrcItem);
      PostOrcItens;
      vOrcItem.Free;
    end;
  end;
  if frmPrevenda <> nil then
  begin
    if frmPrevenda.dsItens.DataSet.State in [dsInsert] then
    begin
      vPrevItem := TPrevitens.Create;
      vPrevItem.Codigo := 0;
      vPrevItem.Numero := vgNumPev;
      vPrevItem.Quantidade := StrToFloat(edQuantidade.Text);
      vPrevItem.Codproduto := StrToInt(edCodigo.Text);
      vPrevItem.Vlrcusto := 0;
      vPrevItem.Vlrbruto := StrToFloat(LimpaReal(edVlrUnit.Text));
      vPrevItem.Vlrdesc := StrToFloat(LimpaReal(edVlrDesc.Text));
      vPrevItem.Percdesc := StrToFloat(LimpaReal(edPDesc.Text));
      vPrevItem.Vlrliq := StrToFloat(LimpaReal(edVlrLiq.Text));
      vPrevItem.Vlrtotal := StrToFloat(LimpaReal(edVlrTot.Text));
      vPrevItem.Permg := 0;
      SetValuesPrevItens(vPrevItem);
      PostPrevItens;
      vPrevItem.Free;
    end;
  end;
  Close;
end;

procedure TfrmSelProdutoVenda.btConfirmarClick(Sender: TObject);
begin
  actInserir.Execute;
end;

procedure TfrmSelProdutoVenda.CalcularDesconto;
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

procedure TfrmSelProdutoVenda.CalcularLiquido;
Var
vVlrUnit, vVlrDesc, vVlrLiq: real;
begin
  vVlrUnit := StrToFloat(LimpaReal(edVlrUnit.Text));
  vVlrDesc := StrToFloat(LimpaReal(edVlrDesc.Text));
  vVlrLiq := vVlrUnit - vVlrDesc;
  edVlrLiq.Text := FloatToStrF((vVlrLiq), fffixed, 10, 2);
end;

procedure TfrmSelProdutoVenda.cbProdutoKeyPress(Sender: TObject; var Key: Char);
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
        if frmOrcamento <> nil then
        begin
          if frmOrcamento.dsItens.DataSet.State in [dsInsert] then
          begin
            // Preço de atacado
            if vgTabOrc = 1 then
              edVlrUnit.Text := FormatFloat(vgMaskReal, (GetTab1Prod));
            // Preço de varejo
            if vgTabOrc = 2 then
              edVlrUnit.Text := FormatFloat(vgMaskReal, (GetTab2Prod));
          end;
        end;
        if frmPrevenda <> nil then
        begin
          if frmPrevenda.dsItens.DataSet.State in [dsInsert] then
          begin
            // Preço de atacado
            if vgTabPev = 1 then
              edVlrUnit.Text := FormatFloat(vgMaskReal, (GetTab1Prod));
            // Preço de varejo
            if vgTabPev = 2 then
              edVlrUnit.Text := FormatFloat(vgMaskReal, (GetTab2Prod));
          end;
        end;
        edVlrLiq.Text := edVlrUnit.Text;
        CalcularTotal;
      end;
      edVlrDesc.SetFocus;
    end
    else
      MessageDlg('É necessário selecionar um produto ou serviço!', mtWarning, [mbOk], 0);
  end;
end;

procedure TfrmSelProdutoVenda.edCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if ((edCodigo.Text <> '') and (edCodigo.Text <> ' ')) then
    begin
      if FiltrarProdutosCodBar(edCodigo.Text, 1) = true then
      begin
        cbProduto.Text := GetDescProd;
        cbProduto.PerformSearch;
        if frmOrcamento <> nil then
        begin
          if frmOrcamento.dsItens.DataSet.State in [dsInsert] then
          begin
            // Preço de atacado
            if vgTabOrc = 1 then
              edVlrUnit.Text := FormatFloat(vgMaskReal, (GetTab1Prod));
            // Preço de varejo
            if vgTabOrc = 2 then
              edVlrUnit.Text := FormatFloat(vgMaskReal, (GetTab2Prod));
          end;
        end;
        if frmPrevenda <> nil then
        begin
          if frmPrevenda.dsItens.DataSet.State in [dsInsert] then
          begin
            // Preço de atacado
            if vgTabPev = 1 then
              edVlrUnit.Text := FormatFloat(vgMaskReal, (GetTab1Prod));
            // Preço de varejo
            if vgTabPev = 2 then
              edVlrUnit.Text := FormatFloat(vgMaskReal, (GetTab2Prod));
          end;
        end;
        edVlrLiq.Text := edVlrUnit.Text;
        CalcularTotal;
        cbProduto.SetFocus;
      end
      else
        cbProduto.SetFocus;
    end;
  end;
end;

procedure TfrmSelProdutoVenda.edPDescExit(Sender: TObject);
begin
  if ((edPDesc.Text = '') or (edPDesc.Text = ' ')) then
    edPDesc.Text := '0,0';
  edPDesc.Text := FormatFloat('#0.000', StrToFloat(LimpaReal(edPDesc.Text)));
  CalcularDesconto;
  CalcularLiquido;
  CalcularTotal;
  VerifDesc;
end;

procedure TfrmSelProdutoVenda.edPDescKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btConfirmar.SetFocus;
end;

procedure TfrmSelProdutoVenda.edVlrDescExit(Sender: TObject);
begin
  if ((edVlrDesc.Text = '') or (edVlrDesc.Text = ' ')) then
    edVlrDesc.Text := '0,00';
  edVlrDesc.Text := FormatFloat(vgMaskReal, StrToFloat(LimpaReal(edVlrDesc.Text)));
  CalcularPercentual;
  CalcularLiquido;
  CalcularTotal;
  VerifDesc;
end;

procedure TfrmSelProdutoVenda.edVlrDescKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    edPDesc.SetFocus;
end;

procedure TfrmSelProdutoVenda.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmSelProdutoVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frmOrcamento <> nil then
    if frmOrcamento.dsItens.DataSet.State in [dsInsert] then
      frmOrcamento.dsItens.DataSet.Cancel;
  if frmPrevenda <> nil then
    if frmPrevenda.dsItens.DataSet.State in [dsInsert] then
      frmPrevenda.dsItens.DataSet.Cancel;
  inherited;
end;

procedure TfrmSelProdutoVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

end.
