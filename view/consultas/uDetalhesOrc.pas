unit uDetalhesOrc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, wwDataInspector, Data.DB;

type
  TfrmDetalhesOrc = class(TfrmTmpFormNormal)
    dsDetalhes: TDataSource;
    wwDataInspector1: TwwDataInspector;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDetalhesOrc: TfrmDetalhesOrc;

implementation

{$R *.dfm}

uses dataOrcamentos;

procedure TfrmDetalhesOrc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

end.
