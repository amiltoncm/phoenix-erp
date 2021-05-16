unit uCadContas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, 
  Vcl.ImgList, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, 
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, wwdblook, wwdbedit, Wwdotdot, Wwdbcomb,
  System.ImageList, System.Actions;

type
  TfrmCadContas = class(TfrmTmpCadastro)
    lbCodigo: TLabel;
    dbCodigo: TDBEdit;
    lbDescricao: TLabel;
    dbDescricao: TDBEdit;
    lbAtiva: TLabel;
    Label1: TLabel;
    cbBanco: TwwDBLookupCombo;
    dbCodBanco: TDBEdit;
    Label2: TLabel;
    cbAtivo: TwwDBComboBox;

    procedure FormDestroy(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actAtualizarExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
    procedure actProcurarExecute(Sender: TObject);
    procedure cbBancoExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadContas: TfrmCadContas;

implementation

{$R *.dfm}

uses dataCadastros, uDaoContas, uProcContas, dataLookups, uFuncoesDB,
  uDaoLookups;

procedure TfrmCadContas.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadContas <> nil then
    frmCadContas := nil;
end;

procedure TfrmCadContas.actGravarExecute(Sender: TObject);
begin
  if dsCadastro.DataSet.State in [dsInsert] then
    dsCadastro.DataSet.FieldByName('CON_CODIGO').Value := GetCodigo('CON_CODIGO', 'CONTAS');
  inherited;
  AtualizarLookup('CONTAS');
end;

procedure TfrmCadContas.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadContas.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadContas.actLimparExecute(Sender: TObject);
begin
  ListarContas('C.CON_CODIGO');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadContas.actNovoExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadContas.FormActivate(Sender: TObject);
begin
  inherited;
  ListarContas('C.CON_CODIGO');
  dbDescricao.SetFocus;
end;

procedure TfrmCadContas.actProcurarExecute(Sender: TObject);
begin
  ListarContas('C.CON_CODIGO');
  frmProcContas.ShowModal;
end;

procedure TfrmCadContas.cbBancoExit(Sender: TObject);
begin
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    dsCadastro.DataSet.FieldByName('BAN_CODIGO').Value := dmLookups.qyLkBancosBAN_CODIGO.Value;
end;

end.
