unit uProcFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.StdCtrls,
  wwdblook, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TfrmProcFornecedores = class(TfrmTmpProcura)
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
  frmProcFornecedores: TfrmProcFornecedores;

implementation

{$R *.dfm}

uses dataLookups, dataPessoas, uDaoPessoas, uOrcamento;

procedure TfrmProcFornecedores.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcFornecedores.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcFornecedores.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

procedure TfrmProcFornecedores.Limpar;
begin
  ListarPessoas('PES_NOME');
end;

procedure TfrmProcFornecedores.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcFornecedores.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcFornecedores.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcFornecedores.btFecharClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmProcFornecedores.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcFornecedores.Filtrar;
begin
  FiltrarPessoas('PES_NOME', 'LIKE', cbProcura.Text + '%', 'PES_NOME');
end;

procedure TfrmProcFornecedores.Selecionar;
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
