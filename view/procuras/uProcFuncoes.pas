unit uProcFuncoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, wwdblook;

type
  TfrmProcFuncoes = class(TfrmTmpProcura)
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
  frmProcFuncoes: TfrmProcFuncoes;

implementation

{$R *.dfm}

uses uDaoFuncoes, dataCadastros, dataLookups, uCadFuncoes;

procedure TfrmProcFuncoes.Limpar;
begin
  ListarFuncoes('FNC_DESCRICAO');
end;

procedure TfrmProcFuncoes.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcFuncoes.Filtrar;
begin
  FiltrarFuncoes('FNC_DESCRICAO', 'LIKE', cbProcura.Text + '%', 'FNC_DESCRICAO');
end;

procedure TfrmProcFuncoes.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('FNC_CODIGO').IsNull) then
    begin
      FiltrarFuncoes('FNC_CODIGO', '=', dsProcura.DataSet.FieldByName('FNC_CODIGO').Text, 'FNC_CODIGO');
      frmCadFuncoes.sbPrincipal.Panels[3].Text := 'Ativo';
      Close;
    end
    else
      MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
  Except
    MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
    cbProcura.SetFocus;
  End;
end;

procedure TfrmProcFuncoes.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcFuncoes.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcFuncoes.btFecharClick(Sender: TObject);
begin
  //Limpar;
  inherited;
end;

procedure TfrmProcFuncoes.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcFuncoes.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcFuncoes.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcFuncoes.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

end.
