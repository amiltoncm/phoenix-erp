unit uProcLogradourostipo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, wwdblook;

type
  TfrmProcLogradourostipo = class(TfrmTmpProcura)
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
  frmProcLogradourostipo: TfrmProcLogradourostipo;

implementation

{$R *.dfm}

uses uDaoLogradourostipo, dataDiversos, dataLookups, uCadLogradourostipo;

procedure TfrmProcLogradourostipo.Limpar;
begin
  ListarLogradourostipo('TPL_DESCRICAO');
end;

procedure TfrmProcLogradourostipo.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcLogradourostipo.Filtrar;
begin
  FiltrarLogradourostipo('TPL_DESCRICAO', 'LIKE', cbProcura.Text + '%', 'TPL_DESCRICAO');
end;

procedure TfrmProcLogradourostipo.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('TPL_DESCRICAO').IsNull) then
    begin
      FiltrarLogradourostipo('TPL_DESCRICAO', '=', dsProcura.DataSet.FieldByName('TPL_DESCRICAO').Text, 'TPL_DESCRICAO');
      frmCadLogradourostipo.sbPrincipal.Panels[3].Text := 'Ativo';
      Close;
    end
    else
      MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
  Except
    MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
    cbProcura.SetFocus;
  End;
end;

procedure TfrmProcLogradourostipo.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcLogradourostipo.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcLogradourostipo.btFecharClick(Sender: TObject);
begin
  //Limpar;
  inherited;
end;

procedure TfrmProcLogradourostipo.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcLogradourostipo.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcLogradourostipo.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcLogradourostipo.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

end.
