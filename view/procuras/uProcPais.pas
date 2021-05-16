unit uProcPais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, wwdblook;

type
  TfrmProcPais = class(TfrmTmpProcura)
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
  frmProcPais: TfrmProcPais;

implementation

{$R *.dfm}

uses uDaoPais, dataCadastros, dataLookups, uCadPais, dataDiversos;

procedure TfrmProcPais.Limpar;
begin
  ListarPais('PAI_PAIS');
end;

procedure TfrmProcPais.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcPais.Filtrar;
begin
  FiltrarPais('PAI_PAIS', 'LIKE', cbProcura.Text + '%', 'PAI_PAIS');
end;

procedure TfrmProcPais.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('PAI_PAIS').IsNull) then
    begin
      FiltrarPais('PAI_PAIS', '=', dsProcura.DataSet.FieldByName('PAI_PAIS').Text, 'PAI_PAIS');
      frmCadPais.sbPrincipal.Panels[3].Text := 'Ativo';
      Close;
    end
    else
      MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
  Except
    MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
    cbProcura.SetFocus;
  End;
end;

procedure TfrmProcPais.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcPais.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcPais.btFecharClick(Sender: TObject);
begin
  //Limpar;
  inherited;
end;

procedure TfrmProcPais.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcPais.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcPais.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcPais.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

end.
