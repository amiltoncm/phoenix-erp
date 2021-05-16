unit uProcEnderecostipo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, wwdblook;

type
  TfrmProcEnderecostipo = class(TfrmTmpProcura)
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
  frmProcEnderecostipo: TfrmProcEnderecostipo;

implementation

{$R *.dfm}

uses uDaoEnderecostipo, dataDiversos, dataLookups, uCadEnderecostipo;

procedure TfrmProcEnderecostipo.Limpar;
begin
  ListarEnderecostipo('TPE_DESCRICAO');
end;

procedure TfrmProcEnderecostipo.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcEnderecostipo.Filtrar;
begin
  FiltrarEnderecostipo('TPE_DESCRICAO', 'LIKE', cbProcura.Text + '%', 'TPE_DESCRICAO');
end;

procedure TfrmProcEnderecostipo.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('TPE_DESCRICAO').IsNull) then
    begin
      FiltrarEnderecostipo('TPE_DESCRICAO', '=', dsProcura.DataSet.FieldByName('TPE_DESCRICAO').Text, 'TPE_DESCRICAO');
      frmCadEnderecostipo.sbPrincipal.Panels[3].Text := 'Ativo';
      Close;
    end
    else
      MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
  Except
    MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
    cbProcura.SetFocus;
  End;
end;

procedure TfrmProcEnderecostipo.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcEnderecostipo.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcEnderecostipo.btFecharClick(Sender: TObject);
begin
  //Limpar;
  inherited;
end;

procedure TfrmProcEnderecostipo.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcEnderecostipo.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcEnderecostipo.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcEnderecostipo.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

end.
