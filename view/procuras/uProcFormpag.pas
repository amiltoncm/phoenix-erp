unit uProcFormpag;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, wwdblook;

type
  TfrmProcFormpag = class(TfrmTmpProcura)
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
  frmProcFormpag: TfrmProcFormpag;

implementation

{$R *.dfm}

uses uDaoFormpag, dataFinanceiro, dataLookups, uCadFormpag, uCadPrazos;

procedure TfrmProcFormpag.Limpar;
begin
  ListarFormpag('FRP_DESCRICAO');
end;

procedure TfrmProcFormpag.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcFormpag.Filtrar;
begin
  FiltrarFormpag('FRP_DESCRICAO', 'LIKE', cbProcura.Text + '%', 'FRP_DESCRICAO');
end;

procedure TfrmProcFormpag.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('FRP_CODIGO').IsNull) then
    begin
      FiltrarFormpag('FRP_CODIGO', '=', dsProcura.DataSet.FieldByName('FRP_CODIGO').Text, 'FRP_CODIGO');
      if frmCadFormpag <> nil then
        frmCadFormpag.sbPrincipal.Panels[3].Text := 'Ativo';
      if frmCadPrazos <> nil then
      begin
        if frmCadPrazos.dsFormas.DataSet.State in [dsInsert] then
          frmCadPrazos.dsFormas.DataSet.FieldByName('frp_codigo').Value :=
          dsProcura.DataSet.FieldByName('frp_codigo').Value;
          frmCadPrazos.dsFormas.DataSet.FieldByName('frp_descricao').Value :=
          dsProcura.DataSet.FieldByName('frp_descricao').Value;
      end;
      Close;
    end
    else
      MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
  Except
    MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
    cbProcura.SetFocus;
  End;
end;

procedure TfrmProcFormpag.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcFormpag.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcFormpag.btFecharClick(Sender: TObject);
begin
  //Limpar;
  inherited;
end;

procedure TfrmProcFormpag.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcFormpag.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcFormpag.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcFormpag.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

end.
