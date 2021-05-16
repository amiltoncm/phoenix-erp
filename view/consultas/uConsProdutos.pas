unit uConsProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  Data.DB, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmConsProdutos = class(TfrmTmpFormNormal)
    PageControl1: TPageControl;
    tsProduto: TTabSheet;
    Label1: TLabel;
    edCodigo: TEdit;
    edProduto: TEdit;
    Label2: TLabel;
    tsComplementares: TTabSheet;
    tsSimilares: TTabSheet;
    tsMovimentações: TTabSheet;
    panProduto: TPanel;
    dsProdutos: TDataSource;
    GridProdutos: TJvDBGrid;
    tsDetalhes: TTabSheet;
    Label3: TLabel;
    dsProdutosEst: TDataSource;
    dbDisponivel: TDBEdit;
    dbReservas: TDBEdit;
    dbFisico: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    Label6: TLabel;
    dbCodGrupo: TDBEdit;
    Label7: TLabel;
    dbGrupo: TDBEdit;
    Label8: TLabel;
    dbCodSubGrupo: TDBEdit;
    Label9: TLabel;
    dbSubGrupo: TDBEdit;
    Label10: TLabel;
    dbMarca: TDBEdit;
    Label11: TLabel;
    dbCodMarca: TDBEdit;
    Label12: TLabel;
    dbLocalizacao: TDBEdit;
    Label13: TLabel;
    dbCodLocal: TDBEdit;
    Label14: TLabel;
    dbCodBarras: TDBEdit;
    Label15: TLabel;
    dbTpItem: TDBEdit;
    Label16: TLabel;
    dbCodTp: TDBEdit;
    Label17: TLabel;
    dbClassificacao: TDBEdit;
    Label18: TLabel;
    dbPesoBrt: TDBEdit;
    Label19: TLabel;
    dbPesoLiq: TDBEdit;
    Label20: TLabel;
    dbNCM: TDBEdit;
    Label21: TLabel;
    dbLocalizacaoEst: TDBEdit;
    dsProdutosMov: TDataSource;
    Panel1: TPanel;
    Label22: TLabel;
    GridMov: TDBGrid;
    pnReservas: TPanel;
    Label23: TLabel;
    GridReservas: TDBGrid;
    dsPrevRes: TDataSource;
    tsObs: TTabSheet;
    dsProdComp: TDataSource;
    dsProdSim: TDataSource;
    dsProdObs: TDataSource;
    dbEmbalagem: TDBEdit;
    Label24: TLabel;
    Label25: TLabel;
    dbCodBarEmb: TDBEdit;
    reMemObs: TDBRichEdit;
    GridComp: TDBGrid;
    GridSim: TDBGrid;
    procedure Limpar;
    procedure FormActivate(Sender: TObject);
    procedure edCodigoExit(Sender: TObject);
    procedure dsProdutosDataChange(Sender: TObject; Field: TField);
    procedure edProdutoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dbReservasDblClick(Sender: TObject);
    procedure GridProdutosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridMovDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsProdutos: TfrmConsProdutos;

implementation

{$R *.dfm}

uses dataEstoque, dataCadastros, uDaoProdutos, uDaoProdutosEst, uVarGlobal,
  uDaoProdutosMov, dataConsultas, uDaoPrevRes, dataOrcamentos, uDaoProdutosComp,
  uDaoProdutosObs, uDaoProdutosSim;

procedure TfrmConsProdutos.Limpar;
begin
  PageControl1.ActivePage := tsProduto;
  FiltrarProdutos('PRO_CODIGO', '=', vgConsProdutos, '0');
  if vgConsProdutos <> '0' then
    edCodigo.Text := vgConsProdutos
  else
    edCodigo.Clear;
  vgConsProdutos := '0';
  edProduto.Clear;
  edCodigo.SetFocus;
end;

procedure TfrmConsProdutos.SpeedButton1Click(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmConsProdutos.dbReservasDblClick(Sender: TObject);
begin
  PageControl1.ActivePage := tsMovimentações;
end;

procedure TfrmConsProdutos.dsProdutosDataChange(Sender: TObject; Field: TField);
begin
  if dsProdutos.DataSet.FieldByName('pro_codigo').IsNull then
  begin
    FiltrarProdutosEst('pro_codigo', '=', '0', '0');
    ConsProdutosMov('0');
    FiltrarConsPrevRes('pro_codigo', '=', '0', '0');
    FiltrarProdutosComp('c.pro_codigo', '=', '0', '0');
    FiltrarProdutosObs('pro_codigo', '=', '0', '0');
    FiltrarProdutosSim('s.pro_codigo', '=', '0', '0');
  end
  else
  begin
    FiltrarProdutosEst('pro_codigo', '=', IntToStr(dsProdutos.DataSet.FieldByName('pro_codigo').Value), '0');
    ConsProdutosMov(IntToStr(dsProdutos.DataSet.FieldByName('pro_codigo').Value));
    FiltrarConsPrevRes('pro_codigo', '=', IntToStr(dsProdutos.DataSet.FieldByName('pro_codigo').Value), 'prv_numero');
    FiltrarProdutosComp('c.pro_codigo', '=', IntToStr(dsProdutos.DataSet.FieldByName('PRO_CODIGO').Value), 'p.pro_descricao');
    FiltrarProdutosObs('pro_codigo', '=', IntToStr(dsProdutos.DataSet.FieldByName('PRO_CODIGO').Value), '0');
    FiltrarProdutosSim('s.pro_codigo', '=', IntToStr(dsProdutos.DataSet.FieldByName('PRO_CODIGO').Value), 'p.pro_descricao');
  end;
  if dsProdutos.DataSet.FieldByName('pro_codigo').IsNull then
    panProduto.Caption := ''
  else
    panProduto.Caption := dsProdutos.DataSet.FieldByName('PRO_DESCRICAO'). Text + ' (' +
                          dsProdutos.DataSet.FieldByName('PRO_CODIGO'). Text + ')';
end;

procedure TfrmConsProdutos.edCodigoExit(Sender: TObject);
begin
  if edCodigo.Text <> '' then
  begin
    edProduto.Clear;
    FindCode(edCodigo.Text);
  end;
end;

procedure TfrmConsProdutos.edProdutoExit(Sender: TObject);
begin
  if edProduto.Text <> '' then
  begin
    edCodigo.Clear;
    FindDesc(edProduto.Text);
  end;

end;

procedure TfrmConsProdutos.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmConsProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F12 then
    Limpar;
end;

procedure TfrmConsProdutos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

procedure TfrmConsProdutos.GridMovDrawColumnCell(Sender: TObject;
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

procedure TfrmConsProdutos.GridProdutosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('PRO_STATUS').Text = 'A' then
    (Sender as TDBGrid).Canvas.Font.Color := clBlack
  else
    (Sender as TDBGrid).Canvas.Font.Color := clRed;
  (Sender as TDBGrid).Canvas.FillRect(Rect);
  (Sender as TDBGrid).DefaultDrawDataCell(Rect, (Sender as TDBGrid).columns[datacol].field, State);
end;

end.
