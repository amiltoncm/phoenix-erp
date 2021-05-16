unit uCadFuncoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, 
  Vcl.ImgList, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, 
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, System.ImageList, System.Actions;

type
  TfrmCadFuncoes = class(TfrmTmpCadastro)
    dbCodigo: TDBEdit;
    dbDescricao: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormDestroy(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actAtualizarExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
    procedure actProcurarExecute(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFuncoes: TfrmCadFuncoes;

implementation

{$R *.dfm}

uses dataCadastros, uDaoLookups, uDaoFuncoes, uProcFuncoes, uFuncoesDB;

procedure TfrmCadFuncoes.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadFuncoes <> nil then
    frmCadFuncoes := nil;
end;

procedure TfrmCadFuncoes.actGravarExecute(Sender: TObject);
begin
  if dsCadastro.DataSet.State in [dsInsert] then
    dsCadastro.DataSet.FieldByName('FNC_CODIGO').Value := GetCodigo('FNC_CODIGO', 'FUNCOES');
  inherited;
  AtualizarLookup('FUNCOES');
end;

procedure TfrmCadFuncoes.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadFuncoes.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadFuncoes.actLimparExecute(Sender: TObject);
begin
  ListarFuncoes('FNC_DESCRICAO');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadFuncoes.actNovoExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadFuncoes.FormActivate(Sender: TObject);
begin
  inherited;
  ListarFuncoes('FNC_DESCRICAO');
  dbDescricao.SetFocus;
end;

procedure TfrmCadFuncoes.actProcurarExecute(Sender: TObject);
begin
  ListarFuncoes('FNC_DESCRICAO');
  frmProcFuncoes.ShowModal;
end;

end.
