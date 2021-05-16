unit uCadUnidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, 
  Vcl.ImgList, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, 
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, System.ImageList, System.Actions;

type
  TfrmCadUnidades = class(TfrmTmpCadastro)
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
  frmCadUnidades: TfrmCadUnidades;

implementation

{$R *.dfm}

uses dataCadastros, uDaoLookups, uDaoUnidades, uProcUnidades;

procedure TfrmCadUnidades.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadUnidades <> nil then
    frmCadUnidades := nil;
end;

procedure TfrmCadUnidades.actGravarExecute(Sender: TObject);
begin
  inherited;
  AtualizarLookup('UNIDADES');
end;

procedure TfrmCadUnidades.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbCodigo.SetFocus;
end;

procedure TfrmCadUnidades.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadUnidades.actLimparExecute(Sender: TObject);
begin
  ListarUnidades('UNI_DESCRICAO');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadUnidades.actNovoExecute(Sender: TObject);
begin
  inherited;
  dbCodigo.SetFocus;
end;

procedure TfrmCadUnidades.FormActivate(Sender: TObject);
begin
  inherited;
  ListarUnidades('UNI_DESCRICAO');
  dbCodigo.SetFocus;
end;

procedure TfrmCadUnidades.actProcurarExecute(Sender: TObject);
begin
  ListarUnidades('UNI_DESCRICAO');
  frmProcUnidades.ShowModal;
end;

end.

