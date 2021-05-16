unit uAltParcela;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormalMov, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, wwdbdatetimepicker, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmAltParcela = class(TfrmTmpFormNormalMov)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dbDuplicata: TDBEdit;
    dbNumero: TDBEdit;
    dbParcela: TDBEdit;
    dbValor: TDBEdit;
    dbPago: TDBEdit;
    dbAcrescimo: TDBEdit;
    dbDesconto: TDBEdit;
    dbSaldo: TDBEdit;
    cbVencimento: TwwDBDateTimePicker;
    cbEmissao: TwwDBDateTimePicker;
    btGravar: TBitBtn;
    procedure Calcular;
    procedure btGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbValorExit(Sender: TObject);
    procedure dbAcrescimoExit(Sender: TObject);
    procedure dbDescontoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAltParcela: TfrmAltParcela;

implementation

{$R *.dfm}

uses dataFinanceiro, uDaoReceber;

procedure TfrmAltParcela.Calcular;
Var
vValor, vAcrescimo, vDesconto, vTotal: Real;
begin
  vValor := 0;
  vAcrescimo := 0;
  vDesconto := 0;
  vTotal := 0;
  if dbValor.Text <> '' then
    vValor := dsMovimento.DataSet.FieldByName('PAG_VALOR').Value;
  if dbAcrescimo.Text <> '' then
    vAcrescimo := dsMovimento.DataSet.FieldByName('PAG_ACRESCIMO').Value;
  if dbDesconto.Text <> '' then
    vDesconto := dsMovimento.DataSet.FieldByName('PAG_DESCONTO').Value;
  vTotal := vValor + vAcrescimo - vDesconto;
  dsMovimento.DataSet.FieldByName('PAG_SALDO').Value := vTotal;
end;

procedure TfrmAltParcela.dbAcrescimoExit(Sender: TObject);
begin
  Calcular;
end;

procedure TfrmAltParcela.dbDescontoExit(Sender: TObject);
begin
  Calcular;
end;

procedure TfrmAltParcela.dbValorExit(Sender: TObject);
begin
  Calcular;
end;

procedure TfrmAltParcela.btGravarClick(Sender: TObject);
begin
  PostReceber;
  Close;
end;

procedure TfrmAltParcela.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

end.
