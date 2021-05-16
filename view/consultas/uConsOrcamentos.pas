unit uConsOrcamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpConsultaNormal, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, wwdbedit, Wwdotdot, Wwdbcomb,
  JvExDBGrids, JvDBGrid;

type
  TfrmConsOrcamentos = class(TfrmTmpConsultaNormal)
    procedure Limpar;
    procedure Filtrar;
    procedure Selecionar;
    procedure FormActivate(Sender: TObject);
    procedure btFiltrarClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btSelecionarClick(Sender: TObject);
    procedure cbCampoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsOrcamentos: TfrmConsOrcamentos;

implementation

{$R *.dfm}

uses dataOrcamentos, uDaoOrcamentos, uPrevenda;

procedure TfrmConsOrcamentos.Limpar;
begin
  Inherited;
  cbFiltro.ItemIndex := 1;
end;

procedure TfrmConsOrcamentos.Filtrar;
begin
  if cbCampo.ItemIndex = 0 then //Nome do cliente
  begin
    if cbFiltro.ItemIndex = 0 then //Igual
      FiltrarOrcamentos('PES_NOME', '=', edParametro.Text, '0');
    if cbFiltro.ItemIndex = 1 then //Contenha
      FiltrarOrcamentos('PES_NOME', 'LIKE', '%' +  edParametro.Text + '%', '0');
    if cbFiltro.ItemIndex = 2 then //Começe com
      FiltrarOrcamentos('PES_NOME', 'LIKE', edParametro.Text + '%', '0');
  end;
  if cbCampo.ItemIndex = 1 then //Número do orçamento
  begin
    if cbFiltro.ItemIndex = 0 then //Igual
      FiltrarOrcamentos('ORC_NUMERO', '=', edParametro.Text, '0');
    if cbFiltro.ItemIndex = 1 then //Contenha
      FiltrarOrcamentos('ORC_NUMERO', 'LIKE', '%' + edParametro.Text + '%', '0');
    if cbFiltro.ItemIndex = 2 then //Comece com
      FiltrarOrcamentos('ORC_NUMERO', 'LIKE', edParametro.Text + '%', '0');
  end;
  GridConsultas.SetFocus;
end;

procedure TfrmConsOrcamentos.Selecionar;
begin
  if dsConsultas.DataSet.FieldByName('ORC_NUMERO').IsNull then
    MessageDlg('É necessário selecionar um orçamento!', mtWarning, [mbOk], 0)
  else
  begin
    FiltrarOrcamentos('ORC_NUMERO', '=', IntToStr(dsConsultas.DataSet.FieldByName('ORC_NUMERO').Value), '0');
    if frmPreVenda <> nil then
      if dmOrcamentos.qyPrevendas.State in [dsEdit, dsInsert] then
        dmOrcamentos.qyPrevendasORC_NUMERO.Value := dsConsultas.DataSet.FieldByName('ORC_NUMERO').Value;
    Close;
  end;
end;

procedure TfrmConsOrcamentos.btFiltrarClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmConsOrcamentos.btLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmConsOrcamentos.btSelecionarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmConsOrcamentos.cbCampoExit(Sender: TObject);
begin
  if cbCampo.ItemIndex = 0 then
    edParametro.NumbersOnly := False;
  if cbCampo.ItemIndex = 1 then
    edParametro.NumbersOnly := True;
end;

procedure TfrmConsOrcamentos.FormActivate(Sender: TObject);
begin
  inherited;
  ListarOrcamentos('ORC_NUMERO DESC');
  cbFiltro.ItemIndex := 1;
end;

procedure TfrmConsOrcamentos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F12 then
    Limpar;
end;

end.
