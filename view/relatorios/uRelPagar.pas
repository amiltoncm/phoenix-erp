unit uRelPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpRelFormNormal, Vcl.Menus, ppEndUsr,
  Data.DB, ppParameter, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, Vcl.StdCtrls, Vcl.Buttons,
  wwdblook, Vcl.ComCtrls, ppVar, ppDesignLayer;

type
  TfrmRelPagar = class(TfrmTmpRelFormNormal)
    Label1: TLabel;
    dtpInicial: TDateTimePicker;
    Label2: TLabel;
    dtpFinal: TDateTimePicker;
    Label3: TLabel;
    cbFornecedor: TwwDBLookupCombo;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppSystemVariable1: TppSystemVariable;
    lbSubTitulo: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    lbTotal: TppLabel;
    ppDBCalc1: TppDBCalc;
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
    ppLabel8: TppLabel;
    ppDBText7: TppDBText;
    ppLabel9: TppLabel;
    ppDBText8: TppDBText;
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
  frmRelPagar: TfrmRelPagar;

implementation

{$R *.dfm}

uses uVarGlobal, dataConsultas, dataLookups, uDaoConsultas;

procedure TfrmRelPagar.btImprimirClick(Sender: TObject);
Var
vDataInic, vDataFinal, vFornecedor, vStatus: String;
begin
  vDataInic := FormatDateTime(vgMaskData, (dtpInicial.Date));
  vDataFinal := FormatDateTime(vgMaskData, (dtpFinal.Date));
  if cbFornecedor.Text <> '' then
    vFornecedor := IntToStr(dmLookups.qyLkFornecedoresPES_CODIGO.Value)
  else
    vFornecedor := '0';
  FiltRelPagar(vDataInic, vDataFinal, vFornecedor, vgPagar);
  inherited;
end;

procedure TfrmRelPagar.btVisualizarClick(Sender: TObject);
Var
vDataInic, vDataFinal, vFornecedor, vStatus: String;
begin
  vDataInic := FormatDateTime(vgMaskData, (dtpInicial.Date));
  vDataFinal := FormatDateTime(vgMaskData, (dtpFinal.Date));
  if cbFornecedor.Text <> '' then
    vFornecedor := IntToStr(dmLookups.qyLkFornecedoresPES_CODIGO.Value)
  else
    vFornecedor := '0';
  FiltRelPagar(vDataInic, vDataFinal, vFornecedor, vgPagar);
  inherited;
end;

procedure TfrmRelPagar.FormActivate(Sender: TObject);
begin
  if vgPagar = 'R' then
  begin
    Self.Caption := 'Relatório de Contas à Pagar';
    Relatorio.PrinterSetup.DocumentName := 'Relatório de Contas à Pagar';
    lbTotal.Caption := 'Saldo Total à Pagar: ';
    dtpInicial.Date := now;
    dtpFinal.Date := now + 7;
  end;
  if vgPagar = 'S' then
  begin
    Self.Caption := 'Relatório de Contas Pagas';
    Relatorio.PrinterSetup.DocumentName := 'Relatório de Contas Pagas';
    lbTotal.Caption := 'Valor Total Pago: ';
    dtpInicial.Date := now -7;
    dtpFinal.Date := now;
  end;
  lbSubTitulo.Caption := 'De: ' + DateToStr(dtpInicial.Date) + ' até: ' + DateToStr(dtpFinal.Date);
  inherited;
end;

procedure TfrmRelPagar.sbExportarClick(Sender: TObject);
Var
vDataInic, vDataFinal, vFornecedor, vStatus: String;
begin
  vDataInic := FormatDateTime(vgMaskData, (dtpInicial.Date));
  vDataFinal := FormatDateTime(vgMaskData, (dtpFinal.Date));
  if cbFornecedor.Text <> '' then
    vFornecedor := IntToStr(dmLookups.qyLkFornecedoresPES_CODIGO.Value)
  else
    vFornecedor := '0';
  FiltRelPagar(vDataInic, vDataFinal, vFornecedor, vgPagar);
  inherited;
end;

end.
