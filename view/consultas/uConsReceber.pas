unit uConsReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormMDI, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ImgList, Vcl.Menus, Vcl.ActnList, Data.DB, wwdblook,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, System.ImageList,
  System.Actions;

type
  TfrmConsReceber = class(TfrmTmpFormMDI)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GridReceber: TJvDBGrid;
    dtpInicial: TDateTimePicker;
    dtpFinal: TDateTimePicker;
    cbCliente: TwwDBLookupCombo;
    btFiltrar: TBitBtn;
    btLimpar: TBitBtn;
    btBaixar: TBitBtn;
    btAlterar: TBitBtn;
    dsConsulta: TDataSource;
    ActionList1: TActionList;
    actLimpar: TAction;
    PopupMenu1: TPopupMenu;
    Alterar1: TMenuItem;
    Baixar1: TMenuItem;
    Imagens: TImageList;
    procedure Limpar;
    procedure Baixar;
    procedure Alterar;
    procedure FormActivate(Sender: TObject);
    procedure btFiltrarClick(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
    procedure btBaixarClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure Alterar1Click(Sender: TObject);
    procedure Baixar1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GridReceberDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsReceber: TfrmConsReceber;

implementation

{$R *.dfm}

uses dataLookups, uDaoReceber, uVarGlobal, dataFinanceiro, uAltParcela,
  uConfBxReceber;

procedure TfrmConsReceber.Limpar;
begin
  FiltrarReceber('rec_codigo', '=', '0', '0');
  dtpInicial.Date := now;
  dtpFinal.Date := now + 30;
  cbCliente.Text := '';
  dtpInicial.SetFocus;
end;

procedure TfrmConsReceber.Baixar;
begin
  if dsConsulta.DataSet.FieldByName('REC_VENCIMENTO').IsNull then
    MessageDlg('É necessário selecionar uma duplicata!', mtWarning, [mbOk], 0)
  else
  begin
    frmConfBxReceber.ShowModal;
    dsConsulta.DataSet.Refresh;
  end;
end;

procedure TfrmConsReceber.Baixar1Click(Sender: TObject);
begin
  Baixar;
end;

procedure TfrmConsReceber.Alterar;
begin
  if dsConsulta.DataSet.FieldByName('REC_VENCIMENTO').IsNull then
    MessageDlg('É necessário selecionar uma duplicata!', mtWarning, [mbOk], 0)
  else
  begin
    EdtReceber;
    frmAltParcela.ShowModal;
    dsConsulta.DataSet.Refresh;
  end;
end;

procedure TfrmConsReceber.Alterar1Click(Sender: TObject);
begin
  Alterar;
end;

procedure TfrmConsReceber.actLimparExecute(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmConsReceber.btAlterarClick(Sender: TObject);
begin
  Alterar;
end;

procedure TfrmConsReceber.btBaixarClick(Sender: TObject);
begin
  Baixar;
end;

procedure TfrmConsReceber.btFiltrarClick(Sender: TObject);
Var
vDataInic, vDataFinal, vCliente: String;
begin
  vDataInic := FormatDateTime(vgMaskData, (dtpInicial.Date));
  vDataFinal := FormatDateTime(vgMaskData, (dtpFinal.Date));
  if cbCliente.Text <> '' then
    vCliente := IntToStr(dmLookups.qyLkClientesPES_CODIGO.Value)
  else
    vCliente := '0';
  FiltrarReceberBx(vDataInic, vDataFinal, vCliente);
end;

procedure TfrmConsReceber.FormActivate(Sender: TObject);
begin
  Limpar;
  btFiltrar.Click;
end;

procedure TfrmConsReceber.FormDestroy(Sender: TObject);
begin
  if frmConsReceber <> nil then
    frmConsReceber := nil;
end;

procedure TfrmConsReceber.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

procedure TfrmConsReceber.GridReceberDblClick(Sender: TObject);
begin
  Baixar;
end;

end.
