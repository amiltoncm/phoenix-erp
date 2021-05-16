unit uLancPagMan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ComCtrls, wwdblook;

type
  TfrmLancPagMan = class(TfrmTmpFormNormal)
    Label1: TLabel;
    dtpVencimento: TDateTimePicker;
    Label2: TLabel;
    dtpEmissao: TDateTimePicker;
    Label3: TLabel;
    edNumero: TEdit;
    Label4: TLabel;
    edSerie: TEdit;
    Label5: TLabel;
    cbModelo: TwwDBLookupCombo;
    Label6: TLabel;
    edCodModelo: TEdit;
    Label7: TLabel;
    edQtdParcelas: TEdit;
    Label8: TLabel;
    edDuplicata: TEdit;
    Label9: TLabel;
    cbFornecedor: TwwDBLookupCombo;
    edChaveNFe: TEdit;
    Label10: TLabel;
    edVlrTotalNF: TEdit;
    Label11: TLabel;
    btLancar: TBitBtn;
    function TestaCampos: Boolean;
    procedure Limpar;
    procedure btLancarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edSerieExit(Sender: TObject);
    procedure edVlrTotalNFExit(Sender: TObject);
    procedure edVlrTotalNFKeyPress(Sender: TObject; var Key: Char);
    procedure cbModeloExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLancPagMan: TfrmLancPagMan;

implementation

{$R *.dfm}

uses dataLookups, dataTemp, uConfDuplicatas, uFuncoesFormatacao, uVarGlobal,
  uDaoPagar;

function TfrmLancPagMan.TestaCampos: Boolean;
Var
vTeste: Boolean;
begin
  vTeste := True;
  if ((edNumero.Text = '') or (edNumero.Text = ' ')) then
  begin
    vTeste := False;
    MessageDlg('O campo "Número NF" é obrigatório!', mtWarning, [mbOk], 0);
  end;
  if ((edSerie.Text = '') or (edSerie.Text = ' ')) then
  begin
    vTeste := False;
    MessageDlg('O campo "Série" é obrigatório!', mtWarning, [mbOk], 0);
  end;
  if ((cbModelo.Text = '') or (cbModelo.Text = ' ')) then
  begin
    vTeste := False;
    MessageDlg('O campo "Modelo" é obrigatório!', mtWarning, [mbOk], 0);
  end;
  if ((edQtdParcelas.Text = '') or (edQtdParcelas.Text = ' ')) then
  begin
    vTeste := False;
    MessageDlg('O campo "Quantidade de Parcelas" é obrigatório!', mtWarning, [mbOk], 0);
  end;
  if ((cbFornecedor.Text = '') or (cbFornecedor.Text = ' ')) then
  begin
    vTeste := False;
    MessageDlg('O campo "Fornecedor" é obrigatório!', mtWarning, [mbOk], 0);
  end;
  if ((edVlrTotalNF.Text = '') or (edVlrTotalNF.Text = ' ')) then
  begin
    vTeste := False;
    MessageDlg('O campo "Valor total" é obrigatório!', mtWarning, [mbOk], 0);
  end;
  if (edVlrTotalNF.Text = '0,00') then
  begin
    vTeste := False;
    MessageDlg('O valor do campo "Valor total" não pode ser ZERO!', mtWarning, [mbOk], 0);
  end;
  Result := vTeste;
end;

procedure TfrmLancPagMan.cbModeloExit(Sender: TObject);
begin
  edCodModelo.Text := dmLookups.qyLkModDocMDC_CODIGO.Text;
end;

procedure TfrmLancPagMan.edSerieExit(Sender: TObject);
begin
  edDuplicata.Text := edNumero.Text + edSerie.Text;
end;

procedure TfrmLancPagMan.edVlrTotalNFExit(Sender: TObject);
Var
vValor: Real;
begin
  if ((edVlrTotalNF.Text = '') or (edVlrTotalNF.Text = ' ')) then
    edVlrTotalNF.Text := '0,00';
  vValor := StrToFloat(LimpaReal(edVlrTotalNF.Text));
  edVlrTotalNF.Text := FormatFloat(vgMaskReal, vValor);
end;

procedure TfrmLancPagMan.edVlrTotalNFKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key := NumeroReal(Key);
end;

procedure TfrmLancPagMan.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmLancPagMan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmTemp.mdPagar.Close;
  inherited;
end;

procedure TfrmLancPagMan.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

procedure TfrmLancPagMan.Limpar;
begin
  edChaveNFe.Clear;
  dtpEmissao.Date := now;
  edNumero.Clear;
  edSerie.Text := '1';
  dtpVencimento.Date := now + 28;
  cbModelo.Text := 'Nota Fiscal Eletrônica - NFe';
  cbModelo.PerformSearch;
  edCodModelo.Text := dmLookups.qyLkModDocMDC_CODIGO.Text;
  edQtdParcelas.Text := '1';
  edDuplicata.Clear;
  cbFornecedor.Text := '';
  cbFornecedor.PerformSearch;
  edVlrTotalNF.Clear;
  edChaveNFe.SetFocus;
end;

procedure TfrmLancPagMan.btLancarClick(Sender: TObject);
Var
vI, vDuplicatas: Integer;
vDiasVenc: Integer;
vValorParc: Real;
begin
  if TestaCampos = True then
  begin
    if VerPagLanc(IntToStr(dmLookups.qyLkFornecedoresPES_CODIGO.Value), edNumero.Text,
                  edSerie.Text, '1') = False then
    begin
      vDuplicatas := StrToInt(edQtdParcelas.Text);
      vI := 0;
      vDiasVenc := 0;
      dmTemp.mdPagar.Open;
      Repeat
        vI := vI + 1;
        dmTemp.mdPagar.Insert;
        dmTemp.mdPagarCodigo.Value := vI;
        dmTemp.mdPagarEmissao.Text := DateToStr(dtpEmissao.Date);
        dmTemp.mdPagarVencimento.Text := DateToStr(dtpVencimento.Date + vDiasVenc);
        dmTemp.mdPagarNumero.Value := StrToInt(edNumero.Text);
        dmTemp.mdPagarSerie.Value := StrToInt(edSerie.Text);
        dmTemp.mdPagarModelo.Text := edCodModelo.Text;
        dmTemp.mdPagarParcela.Value := vI;
        dmTemp.mdPagarDuplicata.Text := edDuplicata.Text + '/' + IntToStr(vI);
        dmTemp.mdPagarPesCodigo.Value := dmLookups.qyLkFornecedoresPES_CODIGO.Value;
        dmTemp.mdPagarNome.Text := dmLookups.qyLkFornecedoresPES_NOME.Text;
        vValorParc := StrToFloat(LimpaReal(edVlrTotalNF.Text)) / vDuplicatas;
        dmTemp.mdPagarValor.Value := vValorParc;
        dmTemp.mdPagarPago.Value := 0;
        dmTemp.mdPagarAcrescimo.Value := 0;
        dmTemp.mdPagarDesconto.Value := 0;
        dmTemp.mdPagarSaldo.Value := dmTemp.mdPagarValor.Value;
        dmTemp.mdPagarChaveNFE.Text := edChaveNFe.Text;
        dmTemp.mdPagarStaCodigo.Value := 1;
        dmTemp.mdPagar.Post;
        vDiasVenc := vDiasVenc + 28;
      Until vI = vDuplicatas;
      frmConfDuplicatas.ShowModal;
      Limpar;
    end
    else
      MessageDlg('A NF ' + edNumero.Text + '/' + edSerie.Text + ' já está lançada!', mtWarning, [mbOk], 0);
  end;
end;

end.
