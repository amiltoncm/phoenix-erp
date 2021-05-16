unit uCadProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, Vcl.ImgList,
  Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, wwdblook, wwdbedit, Wwdotdot, Wwdbcomb,
  wwdbdatetimepicker, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvExMask,
  JvToolEdit, JvBaseEdits, JvDBControls, System.ImageList, System.Actions;

type
  TfrmCadProdutos = class(TfrmTmpCadastro)
    PageCadastro: TPageControl;
    tsDescricao: TTabSheet;
    lbCodigo: TLabel;
    dbCodigo: TDBEdit;
    lbDescricao: TLabel;
    dbDescricao: TDBEdit;
    cbUnidades: TwwDBLookupCombo;
    Label1: TLabel;
    dbCodUnidade: TDBEdit;
    Label2: TLabel;
    dbCodBarras: TDBEdit;
    Label3: TLabel;
    cbLocalizacao: TwwDBLookupCombo;
    Label4: TLabel;
    cbGrupos: TwwDBLookupCombo;
    Label5: TLabel;
    dbCodGrupo: TDBEdit;
    cbSubgrupo: TwwDBLookupCombo;
    Label7: TLabel;
    Label8: TLabel;
    dbCodSub: TDBEdit;
    cbMarca: TwwDBLookupCombo;
    Label9: TLabel;
    dbCodMarca: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    cbStatus: TwwDBComboBox;
    Label12: TLabel;
    tsCustos: TTabSheet;
    cbInativar: TwwDBComboBox;
    Label13: TLabel;
    dbVlrUnitario: TDBEdit;
    Label14: TLabel;
    dbVlrFrete: TDBEdit;
    Label15: TLabel;
    dbVlrOutras: TDBEdit;
    Label16: TLabel;
    dbVlrImportacao: TDBEdit;
    Label17: TLabel;
    dbVlrCusto: TDBEdit;
    Label18: TLabel;
    dbMkpAtac: TDBEdit;
    Label19: TLabel;
    dbVlrAtac: TDBEdit;
    Label20: TLabel;
    dbMkpVar: TDBEdit;
    Label21: TLabel;
    dbVlrVar: TDBEdit;
    Label22: TLabel;
    dbMgMin: TDBEdit;
    Label23: TLabel;
    dbDescMax: TDBEdit;
    Label24: TLabel;
    dtpDataCad: TwwDBDateTimePicker;
    tsEstoque: TTabSheet;
    Label25: TLabel;
    Label26: TLabel;
    dbEstMin: TDBEdit;
    Label27: TLabel;
    dbEstIde: TDBEdit;
    Label28: TLabel;
    dbPesoBrt: TDBEdit;
    Label29: TLabel;
    dbPesoLiq: TDBEdit;
    tsFiscal: TTabSheet;
    cbTipoItem: TwwDBLookupCombo;
    Label30: TLabel;
    Label31: TLabel;
    dbCodTipo: TDBEdit;
    cbOrigem: TwwDBComboBox;
    Label32: TLabel;
    Label33: TLabel;
    cbClassFisc: TwwDBComboBox;
    Label34: TLabel;
    dbNCM: TDBEdit;
    spAnterior: TSpeedButton;
    spProxima: TSpeedButton;
    cbMovEst: TwwDBComboBox;
    actCopyCad: TAction;
    ToolButton4: TToolButton;
    pnEstoque: TPanel;
    pnTitleEstoque: TPanel;
    Label35: TLabel;
    dsProdutosEst: TDataSource;
    JvDBGrid1: TJvDBGrid;
    dsProdutosMov: TDataSource;
    tsFornecedores: TTabSheet;
    Panel1: TPanel;
    dsProdutosFor: TDataSource;
    Label37: TLabel;
    dbCodFornecedor: TDBEdit;
    Label38: TLabel;
    Label39: TLabel;
    dbRefForn: TDBEdit;
    Label40: TLabel;
    dbUnCompra: TDBEdit;
    Label41: TLabel;
    dbUnVenda: TDBEdit;
    Label42: TLabel;
    dbCodBarFor: TDBEdit;
    cbFornecedor: TwwDBLookupCombo;
    JvDBGrid3: TJvDBGrid;
    Panel2: TPanel;
    sbNovoProdFor: TSpeedButton;
    sbExcluirProdFor: TSpeedButton;
    sbGravarProdFor: TSpeedButton;
    sbCancelarProdFor: TSpeedButton;
    dbCEST: TDBEdit;
    Label43: TLabel;
    Label44: TLabel;
    dbEmbalagem: TDBEdit;
    Label45: TLabel;
    dbCodBarrasEmb: TDBEdit;
    tsMovimentacoes: TTabSheet;
    Panel3: TPanel;
    Label46: TLabel;
    GridMov: TDBGrid;
    pnReservas: TPanel;
    Label47: TLabel;
    DBGrid1: TDBGrid;
    dsPrevRes: TDataSource;
    sbDetMov: TSpeedButton;
    tsComplementares: TTabSheet;
    tsSimilares: TTabSheet;
    tsObs: TTabSheet;
    Panel4: TPanel;
    Panel5: TPanel;
    sbExcluirSim: TSpeedButton;
    Panel6: TPanel;
    sbGravarObs: TSpeedButton;
    sbCancelarObs: TSpeedButton;
    dsProdComp: TDataSource;
    dsProdSim: TDataSource;
    dsProdObs: TDataSource;
    sbExcluirComp: TSpeedButton;
    reMemObs: TDBRichEdit;
    Label36: TLabel;
    Label48: TLabel;
    cbProcComp: TwwDBLookupCombo;
    cbProcSim: TwwDBLookupCombo;
    GridComp: TDBGrid;
    GridSim: TDBGrid;
    btInsComp: TBitBtn;
    btInsSim: TBitBtn;
    sbNumero: TSpeedButton;
    actProcNum: TAction;
    Label6: TLabel;
    dbCredICMS: TJvDBCalcEdit;
    dsCopaCoz: TDataSource;
    tsCopaCoz: TTabSheet;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    Panel7: TPanel;
    sbExcluirCopaCoz: TSpeedButton;
    sbGravarCopaCoz: TSpeedButton;
    sbCancelarCopaCoz: TSpeedButton;
    sbNovoCopaCoz: TSpeedButton;
    procedure Calcular;
    procedure FormDestroy(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actAtualizarExecute(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actProcurarExecute(Sender: TObject);
    procedure cbUnidadesExit(Sender: TObject);
    procedure cbLocalizacaoExit(Sender: TObject);
    procedure cbGruposExit(Sender: TObject);
    procedure cbSubgrupoExit(Sender: TObject);
    procedure cbMarcaExit(Sender: TObject);
    procedure dbVlrUnitarioExit(Sender: TObject);
    procedure dbVlrFreteExit(Sender: TObject);
    procedure dbVlrOutrasExit(Sender: TObject);
    procedure dbVlrImportacaoExit(Sender: TObject);
    procedure dbVlrCustoExit(Sender: TObject);
    procedure dbMkpAtacExit(Sender: TObject);
    procedure dbVlrAtacExit(Sender: TObject);
    procedure dbMkpVarExit(Sender: TObject);
    procedure dbVlrVarExit(Sender: TObject);
    procedure spAnteriorClick(Sender: TObject);
    procedure spProximaClick(Sender: TObject);
    procedure tsDescricaoShow(Sender: TObject);
    procedure tsCustosShow(Sender: TObject);
    procedure tsEstoqueShow(Sender: TObject);
    procedure tsFiscalShow(Sender: TObject);
    procedure dbDescMaxExit(Sender: TObject);
    procedure cbInativarExit(Sender: TObject);
    procedure dsCadastroStateChange(Sender: TObject);
    procedure actCopyCadExecute(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure tsFornecedoresShow(Sender: TObject);
    procedure cbFornecedorExit(Sender: TObject);
    procedure sbNovoProdForClick(Sender: TObject);
    procedure sbExcluirProdForClick(Sender: TObject);
    procedure sbGravarProdForClick(Sender: TObject);
    procedure sbCancelarProdForClick(Sender: TObject);
    procedure dbNCMExit(Sender: TObject);
    procedure cbTipoItemExit(Sender: TObject);
    procedure dsProdutosForStateChange(Sender: TObject);
    procedure GridMovDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbDetMovClick(Sender: TObject);
    procedure dsProdCompStateChange(Sender: TObject);
    procedure dsProdSimStateChange(Sender: TObject);
    procedure dsProdObsStateChange(Sender: TObject);
    procedure sbGravarObsClick(Sender: TObject);
    procedure sbCancelarObsClick(Sender: TObject);
    procedure btInsCompClick(Sender: TObject);
    procedure btInsSimClick(Sender: TObject);
    procedure sbExcluirSimClick(Sender: TObject);
    procedure sbExcluirCompClick(Sender: TObject);
    procedure dbCodBarrasKeyPress(Sender: TObject; var Key: Char);
    procedure dbCodBarrasEmbKeyPress(Sender: TObject; var Key: Char);
    procedure dbCodBarrasExit(Sender: TObject);
    procedure actProcNumExecute(Sender: TObject);
    procedure dbCodBarrasEmbExit(Sender: TObject);
    procedure dbCredICMSExit(Sender: TObject);
    procedure sbCancelarCopaCozClick(Sender: TObject);
    procedure sbGravarCopaCozClick(Sender: TObject);
    procedure sbExcluirCopaCozClick(Sender: TObject);
    procedure dsCopaCozStateChange(Sender: TObject);
    procedure sbNovoCopaCozClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProdutos: TfrmCadProdutos;

implementation

{$R *.dfm}

uses dataCadastros, dataLookups, uDaoLookups, uDaoProdutos, uProcProdutos,
  uFuncoesDB, uClassProdutos, uDaoConfig, uDaoProdutosEst, dataEstoque,
  uDaoProdutosMov, dataConsultas, uDaoProdutosFor, uDaoPrevRes, uVarGlobal,
  uDetProdMov, uDaoProdutosComp, uDaoProdutosObs, uDaoProdutosSim, uClassProdutossim,
  uClassProdutoscomp, uFuncoesFormatacao, uFuncoesValidacao, dataGestao,
  uDaoProdComanda;

procedure TfrmCadProdutos.Calcular;
Var
vVlrUnitario, vVlrFrete, vVlrOutras, vVlrImport, vVlrCusto: Real;
vMkpAtac, vVlrAtac, vMkpVar, vVlrVar, vVlrCred: Real;
begin
  // Calcula Custo -------------------------------------------------------------
  if dsCadastro.DataSet.FieldByName('PRO_VLRUNITARIO').IsNull then
    vVlrUnitario := 0
  else
    vVlrUnitario := dsCadastro.DataSet.FieldByName('PRO_VLRUNITARIO').Value;
  if dsCadastro.DataSet.FieldByName('pro_credicms').IsNull then
    vVlrCred := 0
  else
    vVlrCred := dsCadastro.DataSet.FieldByName('pro_credicms').Value;
  if dsCadastro.DataSet.FieldByName('PRO_VLRFRETE').IsNull then
    vVlrFrete := 0
  else
    vVlrFrete := dsCadastro.DataSet.FieldByName('PRO_VLRFRETE').Value;
  if dsCadastro.DataSet.FieldByName('PRO_VLROUTRAS').IsNull then
    vVlrOutras := 0
  else
    vVlrOutras := dsCadastro.DataSet.FieldByName('PRO_VLROUTRAS').Value;
  if dsCadastro.DataSet.FieldByName('PRO_VLRIMPORT').IsNull then
    vVlrImport := 0
  else
    vVlrImport := dsCadastro.DataSet.FieldByName('PRO_VLRIMPORT').Value;
  vVlrCusto := vVlrUnitario + vVlrFrete + vVlrOutras + vVlrImport - vVlrCred;
  dsCadastro.DataSet.FieldByName('PRO_VLRCUSTO').Value := vVlrCusto;
  // Calcula Preço de venda ----------------------------------------------------
  if dsCadastro.DataSet.FieldByName('PRO_MKPATAC').IsNull then
    vMkpAtac := 0
  else
    vMkpAtac := dsCadastro.DataSet.FieldByName('PRO_MKPATAC').Value;
  if dsCadastro.DataSet.FieldByName('PRO_MKPVAR').IsNull then
    vMkpVar := 0
  else
    vMkpVar := dsCadastro.DataSet.FieldByName('PRO_MKPVAR').Value;
  vVlrAtac := ((vVlrCusto * vMkpAtac)/ 100) + vVlrCusto;
  vVlrVar := ((vVlrCusto * vMkpVar)/ 100) + vVlrCusto;
  dsCadastro.DataSet.FieldByName('PRO_VLRATAC').Value := vVlrAtac;
  dsCadastro.DataSet.FieldByName('PRO_VLRVAR').Value := vVlrVar;
end;

procedure TfrmCadProdutos.actAlterarExecute(Sender: TObject);
begin
  inherited;
  PageCadastro.ActivePage := tsDescricao;
  dbDescricao.SetFocus;
end;

procedure TfrmCadProdutos.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadProdutos.actCopyCadExecute(Sender: TObject);
Var
vProdutos: TProdutos;
begin
  if MessageDlg('Deseja inserir novo item copiando o atual?' + #13 + '(Deve ser alterado a descrição!)', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    vProdutos := TProdutos.Create;
    vProdutos.Descricao := dsCadastro.DataSet.FieldByName('PRO_DESCRICAO').Text;
    vProdutos.Codunidade := dsCadastro.DataSet.FieldByName('UNI_CODIGO').Value;
    vProdutos.Unidade := dsCadastro.DataSet.FieldByName('UNI_DESCRICAO').Text;
    vProdutos.Codgrupo := dsCadastro.DataSet.FieldByName('GRP_CODIGO').Value;
    vProdutos.Grupo := dsCadastro.DataSet.FieldByName('GRP_DESCRICAO').Text;
    vProdutos.Codsubgrupo := dsCadastro.DataSet.FieldByName('SGR_CODIGO').Value;
    vProdutos.Subgrupo := dsCadastro.DataSet.FieldByName('SGR_DESCRICAO').Text;
    vProdutos.Codmarca := dsCadastro.DataSet.FieldByName('MAR_CODIGO').Value;
    vProdutos.Marca := dsCadastro.DataSet.FieldByName('MAR_DESCRICAO').Text;
    vProdutos.Codbarras := dsCadastro.DataSet.FieldByName('PRO_CODBARRAS').Text;
    vProdutos.Codtipo := dsCadastro.DataSet.FieldByName('TIP_CODIGO').Value;
    vProdutos.Tipo := dsCadastro.DataSet.FieldByName('TIP_DESCRICAO').Text;
    vProdutos.Classif := dsCadastro.DataSet.FieldByName('PRO_CLASSFISC').Value;
    vProdutos.Vlrunitario := dsCadastro.DataSet.FieldByName('PRO_VLRUNITARIO').Value;
    vProdutos.Vlrfrete := dsCadastro.DataSet.FieldByName('PRO_VLRFRETE').Value;
    vProdutos.Vlroutras := dsCadastro.DataSet.FieldByName('PRO_VLROUTRAS').Value;
    vProdutos.Vlrimport := dsCadastro.DataSet.FieldByName('PRO_VLRIMPORT').Value;
    vProdutos.Vlrcusto := dsCadastro.DataSet.FieldByName('PRO_VLRCUSTO').Value;
    vProdutos.CredIcms := dsCadastro.DataSet.FieldByName('pro_credicms').Value;
    vProdutos.Mkpatac := dsCadastro.DataSet.FieldByName('PRO_MKPATAC').Value;
    vProdutos.Mkpvar := dsCadastro.DataSet.FieldByName('PRO_MKPVAR').Value;
    vProdutos.Vlratac := dsCadastro.DataSet.FieldByName('PRO_VLRATAC').Value;
    vProdutos.Vlrvar := dsCadastro.DataSet.FieldByName('PRO_VLRVAR').Value;
    vProdutos.Mgmin := dsCadastro.DataSet.FieldByName('PRO_MGMIN').Value;
    vProdutos.Descmax := dsCadastro.DataSet.FieldByName('PRO_DESMAX').Value;
    vProdutos.Movest := dsCadastro.DataSet.FieldByName('PRO_MOVEST').Text;
    vProdutos.Codlocal := dsCadastro.DataSet.FieldByName('LOC_CODIGO').Value;
    vProdutos.Local := dsCadastro.DataSet.FieldByName('LOC_DESCRICAO').Text;
    vProdutos.Estmin := dsCadastro.DataSet.FieldByName('PRO_ESTMIN').Value;
    vProdutos.Estide := dsCadastro.DataSet.FieldByName('PRO_ESTIDEAL').Value;
    vProdutos.Pesobruto := dsCadastro.DataSet.FieldByName('PRO_PESOBRUTO').Value;
    vProdutos.Pesoliq := dsCadastro.DataSet.FieldByName('PRO_PESOLIQ').Value;
    vProdutos.Origem := dsCadastro.DataSet.FieldByName('PRO_ORIGEM').Value;
    vProdutos.Inativar := dsCadastro.DataSet.FieldByName('PRO_INATZERAR').Value;
    vProdutos.Ncm := dsCadastro.DataSet.FieldByName('PRO_NCM').Text;
    vProdutos.Status := dsCadastro.DataSet.FieldByName('PRO_STATUS').Text;
    vProdutos.Embalagem := dsCadastro.DataSet.FieldByName('pro_embalagem').Value;
    InsProdutos;
    SetValuesProdutos(vProdutos);
    vProdutos.Free;
    PageCadastro.ActivePage := tsDescricao;
    dbDescricao.SetFocus;
  end;
end;

procedure TfrmCadProdutos.actGravarExecute(Sender: TObject);
Var
vBarras: String;
begin
  if dsCadastro.DataSet.State in [dsInsert] then
    dsCadastro.DataSet.FieldByName('PRO_CODIGO').Value := GetCodigo('PRO_CODIGO', 'PRODUTOS');
  inherited;
  AtualizarLookup('PRODUTOS');
  // Verifica CodBar e CodBarEmb Duplicados
  if Not(dsCadastro.DataSet.FieldByName('pro_codbarras').IsNull) then
  begin
    if dsCadastro.DataSet.FieldByName('pro_codbarras').Text <> '' then
    begin
      vBarras := TestaDupCodBar(dsCadastro.DataSet.FieldByName('pro_codbarras').Text);
      if vBarras <> '0' then
      begin
        MessageDlg('O Código de Barras: ' + dsCadastro.DataSet.FieldByName('pro_codbarras').Text + #13 +
                   'está sendo utilizado em mais de um produto:' + #13 +
                   vBarras, mtWarning, [mbOk], 0);
      end;
    end;
  end;
  if Not(dsCadastro.DataSet.FieldByName('pro_codbarrasemb').IsNull) then
  begin
    if dsCadastro.DataSet.FieldByName('pro_codbarrasemb').Text <> '' then
    begin
      vBarras := TestaDupCodBarEmb(dsCadastro.DataSet.FieldByName('pro_codbarrasemb').Text);
      if vBarras <> '0' then
      begin
        MessageDlg('O Código de Barras de embalagem: ' + dsCadastro.DataSet.FieldByName('pro_codbarrasemb').Text + #13 +
                   'está sendo utilizado em mais de um produto:' + #13 +
                   vBarras, mtWarning, [mbOk], 0);
      end;
    end;
  end;
end;

procedure TfrmCadProdutos.actLimparExecute(Sender: TObject);
begin
  ListarProdutos('PRO_DESCRICAO');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadProdutos.actNovoExecute(Sender: TObject);
begin
  inherited;
  PageCadastro.ActivePage := tsDescricao;
  dbDescricao.SetFocus;
end;

procedure TfrmCadProdutos.actProcNumExecute(Sender: TObject);
Var
vCodProd: String;
vOk: boolean;
begin
  vOK := InputQuery('Localizar Produto', 'Digite o Código do Produto:', vCodProd);
  if vOK then
  begin
    if ((vCodProd <> '') and (vCodProd <> ' ')) then
    begin
      if TestaInteiro(vCodProd) = true then
      begin
        FiltrarProdutos('pro_codigo', '=', vCodProd, '0');
        if dsCadastro.DataSet.FieldByName('pro_codigo').IsNull then
          MessageDlg('Produto: ' + vCodProd + ' não encontrado!', mtWarning, [mbOk], 0);
      end;
    end;
  end;
end;

procedure TfrmCadProdutos.actProcurarExecute(Sender: TObject);
begin
  ListarProdutos('PRO_DESCRICAO');
  frmProcProdutos.ShowModal;
end;

procedure TfrmCadProdutos.btInsCompClick(Sender: TObject);
Var
vProdComp: TProdutosComp;
begin
  if ((cbProcComp.Text <> '') and (cbProcComp.Text <> ' '))  then
  begin
    if dsCadastro.DataSet.FieldByName('pro_codigo').Value <>
       dmLookups.qyLkProdutosPRO_CODIGO.Value then
    begin
      if TestaProdComp(IntToStr(dsCadastro.DataSet.FieldByName('pro_codigo').Value),
                      IntToStr(dmLookups.qyLkProdutosPRO_CODIGO.Value)) = false then
      begin
        vProdComp := TProdutoscomp.Create;
        vProdComp.Codigo := dsCadastro.DataSet.FieldByName('pro_codigo').Value;
        vProdComp.Codcomp := dmLookups.qyLkProdutosPRO_CODIGO.Value;
        InsProdutosComp;
        SetValuesProdutosComp(vProdComp);
        PostProdutosComp;
        vProdComp.Free;
        dsProdComp.DataSet.Refresh;
        cbProcComp.Text := '';
      end
      else
        MessageDlg('Produto já inserido!', mtWarning, [mbOk], 0);
    end
    else
      MessageDlg('Produto deve ser diferente!', mtWarning, [mbOk], 0);
  end
  else
    MessageDlg('É becessário selecionar um produto!', mtWarning, [mbOk], 0);
end;

procedure TfrmCadProdutos.btInsSimClick(Sender: TObject);
Var
vProdSim: TProdutosSim;
begin
  if ((cbProcSim.Text <> '') and (cbProcSim.Text <> ' '))  then
  begin
    if dsCadastro.DataSet.FieldByName('pro_codigo').Value <>
       dmLookups.qyLkProdutosPRO_CODIGO.Value then
    begin
      if TestaProdSim(IntToStr(dsCadastro.DataSet.FieldByName('pro_codigo').Value),
                      IntToStr(dmLookups.qyLkProdutosPRO_CODIGO.Value)) = false then
      begin
        vProdSim := TProdutossim.Create;
        vProdSim.Codigo := dsCadastro.DataSet.FieldByName('pro_codigo').Value;
        vProdSim.Codsim := dmLookups.qyLkProdutosPRO_CODIGO.Value;
        InsProdutosSim;
        SetValuesProdutosSim(vProdSim);
        PostProdutosSim;
        vProdSim.Free;
        dsProdSim.DataSet.Refresh;
        cbProcSim.Text := '';
      end
      else
        MessageDlg('Produto já inserido!', mtWarning, [mbOk], 0);
    end
    else
      MessageDlg('Produto deve ser diferente!', mtWarning, [mbOk], 0);
  end
  else
    MessageDlg('É becessário selecionar um produto!', mtWarning, [mbOk], 0);
end;

procedure TfrmCadProdutos.cbFornecedorExit(Sender: TObject);
begin
  if dsProdutosFor.DataSet.State in [dsInsert, dsEdit] then
    dsProdutosFor.DataSet.FieldByName('PES_CODIGO').Value := dmLookups.qyLkFornecedoresPES_CODIGO.Value;
end;

procedure TfrmCadProdutos.cbGruposExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
  begin
    if ((cbGrupos.Text = '') or (cbGrupos.Text = ' ')) then
      FiltrarSubGrupo('0')
    else
    begin
      dsCadastro.DataSet.FieldByName('GRP_CODIGO').Value := dmLookups.qyLkGruposGRP_CODIGO.Value;
      FiltrarSubGrupo(dsCadastro.DataSet.FieldByName('GRP_CODIGO').Text);
    end;
  end;
end;

procedure TfrmCadProdutos.cbInativarExit(Sender: TObject);
begin
  inherited;
  PageCadastro.ActivePage := tsCustos;
  dbVlrUnitario.SetFocus;
end;

procedure TfrmCadProdutos.cbLocalizacaoExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    dsCadastro.DataSet.FieldByName('LOC_CODIGO').Value := dmLookups.qyLkLocalizacaoLOC_CODIGO.Value;
end;

procedure TfrmCadProdutos.cbMarcaExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    dsCadastro.DataSet.FieldByName('MAR_CODIGO').Value := dmLookups.qyLkMarcasMAR_CODIGO.Value;
end;

procedure TfrmCadProdutos.cbSubgrupoExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
  begin
    dsCadastro.DataSet.FieldByName('SGR_CODIGO').Value := dmLookups.qyLkSubGruposCadSGR_CODIGO.Value;
    SetMkpAtac(dmLookups.qyLkSubGruposSGR_MKPATAC.Value);
    SetMkpVar(dmLookups.qyLkSubGruposSGR_MKPVAR.Value);
    Calcular;
  end;
end;

procedure TfrmCadProdutos.cbTipoItemExit(Sender: TObject);
begin
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    dsCadastro.DataSet.FieldByName('tip_codigo').Value := dmLookups.qyLkTipoItemTIP_CODIGO.Value;
end;

procedure TfrmCadProdutos.cbUnidadesExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    dsCadastro.DataSet.FieldByName('UNI_CODIGO').Value := dmLookups.qyLkUnidadesUNI_CODIGO.Value;
end;

procedure TfrmCadProdutos.dbCodBarrasEmbExit(Sender: TObject);
begin
  inherited;
  PageCadastro.ActivePage := tsFiscal;
  cbTipoItem.SetFocus;
end;

procedure TfrmCadProdutos.dbCodBarrasEmbKeyPress(Sender: TObject;
  var Key: Char);
begin
  key := Numeros(key);
end;

procedure TfrmCadProdutos.dbCodBarrasExit(Sender: TObject);
begin
  if (Length(dbCodBarras.Text) = 13) then
  begin
    if Ean13(dbCodBarras.Text) = false then
      MessageDlg('Código de barras inválido!', mtWarning, [mbOk], 0);
  end;
end;

procedure TfrmCadProdutos.dbCodBarrasKeyPress(Sender: TObject; var Key: Char);
begin
  key := Numeros(key);
end;

procedure TfrmCadProdutos.dbCredICMSExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    Calcular;
end;

procedure TfrmCadProdutos.dbDescMaxExit(Sender: TObject);
begin
  inherited;
  PageCadastro.ActivePage := tsEstoque;
  cbMovEst.SetFocus;
end;

procedure TfrmCadProdutos.dbMkpAtacExit(Sender: TObject);
Var
vCusto, vMkpAtac, vVlrAtac: Real;
begin
  if dsCadastro.DataSet.FieldByName('pro_vlrcusto').IsNull then
    vCusto := 0
  else
    vCusto := dsCadastro.DataSet.FieldByName('pro_vlrcusto').Value;
  if dsCadastro.DataSet.FieldByName('pro_mkpatac').IsNull then
    vMkpAtac := 0
  else
    vMkpAtac := dsCadastro.DataSet.FieldByName('pro_mkpatac').Value;
  vVlrAtac := ((vCusto * vMkpAtac) / 100) + vCusto;
  dsCadastro.DataSet.FieldByName('pro_vlratac').Value := vVlrAtac;
end;

procedure TfrmCadProdutos.dbMkpVarExit(Sender: TObject);
Var
vCusto, vMkpVar, vVlrVar: Real;
begin
  if dsCadastro.DataSet.FieldByName('pro_vlrcusto').IsNull then
    vCusto := 0
  else
    vCusto := dsCadastro.DataSet.FieldByName('pro_vlrcusto').Value;
  if dsCadastro.DataSet.FieldByName('pro_mkpvar').IsNull then
    vMkpVar := 0
  else
    vMkpVar := dsCadastro.DataSet.FieldByName('pro_mkpvar').Value;
  vVlrVar := ((vCusto * vMkpVar) / 100) + vCusto;
  dsCadastro.DataSet.FieldByName('pro_vlrvar').Value := vVlrVar;
end;

procedure TfrmCadProdutos.dbNCMExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    if (dsCadastro.DataSet.FieldByName('pro_ncm').IsNull) then
      MessageDlg('É necessário preencher o NCM!', mtWarning, [mbOk], 0);
end;

procedure TfrmCadProdutos.dbVlrAtacExit(Sender: TObject);
Var
vCusto, vMkpAtac, vVlrAtac: Real;
begin
  if dsCadastro.DataSet.FieldByName('pro_vlrcusto').IsNull then
    vCusto := 0
  else
    vCusto := dsCadastro.DataSet.FieldByName('pro_vlrcusto').Value;
  if dsCadastro.DataSet.FieldByName('pro_vlratac').IsNull then
    vVlrAtac := 0
  else
    vVlrAtac := dsCadastro.DataSet.FieldByName('pro_vlratac').Value;

  vMkpAtac := ((vVlrAtac / vCusto) - 1) * 100;
  dsCadastro.DataSet.FieldByName('pro_mkpatac').Value := vMkpAtac;
end;

procedure TfrmCadProdutos.dbVlrCustoExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    Calcular;
end;

procedure TfrmCadProdutos.dbVlrFreteExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    Calcular;
end;

procedure TfrmCadProdutos.dbVlrImportacaoExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    Calcular;
end;

procedure TfrmCadProdutos.dbVlrOutrasExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    Calcular;
end;

procedure TfrmCadProdutos.dbVlrUnitarioExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    Calcular;
end;

procedure TfrmCadProdutos.dbVlrVarExit(Sender: TObject);
Var
vCusto, vMkpAtac, vVlrVar: Real;
begin
  if dsCadastro.DataSet.FieldByName('pro_vlrcusto').IsNull then
    vCusto := 0
  else
    vCusto := dsCadastro.DataSet.FieldByName('pro_vlrcusto').Value;
  if dsCadastro.DataSet.FieldByName('pro_vlrvar').IsNull then
    vVlrVar := 0
  else
    vVlrVar := dsCadastro.DataSet.FieldByName('pro_vlrvar').Value;

  vMkpAtac := ((vVlrVar / vCusto) - 1) * 100;
  dsCadastro.DataSet.FieldByName('pro_mkpvar').Value := vMkpAtac;
end;

procedure TfrmCadProdutos.dsCadastroDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if dsCadastro.DataSet.FieldByName('PRO_CODIGO').IsNull then
  begin
    panCaption.Caption := 'Cadastro de Produtos';
    ConsProdutosEst('0');
    ConsProdutosMov('0');
    FiltrarProdutosFor('P.PRO_CODIGO', '=', '0', '0');
    FiltrarConsPrevRes('pro_codigo', '=', '0', '0');
    FiltrarProdutosComp('c.pro_codigo', '=', '0', '0');
    FiltrarProdutosObs('pro_codigo', '=', '0', '0');
    FiltrarProdutosSim('s.pro_codigo', '=', '0', '0');
    FiltrarProdComanda('pro_codigo', '=', '0', '0');
  end
  else
  begin
    ConsProdutosEst(IntToStr(dsCadastro.DataSet.FieldByName('PRO_CODIGO').Value));
    ConsProdutosMov(IntToStr(dsCadastro.DataSet.FieldByName('PRO_CODIGO').Value));
    FiltrarProdutosFor('P.PRO_CODIGO', '=', IntToStr(dsCadastro.DataSet.FieldByName('PRO_CODIGO').Value), 'F.PES_NOME');
    FiltrarProdutosComp('c.pro_codigo', '=', IntToStr(dsCadastro.DataSet.FieldByName('PRO_CODIGO').Value), 'p.pro_descricao');
    FiltrarProdutosObs('pro_codigo', '=', IntToStr(dsCadastro.DataSet.FieldByName('PRO_CODIGO').Value), '0');
    FiltrarProdutosSim('s.pro_codigo', '=', IntToStr(dsCadastro.DataSet.FieldByName('PRO_CODIGO').Value), 'p.pro_descricao');
    FiltrarConsPrevRes('pro_codigo', '=', IntToStr(dsCadastro.DataSet.FieldByName('pro_codigo').Value), 'prv_numero');
    FiltrarProdComanda('pro_codigo', '=', IntToStr(dsCadastro.DataSet.FieldByName('pro_codigo').Value), '0');
    panCaption.Caption := 'Cadastro de Produtos: ' + dsCadastro.DataSet.FieldByName('PRO_DESCRICAO').Text +
                          ' - (' +dsCadastro.DataSet.FieldByName('PRO_CODIGO').Text + ')';
  end;
end;

procedure TfrmCadProdutos.dsCadastroStateChange(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsInsert] then
  begin
    cbUnidades.PerformSearch;
    cbLocalizacao.PerformSearch;
    cbMarca.PerformSearch;
    cbTipoItem.PerformSearch;
  end;
end;

procedure TfrmCadProdutos.dsCopaCozStateChange(Sender: TObject);
begin
  if dsCopaCoz.DataSet.State in [dsEdit, dsInsert] then
  begin
    sbNovoCopaCoz.Enabled := False;
    sbExcluirCopaCoz.Enabled := False;
    sbGravarCopaCoz.Enabled := True;
    sbCancelarCopaCoz.Enabled := True;
  end
  else
  begin
    sbNovoCopaCoz.Enabled := True;
    sbExcluirCopaCoz.Enabled := True;
    sbGravarCopaCoz.Enabled := False;
    sbCancelarCopaCoz.Enabled := False;
  end;
end;

procedure TfrmCadProdutos.dsProdObsStateChange(Sender: TObject);
begin
  if dsProdObs.DataSet.State in [dsEdit, dsInsert] then
  begin
    dsProdObs.DataSet.FieldByName('pro_codigo').Value := dsCadastro.DataSet.FieldByName('pro_codigo').Value;
    sbGravarObs.Enabled := True;
    sbCancelarObs.Enabled := True;
  end
  else
  begin
    sbGravarObs.Enabled := False;
    sbCancelarObs.Enabled := False;
  end;
end;

procedure TfrmCadProdutos.dsProdCompStateChange(Sender: TObject);
begin
  if dsProdComp.DataSet.State in [dsEdit, dsInsert] then
    sbExcluirComp.Enabled := False
  else
    sbExcluirComp.Enabled := True;
end;

procedure TfrmCadProdutos.dsProdSimStateChange(Sender: TObject);
begin
  if dsProdSim.DataSet.State in [dsEdit, dsInsert] then
    sbExcluirSim.Enabled := False
  else
    sbExcluirSim.Enabled := True;
end;

procedure TfrmCadProdutos.dsProdutosForStateChange(Sender: TObject);
begin
  if dsProdutosFor.DataSet.State in [dsEdit, dsInsert] then
  begin
    sbNovoProdFor.Enabled := False;
    sbExcluirProdFor.Enabled := False;
    sbGravarProdFor.Enabled := True;
    sbCancelarProdFor.Enabled := True;
  end
  else
  begin
    sbNovoProdFor.Enabled := True;
    sbExcluirProdFor.Enabled := True;
    sbGravarProdFor.Enabled := False;
    sbCancelarProdFor.Enabled := False;
  end;
end;

procedure TfrmCadProdutos.FormActivate(Sender: TObject);
Var
vCaseProd: String;
begin
  inherited;
  vCaseProd := GetProdCase;
  if vCaseProd = 'N' then
    dbDescricao.CharCase := ecNormal;
  if vCaseProd = 'U' then
    dbDescricao.CharCase := ecUpperCase;
  if vCaseProd = 'L' then
    dbDescricao.CharCase := ecLowerCase;
  ListarProdutos('PRO_DESCRICAO');
  PageCadastro.ActivePage := tsDescricao;
  dbDescricao.SetFocus;
end;

procedure TfrmCadProdutos.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadProdutos <> nil then
    frmCadProdutos := nil;
end;

procedure TfrmCadProdutos.GridMovDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('prm_tipo').Text = 'PRV' then // Caso seja venda
  begin
    (Sender as TDBGrid).Canvas.Font.Color := clBlue;
    (Sender as TDBGrid).Canvas.Font.Style:= [];
  end
  else
    if (Sender as TDBGrid).DataSource.DataSet.FieldByName('prm_tipo').Text = 'COM' then // Caso seja compra
    begin
      (Sender as TDBGrid).Canvas.Font.Color := clGreen;
      (Sender as TDBGrid).Canvas.Font.Style:= [];
    end
    else
      if (Sender as TDBGrid).DataSource.DataSet.FieldByName('prm_tipo').Text = 'MAN' then // Caso seja lançamento manual
      begin
        (Sender as TDBGrid).Canvas.Font.Color := clRed;
        (Sender as TDBGrid).Canvas.Font.Style:= [];
      end
      else
        begin
          (Sender as TDBGrid).Canvas.Font.Color := clBlack;
          (Sender as TDBGrid).Canvas.Font.Style:= [];
        end;
  (Sender as TDBGrid).Canvas.FillRect(Rect);
  (Sender as TDBGrid).DefaultDrawDataCell(Rect, (Sender as TDBGrid).columns[datacol].field, State);
end;

procedure TfrmCadProdutos.sbCancelarCopaCozClick(Sender: TObject);
begin
  dsCopaCoz.DataSet.Cancel;
end;

procedure TfrmCadProdutos.sbCancelarObsClick(Sender: TObject);
begin
  dsProdObs.DataSet.Cancel;
end;

procedure TfrmCadProdutos.sbCancelarProdForClick(Sender: TObject);
begin
  dsProdutosFor.DataSet.Cancel;
end;

procedure TfrmCadProdutos.sbExcluirCompClick(Sender: TObject);
begin
  if Not(dsProdComp.DataSet.FieldByName('pro_codigo').IsNull) then
    dsProdComp.DataSet.Delete;
end;

procedure TfrmCadProdutos.sbExcluirCopaCozClick(Sender: TObject);
begin
  if not(dsCopaCoz.DataSet.FieldByName('pro_codigo').IsNull) then
    dsCopaCoz.DataSet.Delete;
end;

procedure TfrmCadProdutos.sbExcluirProdForClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir o vínculo Produto x Fornecedor?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    DelProdutosFor;
end;

procedure TfrmCadProdutos.sbExcluirSimClick(Sender: TObject);
begin
  if Not(dsProdSim.DataSet.FieldByName('pro_codigo').IsNull) then
    dsProdSim.DataSet.Delete;
end;

procedure TfrmCadProdutos.sbGravarCopaCozClick(Sender: TObject);
begin
  if not(dsCadastro.DataSet.FieldByName('pro_codigo').IsNull) then
  begin
    dsCopaCoz.DataSet.FieldByName('pro_codigo').Value := dsCadastro.DataSet.FieldByName('pro_codigo').Value;
    dsCopaCoz.DataSet.Post;
  end
  else
  begin
    MessageDlg('É necessário ter um produto gravado!', mtWarning, [mbOk], 0);
    dsCopaCoz.DataSet.Cancel;
  end;
end;

procedure TfrmCadProdutos.sbGravarObsClick(Sender: TObject);
begin
  dsProdObs.DataSet.Post;
end;

procedure TfrmCadProdutos.sbGravarProdForClick(Sender: TObject);
begin
  PostProdutosFor;
end;

procedure TfrmCadProdutos.sbNovoCopaCozClick(Sender: TObject);
begin
  dsCopaCoz.DataSet.Insert;
end;

procedure TfrmCadProdutos.sbNovoProdForClick(Sender: TObject);
begin
  InsProdutosFor;
  cbFornecedor.SetFocus;
end;

procedure TfrmCadProdutos.spAnteriorClick(Sender: TObject);
begin
  spProxima.Enabled := True;
  if PageCadastro.ActivePage <> tsDescricao then
    PageCadastro.ActivePageIndex := PageCadastro.ActivePageIndex - 1;
end;

procedure TfrmCadProdutos.sbDetMovClick(Sender: TObject);
begin
  if Not(dsCadastro.DataSet.FieldByName('PRO_CODIGO').IsNull) then
  begin
    vgDetProdMov := dsCadastro.DataSet.FieldByName('PRO_CODIGO').Value;
    vgDescProdMov := dsCadastro.DataSet.FieldByName('PRO_DESCRICAO').Value;
    frmDetProdMov.ShowModal;
    ConsProdutosMov(IntToStr(dsCadastro.DataSet.FieldByName('PRO_CODIGO').Value));
  end;
end;

procedure TfrmCadProdutos.spProximaClick(Sender: TObject);
begin
  spAnterior.Enabled := True;
  if PageCadastro.ActivePage <> tsCopaCoz then
    PageCadastro.ActivePageIndex := PageCadastro.ActivePageIndex + 1;
end;

procedure TfrmCadProdutos.tsCustosShow(Sender: TObject);
begin
  spAnterior.Enabled := True;
  spProxima.Enabled := True;
end;

procedure TfrmCadProdutos.tsDescricaoShow(Sender: TObject);
begin
  spAnterior.Enabled := False;
  spProxima.Enabled := True;
end;

procedure TfrmCadProdutos.tsEstoqueShow(Sender: TObject);
begin
  spAnterior.Enabled := True;
  spProxima.Enabled := True;
end;

procedure TfrmCadProdutos.tsFiscalShow(Sender: TObject);
begin
  spAnterior.Enabled := True;
  spProxima.Enabled := True;
end;

procedure TfrmCadProdutos.tsFornecedoresShow(Sender: TObject);
begin
  spAnterior.Enabled := True;
  spProxima.Enabled := False;
end;

end.
