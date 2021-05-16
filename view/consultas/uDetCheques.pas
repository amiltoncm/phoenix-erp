unit uDetCheques;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Vcl.Grids, wwDataInspector;

type
  TfrmDetCheques = class(TfrmTmpFormNormal)
    wwDataInspector1: TwwDataInspector;
    dsDetalhes: TDataSource;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDetCheques: TfrmDetCheques;

implementation

{$R *.dfm}

uses dataConsultas;

procedure TfrmDetCheques.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

end.
