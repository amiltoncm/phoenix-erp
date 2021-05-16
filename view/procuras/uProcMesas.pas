unit uProcMesas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, wwdblook;

type
  TfrmProcMesas = class(TfrmTmpProcura)
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
  frmProcMesas: TfrmProcMesas;

implementation

{$R *.dfm}

uses uDaoMesas, dataCadastros, dataLookups, uCadMesas;

procedure TfrmProcMesas.Limpar;
begin
  ListarMesas('mes_descricao');
end;

procedure TfrmProcMesas.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcMesas.Filtrar;
begin
  FiltrarMesas('mes_descricao', 'LIKE', cbProcura.Text + '%', 'mes_descricao');
end;

procedure TfrmProcMesas.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('mes_descricao').IsNull) then
    begin
      FiltrarMesas('mes_descricao', '=', dsProcura.DataSet.FieldByName('mes_descricao').Text, 'mes_descricao');
      frmCadMesas.sbPrincipal.Panels[3].Text := 'Ativo';
      Close;
    end
    else
      MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
  Except
    MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
    cbProcura.SetFocus;
  End;
end;

procedure TfrmProcMesas.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcMesas.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcMesas.btFecharClick(Sender: TObject);
begin
  //Limpar;
  inherited;
end;

procedure TfrmProcMesas.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcMesas.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcMesas.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcMesas.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

end.
