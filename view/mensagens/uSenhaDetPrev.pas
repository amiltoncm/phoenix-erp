unit uSenhaDetPrev;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpSenhaMaster, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TfrmSenhaDetPrev = class(TfrmTmpSenhaMaster)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSenhaDetPrev: TfrmSenhaDetPrev;

implementation

{$R *.dfm}

uses uDetalhesPV;

procedure TfrmSenhaDetPrev.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if vlSenhaOk = true then
    frmDetalhesPV.ShowModal;
end;

end.
