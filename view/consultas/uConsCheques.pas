unit uConsCheques;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormMDI, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ImgList, Vcl.Menus, Vcl.ActnList, Data.DB, wwdblook,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, uTmpFormNormal;

type
  TfrmConsCheques = class(TfrmTmpFormMDI)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GridPagar: TJvDBGrid;
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
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btFiltrarClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btBaixarClick(Sender: TObject);
    procedure Alterar1Click(Sender: TObject);
    procedure Alterar;
    procedure Baixar1Click(Sender: TObject);
    procedure Baixar;
    procedure GridPagarDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsCheques: TfrmConsCheques;

implementation

{$R *.dfm}

uses dataConsultas, dataLookups, uDaoCheques, uVarGlobal, uAltCheque, uBxCheque;

procedure TfrmConsCheques.Limpar;
begin
  dtpInicial.Date := now;
  dtpFinal.Date := now + 30;
  cbCliente.Text := '';
  btFiltrar.Click;
  dtpInicial.SetFocus;
end;

procedure TfrmConsCheques.Alterar1Click(Sender: TObject);
begin
  Alterar;
end;

procedure TfrmConsCheques.Baixar1Click(Sender: TObject);
begin
  Baixar;
end;

procedure TfrmConsCheques.btAlterarClick(Sender: TObject);
begin
  Alterar;
end;

procedure TfrmConsCheques.Alterar;
begin
  if Not(dsConsulta.DataSet.FieldByName('chq_lancamento').IsNull) then
  begin
    frmAltCheque.ShowModal;
    dsConsulta.DataSet.Refresh;
  end;
end;

procedure TfrmConsCheques.btBaixarClick(Sender: TObject);
begin
  Baixar;
end;

procedure TfrmConsCheques.Baixar;
begin
  if Not(dsConsulta.DataSet.FieldByName('chq_lancamento').IsNull) then
  begin
    if MessageDlg('Deseja realmente baixar o cheque:' + #13 + #13 +
                  dsConsulta.DataSet.FieldByName('chq_cheque').Text + ' - ' + vgSimbolo +
                  ' ' + dsConsulta.DataSet.FieldByName('chq_valor').Text, mtConfirmation,
                  [mbYes, mbNo], 0) = mrYes then
    begin
      FiltrarCheques('chq_lancamento', '=', IntToStr(dsConsulta.DataSet.FieldByName('chq_lancamento').Value), '0');
      frmBxCheque.ShowModal;
      dsConsulta.DataSet.Refresh;
    end;
  end;
end;

procedure TfrmConsCheques.btFiltrarClick(Sender: TObject);
Var
vCliente: String;
begin
  if ((cbCliente.Text <> '') or (cbCliente.Text <> ' ')) then
    vCliente := '0'
  else
    vCLiente := IntToStr(dmLookups.qyLkClientesPES_CODIGO.Value);
  ConsCheques(FormatDateTime(vgMaskData, dtpInicial.Date),
              FormatDateTime(vgMaskData, dtpFinal.Date),
              vCliente, '1');
end;

procedure TfrmConsCheques.FormActivate(Sender: TObject);
begin
  inherited;
  Limpar;
  btFiltrar.Click;
end;

procedure TfrmConsCheques.FormDestroy(Sender: TObject);
begin
  if frmConsCheques <> nil then
    frmConsCheques := nil;
end;

procedure TfrmConsCheques.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
  inherited;
end;

procedure TfrmConsCheques.GridPagarDblClick(Sender: TObject);
begin
  Baixar;
end;

end.
