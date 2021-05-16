unit uProcClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.StdCtrls,
  wwdblook, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TfrmProcClientes = class(TfrmTmpProcura)
    procedure Limpar;
    procedure Filtrar;
    procedure Selecionar;
    procedure spLimparClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure spProcuraClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure GridProcuraDblClick(Sender: TObject);
    procedure GridProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure cbProcuraKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcClientes: TfrmProcClientes;

implementation

{$R *.dfm}

uses dataLookups, dataPessoas, uDaoPessoas, uOrcamento;

procedure TfrmProcClientes.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcClientes.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcClientes.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

procedure TfrmProcClientes.Limpar;
begin
  ListarPessoas('PES_NOME');
end;

procedure TfrmProcClientes.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcClientes.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcClientes.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcClientes.btFecharClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmProcClientes.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcClientes.Filtrar;
begin
  FiltrarPessoas('PES_NOME', 'LIKE', cbProcura.Text + '%', 'PES_NOME');
end;

procedure TfrmProcClientes.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('PES_NOME').IsNull) then
    begin
      FiltrarPessoas('PES_NOME', '=', dsProcura.DataSet.FieldByName('PES_NOME').Text, 'PES_NOME');
      Close;
    end
    else
      MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
  Except
    MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
    cbProcura.SetFocus;
  End;
end;

end.
