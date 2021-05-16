unit uVincProdFor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, wwdblook, Data.DB, Vcl.ExtCtrls;

type
  TfrmVincProdFor = class(TfrmTmpFormNormal)
    Label1: TLabel;
    cbProduto: TwwDBLookupCombo;
    dbCodProduto: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbFornecedor: TDBEdit;
    dsProdutosFor: TDataSource;
    Label4: TLabel;
    dbCodFornecedor: TDBEdit;
    Label5: TLabel;
    dbReferencia: TDBEdit;
    Label6: TLabel;
    dbCodBarras: TDBEdit;
    Label7: TLabel;
    dbUniCp: TDBEdit;
    Label8: TLabel;
    bUniVd: TDBEdit;
    btGravar: TBitBtn;
    panProduto: TPanel;
    btCadastrar: TBitBtn;
    dsItens: TDataSource;
    procedure btGravarClick(Sender: TObject);
    procedure cbProdutoExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure btCadastrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVincProdFor: TfrmVincProdFor;

implementation

{$R *.dfm}

uses dataLookups, uDaoProdutosFor, dataEstoque, uVarGlobal, uClassProdutos,
  uImpXMLPag, uDaoUnidades, uFuncoesDB, uFuncoesFormatacao, uDaoConfig,
  uDaoProdutos, uDaoLookups, uCadProdutosImp;

procedure TfrmVincProdFor.btCadastrarClick(Sender: TObject);
Var
vProduto: TProdutos;
vUnidade: String;
vCFOP: String;
vDescProduto: string;
vOK: Boolean;
vCodigo: String;
vCaseProd: String;
begin
  vCaseProd := GetProdCase;
  vDescProduto := UpperCase(cbProduto.Text);
  vOK := InputQuery('Descrição do Produto', 'Digite a descrição do produto', vDescProduto);
  if vOK then
  begin
    if vCaseProd = 'U' then
      vDescProduto := UpperCase(vDescProduto);
    if vCaseProd = 'L' then
      vDescProduto := LowerCase(vDescProduto);
    vProduto := TProdutos.Create;
    vProduto.Codigo := GetCodigo('PRO_CODIGO', 'PRODUTOS');
    vCodigo := IntToStr(vProduto.Codigo);
    vProduto.Descricao := vDescProduto;
    FiltrarUnidades('UNI_CODIGO', '=', dsItens.DataSet.FieldByName('uCom').Text, '0');
    vUnidade := GetUnidade;
    if vUnidade <> '' then
    begin
      vProduto.Unidade := vUnidade;
      vProduto.CodUnidade := GetCodUnidade;
    end
    else
    begin
      vProduto.Codunidade := 'PÇ';
      vProduto.Unidade := 'PEÇA';
    end;
    vProduto.Classif := 1;
    vCFOP := dsItens.DataSet.FieldByName('CFOP').Text;
    if vCFOP[2] = '1' then
      vProduto.Classif := 1;
    if vCFOP[2] = '4' then
      vProduto.Classif := 2;
    vProduto.Ncm := FormatNCM(dsItens.DataSet.FieldByName('NCM').Text);
    vProduto.Codgrupo := 0;
    vProduto.Grupo := 'NÃO DEFINIDO';
    vProduto.Codsubgrupo := 0;
    vProduto.Subgrupo := 'NÃO DEFINIDO';
    vProduto.Codmarca := 0;
    vProduto.Marca := 'NÃO DEFINIDA';
    vProduto.Codbarras := dsItens.DataSet.FieldByName('cEAN').Text;
    vProduto.Codtipo := 0;
    vProduto.Tipo := 'MERCADORIA PARA REVENDA';
    vProduto.Vlrunitario := 0;
    vProduto.CredIcms := 0;
    vProduto.Vlrfrete := 0;
    vProduto.Vlroutras := 0;
    vProduto.Vlrimport := 0;
    vProduto.Vlrcusto := 0;
    vProduto.Mkpatac := 0;
    vProduto.Mkpvar := 0;
    vProduto.Vlratac := 0;
    vProduto.Vlrvar := 0;
    vProduto.Mgmin := 0;
    vProduto.Descmax := 0;
    vProduto.Movest := 'S';
    vProduto.Codlocal := 0;
    vProduto.Local := 'NÃO DEFINIDA';
    vProduto.Dtcad := FormatDateTime('dd/MM/yyyy', GetDateServerPG);
    vProduto.Estmin := 0;
    vProduto.Estide := 0;
    vProduto.Pesobruto := 0;
    vProduto.Pesoliq := 0;
    vProduto.Origem := 1;
    vProduto.Inativar := 0;
    vProduto.Status := 'A';
    InsProdutos;
    SetValuesProdutos(vProduto);
    if PostProdutos = True then
    begin
      AtualizarLookup('PRODUTOS');
      vDescProduto := vProduto.Descricao;
      vProduto.Free;
      if MessageDlg('Produto cadastrado com sucesso, código: ' + IntToStr(vProduto.Codigo) + #13 +
                    'Deseja abrir o cadastro rápido?', mtConfirmation, [mbYes, mbNO], 0) = mrYes then
      begin
        FiltrarProdutos('PRO_CODIGO', '=', vCodigo, '0');
        EdtProdutos;
        frmCadProdutosImp.ShowModal;
        vDescProduto := GetDescProd;
      end;
      cbProduto.Text := vDescProduto;
      cbProduto.PerformSearch;
      cbProduto.SetFocus;
    end
    else
      MessageDlg('Erro ao gravar o novo Produto, verifique se o cadastro já não existe!', mtError, [mbOk], 0);
  end;
end;

procedure TfrmVincProdFor.btGravarClick(Sender: TObject);
begin
  if dbCodProduto.Text <> '' then
  begin
    if dsProdutosFor.DataSet.State in [dsEdit, dsInsert] then
      PostProdutosFor;
    Close;
  end
  else
    MessageDlg('É necessário selecionar um produto para o vínculo!', mtWarning, [mbOk], 0);
end;

procedure TfrmVincProdFor.cbProdutoExit(Sender: TObject);
begin
  if dsProdutosFor.DataSet.State in [dsInsert, dsEdit] then
  begin
    if cbProduto.Text <> '' then
      dmEstoque.qyProdutosForPRO_CODIGO.Value := dmLookups.qyLkProdutosPRO_CODIGO.Value;
  end;
end;

procedure TfrmVincProdFor.FormActivate(Sender: TObject);
begin
  inherited;
  panProduto.Caption := '   ' + vgDescProdFor;
  cbProduto.Text := vgDescProdFor;
  cbProduto.PerformSearch;
  cbProduto.SetFocus;
end;

procedure TfrmVincProdFor.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if dsProdutosFor.DataSet.State in [dsInsert, dsEdit] then
  begin
    if MessageDlg('Existem informações pendentes que serão perdidas,' + #13 +
                  'deseja fechar assim mesmo?', mtConfirmation, [mbYes, mbNo], 0)
                   = mrYes then
    begin
      dsProdutosFor.DataSet.Cancel;
      CanClose := True;
    end
    else
      CanClose := False;
  end;
end;

end.
