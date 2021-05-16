unit uNewComanda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, vcl.wwdblook;

type
  TfrmNewComanda = class(TfrmTmpFormNormal)
    Label1: TLabel;
    cbProcComanda: TwwDBLookupCombo;
    Label2: TLabel;
    cbProcMesa: TwwDBLookupCombo;
    btConfirmar: TBitBtn;
    procedure btFecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNewComanda: TfrmNewComanda;

implementation

{$R *.dfm}

uses dataLookups, uClassComandasAtend, uDaoComandasAtend;

procedure TfrmNewComanda.btConfirmarClick(Sender: TObject);
Var
vProcMesa: Integer;
vComandaAtend: TComandasatend;
begin
  if ((cbProcComanda.Text <> '') and (cbProcComanda.Text <> ' ')) then
  begin
    if TestaComandaUso(dmLookups.qyLkComandascma_codigo.Value) = false then
    begin
      if ((cbProcMesa.Text = '') or (cbProcMesa.Text = ' ')) then
        vProcMesa := 0
      else
        vProcMesa := dmLookups.qyLkMesasmes_codigo.Value;
      vComandaAtend := TComandasatend.Create;
      vComandaAtend.Codigo := 0;
      vComandaAtend.Codcomanda := dmLookups.qyLkComandascma_codigo.Value;
      vComandaAtend.Codmesa := vProcMesa;
      vComandaAtend.Codprevenda := 0;
      InsComandasAtend;
      SetValuesComandasAtend(vComandaAtend);
      PostComandasAtend;
      vComandaAtend.Free;
      Close;
    end
    else
      MessageDlg('Esta comando já está em uso!', mtWarning, [mbOk], 0);
  end
  else
    MessageDlg('é necessário selecionar uma comanda vaga!', mtWarning, [mbOk], 0);
end;

procedure TfrmNewComanda.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmNewComanda.FormActivate(Sender: TObject);
begin
  inherited;
  cbProcComanda.Text := '';
  cbProcMesa.Text := 'NÃO DEFINIDA';
  cbProcMesa.PerformSearch;
  cbProcComanda.SetFocus;
end;

procedure TfrmNewComanda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
  if key = #27 then
    Close;
end;

end.
