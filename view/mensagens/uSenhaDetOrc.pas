unit uSenhaDetOrc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpSenhaMaster, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TfrmSenhaDetOrc = class(TfrmTmpSenhaMaster)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSenhaDetOrc: TfrmSenhaDetOrc;

implementation

{$R *.dfm}

uses uDetalhesOrc;

procedure TfrmSenhaDetOrc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if vlSenhaOk = true then
    frmDetalhesOrc.ShowModal;
end;

end.
