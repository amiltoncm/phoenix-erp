unit uProcUnidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, wwdblook;

type
  TfrmProcUnidades = class(TfrmTmpProcura)
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
  frmProcUnidades: TfrmProcUnidades;

implementation

{$R *.dfm}

uses uDaoUnidades, dataCadastros, dataLookups, uCadUnidades;

procedure TfrmProcUnidades.Limpar;
begin
  ListarUnidades('UNI_DESCRICAO');
end;

procedure TfrmProcUnidades.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcUnidades.Filtrar;
begin
  FiltrarUnidades('UNI_DESCRICAO', 'LIKE', cbProcura.Text + '%', 'UNI_DESCRICAO');
end;

procedure TfrmProcUnidades.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('UNI_DESCRICAO').IsNull) then
    begin
      FiltrarUnidades('UNI_DESCRICAO', '=', dsProcura.DataSet.FieldByName('UNI_DESCRICAO').Text, 'UNI_DESCRICAO');
      frmCadUnidades.sbPrincipal.Panels[3].Text := 'Ativo';
      Close;
    end
    else
      MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
  Except
    MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
    cbProcura.SetFocus;
  End;
end;

procedure TfrmProcUnidades.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcUnidades.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcUnidades.btFecharClick(Sender: TObject);
begin
  //Limpar;
  inherited;
end;

procedure TfrmProcUnidades.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcUnidades.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcUnidades.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcUnidades.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

end.
