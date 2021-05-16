unit uDetProdMov;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmDetProdMov = class(TfrmTmpFormNormal)
    pnProduto: TPanel;
    GridMov: TDBGrid;
    dsProdutosMov: TDataSource;
    Label1: TLabel;
    sbTodos: TSpeedButton;
    sbCompra: TSpeedButton;
    sbVenda: TSpeedButton;
    sbEntManual: TSpeedButton;
    StatusBar1: TStatusBar;
    dsProdutosEst: TDataSource;
    procedure GridMovDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure sbTodosClick(Sender: TObject);
    procedure sbCompraClick(Sender: TObject);
    procedure sbVendaClick(Sender: TObject);
    procedure sbEntManualClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDetProdMov: TfrmDetProdMov;

implementation

{$R *.dfm}

uses uVarGlobal, dataEstoque, dataConsultas, uDaoProdutosMov;

procedure TfrmDetProdMov.FormActivate(Sender: TObject);
begin
  inherited;
  dsProdutosEst.DataSet.Active := True;
  pnProduto.Caption := vgDescProdMov + FormatFloat('000,000', vgDetProdMov);
  sbTodos.Down := True;
  StatusBar1.Panels[1].Text := dsProdutosEst.DataSet.FieldByName('est_disponivel').Text;
  StatusBar1.Panels[3].Text := dsProdutosEst.DataSet.FieldByName('est_reservas').Text;
  StatusBar1.Panels[5].Text := dsProdutosEst.DataSet.FieldByName('est_fisico').Text;
  ConsProdutosMov(IntToStr(vgDetProdMov));
end;

procedure TfrmDetProdMov.GridMovDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('prm_tipo').Text = 'PRV' then // Caso seja venda
  begin
    (Sender as TDBGrid).Canvas.Font.Color := clBlue;
    (Sender as TDBGrid).Canvas.Font.Style:= [];
  end
  else
    if (Sender as TDBGrid).DataSource.DataSet.FieldByName('prm_tipo').Text = 'COM' then // Caso seja compra
    begin
      (Sender as TDBGrid).Canvas.Font.Color := clGreen;
      (Sender as TDBGrid).Canvas.Font.Style:= [];
    end
    else
      if (Sender as TDBGrid).DataSource.DataSet.FieldByName('prm_tipo').Text = 'MAN' then // Caso seja lançamento manual
      begin
        (Sender as TDBGrid).Canvas.Font.Color := clRed;
        (Sender as TDBGrid).Canvas.Font.Style:= [];
      end
      else
        begin
          (Sender as TDBGrid).Canvas.Font.Color := clBlack;
          (Sender as TDBGrid).Canvas.Font.Style:= [];
        end;
  (Sender as TDBGrid).Canvas.FillRect(Rect);
  (Sender as TDBGrid).DefaultDrawDataCell(Rect, (Sender as TDBGrid).columns[datacol].field, State);
end;

procedure TfrmDetProdMov.sbCompraClick(Sender: TObject);
begin
  ConsProdutosMovTp(IntToStr(vgDetProdMov), 'COM');
end;

procedure TfrmDetProdMov.sbEntManualClick(Sender: TObject);
begin
  ConsProdutosMovTp(IntToStr(vgDetProdMov), 'MAN');
end;

procedure TfrmDetProdMov.sbTodosClick(Sender: TObject);
begin
  ConsProdutosMov(IntToStr(vgDetProdMov));
end;

procedure TfrmDetProdMov.sbVendaClick(Sender: TObject);
begin
  ConsProdutosMovTp(IntToStr(vgDetProdMov), 'PRV');
end;

end.
