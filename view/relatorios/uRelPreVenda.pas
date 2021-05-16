unit uRelPreVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpRelFormNormal, Vcl.Menus, ppEndUsr,
  Data.DB, ppParameter, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, Vcl.StdCtrls, Vcl.Buttons, ppVar,
  ppDesignLayer;

type
  TfrmRelPreVenda = class(TfrmTmpRelFormNormal)
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLine3: TppLine;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppDBText3: TppDBText;
    ppLabel3: TppLabel;
    ppDBText4: TppDBText;
    ppLabel4: TppLabel;
    ppDBText5: TppDBText;
    dsPrevenda: TDataSource;
    dbPrevenda: TppDBPipeline;
    ppDBText6: TppDBText;
    ppLabel5: TppLabel;
    ppDBText7: TppDBText;
    ppLabel6: TppLabel;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLabel7: TppLabel;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLabel8: TppLabel;
    ppDBText14: TppDBText;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLine1: TppLine;
    ppLabel11: TppLabel;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppLabel12: TppLabel;
    ppDBText19: TppDBText;
    dbEndereco: TppDBPipeline;
    dsEndereco: TDataSource;
    ppLine2: TppLine;
    ppLabel13: TppLabel;
    ppDBText20: TppDBText;
    ppLabel14: TppLabel;
    ppDBText21: TppDBText;
    ppLabel15: TppLabel;
    ppDBText22: TppDBText;
    ppLabel16: TppLabel;
    ppDBText23: TppDBText;
    ppLabel17: TppLabel;
    ppDBText24: TppDBText;
    ppLabel18: TppLabel;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppLabel19: TppLabel;
    ppDBText27: TppDBText;
    ppLabel20: TppLabel;
    ppDBText28: TppDBText;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelPreVenda: TfrmRelPreVenda;

implementation

{$R *.dfm}

uses dataOrcamentos;

procedure TfrmRelPreVenda.FormActivate(Sender: TObject);
begin
  inherited;
  dsPrevenda.DataSet.Active := True;
  dsEndereco.DataSet.Active := True;
end;

end.
