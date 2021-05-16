unit uDetPVItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, wwDataInspector, Data.DB;

type
  TfrmDetPVItens = class(TfrmTmpFormNormal)
    dsItensPV: TDataSource;
    wwDataInspector1: TwwDataInspector;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDetPVItens: TfrmDetPVItens;

implementation

{$R *.dfm}

uses dataOrcamentos;

procedure TfrmDetPVItens.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

end.
