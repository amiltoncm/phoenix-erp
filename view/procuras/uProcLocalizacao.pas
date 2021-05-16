unit uProcLocalizacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, wwdblook;

type
  TfrmProcLocalizacao = class(TfrmTmpProcura)
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
  frmProcLocalizacao: TfrmProcLocalizacao;

implementation

{$R *.dfm}

uses uDaoLocalizacao, dataCadastros, dataLookups, uCadLocalizacao;

procedure TfrmProcLocalizacao.Limpar;
begin
  ListarLocalizacao('LOC_DESCRICAO');
end;

procedure TfrmProcLocalizacao.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcLocalizacao.Filtrar;
begin
  FiltrarLocalizacao('LOC_DESCRICAO', 'LIKE', cbProcura.Text + '%', 'LOC_DESCRICAO');
end;

procedure TfrmProcLocalizacao.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('LOC_CODIGO').IsNull) then
    begin
      FiltrarLocalizacao('LOC_CODIGO', '=', dsProcura.DataSet.FieldByName('LOC_CODIGO').Text, 'LOC_CODIGO');
      frmCadLocalizacao.sbPrincipal.Panels[3].Text := 'Ativo';
      Close;
    end
    else
      MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
  Except
    MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
    cbProcura.SetFocus;
  End;
end;

procedure TfrmProcLocalizacao.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcLocalizacao.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcLocalizacao.btFecharClick(Sender: TObject);
begin
  //Limpar;
  inherited;
end;

procedure TfrmProcLocalizacao.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcLocalizacao.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcLocalizacao.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcLocalizacao.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

end.
