unit uSenhaDescItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpSenhaMaster, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmSenhaDescItem = class(TfrmTmpSenhaMaster)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSenhaDescItem: TfrmSenhaDescItem;

implementation

{$R *.dfm}

uses uVarGlobal;

procedure TfrmSenhaDescItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if vlSenhaOk = True then
    vgVarLibItem := True
  else
    vgVarLibItem := False;
end;

end.
