unit uAltCheque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmAltCheque = class(TfrmTmpFormNormal)
    dsConsulta: TDataSource;
    Label1: TLabel;
    dbTitular: TDBEdit;
    Label2: TLabel;
    dbBanco: TDBEdit;
    Label3: TLabel;
    dbAgencia: TDBEdit;
    Label4: TLabel;
    dbConta: TDBEdit;
    Label5: TLabel;
    dbNumero: TDBEdit;
    Label6: TLabel;
    dbValor: TDBEdit;
    dtpDataVenc: TDateTimePicker;
    Label7: TLabel;
    btAlterar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAltCheque: TfrmAltCheque;

implementation

{$R *.dfm}

uses dataConsultas, uDaoCheques;

procedure TfrmAltCheque.btAlterarClick(Sender: TObject);
begin
  if dtpDataVenc.Date > now then
  begin
    FiltrarCheques('chq_lancamento', '=', IntToStr(dsConsulta.DataSet.FieldByName('chq_lancamento').Value), '0');
    EdtCheques;
    SetDtVenc(dtpDataVenc.Date);
    PostCheques;
    MessageDlg('Data de vencimento alterada com sucesso!', mtInformation, [mbOk], 0);
    Close;
  end
  else
    MessageDlg('A data selecionada é menor que a data atual!', mtWarning, [mbOk], 0);

end;

procedure TfrmAltCheque.FormActivate(Sender: TObject);
begin
  inherited;
  dsConsulta.DataSet.Active := True;
  dtpDataVenc.Date := dsConsulta.DataSet.FieldByName('chq_vencimento').Value;
  dtpDataVenc.SetFocus;
end;

end.
