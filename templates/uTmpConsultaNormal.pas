unit uTmpConsultaNormal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, wwdbedit, Wwdotdot,
  Wwdbcomb, JvExDBGrids, JvDBGrid;

type
  TfrmTmpConsultaNormal = class(TfrmTmpFormNormal)
    Label4: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    btFiltrar: TBitBtn;
    btLimpar: TBitBtn;
    dsConsultas: TDataSource;
    btSelecionar: TBitBtn;
    cbCampo: TwwDBComboBox;
    cbFiltro: TwwDBComboBox;
    edParametro: TEdit;
    GridConsultas: TJvDBGrid;
    procedure Limpar;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTmpConsultaNormal: TfrmTmpConsultaNormal;

implementation

{$R *.dfm}

procedure TfrmTmpConsultaNormal.Limpar;
begin
  cbCampo.ItemIndex := 0;
  cbFiltro.ItemIndex := 0;
  edParametro.Clear;
  cbCampo.SetFocus;
end;

procedure TfrmTmpConsultaNormal.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmTmpConsultaNormal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  Inherited;
  if key = #27 then
    Close;
end;

end.
