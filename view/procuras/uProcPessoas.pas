unit uProcPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, wwdblook;

type
  TfrmProcPessoas = class(TfrmTmpProcura)
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
  frmProcPessoas: TfrmProcPessoas;

implementation

{$R *.dfm}

uses uDaoPessoas, dataCadastros, dataLookups, uCadPessoas, dataPessoas;

procedure TfrmProcPessoas.Limpar;
begin
  ListarPessoas('PES_NOME');
end;

procedure TfrmProcPessoas.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcPessoas.Filtrar;
begin
  FiltrarPessoas('PES_NOME', 'LIKE', cbProcura.Text + '%', 'PES_NOME');
end;

procedure TfrmProcPessoas.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('PES_NOME').IsNull) then
    begin
      FiltrarPessoas('PES_NOME', '=', dsProcura.DataSet.FieldByName('PES_NOME').Text, 'PES_NOME');
      frmCadPessoas.sbPrincipal.Panels[3].Text := 'Ativo';
      Close;
    end
    else
      MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
  Except
    MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
    cbProcura.SetFocus;
  End;
end;

procedure TfrmProcPessoas.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcPessoas.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcPessoas.btFecharClick(Sender: TObject);
begin
  //Limpar;
  inherited;
end;

procedure TfrmProcPessoas.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcPessoas.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcPessoas.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcPessoas.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

end.
