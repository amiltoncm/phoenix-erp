unit uTmpSenhaMaster;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmTmpSenhaMaster = class(TfrmTmpFormNormal)
    btOk: TBitBtn;
    imgLogin: TImage;
    Label1: TLabel;
    edSenhaMaster: TEdit;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTmpSenhaMaster: TfrmTmpSenhaMaster;
  vlSenhaOk: Boolean;
  vlTentativa: Integer;

implementation

{$R *.dfm}

uses uVarGlobal;

procedure TfrmTmpSenhaMaster.btOkClick(Sender: TObject);
begin
  vlTentativa := vlTentativa + 1;
  if edSenhaMaster.Text = vgSenhaMaster then
  begin
    vlSenhaOk := True;
    Close;
  end
  else
  begin
    MessageDlg('Senha inválida!', mtWarning, [mbOk], 0);
    edSenhaMaster.SetFocus;
    if vlTentativa = 3 then
    begin
      MessageDlg('Você excedeu o número de tentativas!', mtWarning, [mbOk], 0);
      Close;
    end;
  end;
end;

procedure TfrmTmpSenhaMaster.FormActivate(Sender: TObject);
begin
  inherited;
  edSenhaMaster.Clear;
  edSenhaMaster.SetFocus;
  vlSenhaOk := False;
end;

end.
