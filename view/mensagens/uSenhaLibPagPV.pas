unit uSenhaLibPagPV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpSenhaMaster, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmSenhaLibPagPV = class(TfrmTmpSenhaMaster)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSenhaLibPagPV: TfrmSenhaLibPagPV;

implementation

{$R *.dfm}

uses uVarGlobal;

procedure TfrmSenhaLibPagPV.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if vlSenhaOk = True then
    vgLibPvCob := True
  else
    vgLibPvCob := False;
end;

end.
