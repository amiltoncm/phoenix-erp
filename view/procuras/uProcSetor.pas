unit uProcSetor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, wwdblook;

type
  TfrmProcSetor = class(TfrmTmpProcura)
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
  frmProcSetor: TfrmProcSetor;

implementation

{$R *.dfm}

uses uDaoSetor, dataDiversos, dataLookups, uCadSetor;

procedure TfrmProcSetor.Limpar;
begin
  ListarSetor('SET_DESCRICAO');
end;

procedure TfrmProcSetor.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcSetor.Filtrar;
begin
  FiltrarSetor('SET_DESCRICAO', 'LIKE', cbProcura.Text + '%', 'SET_DESCRICAO');
end;

procedure TfrmProcSetor.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('SET_DESCRICAO').IsNull) then
    begin
      FiltrarSetor('SET_DESCRICAO', '=', dsProcura.DataSet.FieldByName('SET_DESCRICAO').Text, 'SET_DESCRICAO');
      frmCadSetor.sbPrincipal.Panels[3].Text := 'Ativo';
      Close;
    end
    else
      MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
  Except
    MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
    cbProcura.SetFocus;
  End;
end;

procedure TfrmProcSetor.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcSetor.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcSetor.btFecharClick(Sender: TObject);
begin
  //Limpar;
  inherited;
end;

procedure TfrmProcSetor.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcSetor.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcSetor.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcSetor.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

end.
