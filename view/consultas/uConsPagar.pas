unit uConsPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormMDI, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.ComCtrls, wwdblook,
  Vcl.ActnList, Vcl.Menus, Vcl.ImgList, System.ImageList, System.Actions;

type
  TfrmConsPagar = class(TfrmTmpFormMDI)
    dsConsulta: TDataSource;
    GridPagar: TJvDBGrid;
    Label1: TLabel;
    dtpInicial: TDateTimePicker;
    Label2: TLabel;
    dtpFinal: TDateTimePicker;
    Label3: TLabel;
    cbFornecedor: TwwDBLookupCombo;
    btFiltrar: TBitBtn;
    btLimpar: TBitBtn;
    ActionList1: TActionList;
    actLimpar: TAction;
    btBaixar: TBitBtn;
    btAlterar: TBitBtn;
    PopupMenu1: TPopupMenu;
    Alterar1: TMenuItem;
    Baixar1: TMenuItem;
    Imagens: TImageList;
    procedure Limpar;
    procedure Alterar;
    procedure Baixar;
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actLimparExecute(Sender: TObject);
    procedure btFiltrarClick(Sender: TObject);
    procedure GridPagarDblClick(Sender: TObject);
    procedure btBaixarClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure Alterar1Click(Sender: TObject);
    procedure Baixar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsPagar: TfrmConsPagar;

implementation

{$R *.dfm}

uses dataLookups, uDaoPagar, dataFinanceiro, uConfBxPagar, uAltDuplicata,
  uVarGlobal;

procedure TfrmConsPagar.Limpar;
begin
  FiltrarPagar('PAG_CODIGO', '=', '0', '0');
  dtpInicial.Date := now;
  dtpFinal.Date := now + 30;
  cbFornecedor.Text := '';
  dtpInicial.SetFocus;
end;

procedure TfrmConsPagar.Alterar;
begin
  if dsConsulta.DataSet.FieldByName('PAG_VENCIMENTO').IsNull then
    MessageDlg('É necessário selecionar uma duplicata!', mtWarning, [mbOk], 0)
  else
  begin
    EdtPagar;
    frmAltDuplicata.ShowModal;
    dsConsulta.DataSet.Refresh;
  end;
end;

procedure TfrmConsPagar.Baixar;
begin
  if dsConsulta.DataSet.FieldByName('PAG_VENCIMENTO').IsNull then
    MessageDlg('É necessário selecionar uma duplicata!', mtWarning, [mbOk], 0)
  else
  begin
    frmConfBxPagar.ShowModal;
    dsConsulta.DataSet.Refresh;
  end;
end;

procedure TfrmConsPagar.Baixar1Click(Sender: TObject);
begin
  Baixar;
end;

procedure TfrmConsPagar.Alterar1Click(Sender: TObject);
begin
  Alterar;
end;

procedure TfrmConsPagar.actLimparExecute(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmConsPagar.btAlterarClick(Sender: TObject);
begin
  Alterar;
end;

procedure TfrmConsPagar.btBaixarClick(Sender: TObject);
begin
  Baixar;
end;

procedure TfrmConsPagar.btFiltrarClick(Sender: TObject);
Var
vDataInic, vDataFinal, vFornecedor: String;
begin
  vDataInic := FormatDateTime(vgMaskData, (dtpInicial.Date));
  vDataFinal := FormatDateTime(vgMaskData, (dtpFinal.Date));
  if cbFornecedor.Text <> '' then
    vFornecedor := IntToStr(dmLookups.qyLkFornecedoresPES_CODIGO.Value)
  else
    vFornecedor := '0';
  FiltrarPagarBx(vDataInic, vDataFinal, vFornecedor);
end;

procedure TfrmConsPagar.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
  btFiltrar.Click;
end;

procedure TfrmConsPagar.FormDestroy(Sender: TObject);
begin
  if frmConsPagar <> nil then
    frmConsPagar := nil;
end;

procedure TfrmConsPagar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

procedure TfrmConsPagar.GridPagarDblClick(Sender: TObject);
begin
  Baixar;
end;

end.
