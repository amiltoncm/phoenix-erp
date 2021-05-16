unit uCondicoesPV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, wwdblook, Vcl.ExtCtrls, DB, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, uClassEnderecoEnt;

type
  TfrmCondicoesPV = class(TfrmTmpFormNormal)
    Label1: TLabel;
    cbPrazo: TwwDBLookupCombo;
    Label16: TLabel;
    cbForma: TwwDBLookupCombo;
    Label17: TLabel;
    cbFrete: TwwDBLookupCombo;
    Label18: TLabel;
    cbEntrega: TwwDBLookupCombo;
    dsPreVenda: TDataSource;
    btGravar: TBitBtn;
    dsEnderecos: TDataSource;
    pnEndEntrega: TPanel;
    GridEnderecos: TJvDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    edLogradouro: TEdit;
    edNumero: TEdit;
    edBairro: TEdit;
    edCidade: TEdit;
    edUf: TEdit;
    edCodEnd: TEdit;
    sbEndPrincipal: TSpeedButton;
    sbNovoEnd: TSpeedButton;
    procedure cbPrazoExit(Sender: TObject);
    procedure cbFormaExit(Sender: TObject);
    procedure cbFreteExit(Sender: TObject);
    procedure cbEntregaExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure GridEnderecosDblClick(Sender: TObject);
    procedure sbEndPrincipalClick(Sender: TObject);
    procedure sbNovoEndClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCondicoesPV: TfrmCondicoesPV;

implementation

{$R *.dfm}

uses dataOrcamentos, dataLookups, uDaoEnderecos, dataPessoas, uDaoPrevendas,
  uClassPessoasend, uVarGlobal, uDaoPessoas, uCadEnderecosAd, uDaoPrevendent,
  uFuncoesFormatacao, uDaoLookups;

procedure TfrmCondicoesPV.btGravarClick(Sender: TObject);
begin
  inherited;
  //Grava as alterações
  if dsPreVenda.DataSet.State in [dsEdit] then
    PostPrevendas;
  //Caso tenha endereço selecionado apaga anterior e grava o novo
  FiltrarPrevendent('PRV_NUMERO', '=', LimpaReal(dsPreVenda.DataSet.FieldByName('PRV_NUMERO').Value), '0');
  if Not(dmOrcamentos.qyPrevEndEntPRV_NUMERO.IsNull) then
    DelPrevendent;
  if edCodEnd.Text <> '0' then
  begin
    InsPrevendent;
    SetNumeroPEE(dsPreVenda.DataSet.FieldByName('PRV_NUMERO').Value);
    SetCodigoPEE(StrToInt(LimpaReal(edCodEnd.Text)));
    PostPrevendent;
  end;
  Close;
end;

procedure TfrmCondicoesPV.cbEntregaExit(Sender: TObject);
begin
  if dsPreVenda.DataSet.State in [dsInsert, dsEdit] then
    dmOrcamentos.qyPrevendasENT_CODIGO.Value := dmLookups.qyLkEntregaENT_CODIGO.Value;
  if dsPreVenda.DataSet.FieldByName('ENT_CODIGO').Value = 1 then
  begin
    GridEnderecos.Enabled := True;
    sbEndPrincipal.Enabled := True;
    sbNovoEnd.Enabled := True;
  end
  else
  begin
    GridEnderecos.Enabled := False;
    sbEndPrincipal.Enabled := False;
    sbNovoEnd.Enabled := False;
  end;
end;

procedure TfrmCondicoesPV.cbFormaExit(Sender: TObject);
begin
  if dsPreVenda.DataSet.State in [dsInsert, dsEdit] then
    dmOrcamentos.qyPrevendasFRP_CODIGO.Value := dmLookups.qyLkPrazosFrpFRP_CODIGO.Value;
end;

procedure TfrmCondicoesPV.cbFreteExit(Sender: TObject);
begin
  if dsPreVenda.DataSet.State in [dsInsert, dsEdit] then
    dmOrcamentos.qyPrevendasMDF_CODIGO.Value := dmLookups.qyLkModFreteMDF_CODIGO.Value;
end;

procedure TfrmCondicoesPV.cbPrazoExit(Sender: TObject);
begin
  if dsPreVenda.DataSet.State in [dsInsert, dsEdit] then
  begin
    dmOrcamentos.qyPrevendasPRZ_CODIGO.Value := dmLookups.qyLkPrazosPRZ_CODIGO.Value;
    cbForma.Clear;
    if ((cbPrazo.Text = '') or (cbPrazo.Text = ' ')) then
      FiltrarPrazosFrpLk('-1')
    else
      FiltrarPrazosFrpLk(IntToStr(dmLookups.qyLkPrazosPRZ_CODIGO.Value));
    if dmLookups.qyLkPrazosPRZ_CODIGO.Value = 1 then
      cbForma.Text := 'DINHEIRO'
    else
      cbForma.Text := dmLookups.qyLkPrazosFrpfrp_descricao.Text;
    cbForma.PerformSearch;
  end;
end;

procedure TfrmCondicoesPV.FormActivate(Sender: TObject);
begin
  inherited;
  FiltrarPrevendent('PRV_NUMERO', '=', LimpaReal(dsPreVenda.DataSet.FieldByName('PRV_NUMERO').Text), '0');
  if dmOrcamentos.qyPrevEndEntPRV_NUMERO.IsNull then
  begin
    vgPessoasEnd := TPessoasend.Create;
    GetEndereco(dsPreVenda.DataSet.FieldByName('PES_CODIGO').Value);
    edCodEnd.Text := '0';
    edLogradouro.Text := vgPessoasEnd.Logradouro;
    edNumero.Text := FormatFloat(vgInteiro, vgPessoasEnd.Numero);
    edBairro.Text := vgPessoasEnd.Bairro;
    edCidade.Text := vgPessoasEnd.Cidade;
    edUf.Text := vgPessoasEnd.Uf;
    vgPessoasEnd.Free;
  end
  else
  begin
    vgEnderecoEnt := TEnderecoEnt.Create;
    GetEnderecoEnt(LimpaReal(dmOrcamentos.qyPrevEndEntEND_CODIGO.Text));
    edCodEnd.Text := FormatFloat(vgInteiro, vgEnderecoEnt.Codigo);
    edLogradouro.Text := vgEnderecoEnt.Logradouro;
    edNumero.Text := FormatFloat(vgInteiro, vgEnderecoEnt.Numero);
    edBairro.Text := vgEnderecoEnt.Bairro;
    edCidade.Text := vgEnderecoEnt.Cidade;
    edUf.Text := vgEnderecoEnt.Uf;
    vgEnderecoEnt.Free;
  end;
  FiltrarEnderecos('PES_CODIGO', '=', IntToStr(dsPreVenda.DataSet.FieldByName('PES_CODIGO').Value), 'END_LOGRADOURO');
  dsPreVenda.DataSet.Active := True;
  if dsPreVenda.DataSet.FieldByName('ENT_CODIGO').Value = 1 then
  begin
    GridEnderecos.Enabled := True;
    sbEndPrincipal.Enabled := True;
    sbNovoEnd.Enabled := True;
  end
  else
  begin
    GridEnderecos.Enabled := False;
    sbEndPrincipal.Enabled := False;
    sbNovoEnd.Enabled := False;
  end;
  // Prazo ---------------------------------------------------------------------
  cbPrazo.Text := dsPreVenda.DataSet.FieldByName('prz_descricao').Text;
  cbPrazo.PerformSearch;
  // Frete ---------------------------------------------------------------------
  cbFrete.Text := dsPreVenda.DataSet.FieldByName('mdf_descricao').Text;
  cbForma.PerformSearch;
  // Entrega -------------------------------------------------------------------
  cbEntrega.Text := dsPreVenda.DataSet.FieldByName('ent_descricao').Text;
  cbForma.PerformSearch;
  EdtPrevendas;
  cbForma.Clear;
  cbPrazo.SetFocus;
end;

procedure TfrmCondicoesPV.GridEnderecosDblClick(Sender: TObject);
begin
  edCodEnd.Text := FormatFloat(vgInteiro, dsEnderecos.DataSet.FieldByName('END_CODIGO').Value);
  edLogradouro.Text := dsEnderecos.DataSet.FieldByName('END_LOGRADOURO').Text;
  edNumero.Text := dsEnderecos.DataSet.FieldByName('END_NUMERO').Text;
  edBairro.Text := dsEnderecos.DataSet.FieldByName('END_BAIRRO').Text;
  edCidade.Text := dsEnderecos.DataSet.FieldByName('CID_MUNICIPIO').Text;
  edUf.Text := dsEnderecos.DataSet.FieldByName('UF_SIGLA').Text;
end;

procedure TfrmCondicoesPV.sbEndPrincipalClick(Sender: TObject);
begin
  vgPessoasEnd := TPessoasend.Create;
  GetEndereco(dsPreVenda.DataSet.FieldByName('PES_CODIGO').Value);
  edCodEnd.Text := '0';
  edLogradouro.Text := vgPessoasEnd.Logradouro;
  edNumero.Text := FormatFloat(vgInteiro, vgPessoasEnd.Numero);
  edBairro.Text := vgPessoasEnd.Bairro;
  edCidade.Text := vgPessoasEnd.Cidade;
  edUf.Text := vgPessoasEnd.Uf;
  vgPessoasEnd.Free;
end;

procedure TfrmCondicoesPV.sbNovoEndClick(Sender: TObject);
begin
  vgCodClienteEnd := dsPreVenda.DataSet.FieldByName('PES_CODIGO').Value;
  frmCadEnderecosAd.ShowModal;
  dsEnderecos.DataSet.Refresh;
end;

end.
