unit uPrevenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormMDI, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Mask, Vcl.DBCtrls, wwdblook, wwdbedit,
  Wwdotdot, Wwdbcomb, Vcl.Grids, Wwdbigrd, Wwdbgrid, Vcl.ActnList, wwdbdatetimepicker,
  Vcl.Menus, System.Actions;

type
  TfrmPrevenda = class(TfrmTmpFormMDI)
    pnCabecalho: TPanel;
    pnItens: TPanel;
    Label1: TLabel;
    dbNumero: TDBEdit;
    dsPreVenda: TDataSource;
    Label2: TLabel;
    btNovo: TBitBtn;
    btAlterar: TBitBtn;
    btExcluir: TBitBtn;
    btGravar: TBitBtn;
    btCancelar: TBitBtn;
    btProcurar: TBitBtn;
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
    sbProcClientes: TSpeedButton;
    cbFuncionarios: TwwDBLookupCombo;
    cbtabela: TwwDBComboBox;
    cbPrazo: TwwDBLookupCombo;
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
    dtpData: TwwDBDateTimePicker;
    Label20: TLabel;
    Label22: TLabel;
    dbObs: TDBMemo;
    Label23: TLabel;
    popDetItens: TPopupMenu;
    DetalhesdoItem1: TMenuItem;
    cbProduto: TwwDBLookupCombo;
    sbDetalhes: TSpeedButton;
    dbOrcamento: TDBEdit;
    sbOrcamento: TSpeedButton;
    Label4: TLabel;
    cbEntrega: TwwDBLookupCombo;
    N1: TMenuItem;
    InformaesdoProduto1: TMenuItem;
    pnCaption: TPanel;
    sbFechar: TSpeedButton;
    sbMinimizar: TSpeedButton;
    dbStatus: TDBEdit;
    ActionList1: TActionList;
    actFinalizar: TAction;
    actAtalhoF9: TAction;
    actAtalhoF10: TAction;
    actProcurar: TAction;
    sbNumero: TSpeedButton;
    dsPrevRes: TDataSource;
    actProcNum: TAction;
    dsPrevEndEnt: TDataSource;
    pnCodBar: TPanel;
    Label9: TLabel;
    Label14: TLabel;
    edQtde: TEdit;
    edCodBar: TEdit;
    ActionListItens: TActionList;
    actInserir: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbProcClientesClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure ExcluirPreVenda;
    procedure btGravarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure dsPreVendaStateChange(Sender: TObject);
    procedure cbClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbClienteExit(Sender: TObject);
    procedure dsPreVendaDataChange(Sender: TObject; Field: TField);
    procedure sbNovoItemClick(Sender: TObject);
    procedure sbExcluirItemClick(Sender: TObject);
    procedure sbGravarItemClick(Sender: TObject);
    procedure sbCancelarItemClick(Sender: TObject);
    procedure dsItensStateChange(Sender: TObject);
    procedure cbFuncionariosExit(Sender: TObject);
    procedure cbPrazoExit(Sender: TObject);
    procedure cbFormaExit(Sender: TObject);
    procedure cbFreteExit(Sender: TObject);
    procedure DetalhesdoItem1Click(Sender: TObject);
    procedure cbProdutoExit(Sender: TObject);
    procedure sbDetalhesClick(Sender: TObject);
    procedure sbOrcamentoClick(Sender: TObject);
    procedure cbEntregaExit(Sender: TObject);
    procedure InformaesdoProduto1Click(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actFinalizarExecute(Sender: TObject);
    procedure EfetivarPrevenda;
    procedure edQtdeExit(Sender: TObject);
    procedure edQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure edCodBarKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dtpDataKeyPress(Sender: TObject; var Key: Char);
    procedure cbClienteKeyPress(Sender: TObject; var Key: Char);
    procedure cbFuncionariosKeyPress(Sender: TObject; var Key: Char);
    procedure cbtabelaKeyPress(Sender: TObject; var Key: Char);
    procedure cbPrazoKeyPress(Sender: TObject; var Key: Char);
    procedure cbFormaKeyPress(Sender: TObject; var Key: Char);
    procedure cbFreteKeyPress(Sender: TObject; var Key: Char);
    procedure cbEntregaKeyPress(Sender: TObject; var Key: Char);
    procedure dbReferenteKeyPress(Sender: TObject; var Key: Char);
    procedure actAtalhoF9Execute(Sender: TObject);
    procedure actAtalhoF10Execute(Sender: TObject);
    procedure actProcurarExecute(Sender: TObject);
    procedure actProcNumExecute(Sender: TObject);
    procedure actInserirExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrevenda: TfrmPrevenda;

implementation

{$R *.dfm}

uses dataLookups, dataOrcamentos, uProcClientes, uVarGlobal, uDaoPessoasFinanc,
  dataPessoas, uDaoPessoas, uDaoProdutos, dataCadastros, uDaoPreVendas, uClassPessoasend,
  uConsOrcamentos, uDaoPrevItens, uConsPreVendas, uClassPrevendas, uDaoOrcamentos,
  uClassPrevitens, uDaoOrcItens, uSenhaDetProdPV, uSenhaDetPrev, uDescPrev, uCondicoesPV,
  uRelPreVenda, uDaoPrevendent, uClassPrevres, uDaoPrevRes, uDaoProdutosEst,
  uConsProdutos, uDaoConfig, uDaoProdutosMov, uClassProdutosmov, uDaoCaixa,
  uClassCaixa, uLancCheque, uPrazos, uFuncoesValidacao, uCartoesPV, uSenhaLibPagPV,
  uSenhaReimpPV, uRelPreVendaEfet, uFuncoesDB, uSenhaDelPV, uSelProdutoVenda;

procedure TfrmPrevenda.actAtalhoF10Execute(Sender: TObject);
begin
  if pnCodBar.Visible = true then
    edCodBar.SetFocus;
end;

procedure TfrmPrevenda.actAtalhoF9Execute(Sender: TObject);
begin
  if pnCodBar.Visible = true then
    edQtde.SetFocus;
end;

procedure TfrmPrevenda.actFinalizarExecute(Sender: TObject);
Var
vPrevRes: TPrevRes;
begin
  if Not(dsItens.DataSet.FieldByName('PRV_NUMERO').IsNull) then
  begin
    if dsPreVenda.DataSet.FieldByName('sto_codigo').Value <> 5 then
    begin
      frmCondicoesPV.ShowModal;
      //Endereço de entrega ------------------------------------------------------
      RelPevEnd(IntToStr(dsPreVenda.DataSet.FieldByName('PRV_NUMERO').Value));
      //Atualiza total da Pré-venda --------------------------------------------
      AtualizaTotalPREV(dsPreVenda.DataSet.FieldByName('prv_numero').Value);
      //Desconto -----------------------------------------------------------------
      frmDescPrev.ShowModal;
      //Alterar status  ----------------------------------------------------------
      SetStatusPrev(2);
      //Reservar produtos  -------------------------------------------------------
      FiltResItem(dsPreVenda.DataSet.FieldByName('PRV_NUMERO').Value);
      dmOrcamentos.qyCalcItensPV.First;
      repeat
      begin
        // Verifica se produto movimenta estoque -----------------------------
        FiltrarProdutos('p.pro_codigo', '=', IntToStr(dmOrcamentos.qyCalcItensPVPRO_CODIGO.Value), '0');
        if GetProdMov = 'S' then
        begin
          FiltrarPrevRes('PRI_CODIGO', '=', IntToStr(dmOrcamentos.qyCalcItensPVPRI_CODIGO.Value), '0');
          if dmOrcamentos.qyPrevResPRI_CODIGO.IsNull then
          begin
            //Reserva - PrevRes  ---------------------------------------------------
            InsPrevRes;
            vPrevRes := TPrevres.Create;
            vPrevRes.Item := dmOrcamentos.qyCalcItensPVPRI_CODIGO.Value;
            vPrevRes.Prevenda := dmOrcamentos.qyCalcItensPVPRV_NUMERO.Value;
            vPrevRes.Produto := dmOrcamentos.qyCalcItensPVPRO_CODIGO.Value;
            vPrevRes.Quantidade := dmOrcamentos.qyCalcItensPVPRI_QUANTIDADE.Value;
            SetValuesPrevRes(vPrevRes);
            vPrevRes.Free;
            PostPrevRes;
          end
          else
          begin
            DelPrevRes;
            //Reserva - PrevRes  ---------------------------------------------------
            InsPrevRes;
            vPrevRes := TPrevres.Create;
            vPrevRes.Item := dmOrcamentos.qyCalcItensPVPRI_CODIGO.Value;
            vPrevRes.Prevenda := dmOrcamentos.qyCalcItensPVPRV_NUMERO.Value;
            vPrevRes.Produto := dmOrcamentos.qyCalcItensPVPRO_CODIGO.Value;
            vPrevRes.Quantidade := dmOrcamentos.qyCalcItensPVPRI_QUANTIDADE.Value;
            SetValuesPrevRes(vPrevRes);
            vPrevRes.Free;
            PostPrevRes;
          end;
          AtualizaReservas(dmOrcamentos.qyCalcItensPVPRO_CODIGO.Value);
        end;
        dmOrcamentos.qyCalcItensPV.Next;
      end;
      until dmOrcamentos.qyCalcItensPV.Eof = True;
      //Impressão e efetivação ---------------------------------------------------
      if GetEfetPrv = 1 then
      begin
        // Verifica efetivação automática
        if GetEfetPrvAut = 1 then
          EfetivarPrevenda
        else
          if MessageDlg('Deseja efetivar a Pré-venda agora?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            EfetivarPrevenda
          else
          // Não efetivação da Pré-venda -----------------------------------------
          begin
            vgNumPVDesc := dsPreVenda.DataSet.FieldByName('PRV_NUMERO').Value;
            frmRelPreVenda.ShowModal;
            dsPreVenda.DataSet.Refresh;
          end;
      end
      else
      begin
        vgNumPVDesc := dsPreVenda.DataSet.FieldByName('PRV_NUMERO').Value;
        frmRelPreVenda.ShowModal;
        dsPreVenda.DataSet.Refresh;
      end;
    end
    else
    begin
      frmSenhaReimpPV.ShowModal;
      if vgReimpPV = true then
      begin
        frmRelPreVendaEfet.ShowModal;
        dsPreVenda.DataSet.Refresh;
      end;
    end;
    if FechaPVAuto = 1 then
      Close;
  end;
end;

procedure TfrmPrevenda.EfetivarPreVenda;
Var
vCodProd: Integer;
vProdMov: TProdutosMov;
vCaixa: TCaixa;
vCodCaixa: Integer;
begin
  FiltrarPrevRes('prv_numero', '=', IntToStr(dsPreVenda.DataSet.FieldByName('prv_numero').Value), 'pro_codigo');
  dmOrcamentos.qyPrevRes.First;
  Repeat
  begin
    // Verifica se produto movimenta estoque -----------------------------
    FiltrarProdutos('p.pro_codigo', '=', IntToStr(dmOrcamentos.qyPrevResPRO_CODIGO.Value), '0');
    if GetProdMov = 'S' then
    begin
      vCodProd := dmOrcamentos.qyPrevResPRO_CODIGO.Value;
      // Movimentar estoque (produtosest) --------------------------------
      SaidaEstoque(vCodProd, dmOrcamentos.qyPrevResPRI_QUANTIDADE.Value);
      // Lançar histórico de movimentação (produsotsmov) -----------------
      InsProdutosMov;
      vProdMov := TProdutosmov.Create;
      vProdMov.Codigo := 0;
      vProdMov.Codproduto := vCodProd;
      vProdMov.Data := GetDateServerPG;
      vProdMov.Quantidade := dmOrcamentos.qyPrevResPRI_QUANTIDADE.Value;
      vProdMov.Codpessoa := dsPreVenda.DataSet.FieldByName('pes_codigo').Value;
      vProdMov.Tipo := 'PRV';
      vProdMov.Nota := dsPreVenda.DataSet.FieldByName('prv_numero').Value;
      vProdMov.Serie := 0;
      vProdMov.Modelo := 0;
      vProdMov.Valor := GetVlrUnitPV(dmOrcamentos.qyPrevResPRI_CODIGO.Value);
      SetValuesProdutosMov(vProdMov);
      PostProdutosMov;
      vProdMov.Free;
      // Zerar produto da reserva (prevres) ----------------------------
      EdtPrevRes;
      ZerarPrevRes;
      PostPrevRes;
      AtualizaReservas(vCodProd);
    end;
    dmOrcamentos.qyPrevRes.Next;
  end;
  Until dmOrcamentos.qyPrevRes.Eof = True;
  // Apagar todos os produtos reservados da Pré-venda
  ScriptDelPrevRes(IntToStr(dsPreVenda.DataSet.FieldByName('prv_numero').Value));
  // Gerar movimentação financeira ---------------------------------------
  // Recebimento em dinheiro ---------------------------------------------
  if dsPreVenda.DataSet.FieldByName('frp_codigo').Value = 0 then
  begin
    // Joga o dinheiro para a conta caixa local
    vCaixa := TCaixa.Create;
    vCaixa.Codigo := GetCodigo('cai_codigo', 'caixa');
    vCaixa.ID := vgIDCaixa;
    vCaixa.CodConta := 1;
    vCaixa.Descricao := 'PV: ' + dsPreVenda.DataSet.FieldByName('prv_numero').Text;
    vCaixa.Numdoc := dsPreVenda.DataSet.FieldByName('prv_numero').Value;
    vCaixa.Valor := dsPreVenda.DataSet.FieldByName('prv_vlrtotal').Value;
    vCaixa.CodPlano := 3;
    vCaixa.CodUsuario := StrToInt(vgCodUsuarioLog);
    vCaixa.Data := GetDateServerPG;
    vCaixa.DataEfet := vCaixa.Data;
    vCaixa.CodPag := 0;
    vCaixa.CodRec := 0;
    vCaixa.CodMdc := '00';
    InsCaixa;
    SetValuesCaixa(vCaixa);
    PostCaixa;
    vCaixa.Free;
    // Mudar status PV -------------------------------------------------
    SetDataEfetPV(GetDateServerPG);
    SetStatusPrev(5);
  end;
  // Recebimento em cheque ---------------------------------------------
  if dsPreVenda.DataSet.FieldByName('frp_codigo').Value = 1 then
  begin
    // Joga o valor para a conta caixa local
    vCaixa := TCaixa.Create;
    vCodCaixa := GetCodigo('cai_codigo', 'caixa');
    vCaixa.ID := vgIDCaixa;
    vCaixa.Codigo := vCodCaixa;
    vCaixa.CodConta := 1;
    vCaixa.Descricao := 'PV: ' + dsPreVenda.DataSet.FieldByName('prv_numero').Text;
    vCaixa.Numdoc := dsPreVenda.DataSet.FieldByName('prv_numero').Value;
    vCaixa.Valor := dsPreVenda.DataSet.FieldByName('prv_vlrtotal').Value;
    vCaixa.CodPlano := 3;
    vCaixa.CodUsuario := StrToInt(vgCodUsuarioLog);
    vCaixa.Data := GetDateServerPG;
    vCaixa.DataEfet := vCaixa.Data;
    vCaixa.CodPag := 0;
    vCaixa.CodRec := 0;
    vCaixa.CodMdc := '00';
    InsCaixa;
    SetValuesCaixa(vCaixa);
    PostCaixa;
    vCaixa.Free;
    // Joga cheque para controle de cheques
    vgCodCaixaChq := vCodCaixa;
    vgCodClienteChq := dsPreVenda.DataSet.FieldByName('pes_codigo').Value;
    vgValorPVChq := dsPreVenda.DataSet.FieldByName('prv_vlrtotal').Value;
    frmLancCheque.ShowModal;
    // Mudar status PV -------------------------------------------------
    SetDataEfetPV(GetDateServerPG);
    SetStatusPrev(5);
  end;
  // Recebimento em crédito loja (4) e boleto (10) ---------------------
  if ((dsPreVenda.DataSet.FieldByName('frp_codigo').Value = 4) or
      (dsPreVenda.DataSet.FieldByName('frp_codigo').Value = 10)) then
  begin
    if dsPreVenda.DataSet.FieldByName('pes_codigo').Value <> 0 then
    begin
      vgPVRec := dsPreVenda.DataSet.FieldByName('prv_numero').Value;
      vgCodClienteRec := dsPreVenda.DataSet.FieldByName('pes_codigo').Value;
      vgValorPVRec := dsPreVenda.DataSet.FieldByName('prv_vlrtotal').Value;
      vgFormaRec := dsPreVenda.DataSet.FieldByName('frp_codigo').Value;
      vgPrazoRec := dsPreVenda.DataSet.FieldByName('prz_codigo').Value;
      frmPrazos.ShowModal;
    end
    else
      MessageDlg('Não é possível fazer venda a prazo para Consumidor Final!',
                 mtWarning, [mbOk], 0);
  end;
  // Recebimento com cartoes ---------------------------------------------
  if ((dsPreVenda.DataSet.FieldByName('frp_codigo').Value = 2) or
      (dsPreVenda.DataSet.FieldByName('frp_codigo').Value = 3)) then
  begin
    if dsPreVenda.DataSet.FieldByName('pes_codigo').Value <> 0 then
    begin
      vgPVCt := dsPreVenda.DataSet.FieldByName('prv_numero').Value;
      vgCodClienteCt := dsPreVenda.DataSet.FieldByName('pes_codigo').Value;
      vgValorPVCt := dsPreVenda.DataSet.FieldByName('prv_vlrtotal').Value;
      vgFormaCt := dsPreVenda.DataSet.FieldByName('frp_codigo').Value;
      vgPrazoCt := dsPreVenda.DataSet.FieldByName('prz_codigo').Value;
      frmCartoesPV.ShowModal;
    end;
  end;
  // Não gerar cobrança ------------------------------------------------
  if dsPreVenda.DataSet.FieldByName('frp_codigo').Value = 11 then
  begin
    vgLibPvCob := false;
    frmSenhaLibPagPV.ShowModal;
    if vgLibPvCob = true then
    begin
      SetDataEfetPV(GetDateServerPG);
      SetStatusPrev(5);
    end;
  end;
  // Altera data da Pré-venda ------------------------------------------
  frmRelPreVendaEfet.ShowModal;
  dsPreVenda.DataSet.Refresh;
end;

procedure TfrmPrevenda.actInserirExecute(Sender: TObject);
begin
  if dsPreVenda.DataSet.FieldByName('PRV_NUMERO').IsNull then
    MessageDlg('É necessário ter uma pré-venda gravada!', mtWarning, [mbOk], 0)
  else
  begin
    vgNumPev := dsPreVenda.DataSet.FieldByName('prv_numero').Value;
    vgTabPev := dsPreVenda.DataSet.FieldByName('prv_tabvenda').Value;
    AppendPrevItens;
    frmSelProdutoVenda.ShowModal;
    AtualizaTotalPREV(dsPreVenda.DataSet.FieldByName('prv_numero').Value);
    dsItens.DataSet.Refresh;
  end;
end;

procedure TfrmPrevenda.actProcNumExecute(Sender: TObject);
Var
vNumPV: String;
vOk: boolean;
begin
  vOK := InputQuery('Localizar Pré-venda', 'Digite o número da Pré-venda', vNumPV);
  if vOK then
  begin
    if ((vNumPV <> '') and (vNumPV <> ' ')) then
    begin
      if TestaInteiro(vNumPV) = true then
      begin
        FiltrarPrevendas('prv_numero', '=', vNumPV, '0');
        if dsPreVenda.DataSet.FieldByName('prv_numero').IsNull then
          MessageDlg('Pré-venda: ' + vNumPV + ' não encontrada!', mtWarning, [mbOk], 0);
      end;
    end;
  end;
end;

procedure TfrmPrevenda.actProcurarExecute(Sender: TObject);
begin
  frmConsPreVendas.ShowModal;
end;

procedure TfrmPrevenda.btAlterarClick(Sender: TObject);
begin
  EdtPrevendas;
  cbCliente.SetFocus;
end;

procedure TfrmPrevenda.btCancelarClick(Sender: TObject);
begin
  dsPreVenda.DataSet.Cancel;
end;

procedure TfrmPrevenda.btExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir a pré-venda ' + dbNumero.Text + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if dsPreVenda.DataSet.FieldByName('sto_codigo').Value <> 5 then
    begin
      if dsPreVenda.DataSet.FieldByName('sto_codigo').Value = 1 then
        ExcluirPreVenda
      else
      begin
        if MessageDlg('Esta Pré-venda já foi impressa!' + #13 + 'Deseja realmente excluir?',
           mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          vgDelPVImp := false;
          frmSenhaDelPV.ShowModal;
          if vgDelPVImp = true then
            ExcluirPreVenda;
        end;
      end;
    end
    else
      MessageDlg('Esta Pré-venda já foi efetivada!', mtWarning, [mbOk], 0);
  end;
end;

procedure TfrmPreVenda.ExcluirPrevenda;
begin
  // Apaga PrevRes -------------------------------------------------------------
  dsItens.DataSet.First;
  Repeat
  begin
    FiltrarPrevRes('pri_codigo', '=', IntToStr(dsItens.DataSet.FieldByName('pri_codigo').Value), '0');
    if Not(dsPrevRes.DataSet.FieldByName('PRV_NUMERO').IsNull) then
    begin
      DelPrevRes;
      AtualizaReservas(dsItens.DataSet.FieldByName('pro_codigo').Value);
    end;
    dsItens.DataSet.Next;
  end;
  Until dsItens.DataSet.Eof = True;
  // Apaga PrevItens -----------------------------------------------------------
  ScriptDelPrevItens(IntToStr(dsPreVenda.DataSet.FieldByName('prv_numero').Value));
  // Apaga Prevendent
  FiltrarPrevendent('prv_numero', '=', IntToStr(dsPreVenda.DataSet.FieldByName('prv_numero').Value), '0');
  if Not(dsPrevEndEnt.DataSet.FieldByName('PRV_NUMERO').IsNull) then
    DelPrevendent;
  // Apaga Prevenda
  DelPrevendas;
  MessageDlg('Pré-venda excluída com sucesso!', mtInformation, [mbOk], 0);
  vgNumPVOpen := '0';
  FiltrarPrevendas('P.PRV_NUMERO', '=', vgNumPVOpen, '0');
  btNovo.SetFocus;
end;

procedure TfrmPrevenda.btGravarClick(Sender: TObject);
begin
  PostPrevendas;
  if Not(dsPreVenda.DataSet.FieldByName('ORC_NUMERO').IsNull) then
  begin
    if MessageDlg('Deseja importar os itens do orçamento?', mtConfirmation, [mbYes, mbNo], 0)  = mrYes then
       ImportOrcItens(dsPreVenda.DataSet.FieldByName('ORC_NUMERO').Value, dsPreVenda.DataSet.FieldByName('PRV_NUMERO').Value);
     FiltrarOrcamentos('ORC_NUMERO', '=', dsPreVenda.DataSet.FieldByName('ORC_NUMERO').Text, '0');
     SetNumOrc(0);
     SetStatusOrc(2);
  end;
  if pnCodBar.Visible then
    edCodBar.SetFocus;
end;

procedure TfrmPrevenda.btNovoClick(Sender: TObject);
begin
  InsPrevendas;
  cbFuncionarios.PerformSearch;
  cbPrazo.PerformSearch;
  cbCliente.SetFocus;
end;

procedure TfrmPrevenda.cbClienteExit(Sender: TObject);
begin
  if dsPreVenda.DataSet.State in [dsInsert, dsEdit] then
  begin
    if ((cbCliente.Text = '') or (cbCliente.Text = ' ')) then
    begin
      cbCliente.Text := 'VENDA AO CONSUMIDOR';
      cbCliente.PerformSearch;
      dsPreVenda.DataSet.FieldByName('pes_codigo').Value := 0;
    end;
    if Not(dsPreVenda.DataSet.FieldByName('pes_codigo').IsNull) then
    begin
      dsPreVenda.DataSet.FieldByName('pes_codigo').Value := dmLookups.qyLkClientesPES_CODIGO.Value;
      dsPreVenda.DataSet.FieldByName('pes_fone').Text := GetNumFone(dsPreVenda.DataSet.FieldByName('PES_CODIGO').Value);
      vgPessoasEnd := TPessoasend.Create;
      GetEndereco(dsPreVenda.DataSet.FieldByName('pes_codigo').Value);
      dsPreVenda.DataSet.FieldByName('pes_logradouro').Text := vgPessoasEnd.Logradouro;
      dsPreVenda.DataSet.FieldByName('pes_numero').Value := vgPessoasEnd.Numero;
      dsPreVenda.DataSet.FieldByName('pes_bairro').Text := vgPessoasEnd.Bairro;
      dsPreVenda.DataSet.FieldByName('cid_codigo').Value := vgPessoasEnd.Codcidade;
      dsPreVenda.DataSet.FieldByName('cid_municipio').Text := vgPessoasEnd.Cidade;
      dsPreVenda.DataSet.FieldByName('uf_sigla').Text := vgPessoasEnd.Uf;
      dsPreVenda.DataSet.FieldByName('pes_cep').Text := vgPessoasEnd.Cep;
      vgPessoasEnd.Free;
    end;
    cbFuncionarios.SetFocus;
    cbFuncionarios.DropDown;
  end;
end;

procedure TfrmPrevenda.cbClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F4 then
    frmProcClientes.ShowModal;
end;

procedure TfrmPrevenda.cbClienteKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmPrevenda.cbEntregaExit(Sender: TObject);
begin
  if dsPreVenda.DataSet.State in [dsInsert, dsEdit] then
    dmOrcamentos.qyPrevendasENT_CODIGO.Value := dmLookups.qyLkEntregaENT_CODIGO.Value;
end;

procedure TfrmPrevenda.cbEntregaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmPrevenda.cbFormaExit(Sender: TObject);
begin
  if dsPreVenda.DataSet.State in [dsInsert, dsEdit] then
    dmOrcamentos.qyPrevendasFRP_CODIGO.Value := dmLookups.qyLkFormPagFRP_CODIGO.Value;
end;

procedure TfrmPrevenda.cbFormaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmPrevenda.cbFreteExit(Sender: TObject);
begin
  if dsPreVenda.DataSet.State in [dsInsert, dsEdit] then
    dmOrcamentos.qyPrevendasMDF_CODIGO.Value := dmLookups.qyLkModFreteMDF_CODIGO.Value;
end;

procedure TfrmPrevenda.cbFreteKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmPrevenda.cbFuncionariosExit(Sender: TObject);
begin
  if dsPreVenda.DataSet.State in [dsInsert, dsEdit] then
    dmOrcamentos.qyPrevendasfun_codigo.Value := dmLookups.qyLkVendedoresfun_codigo.Value;
end;

procedure TfrmPrevenda.cbFuncionariosKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmPrevenda.cbPrazoExit(Sender: TObject);
begin
  if dsPreVenda.DataSet.State in [dsInsert, dsEdit] then
    dmOrcamentos.qyPrevendasPRZ_CODIGO.Value := dmLookups.qyLkPrazosPRZ_CODIGO.Value;
end;

procedure TfrmPrevenda.cbPrazoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmPrevenda.cbProdutoExit(Sender: TObject);
begin
  FiltrarProdutos('PRO_CODIGO', '=', IntToStr(dmLookups.qyLkProdutosPRO_CODIGO.Value), '0');
  if Not(dmCadastros.qyProdutosPRO_CODIGO.IsNull) then
  begin
    dsItens.DataSet.FieldByName('PRO_CODIGO').Value := GetCodProd;
    dsItens.DataSet.FieldByName('UNI_CODIGO').Text := GetUniProd;
    dsItens.DataSet.FieldByName('PRI_VLRCUSTO').Value := GetCustoProd;
    if dsPreVenda.DataSet.FieldByName('PRV_TABVENDA').Value = 1 then
      dsItens.DataSet.FieldByName('PRI_VLRBRT').Value := GetTab1Prod;
    if dsPreVenda.DataSet.FieldByName('PRV_TABVENDA').Value = 2 then
      dsItens.DataSet.FieldByName('PRI_VLRBRT').Value := GetTab2Prod;
    dsItens.DataSet.FieldByName('PRI_VLRLIQ').Value := dsItens.DataSet.FieldByName('PRI_VLRBRT').Value;
    dsItens.DataSet.FieldByName('LOC_DESCRICAO').Value := GetLocalizacao;
  end;
end;

procedure TfrmPrevenda.cbtabelaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmPrevenda.dbReferenteKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmPrevenda.DetalhesdoItem1Click(Sender: TObject);
begin
  if Not(dsItens.DataSet.FieldByName('PRV_NUMERO').IsNull) then
    frmSenhaDetProdPV.ShowModal;
end;

procedure TfrmPrevenda.dsItensStateChange(Sender: TObject);
begin
  if dsItens.DataSet.State in [dsInsert, dsEdit] then
  begin
    sbNovoItem.Enabled := False;
    sbExcluirItem.Enabled := False;
    sbGravarItem.Enabled := True;
    sbCancelarItem.Enabled := True;
    if dmOrcamentos.qyPrevItens.State in [dsInsert] then
      dmOrcamentos.qyPrevItenspri_codigo.Value := GetCodigo('pri_codigo', 'previtens');
    if dsPreVenda.DataSet.FieldByName('sto_codigo').Value = 5 then
    begin
      MessageDlg('A Pré-venda já foi efetivada!', mtWarning, [mbOk], 0);
      dsItens.DataSet.Cancel;
    end;
  end
  else
  begin
    sbNovoItem.Enabled := True;
    sbExcluirItem.Enabled := True;
    sbGravarItem.Enabled := False;
    sbCancelarItem.Enabled := False;
  end;
end;

procedure TfrmPrevenda.dsPreVendaDataChange(Sender: TObject; Field: TField);
begin
  if dsPreVenda.DataSet.FieldByName('PRV_NUMERO').IsNull then
    FiltrarPrevItens('PRV_NUMERO', '=', '0', '0')
  else
    FiltrarPrevItens('PRV_NUMERO', '=', IntToStr(dsPreVenda.DataSet.FieldByName('PRV_NUMERO').Value), 'PRI_CODIGO');
end;

procedure TfrmPrevenda.dsPreVendaStateChange(Sender: TObject);
begin
  if dsPreVenda.DataSet.State in [dsInsert, dsEdit] then
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

procedure TfrmPrevenda.edCodBarKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if ((edCodBar.Text <> '') and (edCodBar.Text <> ' ')) then
    begin
      vgQdtEmbPV := StrToFloat(edQtde.Text); // Pega quantidade, pode ser alterada por embalagem
      if FiltrarProdutosCodBar(edCodBar.Text, 1) = true then
      begin
        AppendPrevItens;
        if dsItens.DataSet.State in [dsInsert] then // Incluído devido ao controle de PV Efetivada
        begin
          dsItens.DataSet.FieldByName('PRI_QUANTIDADE').Value := vgQdtEmbPV;
          dsItens.DataSet.FieldByName('PRO_DESCRICAO').Value := GetDescProd;
          dsItens.DataSet.FieldByName('PRO_CODIGO').Value := GetCodProd;
          dsItens.DataSet.FieldByName('UNI_CODIGO').Text := GetUniProd;
          dsItens.DataSet.FieldByName('PRI_VLRCUSTO').Value := GetCustoProd;
          if dsPreVenda.DataSet.FieldByName('PRV_TABVENDA').Value = 1 then
            dsItens.DataSet.FieldByName('PRI_VLRBRT').Value := GetTab1Prod;
          if dsPreVenda.DataSet.FieldByName('PRV_TABVENDA').Value = 2 then
            dsItens.DataSet.FieldByName('PRI_VLRBRT').Value := GetTab2Prod;
          dsItens.DataSet.FieldByName('PRI_VLRLIQ').Value := dsItens.DataSet.FieldByName('PRI_VLRBRT').Value;
          dsItens.DataSet.FieldByName('LOC_DESCRICAO').Value := GetLocalizacao;
          PostPrevItens;
        end;
        dsItens.DataSet.Refresh;
        vgQdtEmbPV := 1;
        edQtde.Text := '1';
        edCodBar.Clear;
        edCodBar.SetFocus;
      end
      else
      begin
        MessageDlg('Produto código: ' + edCodBar.Text + ' não encontrado!', mtWarning, [mbOk], 0);
        edCodBar.Clear;
        edCodBar.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmPrevenda.edQtdeExit(Sender: TObject);
begin
  if ((edQtde.Text = '') or (edQtde.Text = ' ')) then
    edQtde.Text := '1';
end;

procedure TfrmPrevenda.edQtdeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    edCodBar.SetFocus;
end;

procedure TfrmPrevenda.FormActivate(Sender: TObject);
begin
  pnCodBar.Visible := False;
  inherited;
  edQtde.Text := '1';
  edCodBar.Clear;
  if vgCodBarPV = '1' then
    pnCodBar.Visible := True;
  if ((pnCodBar.Visible = true) and (edCodBar.Enabled = true)) then
    edCodBar.SetFocus
  else
    btNovo.SetFocus;
  //Caso busque uma Pré-venda atualiza o total se o orçamento estiver em aberto
  if Not(dsItens.DataSet.FieldByName('prv_numero').IsNull) then
    if dsPreVenda.DataSet.FieldByName('sto_codigo').Value = 1 then
      AtualizaTotalPREV(dsPreVenda.DataSet.FieldByName('prv_numero').Value);
end;

procedure TfrmPrevenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dmOrcamentos.database.InTransaction = True then
    dmOrcamentos.database.Rollback;
  inherited;
end;

procedure TfrmPrevenda.FormCreate(Sender: TObject);
begin
  inherited;
  Self.WindowState := wsMaximized;
  FiltrarPrevendas('P.PRV_NUMERO', '=', vgNumPVOpen, '0');
end;

procedure TfrmPrevenda.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmPrevenda <> nil then
    frmPrevenda := nil;
end;

procedure TfrmPrevenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //Não pode herdar para não pular automaticamente, não funciona o CodBar
  //inherited;
end;

procedure TfrmPrevenda.InformaesdoProduto1Click(Sender: TObject);
begin
  if Not(dsItens.DataSet.FieldByName('PRO_CODIGO').IsNull) then
  begin
    vgConsProdutos := IntToStr(dsItens.DataSet.FieldByName('PRO_CODIGO').Value);
    frmConsProdutos.ShowModal;
  end;
end;

procedure TfrmPrevenda.sbCancelarItemClick(Sender: TObject);
begin
  dsItens.DataSet.Cancel;
end;

procedure TfrmPrevenda.sbDetalhesClick(Sender: TObject);
begin
  frmSenhaDetPrev.ShowModal;
end;

procedure TfrmPrevenda.sbExcluirItemClick(Sender: TObject);
Var
vCodProd: Integer;

begin
  if Not(dsItens.DataSet.FieldByName('PRV_NUMERO').IsNull) then
    if MessageDlg('Deseja realmente excluir o item selecionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      if dsPreVenda.DataSet.FieldByName('sto_codigo').Value <> 5 then
      begin
        // Verifica se produto movimenta estoque -----------------------------
        FiltrarProdutos('p.pro_codigo', '=', IntToStr(dmOrcamentos.qyPrevItensPRO_CODIGO.Value), '0');
        if GetProdMov = 'S' then
        begin
          vCodProd := dmOrcamentos.qyPrevItensPRO_CODIGO.Value;
          FiltrarPrevRes('pri_codigo', '=', IntToStr(dmOrcamentos.qyPrevItensPRI_CODIGO.Value),'0');
          DelPrevRes;
          DelPrevItens;
          AtualizaReservas(vCodProd);
        end;
      end
      else
        MessageDlg('Esta Pré-venda já foi efetuada!', mtWarning, [mbOk], 0);
    end;
end;

procedure TfrmPrevenda.sbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrevenda.sbGravarItemClick(Sender: TObject);
begin
  PostPrevItens;
  AtualizaTotalPREV(dsPreVenda.DataSet.FieldByName('prv_numero').Value);
end;

procedure TfrmPrevenda.sbNovoItemClick(Sender: TObject);
begin
  actInserir.Execute;
end;

procedure TfrmPrevenda.sbProcClientesClick(Sender: TObject);
begin
  if dsPreVenda.DataSet.State in [dsInsert, dsEdit] then
    frmProcClientes.ShowModal;
end;

procedure TfrmPrevenda.dtpDataKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmPrevenda.sbOrcamentoClick(Sender: TObject);
begin
  if dsPreVenda.DataSet.State in [dsInsert, dsEdit] then
  begin
    frmConsOrcamentos.ShowModal;
    if Not(dsPreVenda.DataSet.FieldByName('orc_numero').IsNull) then
    begin
      vgPreVenda := TPrevendas.Create;
      ImportOrc(dsPreVenda.DataSet.FieldByName('orc_numero').Value);
      dsPreVenda.DataSet.FieldByName('pes_codigo').Value := vgPreVenda.Codcliente;
      dsPreVenda.DataSet.FieldByName('pes_nome').Text := vgPreVenda.Cliente;
      dsPreVenda.DataSet.FieldByName('pes_fone').Text := vgPreVenda.Fone;
      dsPreVenda.DataSet.FieldByName('fun_codigo').Value := vgPreVenda.Codfuncionario;
      dsPreVenda.DataSet.FieldByName('fun_nome').Text := vgPreVenda.Funcionario;
      dsPreVenda.DataSet.FieldByName('prv_tabvenda').Value := vgPreVenda.Tabvenda;
      dsPreVenda.DataSet.FieldByName('prz_codigo').Value := vgPreVenda.Codprazo;
      dsPreVenda.DataSet.FieldByName('prz_descricao').Text := vgPreVenda.Prazo;
      dsPreVenda.DataSet.FieldByName('FRP_CODIGO').Value := vgPreVenda.Codforma;
      dsPreVenda.DataSet.FieldByName('FRP_DESCRICAO').Text := vgPreVenda.Forma;
      dsPreVenda.DataSet.FieldByName('MDF_CODIGO').Value := vgPreVenda.Modfrete;
      dsPreVenda.DataSet.FieldByName('MDF_DESCRICAO').Text := vgPreVenda.Frete;
      dsPreVenda.DataSet.FieldByName('PRV_ENTREGA').Text := vgPreVenda.Entrega;
      dsPreVenda.DataSet.FieldByName('PRV_REFERENTE').Text := vgPreVenda.Referente;
      dsPreVenda.DataSet.FieldByName('PRV_OBS').Text := vgPreVenda.Obs;
      dsPreVenda.DataSet.FieldByName('PRV_VLRCUSTO').Value := vgPreVenda.Vlrcusto;
      dsPreVenda.DataSet.FieldByName('PRV_SUBTOTAL').Value := vgPreVenda.Subtotal;
      dsPreVenda.DataSet.FieldByName('PRV_VLRDESC').Value := vgPreVenda.Vlrdesc;
      dsPreVenda.DataSet.FieldByName('PRV_PERCDESC').Value := vgPreVenda.Percdesc;
      dsPreVenda.DataSet.FieldByName('PRV_VLRTOTAL').Value := vgPreVenda.Vlrtotal;
      dsPreVenda.DataSet.FieldByName('PRV_PERCMG').Value := vgPreVenda.Permg;
      dsPreVenda.DataSet.FieldByName('PRV_VLRLUCRO').Value := vgPreVenda.Vlrlucro;
      vgPreVenda.Free;
    end;
  end;
end;

end.
