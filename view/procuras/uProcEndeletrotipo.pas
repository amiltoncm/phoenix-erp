unit uProcEndeletrotipo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, wwdblook;

type
  TfrmProcEndeletrotipo = class(TfrmTmpProcura)
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
  frmProcEndeletrotipo: TfrmProcEndeletrotipo;

implementation

{$R *.dfm}

uses uDaoEndeletrotipo, dataDiversos, dataLookups, uCadEndeletrotipo;

procedure TfrmProcEndeletrotipo.Limpar;
begin
  ListarEndeletrotipo('TPN_DESCRICAO');
end;

procedure TfrmProcEndeletrotipo.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcEndeletrotipo.Filtrar;
begin
  FiltrarEndeletrotipo('TPN_DESCRICAO', 'LIKE', cbProcura.Text + '%', 'TPN_DESCRICAO');
end;

procedure TfrmProcEndeletrotipo.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('TPN_DESCRICAO').IsNull) then
    begin
      FiltrarEndeletrotipo('TPN_DESCRICAO', '=', dsProcura.DataSet.FieldByName('TPN_DESCRICAO').Text, 'TPN_DESCRICAO');
      frmCadEndeletrotipo.sbPrincipal.Panels[3].Text := 'Ativo';
      Close;
    end
    else
      MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
  Except
    MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
    cbProcura.SetFocus;
  End;
end;

procedure TfrmProcEndeletrotipo.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcEndeletrotipo.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcEndeletrotipo.btFecharClick(Sender: TObject);
begin
  //Limpar;
  inherited;
end;

procedure TfrmProcEndeletrotipo.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcEndeletrotipo.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcEndeletrotipo.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcEndeletrotipo.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

end.
