unit uImpItensFor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Data.DB;

type
  TfrmImpItensFor = class(TfrmTmpFormNormal)
    panFornecedor: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    dbRazaoSocial: TDBEdit;
    dbFantasia: TDBEdit;
    dbCnpj: TDBEdit;
    dbIe: TDBEdit;
    dbLogradouro: TDBEdit;
    dbNumero: TDBEdit;
    dbBairro: TDBEdit;
    dbCidade: TDBEdit;
    dbCodCidade: TDBEdit;
    dbUf: TDBEdit;
    dbCep: TDBEdit;
    dbFone: TDBEdit;
    Panel1: TPanel;
    JvDBGrid1: TJvDBGrid;
    btEntrada: TBitBtn;
    btCadastrar: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    dbCodProduto: TDBEdit;
    dsProdutosFor: TDataSource;
    Label14: TLabel;
    dbProduto: TDBEdit;
    Label15: TLabel;
    dbFornecedor: TDBEdit;
    Label16: TLabel;
    dbRefForn: TDBEdit;
    Label17: TLabel;
    dbCompra: TDBEdit;
    Label18: TLabel;
    dbVenda: TDBEdit;
    dsItens: TDataSource;
    dsFornecedor: TDataSource;
    sbVincular: TSpeedButton;
    sbDesvincular: TSpeedButton;
    procedure Vincular;
    procedure btCadastrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dsItensDataChange(Sender: TObject; Field: TField);
    procedure btEntradaClick(Sender: TObject);
    procedure sbVincularClick(Sender: TObject);
    procedure sbDesvincularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpItensFor: TfrmImpItensFor;

implementation

{$R *.dfm}

uses uImpXMLPag, uDaoProdutosFor, uVincProdFor, uVarGlobal, uDaoPessoas,
  dataEstoque, uClassProdutosFor, uClassProdutos, uDaoConfig, uDaoUnidades,
  uFuncoesFormatacao, uDaoProdutos, uDaoLookups, uDaoProdutosEst, uClassProdutosmov,
  uDaoProdutosMov, uCadProdutosImp, uFuncoesDB;

procedure TfrmImpItensFor.Vincular;
Var
vProdutoFor: TProdutosFor;
begin
  vProdutoFor := TProdutosfor.Create;
  InsProdutosFor;
  vProdutoFor.Codproduto := 0;
  vProdutoFor.Produto := Trim(dsItens.DataSet.FieldByName('xProd').Text);
  vProdutoFor.Codfornecedor := VerifCadCNPJ(dsFornecedor.DataSet.FieldByName('CNPJ').Text);
  vProdutoFor.Fornecedor := dsFornecedor.DataSet.FieldByName('xNome').Text;
  vProdutoFor.Referencia := dsItens.DataSet.FieldByName('cProd').Text;
  vProdutoFor.Codbarras := dsItens.DataSet.FieldByName('cEAN').Text;
  vProdutoFor.UniCp := 1;
  vProdutoFor.UniVd := 1;
  SetValuesProdutosFor(vProdutoFor);
  vProdutoFor.Free;
end;

procedure TfrmImpItensFor.btEntradaClick(Sender: TObject);
Var
vVinc: Boolean;
vProdutosMov: TProdutosMov;
vMult: Real;
vQuant: Real;
begin
  vVinc := True;
  dsItens.DataSet.First;
  Repeat
    FiltrarProdutosForX(dsItens.DataSet.FieldByName('cProd').Text,
                        IntToStr(VerifCadCNPJ(dsFornecedor.DataSet.FieldByName('CNPJ').Text)))  ;
    if dsProdutosFor.DataSet.FieldByName('PRO_CODIGO').IsNull then
      vVinc := False;
    if vVinc = False then
    begin
      if MessageDlg('O Produto ' + dsItens.DataSet.FieldByName('xProd').Text + ' não está vinculado!' + #13 +
                    'Deseja vincular agora?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        if dsProdutosFor.DataSet.FieldByName('PRO_CODIGO').IsNull then
        begin
          Vincular;
          vgCodFornecedor := VerifCadCNPJ(dsFornecedor.DataSet.FieldByName('CNPJ').Text);
          vgDescProdFor := Trim(dsItens.DataSet.FieldByName('xProd').Text);
          frmVincProdFor.ShowModal;
        end;
      end;
    end;
    dsItens.DataSet.Next;
  Until ((dsItens.DataSet.Eof = True) or (vVinc = False));
  //Entrada no estoque
  dsItens.DataSet.First;
  if vVinc = True then
  begin
    Repeat
      //Entrada no estoque
       vMult := GetMultiplyEnt;
       vQuant := StrToFloat(TrocaPtoPVirg(dsItens.DataSet.FieldByName('qCom').Text)) * vMult;
       EntradaEstoque(GetCodProdutoFor, vQuant);
       //Histórico de movimentação
       vProdutosMov := TProdutosmov.Create;
       vProdutosMov.Codigo := 0;
       vProdutosMov.Codproduto := GetCodProdutoFor;
       vProdutosMov.Data := GetDateServerPG;
       vProdutosMov.Quantidade := vQuant;
       vProdutosMov.Codpessoa := vgCodFornecedor;
       vProdutosMov.Tipo := 'COM';
       vProdutosMov.Nota := dsFornecedor.DataSet.FieldByName('nNF').Value;
       vProdutosMov.Serie := dsFornecedor.DataSet.FieldByName('serie').Value;
       vProdutosMov.Modelo := dsFornecedor.DataSet.FieldByName('mod').Value;
       vProdutosMov.Valor := StrToFloat(TrocaPtoPVirg(dsItens.DataSet.FieldByName('vUnCom').Text));
       InsProdutosMov;
       SetValuesProdutosMov(vProdutosMov);
       PostProdutosMov;
       vProdutosMov.Free;
       dsItens.DataSet.Next;
    Until (dsItens.DataSet.Eof = True);
    MessageDlg('Itens lançados com sucesso!', mtInformation, [mbOk], 0);
    Close;
  end;
end;

procedure TfrmImpItensFor.btCadastrarClick(Sender: TObject);
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
  vDescProduto := UpperCase(dsItens.DataSet.FieldByName('xProd').Text);
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
    vProduto.Descricao := Trim(vDescProduto);
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
    vProduto.Cest := dsItens.DataSet.FieldByName('CEST').Text;
    vProduto.Codgrupo := 0;
    vProduto.Grupo := 'NÃO DEFINIDO';
    vProduto.Codsubgrupo := 0;
    vProduto.Subgrupo := 'NÃO DEFINIDO';
    vProduto.Codmarca := 0;
    vProduto.Marca := 'NÃO DEFINIDA';
    vProduto.Codbarras := dsItens.DataSet.FieldByName('cEAN').Text;
    vProduto.Codtipo := 0;
    vProduto.Tipo := 'MERCADORIA PARA REVENDA';
    try
      vProduto.Vlrunitario := StrToFloat(LimpaReal(TrocaPtoPVirg(dsItens.DataSet.FieldByName('vUnCom').Text)));
    except
      vProduto.Vlrunitario := 0;
    end;
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
    vProduto.Origem := 0;
    vProduto.Inativar := 0;
    vProduto.Status := 'A';
    vProduto.Embalagem := 1;
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
    end
    else
      MessageDlg('Erro ao gravar o novo Produto, verifique se o cadastro já não existe!', mtError, [mbOk], 0);
  end;
end;

procedure TfrmImpItensFor.dsItensDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  FiltrarProdutosForX(dsItens.DataSet.FieldByName('cProd').Text,
                      IntToStr(VerifCadCNPJ(dsFornecedor.DataSet.FieldByName('CNPJ').Text)))  ;
end;

procedure TfrmImpItensFor.FormActivate(Sender: TObject);
begin
  inherited;
  dsProdutosFor.DataSet.Active := True;
  dsItens.DataSet.Active := True;
  dsFornecedor.DataSet.Active := True;
  btEntrada.SetFocus;
end;

procedure TfrmImpItensFor.sbDesvincularClick(Sender: TObject);
begin
  FiltrarProdutosForX(dsItens.DataSet.FieldByName('cProd').Text,
                      IntToStr(VerifCadCNPJ(dsFornecedor.DataSet.FieldByName('CNPJ').Text)))  ;
  if dsProdutosFor.DataSet.FieldByName('PRO_CODIGO').IsNull then
    MessageDlg('Este produto não possui vínculo!', mtWarning, [mbOk], 0)
  else
  begin
    if MessageDlg('Deseja realmente desvincular o produto?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      DelProdutosFor;
  end;
end;

procedure TfrmImpItensFor.sbVincularClick(Sender: TObject);
begin
  FiltrarProdutosForX(dsItens.DataSet.FieldByName('cProd').Text,
                      IntToStr(VerifCadCNPJ(dsFornecedor.DataSet.FieldByName('CNPJ').Text)))  ;
  if dsProdutosFor.DataSet.FieldByName('PRO_CODIGO').IsNull then
  begin
    Vincular;
    vgCodFornecedor := VerifCadCNPJ(dsFornecedor.DataSet.FieldByName('CNPJ').Text);
    vgDescProdFor := dsItens.DataSet.FieldByName('xProd').Text;
    frmVincProdFor.ShowModal;
  end
  else
    MessageDlg('Este produto já possui vínculo!', mtWarning, [mbOk], 0);
end;

end.
