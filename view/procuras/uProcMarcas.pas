unit uProcMarcas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, wwdblook;

type
  TfrmProcMarcas = class(TfrmTmpProcura)
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
  frmProcMarcas: TfrmProcMarcas;

implementation

{$R *.dfm}

uses uDaoMarcas, dataCadastros, dataLookups, uCadMarcas;

procedure TfrmProcMarcas.Limpar;
begin
  ListarMarcas('MAR_DESCRICAO');
end;

procedure TfrmProcMarcas.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcMarcas.Filtrar;
begin
  FiltrarMarcas('MAR_DESCRICAO', 'LIKE', cbProcura.Text + '%', 'MAR_DESCRICAO');
end;

procedure TfrmProcMarcas.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('MAR_DESCRICAO').IsNull) then
    begin
      FiltrarMarcas('MAR_DESCRICAO', '=', dsProcura.DataSet.FieldByName('MAR_DESCRICAO').Text, 'MAR_DESCRICAO');
      frmCadMarcas.sbPrincipal.Panels[3].Text := 'Ativo';
      Close;
    end
    else
      MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
  Except
    MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
    cbProcura.SetFocus;
  End;
end;

procedure TfrmProcMarcas.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcMarcas.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcMarcas.btFecharClick(Sender: TObject);
begin
  //Limpar;
  inherited;
end;

procedure TfrmProcMarcas.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcMarcas.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcMarcas.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcMarcas.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

end.
