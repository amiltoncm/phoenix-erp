unit uConsReceberGer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormMDI, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.ComCtrls,
  wwdblook, Vcl.ActnList;

type
  TfrmConsReceberGer = class(TfrmTmpFormMDI)
    dsConsulta: TDataSource;
    GridPagar: TJvDBGrid;
    Label1: TLabel;
    dtpInicial: TDateTimePicker;
    Label2: TLabel;
    dtpFinal: TDateTimePicker;
    Label3: TLabel;
    cbCliente: TwwDBLookupCombo;
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
  frmConsReceberGer: TfrmConsReceberGer;

implementation

{$R *.dfm}

uses dataConsultas, dataLookups, uDetPagar, uVarGlobal,
  uDaoReceber, uDetReceber;

procedure TfrmConsReceberGer.Limpar;
begin
  dtpInicial.Date := now;
  dtpFinal.Date := now + 30;
  cbCliente.Text := '';
  cbStatus.Text := 'ABERTO';
  cbStatus.PerformSearch;
  dtpInicial.SetFocus;
end;

procedure TfrmConsReceberGer.Detalhes;
begin
  if not(dsConsulta.DataSet.FieldByName('rec_codigo').IsNull) then
    frmDetReceber.ShowModal;
end;

procedure TfrmConsReceberGer.actLimparExecute(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmConsReceberGer.btDetalhesClick(Sender: TObject);
begin
  Detalhes;
end;

procedure TfrmConsReceberGer.btFiltrarClick(Sender: TObject);
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
    vStatus := dmLookups.qyLkStatusMovSTA_CODIGO.Text
  else
    vStatus := '0';
  FiltrarConsReceber(vDataInic, vDataFinal, vCliente, vStatus);
end;

procedure TfrmConsReceberGer.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
  btFiltrar.Click;
end;

procedure TfrmConsReceberGer.FormDestroy(Sender: TObject);
begin
  if frmConsReceberGer <> nil then
    frmConsReceberGer := nil;
end;

procedure TfrmConsReceberGer.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

procedure TfrmConsReceberGer.GridPagarDblClick(Sender: TObject);
begin
  Detalhes;
end;

end.
