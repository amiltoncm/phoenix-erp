unit uProcPrazos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, wwdblook;

type
  TfrmProcPrazos = class(TfrmTmpProcura)
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
  frmProcPrazos: TfrmProcPrazos;

implementation

{$R *.dfm}

uses uDaoPrazos, dataFinanceiro, dataLookups, uCadPrazos;

procedure TfrmProcPrazos.Limpar;
begin
  ListarPrazos('PRZ_DESCRICAO');
end;

procedure TfrmProcPrazos.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcPrazos.Filtrar;
begin
  FiltrarPrazos('PRZ_DESCRICAO', 'LIKE', cbProcura.Text + '%', 'PRZ_DESCRICAO');
end;

procedure TfrmProcPrazos.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('PRZ_DESCRICAO').IsNull) then
    begin
      FiltrarPrazos('PRZ_DESCRICAO', '=', dsProcura.DataSet.FieldByName('PRZ_DESCRICAO').Text, 'PRZ_DESCRICAO');
      frmCadPrazos.sbPrincipal.Panels[3].Text := 'Ativo';
      Close;
    end
    else
      MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
  Except
    MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
    cbProcura.SetFocus;
  End;
end;

procedure TfrmProcPrazos.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcPrazos.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcPrazos.btFecharClick(Sender: TObject);
begin
  //Limpar;
  inherited;
end;

procedure TfrmProcPrazos.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcPrazos.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcPrazos.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcPrazos.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

end.
