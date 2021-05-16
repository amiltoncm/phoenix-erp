unit uCadLocalizacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, 
  Vcl.ImgList, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, 
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, System.ImageList, System.Actions;

type
  TfrmCadLocalizacao = class(TfrmTmpCadastro)
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
  frmCadLocalizacao: TfrmCadLocalizacao;

implementation

{$R *.dfm}

uses dataCadastros, uDaoLookups, uDaoLocalizacao, uFuncoesDB, uProcLocalizacao;

procedure TfrmCadLocalizacao.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadLocalizacao <> nil then
    frmCadLocalizacao := nil;
end;

procedure TfrmCadLocalizacao.actGravarExecute(Sender: TObject);
begin
  if dsCadastro.DataSet.State in [dsInsert] then
    dsCadastro.DataSet.FieldByName('LOC_CODIGO').Value := GetCodigo('LOC_CODIGO', 'LOCALIZACAO');
  inherited;
  AtualizarLookup('LOCALIZACAO');
end;

procedure TfrmCadLocalizacao.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadLocalizacao.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadLocalizacao.actLimparExecute(Sender: TObject);
begin
  ListarLocalizacao('LOC_CODIGO');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadLocalizacao.actNovoExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadLocalizacao.FormActivate(Sender: TObject);
begin
  inherited;
  ListarLocalizacao('LOC_CODIGO');
  dbDescricao.SetFocus;
end;

procedure TfrmCadLocalizacao.actProcurarExecute(Sender: TObject);
begin
  ListarLocalizacao('LOC_CODIGO');
  frmProcLocalizacao.ShowModal;
end;

end.

