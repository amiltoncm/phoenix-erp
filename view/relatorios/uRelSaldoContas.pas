unit uRelSaldoContas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpRelFormNormal, Vcl.Menus, ppEndUsr,
  Data.DB, ppParameter, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, Vcl.StdCtrls, Vcl.Buttons, ppVar,
  ppDesignLayer, JvMemoryDataset;

type
  TfrmRelSaldoContas = class(TfrmTmpRelFormNormal)
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppSystemVariable1: TppSystemVariable;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppDBText3: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLine1: TppLine;
    ppDBCalc1: TppDBCalc;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelSaldoContas: TfrmRelSaldoContas;

implementation

{$R *.dfm}

uses dataConsultas;

end.
