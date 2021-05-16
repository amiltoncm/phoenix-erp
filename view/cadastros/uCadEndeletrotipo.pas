unit uCadEndeletrotipo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, 
  Vcl.ImgList, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, 
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, System.ImageList, System.Actions;

type
  TfrmCadEndeletrotipo = class(TfrmTmpCadastro)
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
  frmCadEndeletrotipo: TfrmCadEndeletrotipo;

implementation

{$R *.dfm}

uses dataDiversos, uDaoLookups, uDaoEndeletrotipo, uFuncoesDB,
  uProcEndeletrotipo;

procedure TfrmCadEndeletrotipo.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadEndeletrotipo <> nil then
    frmCadEndeletrotipo := nil;
end;

procedure TfrmCadEndeletrotipo.actGravarExecute(Sender: TObject);
begin
  if dsCadastro.DataSet.State in [dsInsert] then
    dsCadastro.DataSet.FieldByName('TPN_CODIGO').Value := GetCodigo('TPN_CODIGO', 'ENDELETROTIPO');
  inherited;
  AtualizarLookup('ENDELETROTIPO');
end;

procedure TfrmCadEndeletrotipo.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadEndeletrotipo.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadEndeletrotipo.actLimparExecute(Sender: TObject);
begin
  ListarEndeletrotipo('TPN_DESCRICAO');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadEndeletrotipo.actNovoExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadEndeletrotipo.FormActivate(Sender: TObject);
begin
  inherited;
  ListarEndeletrotipo('TPN_DESCRICAO');
  dbDescricao.SetFocus;
end;

procedure TfrmCadEndeletrotipo.actProcurarExecute(Sender: TObject);
begin
  ListarEndeletrotipo('TPN_DESCRICAO');
  frmProcEndeletrotipo.ShowModal;
end;

end.
