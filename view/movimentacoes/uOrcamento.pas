unit uOrcamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormMDI, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Mask, Vcl.DBCtrls, wwdblook, wwdbedit,
  Wwdotdot, Wwdbcomb, Vcl.Grids, Wwdbigrd, Wwdbgrid, Vcl.ActnList, wwdbdatetimepicker,
  Vcl.Menus, System.Actions;

type
  TfrmOrcamento = class(TfrmTmpFormMDI)
    pnTopo: TPanel;
    pnItens: TPanel;
    Label1: TLabel;
    dbNumero: TDBEdit;
    dsOrcamento: TDataSource;
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
    Label7: TLabel;
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
    cbtabela: TwwDBComboBox;
    cbPrazo: TwwDBLookupCombo;
    cbForma: TwwDBLookupCombo;
    cbCliente: TwwDBLookupCombo;
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
    Label21: TLabel;
    dbValidade: TDBEdit;
    Label22: TLabel;
    dbObs: TDBMemo;
    Label23: TLabel;
    popDetItens: TPopupMenu;
    DetalhesdoItem1: TMenuItem;
    sbMail: TSpeedButton;
    cbProduto: TwwDBLookupCombo;
    sbDetalhes: TSpeedButton;
    cbEntrega: TwwDBLookupCombo;
    Informaesdoproduto1: TMenuItem;
    N1: TMenuItem;
    pnCaption: TPanel;
    sbFechar: TSpeedButton;
    sbMinimizar: TSpeedButton;
    dbStatus: TDBEdit;
    ActionList: TActionList;
    actInserir: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbProcClientesClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure dsOrcamentoStateChange(Sender: TObject);
    procedure dbClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbClienteExit(Sender: TObject);
    procedure cbClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbClienteExit(Sender: TObject);
    procedure dsOrcamentoDataChange(Sender: TObject; Field: TField);
    procedure sbNovoItemClick(Sender: TObject);
    procedure sbExcluirItemClick(Sender: TObject);
    procedure sbGravarItemClick(Sender: TObject);
    procedure sbCancelarItemClick(Sender: TObject);
    procedure dsItensStateChange(Sender: TObject);
    procedure btProcurarClick(Sender: TObject);
    procedure cbFuncionariosExit(Sender: TObject);
    procedure cbPrazoExit(Sender: TObject);
    procedure cbFormaExit(Sender: TObject);
    procedure cbFreteExit(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure DetalhesdoItem1Click(Sender: TObject);
    procedure cbProdutoExit(Sender: TObject);
    procedure sbMailClick(Sender: TObject);
    procedure sbDetalhesClick(Sender: TObject);
    procedure cbEntregaExit(Sender: TObject);
    procedure Informaesdoproduto1Click(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure sbMinimizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInserirExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrcamento: TfrmOrcamento;

implementation

{$R *.dfm}

uses dataLookups, dataOrcamentos, uProcClientes, uVarGlobal, uFuncoesDB,
uDaoPessoasFinanc, dataPessoas, uDaoPessoas, uDaoProdutos, dataCadastros,
uDaoOrcamentos, uDaoOrcItens, uConsOrcamentos, uRelOrcamento, uEnvMailOrc,
uFuncoesWeb, uDaoUsuMails, uSenhaDetProd, uSenhaDetOrc, uDescOrc,
uConsProdutos, uSelProdutoVenda;

procedure TfrmOrcamento.actInserirExecute(Sender: TObject);
begin
  if dsOrcamento.DataSet.FieldByName('ORC_NUMERO').IsNull then
    MessageDlg('É necessário ter um orçamento gravado!', mtWarning, [mbOk], 0)
  else
  begin
    vgNumOrc := dsOrcamento.DataSet.FieldByName('orc_numero').Value;
    vgTabOrc := dsOrcamento.DataSet.FieldByName('orc_tabvenda').Value;
    InsOrcItens;
    frmSelProdutoVenda.ShowModal;
    AtualizaTotalORC(dsOrcamento.DataSet.FieldByName('orc_numero').Value);
    dsItens.DataSet.Refresh;
  end;
end;

procedure TfrmOrcamento.btAlterarClick(Sender: TObject);
begin
  EdtOrcamentos;
  cbCliente.SetFocus;
end;

procedure TfrmOrcamento.btCancelarClick(Sender: TObject);
begin
  dsOrcamento.DataSet.Cancel;
end;

procedure TfrmOrcamento.btExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir o orçamento ' + dbNumero.Text + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    DelOrcamentos;
end;

procedure TfrmOrcamento.btGravarClick(Sender: TObject);
begin
  PostOrcamentos;
end;

procedure TfrmOrcamento.btNovoClick(Sender: TObject);
begin
  InsOrcamentos;
  cbFuncionarios.PerformSearch;
  cbPrazo.PerformSearch;
  cbForma.PerformSearch;
  cbCliente.SetFocus;
end;

procedure TfrmOrcamento.btProcurarClick(Sender: TObject);
begin
  frmConsOrcamentos.ShowModal;
end;

procedure TfrmOrcamento.cbClienteExit(Sender: TObject);
begin
  if dsOrcamento.DataSet.State in [dsInsert, dsEdit] then
  begin
    if ((cbCliente.Text = '') or (cbCliente.Text = ' ')) then
    begin
      cbCliente.Text := 'VENDA AO CONSUMIDOR';
      cbCliente.PerformSearch;
    end;
    dsOrcamento.DataSet.FieldByName('pes_codigo').Value := dmLookups.qyLkClientesPES_CODIGO.Value;
    dsOrcamento.DataSet.FieldByName('orc_contato').Text := GetNameCont(dsOrcamento.DataSet.FieldByName('PES_CODIGO').Value);
    dsOrcamento.DataSet.FieldByName('pes_fone').Text := GetNumFone(dsOrcamento.DataSet.FieldByName('PES_CODIGO').Value);
  end;
end;

procedure TfrmOrcamento.cbClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F4 then
    frmProcClientes.ShowModal;
end;

procedure TfrmOrcamento.cbEntregaExit(Sender: TObject);
begin
  if dsOrcamento.DataSet.State in [dsInsert, dsEdit] then
    dmOrcamentos.qyOrcamentosENT_CODIGO.Value := dmLookups.qyLkEntregaENT_CODIGO.Value;
end;

procedure TfrmOrcamento.cbFormaExit(Sender: TObject);
begin
  if dsOrcamento.DataSet.State in [dsInsert, dsEdit] then
    dmOrcamentos.qyOrcamentosFRP_CODIGO.Value := dmLookups.qyLkFormPagFRP_CODIGO.Value;
end;

procedure TfrmOrcamento.cbFreteExit(Sender: TObject);
begin
  if dsOrcamento.DataSet.State in [dsInsert, dsEdit] then
    dmOrcamentos.qyOrcamentosMDF_CODIGO.Value := dmLookups.qyLkModFreteMDF_CODIGO.Value;
end;

procedure TfrmOrcamento.cbFuncionariosExit(Sender: TObject);
begin
  if dsOrcamento.DataSet.State in [dsInsert, dsEdit] then
    dmOrcamentos.qyOrcamentosfun_codigo.Value := dmLookups.qyLkVendedoresfun_codigo.Value;
end;

procedure TfrmOrcamento.cbPrazoExit(Sender: TObject);
begin
  if dsOrcamento.DataSet.State in [dsInsert, dsEdit] then
    dmOrcamentos.qyOrcamentosPRZ_CODIGO.Value := dmLookups.qyLkPrazosPRZ_CODIGO.Value;
end;

procedure TfrmOrcamento.cbProdutoExit(Sender: TObject);
begin
  FiltrarProdutos('PRO_CODIGO', '=', IntToStr(dmLookups.qyLkProdutosPRO_CODIGO.Value), '0');
  if Not(dmCadastros.qyProdutosPRO_CODIGO.IsNull) then
  begin
    dsItens.DataSet.FieldByName('PRO_CODIGO').Value := GetCodProd;
    dsItens.DataSet.FieldByName('UNI_CODIGO').Text := GetUniProd;
    dsItens.DataSet.FieldByName('ORT_VLRCUSTO').Value := GetCustoProd;
    if dsOrcamento.DataSet.FieldByName('ORC_TABVENDA').Value = 1 then
      dsItens.DataSet.FieldByName('ORT_VLRBRT').Value := GetTab1Prod;
    if dsOrcamento.DataSet.FieldByName('ORC_TABVENDA').Value = 2 then
      dsItens.DataSet.FieldByName('ORT_VLRBRT').Value := GetTab2Prod;
    dsItens.DataSet.FieldByName('ORT_VLRLIQ').Value := dsItens.DataSet.FieldByName('ORT_VLRBRT').Value;
  end;
end;

procedure TfrmOrcamento.dbClienteExit(Sender: TObject);
begin
  inherited;
  if dsOrcamento.DataSet.FieldByName('PES_CODIGO').Value <> 0 then
    dsOrcamento.DataSet.FieldByName('ORL_TABVENDA').Value := GetTabVen(dsOrcamento.DataSet.FieldByName('PES_CODIGO').Value);
end;

procedure TfrmOrcamento.dbClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F4 then
    if dsOrcamento.DataSet.State in [dsInsert, dsEdit] then
      frmProcClientes.ShowModal;
end;

procedure TfrmOrcamento.DetalhesdoItem1Click(Sender: TObject);
begin
  if Not(dsItens.DataSet.FieldByName('ORT_CODIGO').IsNull) then
    frmSenhaDetProd.ShowModal;
end;

procedure TfrmOrcamento.dsItensStateChange(Sender: TObject);
begin
  if dsItens.DataSet.State in [dsInsert, dsEdit] then
  begin
    sbNovoItem.Enabled := False;
    sbExcluirItem.Enabled := False;
    sbGravarItem.Enabled := True;
    sbCancelarItem.Enabled := True;
    if dmOrcamentos.qyOrcItens.State in [dsInsert] then
      dmOrcamentos.qyOrcItensort_codigo.Value := GetCodigo('ort_codigo', 'orcitens');
  end
  else
  begin
    sbNovoItem.Enabled := True;
    sbExcluirItem.Enabled := True;
    sbGravarItem.Enabled := False;
    sbCancelarItem.Enabled := False;
  end;
end;

procedure TfrmOrcamento.dsOrcamentoDataChange(Sender: TObject; Field: TField);
begin
  if dsOrcamento.DataSet.FieldByName('ORC_NUMERO').IsNull then
    FiltrarOrcItens('ORC_NUMERO', '=', '0', '0')
  else
    FiltrarOrcItens('ORC_NUMERO', '=', IntToStr(dsOrcamento.DataSet.FieldByName('ORC_NUMERO').Value), 'ORT_CODIGO');
end;

procedure TfrmOrcamento.dsOrcamentoStateChange(Sender: TObject);
begin
  if dsOrcamento.DataSet.State in [dsInsert, dsEdit] then
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

procedure TfrmOrcamento.FormActivate(Sender: TObject);
begin
  inherited;
  if dsOrcamento.DataSet.State in [dsBrowse] then
    btNovo.SetFocus;
end;

procedure TfrmOrcamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dmOrcamentos.database.InTransaction = True then
    dmOrcamentos.database.Rollback;
  inherited;
end;

procedure TfrmOrcamento.FormCreate(Sender: TObject);
begin
  inherited;
  Self.WindowState := wsMaximized;
  FiltrarOrcamentos('ORC_NUMERO', '=', '0', '0');
end;

procedure TfrmOrcamento.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmOrcamento <> nil then
    frmOrcamento := nil;
end;

procedure TfrmOrcamento.Informaesdoproduto1Click(Sender: TObject);
begin
  if Not(dsItens.DataSet.FieldByName('PRO_CODIGO').IsNull) then
  begin
    vgConsProdutos := IntToStr(dsItens.DataSet.FieldByName('PRO_CODIGO').Value);
    frmConsProdutos.ShowModal;
  end;
end;

procedure TfrmOrcamento.sbCancelarItemClick(Sender: TObject);
begin
  dsItens.DataSet.Cancel;
end;

procedure TfrmOrcamento.sbDetalhesClick(Sender: TObject);
begin
  frmSenhaDetOrc.ShowModal;
end;

procedure TfrmOrcamento.sbExcluirItemClick(Sender: TObject);
begin
  if Not(dsItens.DataSet.FieldByName('ORT_CODIGO').IsNull) then
    if MessageDlg('Deseja realmente exclui o item selecionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DelOrcItens;
      AtualizaTotalORC(dsOrcamento.DataSet.FieldByName('orc_numero').Value);
    end;
end;

procedure TfrmOrcamento.sbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmOrcamento.sbGravarItemClick(Sender: TObject);
begin
  PostOrcItens;
  AtualizaTotalORC(dsOrcamento.DataSet.FieldByName('orc_numero').Value);
end;

procedure TfrmOrcamento.sbNovoItemClick(Sender: TObject);
begin
  actInserir.Execute;
end;

procedure TfrmOrcamento.sbProcClientesClick(Sender: TObject);
begin
  frmProcClientes.ShowModal;
end;

procedure TfrmOrcamento.sbMinimizarClick(Sender: TObject);
begin
  Self.WindowState := wsMinimized;
end;

procedure TfrmOrcamento.sbImprimirClick(Sender: TObject);
begin
  if Not(dsItens.DataSet.FieldByName('ORT_CODIGO').IsNull) then
  begin
    AtualizaTotalORC(dsOrcamento.DataSet.FieldByName('orc_numero').Value);
    vgNumOrcDesc := dsOrcamento.DataSet.FieldByName('ORC_NUMERO').Value;
    frmDescOrc.ShowModal;
    frmRelOrcamento.ShowModal;
  end;
end;

procedure TfrmOrcamento.sbMailClick(Sender: TObject);
begin
  if Not(frmOrcamento.dsItens.DataSet.FieldByName('ORT_CODIGO').IsNull) then
  begin
    if ConectadoWeb = True then
    begin
      vgNumOrcDesc := dsOrcamento.DataSet.FieldByName('ORC_NUMERO').Value;
      frmDescOrc.ShowModal;
      FiltrarUsuMails('USU_CODIGO', '=', vgCodUsuarioLog, '0');
      if dmCadastros.qyUsuMailsUSU_CODIGO.IsNull then
        FiltrarUsuMails('USU_CODIGO', '=', vgCodUsuarioLog, '0');
      if dmCadastros.qyUsuMailsUSU_CODIGO.IsNull then
        MessageDlg('Você deve configurar a conta de e-mail para o envio automático!', mtWarning, [mbOk], 0)
      else
        frmEnvMailOrc.ShowModal;
    end
    else
      MessageDlg('Verifique a conexão com a internet!', mtWarning, [mbOk], 0);
  end;
end;

end.
