unit uEstacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid;

type
  TfrmEstacoes = class(TfrmTmpFormNormal)
    JvDBGrid1: TJvDBGrid;
    dsSistema: TDataSource;
    lbNumMaq: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstacoes: TfrmEstacoes;

implementation

{$R *.dfm}

uses dataCadastros, uDaoSistema;

procedure TfrmEstacoes.FormActivate(Sender: TObject);
begin
  inherited;
  ListarSistema('SIS_MAQUINA');
  lbNumMaq.Caption := 'Máquinas registradas: ' +  IntToStr(dsSistema.DataSet.RecordCount);
end;

procedure TfrmEstacoes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

end.
