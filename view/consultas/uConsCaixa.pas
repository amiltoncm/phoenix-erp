unit uConsCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ComCtrls, wwdblook, Vcl.ActnList, Data.DB, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid;

type
  TfrmConsCaixa = class(TfrmTmpFormNormal)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dtpDataInicial: TDateTimePicker;
    dtpDataFinal: TDateTimePicker;
    cbConta: TwwDBLookupCombo;
    btFiltrar: TBitBtn;
    btLimpar: TBitBtn;
    ActionList1: TActionList;
    actLimpar: TAction;
    JvDBGrid1: TJvDBGrid;
    dsConsulta: TDataSource;
    procedure Limpar;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
    procedure btFiltrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsCaixa: TfrmConsCaixa;

implementation

{$R *.dfm}

uses dataConsultas, dataLookups, uDaoConsultas, uVarGlobal;

procedure TfrmConsCaixa.Limpar;
begin
  dtpDataInicial.Date := now - 7;
  dtpDataFinal.Date := now;
  cbConta.Text := '';
  btFiltrar.Click;
  dtpDataInicial.SetFocus;
end;

procedure TfrmConsCaixa.actLimparExecute(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmConsCaixa.btFiltrarClick(Sender: TObject);
Var
vDataInic, vDataFin, vConta: String;
begin
  vDataInic := FormatDateTime(vgMaskData, dtpDataInicial.Date);
  vDataFin := FormatDateTime(vgMaskData, dtpDataFinal.Date);
  if ((cbConta.Text <> '') and (cbConta.Text <> ' ')) then
    vConta := IntToStr(dmLookups.qyLkContasCON_CODIGO.Value)
  else
    vConta := '0';
  ConsPagCaixaFilt(vDataInic, vDataFin, vConta);
end;

procedure TfrmConsCaixa.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmConsCaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

end.
