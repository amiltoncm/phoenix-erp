unit uSenhaDelItemCom;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpSenhaMaster, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmSenhaDelItemCom = class(TfrmTmpSenhaMaster)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSenhaDelItemCom: TfrmSenhaDelItemCom;

implementation

{$R *.dfm}

uses uVarGlobal;

procedure TfrmSenhaDelItemCom.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if vlSenhaOk = True then
    vgDelItemComanda := True
  else
    vgDelItemComanda := False;
end;

end.
