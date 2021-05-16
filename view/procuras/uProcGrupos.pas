unit uProcGrupos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, wwdblook;

type
  TfrmProcGrupos = class(TfrmTmpProcura)
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
  frmProcGrupos: TfrmProcGrupos;

implementation

{$R *.dfm}

uses uDaoGrupos, dataCadastros, dataLookups, uCadGrupos;

procedure TfrmProcGrupos.Limpar;
begin
  ListarGrupos('GRP_DESCRICAO');
end;

procedure TfrmProcGrupos.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcGrupos.Filtrar;
begin
  FiltrarGrupos('GRP_DESCRICAO', 'LIKE', cbProcura.Text + '%', 'GRP_DESCRICAO');
end;

procedure TfrmProcGrupos.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('GRP_DESCRICAO').IsNull) then
    begin
      FiltrarGrupos('GRP_DESCRICAO', '=', dsProcura.DataSet.FieldByName('GRP_DESCRICAO').Text, 'GRP_DESCRICAO');
      frmCadGrupos.sbPrincipal.Panels[3].Text := 'Ativo';
      Close;
    end
    else
      MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
  Except
    MessageDlg('Não foram encontrados resultados para a seleção!', mtWarning, [mbOk], 0);
    cbProcura.SetFocus;
  End;
end;

procedure TfrmProcGrupos.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcGrupos.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcGrupos.btFecharClick(Sender: TObject);
begin
  //Limpar;
  inherited;
end;

procedure TfrmProcGrupos.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcGrupos.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcGrupos.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcGrupos.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

end.
