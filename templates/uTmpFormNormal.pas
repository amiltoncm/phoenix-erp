unit uTmpFormNormal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, uTmpForm;

type
  TfrmTmpFormNormal = class(TfrmTmpForm)
    btFechar: TBitBtn;
    procedure btFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTmpFormNormal: TfrmTmpFormNormal;

implementation

{$R *.dfm}

uses uVarGlobal;

procedure TfrmTmpFormNormal.btFecharClick(Sender: TObject);
begin
  Close;
end;

end.
