unit uCotacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormMDI, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Mask, Vcl.DBCtrls, wwdblook, wwdbedit,
  Wwdotdot, Wwdbcomb, Vcl.Grids, Wwdbigrd, Wwdbgrid, Vcl.ActnList, wwdbdatetimepicker,
  Vcl.Menus;

type
  TfrmCotacao = class(TfrmTmpFormMDI)
    pnTopo: TPanel;
    pnItens: TPanel;
    Label1: TLabel;
    dbNumero: TDBEdit;
    dsCotacao: TDataSource;
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
    procedure dsCotacaoStateChange(Sender: TObject);
    procedure cbFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbFornecedorExit(Sender: TObject);
    procedure dsCotacaoDataChange(Sender: TObject; Field: TField);
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
  frmCotacao: TfrmCotacao;

implementation

{$R *.dfm}

uses dataLookups, dataCompras, uProcClientes, uVarGlobal, uFuncoesDB,
dataPessoas, uDaoPessoas, uDaoProdutos, dataCadastros, uEnvMailOrc,
uFuncoesWeb, uDaoUsuMails, uConsProdutos, uDaoCotacao, uDaoCotItens,
  uProcFornecedores;

procedure TfrmCotacao.btAlterarClick(Sender: TObject);
begin
  EdtCotacao;
  cbFornecedor.SetFocus;
end;

procedure TfrmCotacao.btCancelarClick(Sender: TObject);
begin
  dsCotacao.DataSet.Cancel;
end;

procedure TfrmCotacao.btExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir a cotação ' + dbNumero.Text + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    DelCotacao;
end;

procedure TfrmCotacao.btGravarClick(Sender: TObject);
begin
  PostCotacao;
end;

procedure TfrmCotacao.btNovoClick(Sender: TObject);
begin
  InsCotacao;
  cbFuncionarios.PerformSearch;
  cbPrazo.PerformSearch;
  cbForma.PerformSearch;
  cbFornecedor.SetFocus;
end;

procedure TfrmCotacao.btProcurarClick(Sender: TObject);
begin
  //frmConsCotacoes.ShowModal;
end;

procedure TfrmCotacao.cbFornecedorExit(Sender: TObject);
begin
  if dsCotacao.DataSet.State in [dsInsert, dsEdit] then
  begin
    if ((cbFornecedor.Text = '') or (cbFornecedor.Text = ' ')) then
    begin
      cbFornecedor.Text := 'VENDA AO CONSUMIDOR';
      cbFornecedor.PerformSearch;
    end;
    dsCotacao.DataSet.FieldByName('pes_codigo').Value := dmLookups.qyLkFornecedoresPES_CODIGO.Value;
    dsCotacao.DataSet.FieldByName('cot_contato').Text := GetNameCont(dsCotacao.DataSet.FieldByName('PES_CODIGO').Value);
    dsCotacao.DataSet.FieldByName('pes_fone').Text := GetNumFone(dsCotacao.DataSet.FieldByName('PES_CODIGO').Value);
  end;
end;

procedure TfrmCotacao.cbFornecedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F4 then
    frmProcFornecedores.ShowModal;
end;

procedure TfrmCotacao.cbEntregaExit(Sender: TObject);
begin
  if dsCotacao.DataSet.State in [dsInsert, dsEdit] then
    dmCompras.qyCotacaoENT_CODIGO.Value := dmLookups.qyLkEntregaENT_CODIGO.Value;
end;

procedure TfrmCotacao.cbFormaExit(Sender: TObject);
begin
  if dsCotacao.DataSet.State in [dsInsert, dsEdit] then
    dmCompras.qyCotacaoFRP_CODIGO.Value := dmLookups.qyLkFormPagFRP_CODIGO.Value;
end;

procedure TfrmCotacao.cbFreteExit(Sender: TObject);
begin
  if dsCotacao.DataSet.State in [dsInsert, dsEdit] then
    dmCompras.qyCotacaoMDF_CODIGO.Value := dmLookups.qyLkModFreteMDF_CODIGO.Value;
end;

procedure TfrmCotacao.cbFuncionariosExit(Sender: TObject);
begin
  if dsCotacao.DataSet.State in [dsInsert, dsEdit] then
    dmCompras.qyCotacaofun_codigo.Value := dmLookups.qyLkVendedoresfun_codigo.Value;
end;

procedure TfrmCotacao.cbPrazoExit(Sender: TObject);
begin
  if dsCotacao.DataSet.State in [dsInsert, dsEdit] then
    dmCompras.qyCotacaoPRZ_CODIGO.Value := dmLookups.qyLkPrazosPRZ_CODIGO.Value;
end;

procedure TfrmCotacao.cbProdutoExit(Sender: TObject);
begin
  FiltrarProdutos('PRO_CODIGO', '=', IntToStr(dmLookups.qyLkProdutosPRO_CODIGO.Value), '0');
  if Not(dmCadastros.qyProdutosPRO_CODIGO.IsNull) then
  begin
    // Insere dados padrões
    dsItens.DataSet.FieldByName('pro_codigo').Value := GetCodProd;
    dsItens.DataSet.FieldByName('uni_codigo').Text := GetUniProd;
    dsItens.DataSet.FieldByName('cti_vlrbrt').Value := GetCustoProd;
    dsItens.DataSet.FieldByName('cti_vlrliq').Value := dsItens.DataSet.FieldByName('cti_vlrbrt').Value;
    dsItens.DataSet.FieldByName('cti_percdesc').Value := 0;
    dsItens.DataSet.FieldByName('cti_vlrdesc').Value := 0;
    if dsItens.DataSet.FieldByName('cti_quantidade').IsNull then
      dsItens.DataSet.FieldByName('cti_quantidade').Value := 1;
    // Calcula
    CalcularItemCotItens(1);
  end;
end;

procedure TfrmCotacao.dsItensStateChange(Sender: TObject);
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

procedure TfrmCotacao.dsCotacaoDataChange(Sender: TObject; Field: TField);
begin
  if dsCotacao.DataSet.FieldByName('cot_numero').IsNull then
    FiltrarCotItens('cot_numero', '=', '0', '0')
  else
    FiltrarCotItens('cot_numero', '=', IntToStr(dsCotacao.DataSet.FieldByName('cot_numero').Value), 'cti_codigo');
end;

procedure TfrmCotacao.dsCotacaoStateChange(Sender: TObject);
begin
  if dsCotacao.DataSet.State in [dsInsert, dsEdit] then
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

procedure TfrmCotacao.FormActivate(Sender: TObject);
begin
  inherited;
  btNovo.SetFocus;
end;

procedure TfrmCotacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dmCompras.database.InTransaction = True then
    dmCompras.database.Rollback;
  inherited;
end;

procedure TfrmCotacao.FormCreate(Sender: TObject);
begin
  inherited;
  Self.WindowState := wsMaximized;
  FiltrarCotacao('cot_numero', '=', '0', '0');
end;

procedure TfrmCotacao.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCotacao <> nil then
    frmCotacao := nil;
end;

procedure TfrmCotacao.GridItensColExit(Sender: TObject);
begin
  if Not(dsItens.DataSet.FieldByName('PRO_CODIGO').IsNull) then
    if dsItens.DataSet.State in [dsInsert, dsEdit] then
      CalcularItemCotItens(GridItens.GetActiveCol);
end;

procedure TfrmCotacao.Informaesdoproduto1Click(Sender: TObject);
begin
  if Not(dsItens.DataSet.FieldByName('PRO_CODIGO').IsNull) then
  begin
    vgConsProdutos := IntToStr(dsItens.DataSet.FieldByName('PRO_CODIGO').Value);
    frmConsProdutos.ShowModal;
  end;
end;

procedure TfrmCotacao.sbCancelarItemClick(Sender: TObject);
begin
  dsItens.DataSet.Cancel;
end;

procedure TfrmCotacao.sbExcluirItemClick(Sender: TObject);
begin
  if Not(dsItens.DataSet.FieldByName('cti_codigo').IsNull) then
    if MessageDlg('Deseja realmente exclui o item selecionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      DelCotItens;
end;

procedure TfrmCotacao.sbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCotacao.sbGravarItemClick(Sender: TObject);
begin
  PostCotItens;
end;

procedure TfrmCotacao.sbNovoItemClick(Sender: TObject);
begin
  if dsCotacao.DataSet.FieldByName('cot_numero').IsNull then
    MessageDlg('É necessário ter um orçamento gravado!', mtWarning, [mbOk], 0)
  else
  begin
    InsCotItens;
    GridItens.SetFocus;
  end;
end;

procedure TfrmCotacao.sbProcClientesClick(Sender: TObject);
begin
  if dsCotacao.DataSet.State in [dsInsert, dsEdit] then
    frmProcClientes.ShowModal;
end;

procedure TfrmCotacao.sbMinimizarClick(Sender: TObject);
begin
  Self.WindowState := wsMinimized;
end;

procedure TfrmCotacao.sbImprimirClick(Sender: TObject);
begin
  if Not(dsItens.DataSet.FieldByName('cti_codigo').IsNull) then
  begin
    //vgNumOrcDesc := dsOrcamento.DataSet.FieldByName('ORC_NUMERO').Value;
    //frmDescOrc.ShowModal;
    //frmRelOrcamento.ShowModal;
  end;
end;

procedure TfrmCotacao.sbMailClick(Sender: TObject);
begin
  if Not(frmCotacao.dsItens.DataSet.FieldByName('cti_codigo').IsNull) then
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
