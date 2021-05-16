unit uCadSetor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, 
  Vcl.ImgList, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, 
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, System.ImageList, System.Actions;

type
  TfrmCadSetor = class(TfrmTmpCadastro)
    lbCodigo: TLabel;
    dbCodigo: TDBEdit;
    lbDescricao: TLabel;
    dbDescricao: TDBEdit;
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
  frmCadSetor: TfrmCadSetor;

implementation

{$R *.dfm}

uses dataDiversos, uDaoLookups, uDaoSetor, uProcSetor, uFuncoesDB;

procedure TfrmCadSetor.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadSetor <> nil then
    frmCadSetor := nil;
end;

procedure TfrmCadSetor.actGravarExecute(Sender: TObject);
begin
  if dsCadastro.DataSet.State in [dsInsert] then
    dsCadastro.DataSet.FieldByName('SET_CODIGO').Value := GetCodigo('SET_CODIGO', 'SETOR');
  inherited;
  AtualizarLookup('SETOR');
end;

procedure TfrmCadSetor.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadSetor.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadSetor.actLimparExecute(Sender: TObject);
begin
  ListarSetor('SET_DESCRICAO');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadSetor.actNovoExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadSetor.FormActivate(Sender: TObject);
begin
  inherited;
  ListarSetor('SET_DESCRICAO');
  dbDescricao.SetFocus;
end;

procedure TfrmCadSetor.actProcurarExecute(Sender: TObject);
begin
  ListarSetor('SET_DESCRICAO');
  frmProcSetor.ShowModal;
end;

end.

