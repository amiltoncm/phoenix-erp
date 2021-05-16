unit uProcFonestipo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, wwdblook;

type
  TfrmProcFonestipo = class(TfrmTmpProcura)
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
  frmProcFonestipo: TfrmProcFonestipo;

implementation

{$R *.dfm}

uses uDaoFonestipo, dataCadastros, dataLookups, uCadFonestipo;

procedure TfrmProcFonestipo.Limpar;
begin
  ListarFonestipo('TPF_DESCRICAO');
end;

procedure TfrmProcFonestipo.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcFonestipo.Filtrar;
begin
  FiltrarFonestipo('TPF_DESCRICAO', 'LIKE', cbProcura.Text + '%', 'TPF_DESCRICAO');
end;

procedure TfrmProcFonestipo.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('TPF_DESCRICAO').IsNull) then
    begin
      FiltrarFonestipo('TPF_DESCRICAO', '=', dsProcura.DataSet.FieldByName('TPF_DESCRICAO').Text, 'TPF_DESCRICAO');
      frmCadFonestipo.sbPrincipal.Panels[3].Text := 'Ativo';
      Close;
    end
    else
      MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
  Except
    MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
    cbProcura.SetFocus;
  End;
end;

procedure TfrmProcFonestipo.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcFonestipo.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcFonestipo.btFecharClick(Sender: TObject);
begin
  //Limpar;
  inherited;
end;

procedure TfrmProcFonestipo.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcFonestipo.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcFonestipo.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcFonestipo.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

end.
