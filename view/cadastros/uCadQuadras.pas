unit uCadQuadras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, 
  Vcl.ImgList, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, 
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, System.ImageList, System.Actions,
  JvExStdCtrls, JvCombobox, JvDBCombobox;

type
  TfrmCadQuadras = class(TfrmTmpCadastro)
    lbCodigo: TLabel;
    dbCodigo: TDBEdit;
    lbDescricao: TLabel;
    dbDescricao: TDBEdit;
    Label1: TLabel;
    dbCodProduto: TDBEdit;
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
  frmCadQuadras: TfrmCadQuadras;

implementation

{$R *.dfm}

uses dataGestao, uDaoLookups, uDaoQuadras, uFuncoesDB, uProcQuadras,
  dataLookups;

procedure TfrmCadQuadras.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadQuadras <> nil then
    frmCadQuadras := nil;
end;

procedure TfrmCadQuadras.actGravarExecute(Sender: TObject);
begin
  if dsCadastro.DataSet.State in [dsInsert] then
    dsCadastro.DataSet.FieldByName('qda_codigo').Value := GetCodigo('qda_codigo', 'quadras');
  inherited;
  AtualizarLookup('QUADRAS');
end;

procedure TfrmCadQuadras.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadQuadras.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadQuadras.actLimparExecute(Sender: TObject);
begin
  ListarQuadras('qda_descricao');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadQuadras.actNovoExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadQuadras.FormActivate(Sender: TObject);
begin
  inherited;
  ListarQuadras('qda_descricao');
  dbDescricao.SetFocus;
end;

procedure TfrmCadQuadras.actProcurarExecute(Sender: TObject);
begin
  ListarQuadras('qda_descricao');
  frmProcQuadras.ShowModal;
end;

end.