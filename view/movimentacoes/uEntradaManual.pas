unit uEntradaManual;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, wwdblook, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ActnList, Vcl.Mask, Vcl.DBCtrls, Vcl.Menus, System.Actions;

type
  TfrmEntradaManual = class(TfrmTmpFormNormal)
    pnFornecedor: TPanel;
    Label1: TLabel;
    cbFornecedor: TwwDBLookupCombo;
    Label2: TLabel;
    dtpData: TDateTimePicker;
    Label3: TLabel;
    cbTipo: TwwDBLookupCombo;
    dsEntTemp: TDataSource;
    edNF: TEdit;
    Label4: TLabel;
    edSerie: TEdit;
    Label5: TLabel;
    GridTemp: TDBGrid;
    Label6: TLabel;
    Label7: TLabel;
    pnCodBar: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    edQtde: TEdit;
    edCodBar: TEdit;
    btProcurar: TBitBtn;
    btGravar: TBitBtn;
    ActionList1: TActionList;
    actQtde: TAction;
    actCodBar: TAction;
    actProcProd: TAction;
    dsModDoc: TDataSource;
    dbModDoc: TDBEdit;
    edDescProd: TEdit;
    edCodigo: TEdit;
    PopupMenu1: TPopupMenu;
    Excluir1: TMenuItem;
    edCodFornecedor: TEdit;
    procedure Limpar;
    procedure FormActivate(Sender: TObject);
    procedure actQtdeExecute(Sender: TObject);
    procedure actCodBarExecute(Sender: TObject);
    procedure actProcProdExecute(Sender: TObject);
    procedure cbTipoExit(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure edNFExit(Sender: TObject);
    procedure edSerieExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edCodBarKeyPress(Sender: TObject; var Key: Char);
    procedure edQtdeExit(Sender: TObject);
    procedure edQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure edCodBarExit(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure cbFornecedorExit(Sender: TObject);
    procedure cbFornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure dtpDataKeyPress(Sender: TObject; var Key: Char);
    procedure cbTipoKeyPress(Sender: TObject; var Key: Char);
    procedure edNFKeyPress(Sender: TObject; var Key: Char);
    procedure edSerieKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEntradaManual: TfrmEntradaManual;
  vlCont: Integer;

implementation

{$R *.dfm}

uses dataTemp, dataLookups, uProcProdutos, uFuncoesDB, uDaoProdutos,
  uFuncoesValidacao, uFuncoesFormatacao, uDaoProdutosEst, uDaoProdutosMov,
  uClassProdutosmov;

procedure TfrmEntradaManual.Limpar;
begin
  vlCont := 1;
  dsEntTemp.DataSet.Active := True;
  cbFornecedor.Text := '';
  edCodFornecedor.Text := '000.000';
  dtpData.Date := GetDateServerPG;
  cbTipo.Text := 'Não definido';
  cbTipo.PerformSearch;
  cbTipo.Enabled := False;
  edNF.Text := '0';
  edNF.Enabled := False;
  edSerie.Text := '00';
  edSerie.Enabled := False;
  cbFornecedor.SetFocus;
  edDescProd.Clear;
  edCodigo.Clear;
  edQtde.Text := '1';
  edCodBar.Clear;
  cbFornecedor.SetFocus;
end;

procedure TfrmEntradaManual.actCodBarExecute(Sender: TObject);
begin
  edCodBar.SetFocus;
end;

procedure TfrmEntradaManual.actProcProdExecute(Sender: TObject);
begin
  frmProcProdutos.ShowModal;
end;

procedure TfrmEntradaManual.actQtdeExecute(Sender: TObject);
begin
  edQtde.SetFocus;
end;

procedure TfrmEntradaManual.btGravarClick(Sender: TObject);
Var
vCodForn: Integer;
vProdMov: TProdutosMov;
begin
  vCodForn := StrToInt(LimpaReal(edCodFornecedor.Text));
  if vCodForn = 0 then
    vCodForn := -1;
  if ((edNF.Text = '') or (edNF.Text = ' ')) then
    edNF.Text := '0';
  if ((edSerie.Text = '') or (edSerie.Text = ' ')) then
    edSerie.Text := '00';
  if Not(dsEntTemp.DataSet.FieldByName('Lancamento').IsNull) then
  begin
    dsEntTemp.DataSet.First;
    Repeat
    begin
      // Ajusta o estoque - ProdutosEst
      if dsEntTemp.DataSet.FieldByName('Quantidade').Value > 0 then
        EntradaEstoque(dsEntTemp.DataSet.FieldByName('Codigo').Value,
                       dsEntTemp.DataSet.FieldByName('Quantidade').Value)
      else
        SaidaEstoque(dsEntTemp.DataSet.FieldByName('Codigo').Value,
                       dsEntTemp.DataSet.FieldByName('Quantidade').Value);
      // Lançar movimentação - ProdutosMov
      vProdMov := TProdutosmov.Create;
      vProdMov.Codigo := 0;
      vProdMov.Codproduto := dsEntTemp.DataSet.FieldByName('Codigo').Value;
      vProdMov.Data := StrToDate(FormatDateTime('dd/MM/yyyy', (dtpData.Date)));
      vProdMov.Quantidade := dsEntTemp.DataSet.FieldByName('Quantidade').Value;
      vProdMov.Codpessoa := vCodForn;
      vProdMov.Tipo := 'MAN';
      vProdMov.Nota := StrToInt(LimpaReal(edNF.Text));
      vProdMov.Serie := StrToInt(edSerie.Text);
      vProdMov.Modelo := StrToInt(dsModDoc.DataSet.FieldByName('mdc_codigo').Text);
      vProdMov.Valor := dsEntTemp.DataSet.FieldByName('Valor').Value;
      InsProdutosMov;
      SetValuesProdutosMov(vProdMov);
      PostProdutosMov;
      vProdMov.Free;
      dsEntTemp.DataSet.Next;
    end;
    Until dsEntTemp.DataSet.Eof = True;
    if MessageDlg('Lançamento efetuado com sucesso!' + #13 + #10 +
                  'Deseja efetuar outro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      dsEntTemp.DataSet.Close;
      Limpar;
    end
    else
      Close;
  end
  else
    MessageDlg('É necessário ter itens lançados!', mtWarning, [mbOk], 0);
end;

procedure TfrmEntradaManual.cbFornecedorExit(Sender: TObject);
begin
  if cbFornecedor.Text = '' then
  begin
  edCodFornecedor.Text := '000.000';
    edNF.Text := '0';
    edNF.Enabled := False;
    edSerie.Text := '00';
    edSerie.Enabled := False;
    cbTipo.Text := 'Não definido';
    cbTipo.PerformSearch;
    cbTipo.Enabled := False;
  end
  else
  begin
    edCodFornecedor.Text := dmLookups.qyLkFornecedoresPES_CODIGO.Text;
    edNF.Clear;
    edNF.Enabled := True;
    edSerie.Clear;
    edSerie.Enabled := True;
    cbTipo.Text := 'Nota Fiscal Eletrônica - NFe';
    cbTipo.PerformSearch;
    cbTipo.Enabled := True;
  end;
end;

procedure TfrmEntradaManual.cbFornecedorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmEntradaManual.cbTipoExit(Sender: TObject);
begin
  if dsModDoc.DataSet.FieldByName('mdc_codigo').Text = '00' then
  begin
    edNF.Text := '0';
    edSerie.Text := '00';
  end
  else
  begin
    edNF.Clear;
    edSerie.Clear;
  end;
end;

procedure TfrmEntradaManual.cbTipoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmEntradaManual.dtpDataKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmEntradaManual.edCodBarExit(Sender: TObject);
begin
  edQtde.Text := '1,00';
end;

procedure TfrmEntradaManual.edCodBarKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    edDescProd.Clear;
    if ((edCodBar.Text <> '') and (edCodBar.Text <> ' '))  then
    begin
      if FiltrarProdutosCodBar(edCodBar.Text, 0) = true then
      begin
        edDescProd.Text := GetDescProd;
        edCodigo.Text := FormatFloat('000,000', (GetCodProd));
        edQtde.SetFocus;
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

procedure TfrmEntradaManual.edNFExit(Sender: TObject);
begin
  if ((edNF.Text = '') or (edNF.Text = ' ')) then
    edNF.Text  := '0';
  edNF.Text := FormatFloat('000,000', (StrToFloat(edNF.Text)));
end;

procedure TfrmEntradaManual.edNFKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmEntradaManual.edQtdeExit(Sender: TObject);
begin
  if ((edQtde.Text = '') or (edQtde.Text = ' ')) then
    edQtde.Text := '1,00';
  if TestaReal(edQtde.Text) = true then
    edQtde.Text := FormatFloat('#,###,###,##0.00', StrToFloat(edQtde.Text))
  else
    MessageDlg('Valor inválido!', mtWarning, [mbOk], 0);
end;

procedure TfrmEntradaManual.edQtdeKeyPress(Sender: TObject; var Key: Char);
Var
vVlrUn: String;
vOK: boolean;
begin
  if key = #13 then
  begin
    if ((edCodigo.Text <> '') and (edCodigo.Text <> ' ')) then
    begin
      if TestaReal(edQtde.Text) = true then
      begin
        vVlrUn := '0,00';
        InputQuery('Valor unitário', 'Digite o valor unitário: ', vVlrUn);
        if ((vVlrUn = '') or (vVlrUn = ' ')) then
          vVlrUn := '0';
        if TestaReal(vVlrUn) = true then
        begin
          dmTemp.mdEntManual.Append;
          dmTemp.mdEntManualLancamento.Value := vlCont;
          dmTemp.mdEntManualCodigo.Value := StrToInt(LimpaReal(edCodigo.Text));
          dmTemp.mdEntManualDescricao.Text := edDescProd.Text;
          dmTemp.mdEntManualQuantidade.Value := StrToFloat(edQtde.Text);
          dmTemp.mdEntManualValor.Value := StrToFloat(vVlrUn);
          dmTemp.mdEntManual.Post;
          vlCont := vlCont + 1;
          edCodBar.Clear;
          edDescProd.Clear;
          edCodigo.Clear;
          edQtde.Text := '1,00';
          edCodBar.SetFocus;
        end
        else
        begin
          MessageDlg('Valor inválido (' + vVlrUn + ')', mtWarning, [mbOk], 0);
          edCodBar.SetFocus;
        end;
      end
      else
        MessageDlg('Quantidade inválida! (' + edQtde.Text + ')', mtWarning, [mbOk], 0);
    end
    else
      MessageDlg('Produto não encontrado!', mtWarning, [mbOk], 0);
    edCodBar.SetFocus;
  end;
end;

procedure TfrmEntradaManual.edSerieExit(Sender: TObject);
begin
  if ((edSerie.Text = '') or (edSerie.Text = ' ')) then
    edSerie.Text  := '00';
  edSerie.Text := FormatFloat('00', StrToFloat(edSerie.Text));
end;

procedure TfrmEntradaManual.edSerieKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmEntradaManual.Excluir1Click(Sender: TObject);
begin
  if Not(dsEntTemp.DataSet.FieldByName('Lancamento').IsNull) then
  begin
    if MessageDlg('Deseja realmente excluir o item?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      dsEntTemp.DataSet.Delete;
  end;
end;

procedure TfrmEntradaManual.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmEntradaManual.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //Não pode herdar para não pular automaticamente, não funciona o CodBar
  //inherited;
end;

end.
