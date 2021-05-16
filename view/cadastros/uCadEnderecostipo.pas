unit uCadEnderecostipo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, 
  Vcl.ImgList, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, 
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, System.ImageList, System.Actions;

type
  TfrmCadEnderecostipo = class(TfrmTmpCadastro)
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
  frmCadEnderecostipo: TfrmCadEnderecostipo;

implementation

{$R *.dfm}

uses dataDiversos, uDaoLookups, uDaoEnderecostipo, uFuncoesDB,
  uProcEnderecostipo;

procedure TfrmCadEnderecostipo.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadEnderecostipo <> nil then
    frmCadEnderecostipo := nil;
end;

procedure TfrmCadEnderecostipo.actGravarExecute(Sender: TObject);
begin
  if dsCadastro.DataSet.State in [dsInsert] then
    dsCadastro.DataSet.FieldByName('TPE_CODIGO').Value := GetCodigo('TPE_CODIGO', 'ENDERECOSTIPO');
  inherited;
  AtualizarLookup('ENDERECOSTIPO');
end;

procedure TfrmCadEnderecostipo.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadEnderecostipo.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadEnderecostipo.actLimparExecute(Sender: TObject);
begin
  ListarEnderecostipo('TPE_DESCRICAO');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadEnderecostipo.actNovoExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadEnderecostipo.FormActivate(Sender: TObject);
begin
  inherited;
  ListarEnderecostipo('TPE_DESCRICAO');
  dbDescricao.SetFocus;
end;

procedure TfrmCadEnderecostipo.actProcurarExecute(Sender: TObject);
begin
  ListarEnderecostipo('TPE_DESCRICAO');
  frmProcEnderecostipo.ShowModal;
end;

end.

