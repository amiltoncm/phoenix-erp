unit uSenhaMgOrc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpSenhaMaster, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TfrmSenhaMgOrc = class(TfrmTmpSenhaMaster)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSenhaMgOrc: TfrmSenhaMgOrc;

implementation

{$R *.dfm}

uses uVarGlobal;

procedure TfrmSenhaMgOrc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if vlSenhaOk = True then
    vgVarLib := True
  else
    vgVarLib := False;
end;

end.
