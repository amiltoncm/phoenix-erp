unit uDetOrcItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Vcl.Grids, wwDataInspector;

type
  TfrmDetOrcItens = class(TfrmTmpFormNormal)
    wwDataInspector1: TwwDataInspector;
    dsItensOrc: TDataSource;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDetOrcItens: TfrmDetOrcItens;

implementation

{$R *.dfm}

uses dataOrcamentos;

procedure TfrmDetOrcItens.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

end.
