unit uCadProdutosImp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  wwdbdatetimepicker, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB, JvExMask, JvToolEdit,
  JvBaseEdits, JvDBControls;

type
  TfrmCadProdutosImp = class(TfrmTmpFormNormal)
    panCaption: TPanel;
    PageCadastro: TPageControl;
    tsDescricao: TTabSheet;
    lbCodigo: TLabel;
    lbDescricao: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label24: TLabel;
    dbCodigo: TDBEdit;
    cbGrupos: TwwDBLookupCombo;
    dbCodGrupo: TDBEdit;
    cbSubgrupo: TwwDBLookupCombo;
    dbCodSub: TDBEdit;
    cbMarca: TwwDBLookupCombo;
    dbCodMarca: TDBEdit;
    cbStatus: TwwDBComboBox;
    cbInativar: TwwDBComboBox;
    dtpDataCad: TwwDBDateTimePicker;
    tsCustos: TTabSheet;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    dbVlrUnitario: TDBEdit;
    dbVlrFrete: TDBEdit;
    dbVlrOutras: TDBEdit;
    dbVlrImportacao: TDBEdit;
    dbVlrCusto: TDBEdit;
    dbMkpAtac: TDBEdit;
    dbVlrAtac: TDBEdit;
    dbMkpVar: TDBEdit;
    dbVlrVar: TDBEdit;
    dbMgMin: TDBEdit;
    dbDescMax: TDBEdit;
    tsEstoque: TTabSheet;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    dbEstMin: TDBEdit;
    dbEstIde: TDBEdit;
    dbPesoBrt: TDBEdit;
    dbPesoLiq: TDBEdit;
    cbMovEst: TwwDBComboBox;
    tsFiscal: TTabSheet;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    cbTipoItem: TwwDBLookupCombo;
    dbCodTipo: TDBEdit;
    cbClassFisc: TwwDBComboBox;
    dbNCM: TDBEdit;
    pnBotoes: TPanel;
    spAnterior: TSpeedButton;
    spProxima: TSpeedButton;
    btGravar: TBitBtn;
    btCancelar: TBitBtn;
    cbDescricao: TwwDBLookupCombo;
    dsCadastro: TDataSource;
    Label1: TLabel;
    cbUnidades: TwwDBLookupCombo;
    Label6: TLabel;
    dbCodUnidade: TDBEdit;
    Label2: TLabel;
    dbCodBarras: TDBEdit;
    Label3: TLabel;
    cbLocalizacao: TwwDBLookupCombo;
    Label43: TLabel;
    dbCEST: TDBEdit;
    cbOrigem: TwwDBComboBox;
    Label44: TLabel;
    dbEmbalagem: TDBEdit;
    Label45: TLabel;
    dbCodBarrasEmb: TDBEdit;
    Label35: TLabel;
    dbCredICMS: TJvDBCalcEdit;
    procedure Calcular;
    procedure FormActivate(Sender: TObject);
    procedure spAnteriorClick(Sender: TObject);
    procedure spProximaClick(Sender: TObject);
    procedure tsDescricaoShow(Sender: TObject);
    procedure tsCustosShow(Sender: TObject);
    procedure tsEstoqueShow(Sender: TObject);
    procedure tsFiscalShow(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure btGravarClick(Sender: TObject);
    procedure dsCadastroStateChange(Sender: TObject);
    procedure cbUnidadesExit(Sender: TObject);
    procedure cbLocalizacaoExit(Sender: TObject);
    procedure cbGruposExit(Sender: TObject);
    procedure cbSubgrupoExit(Sender: TObject);
    procedure cbMarcaExit(Sender: TObject);
    procedure cbInativarExit(Sender: TObject);
    procedure dbDescMaxExit(Sender: TObject);
    procedure dbPesoLiqExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbNCMExit(Sender: TObject);
    procedure dbVlrUnitarioExit(Sender: TObject);
    procedure dbCredICMSExit(Sender: TObject);
    procedure dbVlrFreteExit(Sender: TObject);
    procedure dbVlrOutrasExit(Sender: TObject);
    procedure dbVlrImportacaoExit(Sender: TObject);
    procedure dbVlrCustoExit(Sender: TObject);
    procedure dbMkpAtacExit(Sender: TObject);
    procedure dbVlrAtacExit(Sender: TObject);
    procedure dbMkpVarExit(Sender: TObject);
    procedure dbVlrVarExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProdutosImp: TfrmCadProdutosImp;

implementation

{$R *.dfm}

uses dataLookups, dataCadastros, uDaoConfig, uDaoProdutos, uDaoLookups;

procedure TfrmCadProdutosImp.Calcular;
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

procedure TfrmCadProdutosImp.btCancelarClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente cancelar o pré-cadastro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dsCadastro.DataSet.Cancel;
    Close;
  end;
end;

procedure TfrmCadProdutosImp.btGravarClick(Sender: TObject);
begin
  inherited;
  PostProdutos;
  AtualizarLookup('PRODUTOS');
  Close;
end;

procedure TfrmCadProdutosImp.cbGruposExit(Sender: TObject);
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

procedure TfrmCadProdutosImp.cbInativarExit(Sender: TObject);
begin
  inherited;
  PageCadastro.ActivePage := tsCustos;
  dbVlrUnitario.SetFocus;
end;

procedure TfrmCadProdutosImp.cbLocalizacaoExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    dsCadastro.DataSet.FieldByName('LOC_CODIGO').Value := dmLookups.qyLkLocalizacaoLOC_CODIGO.Value;
end;

procedure TfrmCadProdutosImp.cbMarcaExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    dsCadastro.DataSet.FieldByName('MAR_CODIGO').Value := dmLookups.qyLkMarcasMAR_CODIGO.Value;
end;

procedure TfrmCadProdutosImp.cbSubgrupoExit(Sender: TObject);
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

procedure TfrmCadProdutosImp.cbUnidadesExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    dsCadastro.DataSet.FieldByName('UNI_CODIGO').Value := dmLookups.qyLkUnidadesUNI_CODIGO.Value;
end;

procedure TfrmCadProdutosImp.dbCredICMSExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    Calcular;
end;

procedure TfrmCadProdutosImp.dbDescMaxExit(Sender: TObject);
begin
  inherited;
  PageCadastro.ActivePage := tsEstoque;
  cbMovEst.SetFocus;
end;

procedure TfrmCadProdutosImp.dbMkpAtacExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    Calcular;
end;

procedure TfrmCadProdutosImp.dbMkpVarExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    Calcular;
end;

procedure TfrmCadProdutosImp.dbNCMExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    if (dsCadastro.DataSet.FieldByName('pro_ncm').IsNull) then
      MessageDlg('É necessário preencher o NCM!', mtWarning, [mbOk], 0);
end;

procedure TfrmCadProdutosImp.dbPesoLiqExit(Sender: TObject);
begin
  inherited;
  PageCadastro.ActivePage := tsFiscal;
  cbTipoItem.SetFocus;
end;

procedure TfrmCadProdutosImp.dbVlrAtacExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    Calcular;
end;

procedure TfrmCadProdutosImp.dbVlrCustoExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    Calcular;
end;

procedure TfrmCadProdutosImp.dbVlrFreteExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    Calcular;
end;

procedure TfrmCadProdutosImp.dbVlrImportacaoExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    Calcular;
end;

procedure TfrmCadProdutosImp.dbVlrOutrasExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    Calcular;
end;

procedure TfrmCadProdutosImp.dbVlrUnitarioExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    Calcular;
end;

procedure TfrmCadProdutosImp.dbVlrVarExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    Calcular;
end;

procedure TfrmCadProdutosImp.dsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if dsCadastro.DataSet.FieldByName('PRO_DESCRICAO').IsNull then
    panCaption.Caption := 'Cadastro de Produtos'
  else
    panCaption.Caption := 'Cadastro de Produtos: ' + dsCadastro.DataSet.FieldByName('PRO_DESCRICAO').Text +
                          ' - (' +dsCadastro.DataSet.FieldByName('PRO_CODIGO').Text + ')';
end;

procedure TfrmCadProdutosImp.dsCadastroStateChange(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsInsert, dsEdit] then
  Begin
    btGravar.Enabled := True;
    btCancelar.Enabled := True;
  end
  else
  Begin
    btGravar.Enabled := False;
    btCancelar.Enabled := False;
  end;
end;

procedure TfrmCadProdutosImp.FormActivate(Sender: TObject);
Var
vCaseProd: String;
begin
  inherited;
  dsCadastro.DataSet.Active := True;
  vCaseProd := GetProdCase;
  if vCaseProd = 'N' then
    cbDescricao.CharCase := ecNormal;
  if vCaseProd = 'U' then
    cbDescricao.CharCase := ecUpperCase;
  if vCaseProd = 'L' then
    cbDescricao.CharCase := ecLowerCase;
  PageCadastro.ActivePage := tsDescricao;
  cbDescricao.SetFocus;
end;

procedure TfrmCadProdutosImp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dsCadastro.DataSet.Close;
  inherited;
end;

procedure TfrmCadProdutosImp.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if dsCadastro.DataSet.State in [dsInsert, dsEdit] then
  begin
    if MessageDlg('Existem informações pendentes que serão perdidas,' + #13 +
                  'deseja fechar assim mesmo?', mtConfirmation, [mbYes, mbNo], 0)
                   = mrYes then
    begin
      dsCadastro.DataSet.Cancel;
      CanClose := True;
    end
    else
      CanClose := False;
  end;
end;

procedure TfrmCadProdutosImp.spAnteriorClick(Sender: TObject);
begin
  spProxima.Enabled := True;
  if PageCadastro.ActivePage <> tsDescricao then
    PageCadastro.ActivePageIndex := PageCadastro.ActivePageIndex - 1;
end;

procedure TfrmCadProdutosImp.spProximaClick(Sender: TObject);
begin
  spAnterior.Enabled := True;
  if PageCadastro.ActivePage <> tsFiscal then
    PageCadastro.ActivePageIndex := PageCadastro.ActivePageIndex + 1;
end;

procedure TfrmCadProdutosImp.tsCustosShow(Sender: TObject);
begin
  spAnterior.Enabled := True;
  spProxima.Enabled := True;
end;

procedure TfrmCadProdutosImp.tsDescricaoShow(Sender: TObject);
begin
  spAnterior.Enabled := False;
  spProxima.Enabled := True;
end;

procedure TfrmCadProdutosImp.tsEstoqueShow(Sender: TObject);
begin
  spAnterior.Enabled := True;
  spProxima.Enabled := True;
end;

procedure TfrmCadProdutosImp.tsFiscalShow(Sender: TObject);
begin
  spAnterior.Enabled := True;
  spProxima.Enabled := False;
end;

end.
