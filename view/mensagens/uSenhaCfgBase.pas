unit uSenhaCfgBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpSenhaMaster, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmSenhaCfgBase = class(TfrmTmpSenhaMaster)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSenhaCfgBase: TfrmSenhaCfgBase;

implementation

{$R *.dfm}

uses uCfgBase;

procedure TfrmSenhaCfgBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if vlSenhaOk = true then
    frmCfgBase.ShowModal;
end;

end.
