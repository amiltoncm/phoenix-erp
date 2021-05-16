unit uTmpRelFormNormal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uTmpFormNormal, StdCtrls, Buttons, Menus, ppEndUsr, Db,
  ppCtrls, ppBands, ppPrnabl, ppClass, ppVar, ppCache, ppProd, ppReport,
  ppDB, ppComm, ppRelatv, ppDBPipe, ppViewr, ppParameter, ShellApi,
  ppDesignLayer;

type
  TfrmTmpRelFormNormal = class(TfrmTmpFormNormal)
    lbCaption: TLabel;
    sbExportar: TSpeedButton;
    btVisualizar: TBitBtn;
    btImprimir: TBitBtn;
    dbDados: TppDBPipeline;
    Relatorio: TppReport;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppLinha1: TppLine;
    ppLinha2: TppLine;
    ppDetailBand1: TppDetailBand;
    ppLinha3: TppLine;
    ppFooterBand1: TppFooterBand;
    dsDados: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure btVisualizarClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure RelatorioPreviewFormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTmpRelFormNormal: TfrmTmpRelFormNormal;

implementation

{$R *.DFM}

uses uVarGlobal, uFuncoesSistema;

procedure TfrmTmpRelFormNormal.FormActivate(Sender: TObject);
begin
  inherited;
  dsDados.DataSet.Active := True;
  Self.Caption := Relatorio.PrinterSetup.DocumentName;
  lbCaption.Caption := Relatorio.PrinterSetup.DocumentName;
  btImprimir.SetFocus;
end;

procedure TfrmTmpRelFormNormal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

procedure TfrmTmpRelFormNormal.btVisualizarClick(Sender: TObject);
begin
  inherited;
  Relatorio.DeviceType := 'Screen';
  Relatorio.ShowPrintDialog := True;
  Relatorio.Print;
  Close;
end;

procedure TfrmTmpRelFormNormal.btImprimirClick(Sender: TObject);
begin
  inherited;
  Relatorio.DeviceType := 'Printer';
  Relatorio.ShowPrintDialog := True;
  Relatorio.Print;
  Close;
end;

procedure TfrmTmpRelFormNormal.sbExportarClick(Sender: TObject);
begin
  inherited;
  // PDF -----------------------------------------------------------------------
  Relatorio.PDFSettings.Author := Application.Title + ' - Vs. ' + VersaoSistema(0);
  Relatorio.PDFSettings.Creator := Application.Title + ' - Vs. ' + VersaoSistema(0);
  Relatorio.PDFSettings.Subject := Relatorio.PrinterSetup.DocumentName;
  Relatorio.PDFSettings.Title := Relatorio.PrinterSetup.DocumentName;
  // XLS -----------------------------------------------------------------------
  Relatorio.XLSSettings.AppName := Application.Title + ' - Vs. ' + VersaoSistema(0);
  Relatorio.XLSSettings.Author := Application.Title + ' - Vs. ' + VersaoSistema(0);
  Relatorio.XLSSettings.Subject := Relatorio.PrinterSetup.DocumentName;
  Relatorio.XLSSettings.Title := Relatorio.PrinterSetup.DocumentName;
  // Inicia a exportação -------------------------------------------------------
  Relatorio.DefaultFileDeviceType := 'PDF';
  Relatorio.DeviceType := 'PDFFile';
  Relatorio.ShowPrintDialog := True;
  Relatorio.Print;
  Close;
end;

procedure TfrmTmpRelFormNormal.RelatorioPreviewFormCreate(Sender: TObject);
begin
  Relatorio.PreviewForm.WindowState := wsMaximized;
  //TppViewer(Relatorio.PreviewForm.Viewer).ZoomSetting := zsPageWidth;
end;

end.
