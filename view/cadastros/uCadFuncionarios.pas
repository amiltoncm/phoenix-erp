unit uCadFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, 
  Vcl.ImgList, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, 
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook,
  System.ImageList, System.Actions;

type
  TfrmCadFuncionarios = class(TfrmTmpCadastro)
    lbCodigo: TLabel;
    dbCodigo: TDBEdit;
    lbNome: TLabel;
    dbDescricao: TDBEdit;
    lbTelefone: TLabel;
    dbTelefone: TDBEdit;
    lbAtivo: TLabel;
    Label1: TLabel;
    cbFuncao: TwwDBLookupCombo;
    cbAtivo: TwwDBComboBox;
    procedure FormDestroy(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actAtualizarExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
    procedure actProcurarExecute(Sender: TObject);
    procedure cbFuncaoExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFuncionarios: TfrmCadFuncionarios;

implementation

{$R *.dfm}

uses dataCadastros, uDaoLookups, uDaoFuncionarios, uFuncoesDB,
  uProcFuncionarios, dataLookups;

procedure TfrmCadFuncionarios.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadFuncionarios <> nil then
    frmCadFuncionarios := nil;
end;

procedure TfrmCadFuncionarios.actGravarExecute(Sender: TObject);
begin
  if dsCadastro.DataSet.State in [dsInsert] then
    dsCadastro.DataSet.FieldByName('FUN_CODIGO').Value := GetCodigo('FUN_CODIGO', 'FUNCIONARIOS');
  inherited;
  AtualizarLookup('FUNCIONARIOS');
end;

procedure TfrmCadFuncionarios.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadFuncionarios.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadFuncionarios.actLimparExecute(Sender: TObject);
begin
  ListarFuncionarios('F.FUN_NOME');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadFuncionarios.actNovoExecute(Sender: TObject);
begin
  inherited;
  cbFuncao.PerformSearch;
  dbDescricao.SetFocus;
end;

procedure TfrmCadFuncionarios.FormActivate(Sender: TObject);
begin
  inherited;
  ListarFuncionarios('F.FUN_NOME');
  dbDescricao.SetFocus;
end;

procedure TfrmCadFuncionarios.actProcurarExecute(Sender: TObject);
begin
  ListarFuncionarios('F.FUN_NOME');
  frmProcFuncionarios.ShowModal;
end;

procedure TfrmCadFuncionarios.cbFuncaoExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsInsert, dsEdit] then
    dsCadastro.DataSet.FieldByName('FNC_CODIGO').Value := dmLookups.qyLkFuncoesFNC_CODIGO.Value;
end;

end.

