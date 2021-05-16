unit uConsChequesGer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormMDI, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ActnList, Data.DB, wwdblook, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid;

type
  TfrmConsChequesGer = class(TfrmTmpFormMDI)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GridPagar: TJvDBGrid;
    dtpInicial: TDateTimePicker;
    dtpFinal: TDateTimePicker;
    cbFornecedor: TwwDBLookupCombo;
    cbStatus: TwwDBLookupCombo;
    btDetalhes: TBitBtn;
    btFiltrar: TBitBtn;
    btLimpar: TBitBtn;
    dsConsulta: TDataSource;
    ActionList1: TActionList;
    actLimpar: TAction;
    procedure Limpar;
    procedure Detalhes;
    procedure actLimparExecute(Sender: TObject);
    procedure btDetalhesClick(Sender: TObject);
    procedure btFiltrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GridPagarDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsChequesGer: TfrmConsChequesGer;

implementation

{$R *.dfm}

uses dataLookups, dataConsultas, uDaoCheques, uVarGlobal, uDetCheques;

procedure TfrmConsChequesGer.Limpar;
begin
  dtpInicial.Date := now;
  dtpFinal.Date := now + 30;
  cbFornecedor.Text := '';
  cbStatus.Text := 'ABERTO';
  cbStatus.PerformSearch;
  dtpInicial.SetFocus;
  btFiltrar.Click;
end;

procedure TfrmConsChequesGer.actLimparExecute(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmConsChequesGer.btDetalhesClick(Sender: TObject);
begin
  Detalhes;
end;

procedure TfrmConsChequesGer.btFiltrarClick(Sender: TObject);
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
  ConsCheques(vDataInic, vDataFinal, vFornecedor, vStatus);
end;

procedure TfrmConsChequesGer.Detalhes;
begin
  if not(dsConsulta.DataSet.FieldByName('chq_lancamento').IsNull) then
    frmDetCheques.ShowModal;
end;

procedure TfrmConsChequesGer.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
  btFiltrar.Click;
end;

procedure TfrmConsChequesGer.FormDestroy(Sender: TObject);
begin
  if frmConsChequesGer <> nil then
    frmConsChequesGer := nil;
end;

procedure TfrmConsChequesGer.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

procedure TfrmConsChequesGer.GridPagarDblClick(Sender: TObject);
begin
  Detalhes;
end;

end.
