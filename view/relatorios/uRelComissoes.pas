unit uRelComissoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpRelFormNormal, Data.DB, ppParameter,
  ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, Vcl.StdCtrls, Vcl.Buttons, ppDesignLayer;

type
  TfrmRelComissoes = class(TfrmTmpRelFormNormal)
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelComissoes: TfrmRelComissoes;

implementation

{$R *.dfm}

end.
