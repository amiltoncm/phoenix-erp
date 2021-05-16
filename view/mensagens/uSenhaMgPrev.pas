unit uSenhaMgPrev;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpSenhaMaster, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmSenhaMgPrev = class(TfrmTmpSenhaMaster)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSenhaMgPrev: TfrmSenhaMgPrev;

implementation

{$R *.dfm}

uses uVarGlobal;

procedure TfrmSenhaMgPrev.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if vlSenhaOk = True then
    vgVarPVLib := True
  else
    vgVarPVLib := False;
end;

end.
