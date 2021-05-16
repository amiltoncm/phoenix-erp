unit uConsPreVendasGer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormMDI, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ActnList, Data.DB, wwdblook, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid;

type
  TfrmConsPreVendasGer = class(TfrmTmpFormMDI)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GridPagar: TJvDBGrid;
    dtpInicial: TDateTimePicker;
    dtpFinal: TDateTimePicker;
    cbCliente: TwwDBLookupCombo;
    cbStatus: TwwDBLookupCombo;
    btDetalhes: TBitBtn;
    btFiltrar: TBitBtn;
    btLimpar: TBitBtn;
    dsConsulta: TDataSource;
    ActionList1: TActionList;
    actLimpar: TAction;
    btItens: TBitBtn;
    procedure Limpar;
    procedure Detalhes;
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btDetalhesClick(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
    procedure btFiltrarClick(Sender: TObject);
    procedure GridPagarDblClick(Sender: TObject);
    procedure btItensClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsPreVendasGer: TfrmConsPreVendasGer;

implementation

{$R *.dfm}

uses dataConsultas, uDetalhesConsPV, uVarGlobal, dataLookups, uDaoPrevendas,
  uConsItensPV, uDaoPrevItens;

procedure TfrmConsPreVendasGer.Limpar;
begin
  dtpInicial.Date := now;
  dtpFinal.Date := now + 30;
  cbCliente.Text := '';
  cbStatus.Text := 'ABERTO';
  cbStatus.PerformSearch;
  dtpInicial.SetFocus;
end;

procedure TfrmConsPreVendasGer.actLimparExecute(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmConsPreVendasGer.btDetalhesClick(Sender: TObject);
begin
  Detalhes;
end;

procedure TfrmConsPreVendasGer.btFiltrarClick(Sender: TObject);
Var
vDataInic, vDataFinal, vCliente, vStatus: String;
begin
  vDataInic := FormatDateTime(vgMaskData, (dtpInicial.Date));
  vDataFinal := FormatDateTime(vgMaskData, (dtpFinal.Date));
  if cbCliente.Text <> '' then
    vCliente := IntToStr(dmLookups.qyLkClientesPES_CODIGO.Value)
  else
    vCliente := '0';
  if cbStatus.Text <> '' then
    vStatus := dmLookups.qyLkStatusOrcsto_codigo.Text
  else
    vStatus := '0';
  ConsPreVendasGer(vDataInic, vDataFinal, vCliente, vStatus);
end;

procedure TfrmConsPreVendasGer.btItensClick(Sender: TObject);
begin
  if Not(dsConsulta.DataSet.FieldByName('prv_numero').IsNull) then
  begin
    ConsPevItens(IntToStr(dsConsulta.DataSet.FieldByName('prv_numero').Value));
    frmConsItensPV.ShowModal;
  end;
end;

procedure TfrmConsPreVendasGer.Detalhes;
begin
  if not(dsConsulta.DataSet.FieldByName('prv_numero').IsNull) then
    frmDetalhesConsPV.ShowModal;
end;

procedure TfrmConsPreVendasGer.FormActivate(Sender: TObject);
begin
  Limpar;
  btFiltrar.Click;
end;

procedure TfrmConsPreVendasGer.FormDestroy(Sender: TObject);
begin
  if frmConsPreVendasGer <> nil then
    frmConsPreVendasGer := nil;
end;

procedure TfrmConsPreVendasGer.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

procedure TfrmConsPreVendasGer.GridPagarDblClick(Sender: TObject);
begin
  Detalhes;
end;

end.
