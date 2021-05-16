unit uProcComandas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, wwdblook;

type
  TfrmProcComandas = class(TfrmTmpProcura)
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
  frmProcComandas: TfrmProcComandas;

implementation

{$R *.dfm}

uses uDaoComandas, dataCadastros, dataLookups, uCadComandas, dataGestao;

procedure TfrmProcComandas.Limpar;
begin
  ListarComandas('cma_descricao');
end;

procedure TfrmProcComandas.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcComandas.Filtrar;
begin
  FiltrarComandas('cma_descricao', 'LIKE', cbProcura.Text + '%', 'cma_descricao');
end;

procedure TfrmProcComandas.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('cma_descricao').IsNull) then
    begin
      FiltrarComandas('cma_descricao', '=', dsProcura.DataSet.FieldByName('cma_descricao').Text, 'cma_descricao');
      frmCadComandas.sbPrincipal.Panels[3].Text := 'Ativo';
      Close;
    end
    else
      MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
  Except
    MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
    cbProcura.SetFocus;
  End;
end;

procedure TfrmProcComandas.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcComandas.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcComandas.btFecharClick(Sender: TObject);
begin
  //Limpar;
  inherited;
end;

procedure TfrmProcComandas.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcComandas.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcComandas.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcComandas.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

end.
