unit uConsPagarGer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormMDI, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.ComCtrls, wwdblook,
  Vcl.ActnList;

type
  TfrmConsPagarGer = class(TfrmTmpFormMDI)
    dsConsulta: TDataSource;
    GridPagar: TJvDBGrid;
    Label1: TLabel;
    dtpInicial: TDateTimePicker;
    Label2: TLabel;
    dtpFinal: TDateTimePicker;
    Label3: TLabel;
    cbFornecedor: TwwDBLookupCombo;
    cbStatus: TwwDBLookupCombo;
    Label4: TLabel;
    btDetalhes: TBitBtn;
    btFiltrar: TBitBtn;
    btLimpar: TBitBtn;
    ActionList1: TActionList;
    actLimpar: TAction;
    procedure Limpar;
    procedure Detalhes;
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btDetalhesClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actLimparExecute(Sender: TObject);
    procedure btFiltrarClick(Sender: TObject);
    procedure GridPagarDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsPagarGer: TfrmConsPagarGer;

implementation

{$R *.dfm}

uses dataConsultas, dataLookups, uDetPagar, uDaoConsPagar, uVarGlobal;

procedure TfrmConsPagarGer.Limpar;
begin
  FiltrarConsPagar('PAG_CODIGO', '=', '0', '0');
  dtpInicial.Date := now;
  dtpFinal.Date := now + 30;
  cbFornecedor.Text := '';
  cbStatus.Text := 'ABERTO';
  cbStatus.PerformSearch;
  dtpInicial.SetFocus;
end;

procedure TfrmConsPagarGer.Detalhes;
begin
  if not(dsConsulta.DataSet.FieldByName('PAG_CODIGO').IsNull) then
    frmDetPagar.ShowModal;
end;

procedure TfrmConsPagarGer.actLimparExecute(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmConsPagarGer.btDetalhesClick(Sender: TObject);
begin
  Detalhes;
end;

procedure TfrmConsPagarGer.btFiltrarClick(Sender: TObject);
Var
vDataInic, vDataFinal, vFornecedor, vStatus: String;
begin
  vDataInic := FormatDateTime(vgMaskData, (dtpInicial.Date));
  vDataFinal := FormatDateTime(vgMaskData, (dtpFinal.Date));
  if cbFornecedor.Text <> '' then
    vFornecedor := IntToStr(dmLookups.qyLkFornecedoresPES_CODIGO.Value)
  else
    vFornecedor := '0';
  if cbStatus.Text <> '' then
    vStatus := dmLookups.qyLkStatusMovSTA_CODIGO.Text
  else
    vStatus := '0';
  ConsPagar(vDataInic, vDataFinal, vFornecedor, vStatus);
end;

procedure TfrmConsPagarGer.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
  btFiltrar.Click;
end;

procedure TfrmConsPagarGer.FormDestroy(Sender: TObject);
begin
  if frmConsPagarGer <> nil then
    frmConsPagarGer := nil;
end;

procedure TfrmConsPagarGer.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

procedure TfrmConsPagarGer.GridPagarDblClick(Sender: TObject);
begin
  Detalhes;
end;

end.
