unit uProcProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpProcura, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, wwdblook;

type
  TfrmProcProdutos = class(TfrmTmpProcura)
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
  frmProcProdutos: TfrmProcProdutos;

implementation

{$R *.dfm}

uses uDaoProdutos, dataCadastros, dataLookups, uCadProdutos, uEntradaManual;

procedure TfrmProcProdutos.Limpar;
begin
  ListarProdutos('PRO_DESCRICAO');
end;

procedure TfrmProcProdutos.spLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmProcProdutos.Filtrar;
begin
  FiltrarProdutos('PRO_DESCRICAO', 'LIKE', cbProcura.Text + '%', 'PRO_DESCRICAO');
end;

procedure TfrmProcProdutos.Selecionar;
begin
  Try
    if Not(dsProcura.DataSet.FieldByName('PRO_DESCRICAO').IsNull) then
    begin
      FiltrarProdutos('PRO_DESCRICAO', '=', dsProcura.DataSet.FieldByName('PRO_DESCRICAO').Text, 'PRO_DESCRICAO');
      if frmCadProdutos <> nil then
        frmCadProdutos.sbPrincipal.Panels[3].Text := 'Ativo';
      // Entrada manual
      if frmEntradaManual <> nil then
      begin
        frmEntradaManual.edCodBar.Text := IntToStr(dsProcura.DataSet.FieldByName('pro_codigo').Value);
        frmEntradaManual.edDescProd.Text := dsProcura.DataSet.FieldByName('pro_descricao').Text;
        frmEntradaManual.edCodigo.Text := dsProcura.DataSet.FieldByName('pro_codigo').Text;
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

procedure TfrmProcProdutos.spProcuraClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmProcProdutos.btConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcProdutos.btFecharClick(Sender: TObject);
begin
  //Limpar;
  inherited;
end;

procedure TfrmProcProdutos.cbProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Filtrar;
    GridProcura.SetFocus;
  end;
end;

procedure TfrmProcProdutos.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmProcProdutos.GridProcuraDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmProcProdutos.GridProcuraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    cbProcura.SetFocus;
  if key = #13 then
    Selecionar;
end;

end.
