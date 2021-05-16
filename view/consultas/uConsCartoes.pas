unit uConsCartoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid;

type
  TfrmConsCartoes = class(TfrmTmpFormNormal)
    Label1: TLabel;
    dtpDataInicial: TDateTimePicker;
    JvDBGrid1: TJvDBGrid;
    dsConsulta: TDataSource;
    btFiltrar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btFiltrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsCartoes: TfrmConsCartoes;

implementation

{$R *.dfm}

uses dataConsultas, uDaoConsultas, uFuncoesDB, uVarGlobal;

procedure TfrmConsCartoes.btFiltrarClick(Sender: TObject);
begin
  ConsCartoes(FormatDateTime(vgMaskData, dtpDataInicial.Date));
end;

procedure TfrmConsCartoes.FormActivate(Sender: TObject);
begin
  dtpDataInicial.Date := GetDateServerPG;
  ConsCartoes(FormatDateTime(vgMaskData, dtpDataInicial.Date));
  dsConsulta.DataSet.Active := True;
  dtpDataInicial.SetFocus;
  inherited;
end;

procedure TfrmConsCartoes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

end.
