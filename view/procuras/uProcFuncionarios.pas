unit uProcFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, wwdblook;

type
  TfrmProcFuncionarios = class(TfrmTmpProcura)
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
  frmProcFuncionarios: TfrmProcFuncionarios;

implementation

{$R *.dfm}

uses uDaoFuncionarios, dataCadastros, dataLookups, uCadFuncionarios;

procedure TfrmProcFuncionarios.Limpar;
begin
  ListarFuncionarios('F.FUN_NOME');
end;

procedure TfrmProcFuncionarios.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcFuncionarios.Filtrar;
begin
  FiltrarFuncionarios('F.FUN_NOME', 'LIKE', cbProcura.Text + '%', 'F.FUN_NOME');
end;

procedure TfrmProcFuncionarios.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('FUN_CODIGO').IsNull) then
    begin
      FiltrarFuncionarios('F.FUN_CODIGO', '=', dsProcura.DataSet.FieldByName('FUN_CODIGO').Text, 'F.FUN_CODIGO');
      frmCadFuncionarios.sbPrincipal.Panels[3].Text := 'Ativo';
      Close;
    end
    else
      MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
  Except
    MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
    cbProcura.SetFocus;
  End;
end;

procedure TfrmProcFuncionarios.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcFuncionarios.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcFuncionarios.btFecharClick(Sender: TObject);
begin
  //Limpar;
  inherited;
end;

procedure TfrmProcFuncionarios.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcFuncionarios.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcFuncionarios.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcFuncionarios.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

end.
