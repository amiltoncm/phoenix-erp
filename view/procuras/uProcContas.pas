unit uProcContas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, wwdblook;

type
  TfrmProcContas = class(TfrmTmpProcura)
    procedure Limpar;
    procedure Filtrar;
    procedure Selecionar;
    procedure FormActivate(Sender: TObject);
    procedure spLimparClick(Sender: TObject);
    procedure spProcuraClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure cbProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure GridProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure btFecharClick(Sender: TObject);
    procedure GridProcuraDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcContas: TfrmProcContas;

implementation

{$R *.dfm}

uses uDaoContas, dataCadastros, dataLookups, uCadContas;

procedure TfrmProcContas.Limpar;
begin
  ListarContas('C.CON_DESCRICAO');
end;

procedure TfrmProcContas.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcContas.Filtrar;
begin
  FiltrarContas('C.CON_DESCRICAO', 'LIKE', cbProcura.Text + '%', 'C.CON_DESCRICAO');
end;

procedure TfrmProcContas.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('CON_CODIGO').IsNull) then
    begin
      FiltrarContas('CON_CODIGO', '=', dsProcura.DataSet.FieldByName('CON_CODIGO').Text, 'CON_CODIGO');
      frmCadContas.sbPrincipal.Panels[3].Text := 'Ativo';
      Close;
    end
    else
      MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
  Except
    MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
    cbProcura.SetFocus;
  End;
end;

procedure TfrmProcContas.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcContas.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcContas.btFecharClick(Sender: TObject);
begin
  //Limpar;
  inherited;
end;

procedure TfrmProcContas.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcContas.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcContas.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcContas.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

end.
