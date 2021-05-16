unit uCadLogradourostipo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, 
  Vcl.ImgList, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, 
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, System.ImageList, System.Actions;

type
  TfrmCadLogradourostipo = class(TfrmTmpCadastro)
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
  frmCadLogradourostipo: TfrmCadLogradourostipo;

implementation

{$R *.dfm}

uses dataDiversos, uDaoLookups, uDaoLogradourostipo, uProcLogradourostipo,
  uFuncoesDB;

procedure TfrmCadLogradourostipo.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadLogradourostipo <> nil then
    frmCadLogradourostipo := nil;
end;

procedure TfrmCadLogradourostipo.actGravarExecute(Sender: TObject);
begin
  if dsCadastro.DataSet.State in [dsInsert] then
    dsCadastro.DataSet.FieldByName('TPL_CODIGO').Value := GetCodigo('TPL_CODIGO', 'LOGRADOUROSTIPO');
  inherited;
  AtualizarLookup('LOGRADOUROSTIPO');
end;

procedure TfrmCadLogradourostipo.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadLogradourostipo.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadLogradourostipo.actLimparExecute(Sender: TObject);
begin
  ListarLogradourostipo('TPL_DESCRICAO');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadLogradourostipo.actNovoExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadLogradourostipo.FormActivate(Sender: TObject);
begin
  inherited;
  ListarLogradourostipo('TPL_DESCRICAO');
  dbDescricao.SetFocus;
end;

procedure TfrmCadLogradourostipo.actProcurarExecute(Sender: TObject);
begin
  ListarLogradourostipo('TPL_DESCRICAO');
  frmProcLogradourostipo.ShowModal;
end;

end.
