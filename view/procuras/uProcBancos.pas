unit uProcBancos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, wwdblook;

type
  TfrmProcBancos = class(TfrmTmpProcura)
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
  frmProcBancos: TfrmProcBancos;

implementation

{$R *.dfm}

uses uDaoBancos, dataCadastros, dataLookups, uCadBancos;

procedure TfrmProcBancos.Limpar;
begin
  ListarBancos('BAN_DESCRICAO');
end;

procedure TfrmProcBancos.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcBancos.Filtrar;
begin
  FiltrarBancos('BAN_DESCRICAO', 'LIKE', cbProcura.Text + '%', 'BAN_DESCRICAO');
end;

procedure TfrmProcBancos.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('BAN_DESCRICAO').IsNull) then
    begin
      FiltrarBancos('BAN_DESCRICAO', '=', dsProcura.DataSet.FieldByName('BAN_DESCRICAO').Text, 'BAN_DESCRICAO');
      frmCadBancos.sbPrincipal.Panels[3].Text := 'Ativo';
      Close;
    end
    else
      MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
  Except
    MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
    cbProcura.SetFocus;
  End;
end;

procedure TfrmProcBancos.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcBancos.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcBancos.btFecharClick(Sender: TObject);
begin
  //Limpar;
  inherited;
end;

procedure TfrmProcBancos.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcBancos.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcBancos.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcBancos.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

end.
