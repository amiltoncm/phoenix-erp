unit uRelCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpRelFormNormal, Vcl.Menus, ppEndUsr,
  Data.DB, ppParameter, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, Vcl.StdCtrls, Vcl.Buttons,
  wwdblook, Vcl.ComCtrls, ppVar, ppDesignLayer, JvMemoryDataset;

type
  TfrmRelCaixa = class(TfrmTmpRelFormNormal)
    Label1: TLabel;
    dtpDataInicial: TDateTimePicker;
    dtpDataFinal: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    cbConta: TwwDBLookupCombo;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppSystemVariable1: TppSystemVariable;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    lbSubTitulo: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine1: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLabel7: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    procedure FormActivate(Sender: TObject);
    procedure btVisualizarClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCaixa: TfrmRelCaixa;

implementation

{$R *.dfm}

uses dataLookups, dataConsultas, uDaoConsultas, uVarGlobal;

procedure TfrmRelCaixa.btImprimirClick(Sender: TObject);
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
  inherited;
end;

procedure TfrmRelCaixa.btVisualizarClick(Sender: TObject);
Var
vDataInic, vDataFin, vConta: String;
begin
  lbSubTitulo.Caption := 'De: ' + DateToStr(dtpDataInicial.Date) + ' até: ' +
                         DateToStr(dtpDataFinal.Date);
  vDataInic := FormatDateTime(vgMaskData, dtpDataInicial.Date);
  vDataFin := FormatDateTime(vgMaskData, dtpDataFinal.Date);
  if ((cbConta.Text <> '') and (cbConta.Text <> ' ')) then
    vConta := IntToStr(dmLookups.qyLkContasCON_CODIGO.Value)
  else
    vConta := '0';
  ConsPagCaixaFilt(vDataInic, vDataFin, vConta);
  inherited;
end;

procedure TfrmRelCaixa.FormActivate(Sender: TObject);
begin
  inherited;
  dtpDataInicial.Date := now - 7;
  dtpDataFinal.Date := now;
  cbConta.Text := '';
  dtpDataInicial.SetFocus;
end;

procedure TfrmRelCaixa.sbExportarClick(Sender: TObject);
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
  inherited;
end;

end.
