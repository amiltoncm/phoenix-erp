unit uProcPlanocontas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, wwdblook;

type
  TfrmProcPlanocontas = class(TfrmTmpProcura)
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
  frmProcPlanocontas: TfrmProcPlanocontas;

implementation

{$R *.dfm}

uses uDaoPlanocontas, dataCadastros, dataLookups, uCadPlanocontas;

procedure TfrmProcPlanocontas.Limpar;
begin
  ListarPlanocontas('PLC_DESCRICAO');
end;

procedure TfrmProcPlanocontas.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcPlanocontas.Filtrar;
begin
  FiltrarPlanocontas('PLC_DESCRICAO', 'LIKE', cbProcura.Text + '%', 'PLC_DESCRICAO');
end;

procedure TfrmProcPlanocontas.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('PLC_DESCRICAO').IsNull) then
    begin
      FiltrarPlanocontas('PLC_DESCRICAO', '=', dsProcura.DataSet.FieldByName('PLC_DESCRICAO').Text, 'PLC_DESCRICAO');
      frmCadPlanocontas.sbPrincipal.Panels[3].Text := 'Ativo';
      Close;
    end
    else
      MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
  Except
    MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
    cbProcura.SetFocus;
  End;
end;

procedure TfrmProcPlanocontas.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcPlanocontas.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcPlanocontas.btFecharClick(Sender: TObject);
begin
  //Limpar;
  inherited;
end;

procedure TfrmProcPlanocontas.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcPlanocontas.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcPlanocontas.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcPlanocontas.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

end.
