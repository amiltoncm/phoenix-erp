unit uOrdCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormMDI, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Mask, Vcl.DBCtrls, wwdblook, wwdbedit,
  Wwdotdot, Wwdbcomb, Vcl.Grids, Wwdbigrd, Wwdbgrid, Vcl.ActnList, wwdbdatetimepicker,
  Vcl.Menus;

type
  TfrmOrdCompra = class(TfrmTmpFormMDI)
    pnTopo: TPanel;
    pnItens: TPanel;
    Label1: TLabel;
    dbNumero: TDBEdit;
    dsOrdCompra: TDataSource;
    Label2: TLabel;
    btNovo: TBitBtn;
    btAlterar: TBitBtn;
    btExcluir: TBitBtn;
    btGravar: TBitBtn;
    btCancelar: TBitBtn;
    btProcurar: TBitBtn;
    Label4: TLabel;
    dbContato: TDBEdit;
    Label5: TLabel;
    Label8: TLabel;
    dbReferente: TDBEdit;
    pnBotton: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    dbSubTotal: TDBEdit;
    dbVlrDesc: TDBEdit;
    Label12: TLabel;
    dbPercDesc: TDBEdit;
    Label13: TLabel;
    dbVlrTotal: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    sbProcClientes: TSpeedButton;
    cbFuncionarios: TwwDBLookupCombo;
    cbPrazo: TwwDBLookupCombo;
    cbForma: TwwDBLookupCombo;
    cbFornecedor: TwwDBLookupCombo;
    GridItens: TwwDBGrid;
    dsItens: TDataSource;
    sbNovoItem: TSpeedButton;
    sbExcluirItem: TSpeedButton;
    sbGravarItem: TSpeedButton;
    sbCancelarItem: TSpeedButton;
    sbImprimir: TSpeedButton;
    Label17: TLabel;
    Label18: TLabel;
    cbFrete: TwwDBLookupCombo;
    dbFone: TDBEdit;
    Label19: TLabel;
    wwDBDateTimePicker1: TwwDBDateTimePicker;
    Label20: TLabel;
    Label22: TLabel;
    dbObs: TDBMemo;
    Label23: TLabel;
    popDetItens: TPopupMenu;
    sbMail: TSpeedButton;
    cbProduto: TwwDBLookupCombo;
    cbEntrega: TwwDBLookupCombo;
    Informaesdoproduto1: TMenuItem;
    pnCaption: TPanel;
    sbFechar: TSpeedButton;
    sbMinimizar: TSpeedButton;
    dbStatus: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbProcClientesClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure dsOrdCompraStateChange(Sender: TObject);
    procedure cbFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbFornecedorExit(Sender: TObject);
    procedure dsOrdCompraDataChange(Sender: TObject; Field: TField);
    procedure sbNovoItemClick(Sender: TObject);
    procedure sbExcluirItemClick(Sender: TObject);
    procedure sbGravarItemClick(Sender: TObject);
    procedure sbCancelarItemClick(Sender: TObject);
    procedure dsItensStateChange(Sender: TObject);
    procedure btProcurarClick(Sender: TObject);
    procedure GridItensColExit(Sender: TObject);
    procedure cbFuncionariosExit(Sender: TObject);
    procedure cbPrazoExit(Sender: TObject);
    procedure cbFormaExit(Sender: TObject);
    procedure cbFreteExit(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure cbProdutoExit(Sender: TObject);
    procedure sbMailClick(Sender: TObject);
    procedure cbEntregaExit(Sender: TObject);
    procedure Informaesdoproduto1Click(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure sbMinimizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrdCompra: TfrmOrdCompra;

implementation

{$R *.dfm}

uses dataLookups, dataCompras, uVarGlobal, uFuncoesDB, dataPessoas, uDaoPessoas,
  uDaoProdutos, dataCadastros, uEnvMailOrc, uFuncoesWeb, uDaoUsuMails,
  uConsProdutos, uProcFornecedores, uDaoOrdCompra, uDaoOrdItens, uProcClientes;

procedure TfrmOrdCompra.btAlterarClick(Sender: TObject);
begin
  EdtOrdCompra;
  cbFornecedor.SetFocus;
end;

procedure TfrmOrdCompra.btCancelarClick(Sender: TObject);
begin
  dsOrdCompra.DataSet.Cancel;
end;

procedure TfrmOrdCompra.btExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir a ordem de compra ' + dbNumero.Text + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    DelOrdCompra;
end;

procedure TfrmOrdCompra.btGravarClick(Sender: TObject);
begin
  PostOrdCompra;
end;

procedure TfrmOrdCompra.btNovoClick(Sender: TObject);
begin
  InsOrdCompra;
  cbFuncionarios.PerformSearch;
  cbPrazo.PerformSearch;
  cbForma.PerformSearch;
  cbFornecedor.SetFocus;
end;

procedure TfrmOrdCompra.btProcurarClick(Sender: TObject);
begin
  //frmConsOrdCompra.ShowModal;
end;

procedure TfrmOrdCompra.cbFornecedorExit(Sender: TObject);
begin
  if dsOrdCompra.DataSet.State in [dsInsert, dsEdit] then
  begin
    if ((cbFornecedor.Text = '') or (cbFornecedor.Text = ' ')) then
    begin
      cbFornecedor.Text := 'VENDA AO CONSUMIDOR';
      cbFornecedor.PerformSearch;
    end;
    dsOrdCompra.DataSet.FieldByName('pes_codigo').Value := dmLookups.qyLkFornecedoresPES_CODIGO.Value;
    dsOrdCompra.DataSet.FieldByName('ord_contato').Text := GetNameCont(dsOrdCompra.DataSet.FieldByName('PES_CODIGO').Value);
    dsOrdCompra.DataSet.FieldByName('pes_fone').Text := GetNumFone(dsOrdCompra.DataSet.FieldByName('PES_CODIGO').Value);
  end;
end;

procedure TfrmOrdCompra.cbFornecedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F4 then
    frmProcFornecedores.ShowModal;
end;

procedure TfrmOrdCompra.cbEntregaExit(Sender: TObject);
begin
  if dsOrdCompra.DataSet.State in [dsInsert, dsEdit] then
    dmCompras.qyOrdCompraent_codigo.Value := dmLookups.qyLkEntregaent_codigo.Value;
end;

procedure TfrmOrdCompra.cbFormaExit(Sender: TObject);
begin
  if dsOrdCompra.DataSet.State in [dsInsert, dsEdit] then
    dmCompras.qyOrdComprafrp_codigo.Value := dmLookups.qyLkFormPagfrp_codigo.Value;
end;

procedure TfrmOrdCompra.cbFreteExit(Sender: TObject);
begin
  if dsOrdCompra.DataSet.State in [dsInsert, dsEdit] then
    dmCompras.qyOrdCompramdf_codigo.Value := dmLookups.qyLkModFretemdf_codigo.Value;
end;

procedure TfrmOrdCompra.cbFuncionariosExit(Sender: TObject);
begin
  if dsOrdCompra.DataSet.State in [dsInsert, dsEdit] then
    dmCompras.qyOrdComprafun_codigo.Value := dmLookups.qyLkVendedoresfun_codigo.Value;
end;

procedure TfrmOrdCompra.cbPrazoExit(Sender: TObject);
begin
  if dsOrdCompra.DataSet.State in [dsInsert, dsEdit] then
    dmCompras.qyOrdCompraprz_codigo.Value := dmLookups.qyLkPrazosprz_codigo.Value;
end;

procedure TfrmOrdCompra.cbProdutoExit(Sender: TObject);
begin
  FiltrarProdutos('PRO_CODIGO', '=', IntToStr(dmLookups.qyLkProdutosPRO_CODIGO.Value), '0');
  if Not(dmCadastros.qyProdutosPRO_CODIGO.IsNull) then
  begin
    // Insere dados padrões
    dsItens.DataSet.FieldByName('pro_codigo').Value := GetCodProd;
    dsItens.DataSet.FieldByName('uni_codigo').Text := GetUniProd;
    dsItens.DataSet.FieldByName('ori_vlrbrt').Value := GetCustoProd;
    dsItens.DataSet.FieldByName('ori_vlrliq').Value := dsItens.DataSet.FieldByName('cti_vlrbrt').Value;
    dsItens.DataSet.FieldByName('ori_percdesc').Value := 0;
    dsItens.DataSet.FieldByName('ori_vlrdesc').Value := 0;
    if dsItens.DataSet.FieldByName('ori_quantidade').IsNull then
      dsItens.DataSet.FieldByName('ori_quantidade').Value := 1;
    // Calcula
    CalcularItemOrdItens(1);
  end;
end;

procedure TfrmOrdCompra.dsItensStateChange(Sender: TObject);
begin
  if dsItens.DataSet.State in [dsInsert, dsEdit] then
  begin
    sbNovoItem.Enabled := False;
    sbExcluirItem.Enabled := False;
    sbGravarItem.Enabled := True;
    sbCancelarItem.Enabled := True;
  end
  else
  begin
    sbNovoItem.Enabled := True;
    sbExcluirItem.Enabled := True;
    sbGravarItem.Enabled := False;
    sbCancelarItem.Enabled := False;
  end;
end;

procedure TfrmOrdCompra.dsOrdCompraDataChange(Sender: TObject; Field: TField);
begin
  if dsOrdCompra.DataSet.FieldByName('cot_numero').IsNull then
    FiltrarOrdItens('ord_numero', '=', '0', '0')
  else
    FiltrarOrdItens('ord_numero', '=', IntToStr(dsOrdCompra.DataSet.FieldByName('ord_numero').Value), 'ori_codigo');
end;

procedure TfrmOrdCompra.dsOrdCompraStateChange(Sender: TObject);
begin
  if dsOrdCompra.DataSet.State in [dsInsert, dsEdit] then
  begin
    btNovo.Enabled := False;
    btAlterar.Enabled := False;
    btExcluir.Enabled := False;
    btGravar.Enabled := True;
    btCancelar.Enabled := True;
    btProcurar.Enabled := False;
  end
  else
  begin
    btNovo.Enabled := True;
    btAlterar.Enabled := True;
    btExcluir.Enabled := True;
    btGravar.Enabled := False;
    btCancelar.Enabled := False;
    btProcurar.Enabled := True;
  end;
end;

procedure TfrmOrdCompra.FormActivate(Sender: TObject);
begin
  inherited;
  btNovo.SetFocus;
end;

procedure TfrmOrdCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dmCompras.database.InTransaction = True then
    dmCompras.database.Rollback;
  inherited;
end;

procedure TfrmOrdCompra.FormCreate(Sender: TObject);
begin
  inherited;
  Self.WindowState := wsMaximized;
  FiltrarOrdCompra('ord_numero', '=', '0', '0');
end;

procedure TfrmOrdCompra.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmOrdCompra <> nil then
    frmOrdCompra := nil;
end;

procedure TfrmOrdCompra.GridItensColExit(Sender: TObject);
begin
  if Not(dsItens.DataSet.FieldByName('PRO_CODIGO').IsNull) then
    if dsItens.DataSet.State in [dsInsert, dsEdit] then
      CalcularItemOrdItens(GridItens.GetActiveCol);
end;

procedure TfrmOrdCompra.Informaesdoproduto1Click(Sender: TObject);
begin
  if Not(dsItens.DataSet.FieldByName('PRO_CODIGO').IsNull) then
  begin
    vgConsProdutos := IntToStr(dsItens.DataSet.FieldByName('PRO_CODIGO').Value);
    frmConsProdutos.ShowModal;
  end;
end;

procedure TfrmOrdCompra.sbCancelarItemClick(Sender: TObject);
begin
  dsItens.DataSet.Cancel;
end;

procedure TfrmOrdCompra.sbExcluirItemClick(Sender: TObject);
begin
  if Not(dsItens.DataSet.FieldByName('cti_codigo').IsNull) then
    if MessageDlg('Deseja realmente exclui o item selecionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      DelOrdItens;
end;

procedure TfrmOrdCompra.sbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmOrdCompra.sbGravarItemClick(Sender: TObject);
begin
  PostOrdItens;
end;

procedure TfrmOrdCompra.sbNovoItemClick(Sender: TObject);
begin
  if dsOrdCompra.DataSet.FieldByName('ord_numero').IsNull then
    MessageDlg('É necessário ter uma ordem de compra gravada!', mtWarning, [mbOk], 0)
  else
  begin
    InsOrdItens;
    GridItens.SetFocus;
  end;
end;

procedure TfrmOrdCompra.sbProcClientesClick(Sender: TObject);
begin
  if dsOrdCompra.DataSet.State in [dsInsert, dsEdit] then
    frmProcClientes.ShowModal;
end;

procedure TfrmOrdCompra.sbMinimizarClick(Sender: TObject);
begin
  Self.WindowState := wsMinimized;
end;

procedure TfrmOrdCompra.sbImprimirClick(Sender: TObject);
begin
  if Not(dsItens.DataSet.FieldByName('ori_codigo').IsNull) then
  begin
    //vgNumOrcDesc := dsOrcamento.DataSet.FieldByName('ORC_NUMERO').Value;
    //frmDescOrc.ShowModal;
    //frmRelOrcamento.ShowModal;
  end;
end;

procedure TfrmOrdCompra.sbMailClick(Sender: TObject);
begin
  if Not(frmOrdCompra.dsItens.DataSet.FieldByName('ori_codigo').IsNull) then
  begin
    if ConectadoWeb = True then
    begin
      //vgNumOrcDesc := dsOrcamento.DataSet.FieldByName('ORC_NUMERO').Value;
      //frmDescOrc.ShowModal;
      FiltrarUsuMails('USU_CODIGO', '=', vgCodUsuarioLog, '0');
      if dmCadastros.qyUsuMailsUSU_CODIGO.IsNull then
        FiltrarUsuMails('USU_CODIGO', '=', vgCodUsuarioLog, '0');
      if dmCadastros.qyUsuMailsUSU_CODIGO.IsNull then
        MessageDlg('Você deve configurar a conta de e-mail para o envio automático!', mtWarning, [mbOk], 0)
      else
        //frmEnvMailOrc.ShowModal;
    end
    else
      MessageDlg('Verifique a conexão com a internet!', mtWarning, [mbOk], 0);
  end;
end;

end.
