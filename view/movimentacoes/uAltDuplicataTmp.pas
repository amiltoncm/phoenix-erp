unit uAltDuplicataTmp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormalMov, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, wwdbdatetimepicker, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmAltDuplicataTmp = class(TfrmTmpFormNormalMov)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbDuplicata: TDBEdit;
    Label4: TLabel;
    dbNumero: TDBEdit;
    Label5: TLabel;
    dbParcela: TDBEdit;
    Label6: TLabel;
    dbValor: TDBEdit;
    Label7: TLabel;
    dbPago: TDBEdit;
    Label8: TLabel;
    dbAcrescimo: TDBEdit;
    Label9: TLabel;
    dbDesconto: TDBEdit;
    Label10: TLabel;
    dbSaldo: TDBEdit;
    cbVencimento: TwwDBDateTimePicker;
    cbEmissao: TwwDBDateTimePicker;
    btGravar: TBitBtn;
    procedure Calcular;
    procedure FormActivate(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure dbValorExit(Sender: TObject);
    procedure dbAcrescimoExit(Sender: TObject);
    procedure dbDescontoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAltDuplicataTmp: TfrmAltDuplicataTmp;

implementation

{$R *.dfm}

uses dataTemp;

procedure TfrmAltDuplicataTmp.Calcular;
Var
vValor, vAcrescimo, vDesconto, vTotal: Real;
begin
  vValor := 0;
  vAcrescimo := 0;
  vDesconto := 0;
  vTotal := 0;
  if dbValor.Text <> '' then
    vValor := dsMovimento.DataSet.FieldByName('Valor').Value;
  if dbAcrescimo.Text <> '' then
    vAcrescimo := dsMovimento.DataSet.FieldByName('Acrescimo').Value;
  if dbDesconto.Text <> '' then
    vDesconto := dsMovimento.DataSet.FieldByName('Desconto').Value;
  vTotal := vValor + vAcrescimo - vDesconto;
  dsMovimento.DataSet.FieldByName('Saldo').Value := vTotal;
end;

procedure TfrmAltDuplicataTmp.btGravarClick(Sender: TObject);
begin
  dsMovimento.DataSet.Post;
  Close;
end;

procedure TfrmAltDuplicataTmp.dbAcrescimoExit(Sender: TObject);
begin
  Calcular;
end;

procedure TfrmAltDuplicataTmp.dbDescontoExit(Sender: TObject);
begin
  Calcular;
end;

procedure TfrmAltDuplicataTmp.dbValorExit(Sender: TObject);
begin
  Calcular;
end;

procedure TfrmAltDuplicataTmp.FormActivate(Sender: TObject);
begin
  //inherited;
  dsMovimento.DataSet.Active := true;
  if dsMovimento.DataSet.State in [dsBrowse] then
    dsMovimento.DataSet.Edit;
  cbVencimento.SetFocus;
end;

end.
