unit uProcUf;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, wwdblook;

type
  TfrmProcUf = class(TfrmTmpProcura)
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
  frmProcUf: TfrmProcUf;

implementation

{$R *.dfm}

uses uDaoUf, dataDiversos, dataLookups, uCadUf;

procedure TfrmProcUf.Limpar;
begin
  ListarUf('UF_ESTADO');
end;

procedure TfrmProcUf.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcUf.Filtrar;
begin
  FiltrarUf('UF_ESTADO', 'LIKE', cbProcura.Text + '%', 'UF_ESTADO');
end;

procedure TfrmProcUf.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('UF_ESTADO').IsNull) then
    begin
      FiltrarUf('UF_ESTADO', '=', dsProcura.DataSet.FieldByName('UF_ESTADO').Text, 'U.UF_ESTADO');
      frmCadUf.sbPrincipal.Panels[3].Text := 'Ativo';
      Close;
    end
    else
      MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
  Except
    MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
    cbProcura.SetFocus;
  End;
end;

procedure TfrmProcUf.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcUf.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcUf.btFecharClick(Sender: TObject);
begin
  //Limpar;
  inherited;
end;

procedure TfrmProcUf.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcUf.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcUf.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcUf.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

end.
