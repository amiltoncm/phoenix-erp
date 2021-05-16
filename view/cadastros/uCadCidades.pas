unit uCadCidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, 
  Vcl.ImgList, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, 
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, wwdblook, System.ImageList,
  System.Actions;

type
  TfrmCadCidades = class(TfrmTmpCadastro)
    lbCodigo: TLabel;
    dbCodigo: TDBEdit;
    lbMunicipio: TLabel;
    dbMunicipio: TDBEdit;
    lbSigla: TLabel;
    dbSigla: TDBEdit;
    lbCeppadrao: TLabel;
    dbCeppadrao: TDBEdit;
    cbEstado: TwwDBLookupCombo;
    Label1: TLabel;

    procedure FormDestroy(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actAtualizarExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
    procedure actProcurarExecute(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure cbEstadoExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCidades: TfrmCadCidades;

implementation

{$R *.dfm}

uses dataCadastros, uDaoCidades, uProcCidades, uDaoLookups, dataLookups;

procedure TfrmCadCidades.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadCidades <> nil then
    frmCadCidades := nil;
end;

procedure TfrmCadCidades.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbCodigo.SetFocus;
end;

procedure TfrmCadCidades.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadCidades.actGravarExecute(Sender: TObject);
begin
  inherited;
  AtualizarLookup('CIDADES');
end;

procedure TfrmCadCidades.actLimparExecute(Sender: TObject);
begin
  ListarCidades('C.CID_MUNICIPIO');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadCidades.actNovoExecute(Sender: TObject);
begin
  inherited;
  dbCodigo.SetFocus;
end;

procedure TfrmCadCidades.FormActivate(Sender: TObject);
begin
  inherited;
  ListarCidades('C.CID_MUNICIPIO');
  dbCodigo.SetFocus;
end;

procedure TfrmCadCidades.actProcurarExecute(Sender: TObject);
begin
  ListarCidades('C.CID_MUNICIPIO');
  frmProcCidades.ShowModal;
end;

procedure TfrmCadCidades.cbEstadoExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsInsert, dsEdit] then
    dsCadastro.DataSet.FieldByName('UF_SIGLA').Text := dmLookups.qyLkUfUF_SIGLA.Text;
end;

end.
