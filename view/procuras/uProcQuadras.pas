unit uProcQuadras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, wwdblook;

type
  TfrmProcQuadras = class(TfrmTmpProcura)
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
  frmProcQuadras: TfrmProcQuadras;

implementation

{$R *.dfm}

uses uDaoQuadras, dataGestao, dataLookups, uCadQuadras;

procedure TfrmProcQuadras.Limpar;
begin
  ListarQuadras('qda_descricao');
end;

procedure TfrmProcQuadras.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcQuadras.Filtrar;
begin
  FiltrarQuadras('qda_descricao', 'LIKE', cbProcura.Text + '%', 'qda_descricao');
end;

procedure TfrmProcQuadras.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('qda_descricao').IsNull) then
    begin
      FiltrarQuadras('qda_descricao', '=', dsProcura.DataSet.FieldByName('qda_descricao').Text, 'qda_descricao');
      frmCadQuadras.sbPrincipal.Panels[3].Text := 'Ativo';
      Close;
    end
    else
      MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
  Except
    MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
    cbProcura.SetFocus;
  End;
end;

procedure TfrmProcQuadras.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcQuadras.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcQuadras.btFecharClick(Sender: TObject);
begin
  //Limpar;
  inherited;
end;

procedure TfrmProcQuadras.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcQuadras.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcQuadras.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcQuadras.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

end.
