unit uConsPreVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpConsultaNormal, Data.DB, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.Mask, wwdbedit,
  Wwdotdot, Wwdbcomb, Vcl.Buttons, Vcl.DBCtrls;

type
  TfrmConsPreVendas = class(TfrmTmpConsultaNormal)
    dbtReferente: TDBText;
    procedure Limpar;
    procedure Filtrar;
    procedure Selecionar;
    procedure btFiltrarClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure cbCampoExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridConsultasDblClick(Sender: TObject);
    procedure GridConsultasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsPreVendas: TfrmConsPreVendas;

implementation

{$R *.dfm}

uses uDaoPrevendas, dataOrcamentos, uPrevenda;

procedure TfrmConsPreVendas.Limpar;
begin
  Inherited;
  cbFiltro.ItemIndex := 1;
end;

procedure TfrmConsPreVendas.btFiltrarClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmConsPreVendas.btLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmConsPreVendas.btSelecionarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmConsPreVendas.cbCampoExit(Sender: TObject);
begin
  if cbCampo.ItemIndex = 0 then
    edParametro.NumbersOnly := False;
  if cbCampo.ItemIndex = 1 then
  begin
    edParametro.NumbersOnly := True;
    cbFiltro.ItemIndex := 0;
  end;
end;

procedure TfrmConsPreVendas.Filtrar;
begin
  if cbCampo.ItemIndex = 0 then //Nome do cliente
  begin
    if cbFiltro.ItemIndex = 0 then //Igual
      FiltrarPrevendas('PES_NOME', '=', edParametro.Text, '0');
    if cbFiltro.ItemIndex = 1 then //Contenha
      FiltrarPrevendas('PES_NOME', 'LIKE', '%' +  edParametro.Text + '%', '0');
    if cbFiltro.ItemIndex = 2 then //Começe com
      FiltrarPrevendas('PES_NOME', 'LIKE', edParametro.Text + '%', '0');
  end;
  if cbCampo.ItemIndex = 1 then //Número do orçamento
  begin
    cbFiltro.ItemIndex := 0;
    FiltrarPrevendas('PRV_NUMERO', '=', edParametro.Text, '0');
  end;
  GridConsultas.SetFocus;
end;

procedure TfrmConsPreVendas.FormActivate(Sender: TObject);
begin
  inherited;
  ListarPrevendas('PRV_NUMERO DESC');
  cbFiltro.ItemIndex := 1;
end;

procedure TfrmConsPreVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F12 then
    Limpar;
end;

procedure TfrmConsPreVendas.GridConsultasDblClick(Sender: TObject);
begin
  //Selecionar;
end;

procedure TfrmConsPreVendas.GridConsultasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F12 then
    Limpar;
end;

procedure TfrmConsPreVendas.Selecionar;
begin
  if dsConsultas.DataSet.FieldByName('PRV_NUMERO').IsNull then
    MessageDlg('É necessário selecionar uma Pré-venda!', mtWarning, [mbOk], 0)
  else
  begin
    FiltrarPrevendas('PRV_NUMERO', '=', IntToStr(dsConsultas.DataSet.FieldByName('PRV_NUMERO').Value), '0');
    Close;
  end;
end;

end.
