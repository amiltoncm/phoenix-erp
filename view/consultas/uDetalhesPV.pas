unit uDetalhesPV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Vcl.Grids, wwDataInspector;

type
  TfrmDetalhesPV = class(TfrmTmpFormNormal)
    wwDataInspector1: TwwDataInspector;
    dsDetalhes: TDataSource;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDetalhesPV: TfrmDetalhesPV;

implementation

{$R *.dfm}

uses dataOrcamentos;

procedure TfrmDetalhesPV.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

end.
