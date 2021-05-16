unit uVerItensReserv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Data.DB, JvExDBGrids, JvDBGrid;

type
  TfrmVerItensReserv = class(TfrmTmpFormNormal)
    dsConsulta: TDataSource;
    JvDBGrid1: TJvDBGrid;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVerItensReserv: TfrmVerItensReserv;

implementation

{$R *.dfm}

uses dataConsultas;

procedure TfrmVerItensReserv.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

end.
