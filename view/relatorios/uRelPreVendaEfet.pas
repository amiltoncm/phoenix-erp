unit uRelPreVendaEfet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpRelFormNormal, Vcl.Menus, ppEndUsr,
  Data.DB, ppParameter, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, Vcl.StdCtrls, Vcl.Buttons, ppVar,
  ppDesignLayer, ppStrtch, ppMemo;

type
  TfrmRelPreVendaEfet = class(TfrmTmpRelFormNormal)
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppDBText1: TppDBText;
    ImgLogoRel: TppImage;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    dsEmpresa: TDataSource;
    dbEmpresa: TppDBPipeline;
    ppDBText13: TppDBText;
    dbOrcamento: TppDBPipeline;
    ppLines003: TppLine;
    ppLabel9: TppLabel;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLabel11: TppLabel;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppLabel12: TppLabel;
    ppDBText19: TppDBText;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    dsPreVendas: TDataSource;
    ppDBText14: TppDBText;
    ppDBText21: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppLabel10: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    lbSimb01: TppLabel;
    lbSimb02: TppLabel;
    lbSimb03: TppLabel;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppLine3: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppDBText31: TppDBText;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppDBText32: TppDBText;
    lbData: TppLabel;
    ppLabel28: TppLabel;
    ppLine4: TppLine;
    ppDBText33: TppDBText;
    lbTotExt: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppDBText22: TppDBText;
    ppLine1: TppLine;
    ppLine5: TppLine;
    ppMemo1: TppMemo;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLabel29: TppLabel;
    ppDBText20: TppDBText;
    ppLabel1: TppLabel;
    ppLabel14: TppLabel;
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
  frmRelPreVendaEfet: TfrmRelPreVendaEfet;

implementation

{$R *.dfm}

uses dataOrcamentos, dataConfig, uVarGlobal, uFuncoesString, uDaoEmpresa,
  uFuncoesFormatacao, uDaoPrevendas;

procedure TfrmRelPreVendaEfet.btImprimirClick(Sender: TObject);
begin
  inherited;
  //SetStatusPrev(5);
end;

procedure TfrmRelPreVendaEfet.btVisualizarClick(Sender: TObject);
begin
  inherited;
  //SetStatusPrev(5);
end;

procedure TfrmRelPreVendaEfet.FormActivate(Sender: TObject);
begin
  inherited;
  ImgLogoRel.Picture.LoadFromFile(vgLogoRel);
  lbSimb01.Caption := vgSimbolo;
  lbSimb02.Caption := vgSimbolo;
  lbSimb03.Caption := vgSimbolo;
  lbData.Caption := DataExtenso(GetCidadeEmp, now);
  lbTotExt.Caption := '(' + ValorPorExtenso(dmOrcamentos.qyPrevendasprv_vlrtotal.Value) + ')';
end;

procedure TfrmRelPreVendaEfet.sbExportarClick(Sender: TObject);
begin
  inherited;
  //SetStatusPrev(5);
end;

end.
