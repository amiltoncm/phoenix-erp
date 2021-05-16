unit uCadBancoMov;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadBancoMov = class(TfrmTmpFormNormal)
    lbCodigo: TLabel;
    lbDescricao: TLabel;
    btGravar: TBitBtn;
    edCodigo: TEdit;
    edDescricao: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadBancoMov: TfrmCadBancoMov;

implementation

{$R *.dfm}

uses uClassBancos, uDaoBancos;

procedure TfrmCadBancoMov.btGravarClick(Sender: TObject);
Var
vBanco: TBancos;
begin
  if ((edCodigo.Text <> '') and (edCodigo.Text <> ' ')) then
  begin
    if ((edDescricao.Text <> '') and (edDescricao.Text <> ' ')) then
    begin
      vBanco := TBancos.Create;
      vBanco.Codigo := StrToInt(edCodigo.Text);
      vBanco.Descricao := edDescricao.Text;
      InsBancos;
      SetValuesBancos(vBanco);
      PostBancos;
      vBanco.Free;
      Close;
    end
    else
      MessageDlg('Campo Descricao do banco é obrigatório!', mtWarning, [mbOk], 0);
  end
  else
    MessageDlg('Campo Código do banco é obrigatório!', mtWarning, [mbOk], 0);
end;

procedure TfrmCadBancoMov.FormActivate(Sender: TObject);
begin
  inherited;
  edCodigo.Clear;
  edDescricao.Clear;
  edCodigo.SetFocus;
end;

end.
