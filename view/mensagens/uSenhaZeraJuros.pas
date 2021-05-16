unit uSenhaZeraJuros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpSenhaMaster, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmSenhaZeraJuros = class(TfrmTmpSenhaMaster)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSenhaZeraJuros: TfrmSenhaZeraJuros;

implementation

{$R *.dfm}

uses uVarGlobal;

procedure TfrmSenhaZeraJuros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if vlSenhaOk = true then
    vgZeraJuros := true;
end;

end.
