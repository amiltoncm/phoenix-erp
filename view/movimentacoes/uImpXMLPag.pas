unit uImpXMLPag;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Xml.xmldom, Datasnap.Provider, Xmlxform, Xml.XMLIntf,
  Xml.Win.msxmldom, Xml.XMLDoc, Data.DB, Datasnap.DBClient, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, uClassPessoas, JvMemoryDataset;

type
  TfrmImpXMLPag = class(TfrmTmpFormNormal)
    panelTopo: TPanel;
    Label1: TLabel;
    sbOpenXML: TSpeedButton;
    edXML: TEdit;
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
    panNF: TPanel;
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
    Label24: TLabel;
    odXML: TOpenDialog;
    xmlTPFornecedor: TXMLTransformProvider;
    xmlTPDuplicatas: TXMLTransformProvider;
    XMLDocFornecedor: TXMLDocument;
    XMLDocDuplicatas: TXMLDocument;
    cdsFornecedor: TClientDataSet;
    cdsDuplicatas: TClientDataSet;
    dsFornecedor: TDataSource;
    dsDuplicatas: TDataSource;
    dbRazaoSocial: TDBEdit;
    cdsFornecedorcNF: TStringField;
    cdsFornecedornNF: TStringField;
    cdsFornecedormod: TStringField;
    cdsFornecedorserie: TStringField;
    cdsFornecedordhEmi: TStringField;
    cdsFornecedornatOp: TStringField;
    cdsFornecedorchNFe: TStringField;
    cdsFornecedornFat: TStringField;
    cdsFornecedorvOrig: TStringField;
    cdsFornecedorvDesc: TStringField;
    cdsFornecedorvLiq: TStringField;
    cdsFornecedorxNome: TStringField;
    cdsFornecedorxFant: TStringField;
    cdsFornecedorCNPJ: TStringField;
    cdsFornecedorIE: TStringField;
    cdsFornecedorxLgr: TStringField;
    cdsFornecedornro: TStringField;
    cdsFornecedorxBairro: TStringField;
    cdsFornecedorcMun: TStringField;
    cdsFornecedorxMun: TStringField;
    cdsFornecedorUF: TStringField;
    cdsFornecedorCEP: TStringField;
    cdsFornecedorfone: TStringField;
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
    dbCodNf: TDBEdit;
    dbNumNF: TDBEdit;
    dbMod: TDBEdit;
    dbSerie: TDBEdit;
    dbEmissao: TDBEdit;
    dbNatOp: TDBEdit;
    dbChave: TDBEdit;
    dbFatura: TDBEdit;
    dbVlrTotal: TDBEdit;
    dbVlrDesc: TDBEdit;
    dbVlrLiq: TDBEdit;
    cdsDuplicatasnDup: TStringField;
    cdsDuplicatasdVenc: TStringField;
    cdsDuplicatasvDup: TStringField;
    DBGrid1: TDBGrid;
    xmlTPDestinatario: TXMLTransformProvider;
    XMLDocDestinatario: TXMLDocument;
    cdsDestinatario: TClientDataSet;
    dsDestinatario: TDataSource;
    cdsDestinatarioCNPJ: TStringField;
    btLancar: TBitBtn;
    xmlTPItens: TXMLTransformProvider;
    XMLDocItens: TXMLDocument;
    cdsItens: TClientDataSet;
    dsItens: TDataSource;
    cdsItensnItem: TStringField;
    cdsItenscProd: TStringField;
    cdsItenscEAN: TStringField;
    cdsItensxProd: TStringField;
    cdsItensNCM: TStringField;
    cdsItensCEST: TStringField;
    cdsItensEXTIPI: TStringField;
    cdsItensCFOP: TStringField;
    cdsItensuCom: TStringField;
    cdsItensqCom: TStringField;
    cdsItensvUnCom: TStringField;
    cdsItensvProd: TStringField;
    cdsItenscEANTrib: TStringField;
    cdsItensuTrib: TStringField;
    cdsItensqTrib: TStringField;
    cdsItensvUnTrib: TStringField;
    cdsItensindTot: TStringField;
    cdsItensxPed: TStringField;
    cdsItensnFCI: TStringField;
    cdsItensorig: TStringField;
    cdsItensICMS10_CST: TStringField;
    cdsItensmodBC: TStringField;
    cdsItensICMS10_vBC: TStringField;
    cdsItenspICMS: TStringField;
    cdsItensvICMS: TStringField;
    cdsItensmodBCST: TStringField;
    cdsItenspMVAST: TStringField;
    cdsItensvBCST: TStringField;
    cdsItenspICMSST: TStringField;
    cdsItensvICMSST: TStringField;
    cdsItensIPITrib_CST: TStringField;
    cdsItensIPITrib_vBC: TStringField;
    cdsItenspIPI: TStringField;
    cdsItensvIPI: TStringField;
    cdsItensPISAliq_CST: TStringField;
    cdsItensPISAliq_vBC: TStringField;
    cdsItenspPIS: TStringField;
    cdsItensvPIS: TStringField;
    cdsItensCOFINSAliq_CST: TStringField;
    cdsItensCOFINSAliq_vBC: TStringField;
    cdsItenspCOFINS: TStringField;
    cdsItensvCOFINS: TStringField;
    btItens: TBitBtn;
    procedure Limpar;
    procedure LerArquivo(vfNome: TFilename);
    procedure CarregarNF(vfNome: TFilename);
    procedure sbOpenXMLClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btLancarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btItensClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpXMLPag: TfrmImpXMLPag;

implementation

{$R *.dfm}

uses uDaoEmpresa, uFuncoesFormatacao, uDaoPessoas, uDaoCidades, uDaoUf,
  uCadPessoaMov, uVarGlobal, uFuncoesDatas, uConfDuplicatas, uDaoPagar,
  uDaoConfig, dataTemp, uDaoProdutosMov, uImpItensFor;

procedure TfrmImpXMLPag.Limpar;
begin
  cdsFornecedor.Active := False;
  cdsDuplicatas.Active := False;
  cdsDestinatario.Active := False;
  edXML.Clear;
  dmTemp.mdPagar.Close;
end;

procedure TfrmImpXMLPag.btItensClick(Sender: TObject);
Var
vCodForn: Integer;
begin
  if VerPagChave(dsFornecedor.DataSet.FieldByName('chNFe').Text) = True then
  begin
    vCodForn := VerifCadCNPJ(dsFornecedor.DataSet.FieldByName('CNPJ').Text);
    if vCodForn = 0 then
      MessageDlg('É necessário que o Fornecedor possua cadastro!', mtWarning, [mbOk], 0)
    else
    begin
      vgCodFornecedor := vCodForn;
      if VerifLanc(vCodForn, dsFornecedor.DataSet.FieldByName('nNF').Value,
                   dsFornecedor.DataSet.FieldByName('serie').Value,
                   dsFornecedor.DataSet.FieldByName('mod').Value) = False then
        frmImpItensFor.ShowModal
      else
        MessageDlg('Esta NFe já possui entrada no estoque!', mtWarning, [mbOk], 0);
    end;
  end
  else
    MessageDlg('É necessário lançar o pagamento antes de dar entrada nos itens!', mtWarning, [mbOk], 0);
end;

procedure TfrmImpXMLPag.btLancarClick(Sender: TObject);
Var
vPessoa: TPessoas;
vCodPessoa: Integer;
vI: Integer;
begin
  //Testa se o fornecedor tem cadastro
  if VerifCadCNPJ(dsFornecedor.DataSet.FieldByName('CNPJ').Text) = 0 then
  begin
    vPessoa := TPessoas.Create;
    vPessoa.Codigo := 0;
    vPessoa.Nome := dsFornecedor.DataSet.FieldByName('xNome').Text;
    if dsFornecedor.DataSet.FieldByName('xFant').Text <> '' then
      vPessoa.Fantasia := dsFornecedor.DataSet.FieldByName('xFant').Text
    else
      vPessoa.Fantasia := dsFornecedor.DataSet.FieldByName('xNome').Text;
    if Length(dsFornecedor.DataSet.FieldByName('CNPJ').Text) = 14 then
      vPessoa.Documento :=  PontuaCNPJ(dsFornecedor.DataSet.FieldByName('CNPJ').Text)
    else
      vPessoa.Documento := dsFornecedor.DataSet.FieldByName('CNPJ').Text;
    vPessoa.Identificacao := dsFornecedor.DataSet.FieldByName('IE').Text;
    vPessoa.Logradouro := dsFornecedor.DataSet.FieldByName('xLgr').Text;
    vPessoa.Numero := StrToInt(OnlyNum(dsFornecedor.DataSet.FieldByName('nro').Text));
    vPessoa.Bairro := dsFornecedor.DataSet.FieldByName('xBairro').Text;
    vPessoa.CodCidade := dsFornecedor.DataSet.FieldByName('cMun').Value;
    vPessoa.Uf := dsFornecedor.DataSet.FieldByName('UF').Text;
    vPessoa.CodUf := StrToInt(GetCodUf(dsFornecedor.DataSet.FieldByName('UF').Text));
    vPessoa.Cidade := GetDescCidade(dsFornecedor.DataSet.FieldByName('cMun').Text);
    if Length(dsFornecedor.DataSet.FieldByName('CEP').Text) = 8 then
      vPessoa.Cep := FormatCEP(dsFornecedor.DataSet.FieldByName('CEP').Text)
    else
      vPessoa.Cep := dsFornecedor.DataSet.FieldByName('CEP').Text;
    vPessoa.Fone := dsFornecedor.DataSet.FieldByName('fone').Text;
    //Padrão
    vPessoa.Ativo := 'S';
    vPessoa.Tipo := 'J';
    vPessoa.CodTipoLog := 0;
    vPessoa.TipoLog := 'Rua';
    InsPessoas;
    SetValuesPessoas(vPessoa);
    vPessoa.Free;
    frmCadPessoaMov.ShowModal;
  end;
  vCodPessoa := VerifCadCNPJ(dsFornecedor.DataSet.FieldByName('CNPJ').Text);
  if dsDuplicatas.DataSet.FieldByName('vDup').IsNull then
    MessageDlg('Não existe(m) duplicata(s) para lançar!', mtWarning, [mbOk], 0)
  else
  begin
    if VerPagChave(dsFornecedor.DataSet.FieldByName('chNFe').Text) = False then
    begin
      dmTemp.mdPagar.Open;
      dsDuplicatas.DataSet.First;
      vI := 0;
      Repeat
        vI := vI + 1;
        dmTemp.mdPagar.Insert;
        dmTemp.mdPagarCodigo.Value := vI;
        dmTemp.mdPagarEmissao.Text := ConverteData(dsFornecedor.DataSet.FieldByName('dhemi').Text);
        dmTemp.mdPagarVencimento.Text := ConverteData(dsDuplicatas.DataSet.FieldByName('dVenc').Text);
        dmTemp.mdPagarNumero.Value := dsFornecedor.DataSet.FieldByName('nNF').Value;
        dmTemp.mdPagarSerie.Value := dsFornecedor.DataSet.FieldByName('serie').Value;
        dmTemp.mdPagarModelo.Value := dsFornecedor.DataSet.FieldByName('mod').Value;
        dmTemp.mdPagarParcela.Value := vI;
        dmTemp.mdPagarDuplicata.Text := dsDuplicatas.DataSet.FieldByName('nDup').Text;
        dmTemp.mdPagarPesCodigo.Value := vCodPessoa;
        dmTemp.mdPagarNome.Text := dsFornecedor.DataSet.FieldByName('xNome').Text;
        dmTemp.mdPagarValor.Text := LimpaReal(TrocaPtoPVirg(dsDuplicatas.DataSet.FieldByName('vDup').Text));
        dmTemp.mdPagarPago.Value := 0;
        dmTemp.mdPagarAcrescimo.Value := 0;
        dmTemp.mdPagarDesconto.Value := 0;
        dmTemp.mdPagarSaldo.Value := dmTemp.mdPagarValor.Value;
        dmTemp.mdPagarChaveNFE.Text := dsFornecedor.DataSet.FieldByName('chNFe').Text;
        dmTemp.mdPagarStaCodigo.Value := 1;
        dmTemp.mdPagar.Post;
        dsDuplicatas.DataSet.Next;
      Until dsDuplicatas.DataSet.Eof = True;
      dsDuplicatas.DataSet.First;
      frmConfDuplicatas.ShowModal;
      if MessageDlg('Deseja dar entrada nos itens agora?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        vgCodFornecedor := VerifCadCNPJ(dsFornecedor.DataSet.FieldByName('CNPJ').Text);
        if vgCodFornecedor <> 0 then
          frmImpItensFor.ShowModal;
      end;
      Limpar;
    end
    else
      MessageDlg('A NFe chave: ' + dsFornecedor.DataSet.FieldByName('chNFe').Text +
                 ' já está lançada!', mtWarning, [mbOK], 0);
  end;
end;

procedure TfrmImpXMLPag.FormActivate(Sender: TObject);
begin
  inherited;
  //Carrega arquivos xtr
  odXML.InitialDir := vgPathXML;
  xmlTPFornecedor.TransformRead.TransformationFile := vgPathXML + '\xtr\ToDpFornecedor.xtr';
  xmlTPDuplicatas.TransformRead.TransformationFile := vgPathXML + '\xtr\ToDpDuplicatas.xtr';
  xmlTPDestinatario.TransformRead.TransformationFile := vgPathXML + '\xtr\ToDpDestinatario.xtr';
  xmlTPItens.TransformRead.TransformationFile := vgPathXML + '\xtr\ToDpItens.xtr';
end;

procedure TfrmImpXMLPag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cdsFornecedor.Active := False;
  cdsDuplicatas.Active := False;
  cdsDestinatario.Active := False;
  cdsItens.Active := False;
  edXML.Clear;
  dmTemp.mdPagar.Close;
  inherited;
end;

procedure TfrmImpXMLPag.FormCreate(Sender: TObject);
begin
  inherited;
  edXML.Clear;
end;

procedure TfrmImpXMLPag.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

procedure TfrmImpXMLPag.LerArquivo(vfNome: TFilename);
Var
vEmpresa, vDestinatario: String;
begin
  Screen.Cursor := crHourGlass;
  try
    //Carrega CNPJ do destinatário para verificação
    cdsDestinatario.Close;
    XMLDocDestinatario.Active := False;
    XMLDocDestinatario.XML.Clear;
    XMLDocDestinatario.LoadFromFile(vfNome);
    XMLDocDestinatario.Active := true;
    xmlTPDestinatario.XMLDataFile := vfNome;
    cdsDestinatario.Open;
    vDestinatario := cdsDestinatario.FieldByName('CNPJ').Text;
    vEmpresa := LimpaCNPJ(GetCNPJ);
    if vEmpresa <> vDestinatario then
    begin
      if LancaTerc = True then
      begin
        if MessageDlg('O CNPJ do XML não coincide com o CNPJ da empresa!' + #13 +
                      'Deseja lançar mesmo assim?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          CarregarNF(vfNome);
      end
      else
        MessageDlg('O CNPJ do XML não coincide com o CNPJ da empresa!', mtInformation, [mbOk], 0);
    end
    else
      CarregarNF(vfNome);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmImpXMLPag.CarregarNF(vfNome: TFilename);
begin
  try
    //Carrega dados nfe + fornecedor
    cdsFornecedor.Close;
    XMLDocFornecedor.Active := False;
    XMLDocFornecedor.XML.Clear;
    XMLDocFornecedor.LoadFromFile(vfNome);
    XMLDocFornecedor.Active := true;
    XMLTPFornecedor.XMLDataFile := vfNome;
    cdsFornecedor.Open;
    //Carrega dados das duplicatas
    cdsDuplicatas.Close;
    XMLDocDuplicatas.Active := False;
    XMLDocDuplicatas.XML.Clear;
    XMLDocDuplicatas.LoadFromFile(vfNome);
    XMLDocDuplicatas.Active := true;
    xmlTPDuplicatas.XMLDataFile := vfNome;
    cdsDuplicatas.Open;
    //Carrega dados dos Itens
    cdsItens.Close;
    XMLDocItens.Active := False;
    XMLDocItens.XML.Clear;
    XMLDocItens.LoadFromFile(vfNome);
    XMLDocItens.Active := true;
    xmlTPItens.XMLDataFile := vfNome;
    cdsItens.Open;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmImpXMLPag.sbOpenXMLClick(Sender: TObject);
begin
  cdsFornecedor.Active := False;
  cdsDuplicatas.Active := False;
  cdsItens.Active := False;
  cdsDestinatario.Active := False;
  if odXML.Execute then
  begin
    edXML.Text := odXML.FileName;
    LerArquivo(edXML.Text);
  end;
end;

end.
