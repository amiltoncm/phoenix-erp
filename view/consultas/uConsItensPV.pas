unit uConsItensPV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid;

type
  TfrmConsItensPV = class(TfrmTmpFormNormal)
    dsItensPV: TDataSource;
    GridPagar: TJvDBGrid;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsItensPV: TfrmConsItensPV;

implementation

{$R *.dfm}

uses uDaoPrevItens, dataConsultas;

procedure TfrmConsItensPV.FormActivate(Sender: TObject);
begin
  inherited;
  dsItensPV.DataSet.Active := True;
end;

procedure TfrmConsItensPV.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

end.
