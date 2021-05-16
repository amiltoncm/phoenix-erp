unit uCadUf;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, 
  Vcl.ImgList, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, 
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, wwdblook, System.ImageList,
  System.Actions;

type
  TfrmCadUf = class(TfrmTmpCadastro)
    lbSigla: TLabel;
    dbSigla: TDBEdit;
    lbEstado: TLabel;
    dbEstado: TDBEdit;
    lbCodigo: TLabel;
    dbCodigo: TDBEdit;
    cbPais: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    dbCodPais: TDBEdit;
    Label3: TLabel;
    dbICMSInt: TDBEdit;
    procedure FormDestroy(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actAtualizarExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
    procedure actProcurarExecute(Sender: TObject);
    procedure cbPaisExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUf: TfrmCadUf;

implementation

{$R *.dfm}

uses dataDiversos, uDaoLookups, uDaoUf, uProcUf, dataLookups;

procedure TfrmCadUf.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadUf <> nil then
    frmCadUf := nil;
end;

procedure TfrmCadUf.actGravarExecute(Sender: TObject);
begin
  inherited;
  AtualizarLookup('UF');
end;

procedure TfrmCadUf.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbSigla.SetFocus;
end;

procedure TfrmCadUf.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadUf.actLimparExecute(Sender: TObject);
begin
  ListarUf('UF_ESTADO');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadUf.actNovoExecute(Sender: TObject);
begin
  inherited;
  dbSigla.SetFocus;
end;

procedure TfrmCadUf.FormActivate(Sender: TObject);
begin
  inherited;
  ListarUf('UF_ESTADO');
  dbSigla.SetFocus;
end;

procedure TfrmCadUf.actProcurarExecute(Sender: TObject);
begin
  ListarUf('UF_ESTADO');
  frmProcUf.ShowModal;
end;

procedure TfrmCadUf.cbPaisExit(Sender: TObject);
begin
  if dsCadastro.DataSet.State in [dsInsert, dsEdit] then
    dsCadastro.DataSet.FieldByName('PAI_CODIGO').Value := dmLookups.qyLkPaisPAI_CODIGO.Value;
end;

end.
