unit uCadGrupos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, 
  Vcl.ImgList, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, 
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, System.ImageList, System.Actions;

type
  TfrmCadGrupos = class(TfrmTmpCadastro)
    lbCodigo: TLabel;
    dbCodigo: TDBEdit;
    lbDescricao: TLabel;
    dbDescricao: TDBEdit;
    Panel1: TPanel;
    GridSubGrupos: TJvDBGrid;
    dsSubGrupos: TDataSource;
    Panel2: TPanel;
    sbNovoSG: TSpeedButton;
    sbExcluirSG: TSpeedButton;
    sbGravarSG: TSpeedButton;
    sbCancelaSG: TSpeedButton;

    procedure FormDestroy(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actAtualizarExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
    procedure actProcurarExecute(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure sbNovoSGClick(Sender: TObject);
    procedure sbExcluirSGClick(Sender: TObject);
    procedure sbGravarSGClick(Sender: TObject);
    procedure dsSubGruposStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbCancelaSGClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadGrupos: TfrmCadGrupos;

implementation

{$R *.dfm}

uses dataCadastros, uDaoLookups, uDaoGrupos, uProcGrupos, uFuncoesDB,
  uDaoSubGrupos;

procedure TfrmCadGrupos.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadGrupos <> nil then
    frmCadGrupos := nil;
end;

procedure TfrmCadGrupos.sbCancelaSGClick(Sender: TObject);
begin
  dsSubGrupos.DataSet.Cancel;
end;

procedure TfrmCadGrupos.sbExcluirSGClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir o Subgrupo ' + dsSubGrupos.DataSet.FieldByName('SGR_DESCRICAO').Text + '?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    DelSubGrupos;
end;

procedure TfrmCadGrupos.sbGravarSGClick(Sender: TObject);
begin
  PostSubGrupos;
end;

procedure TfrmCadGrupos.sbNovoSGClick(Sender: TObject);
begin
  InsSubGrupos;
  GridSubGrupos.SetFocus;
end;

procedure TfrmCadGrupos.actGravarExecute(Sender: TObject);
begin
  if dsCadastro.DataSet.State in [dsInsert] then
    dsCadastro.DataSet.FieldByName('GRP_CODIGO').Value := GetCodigo('GRP_CODIGO', 'GRUPOS');
  inherited;
  AtualizarLookup('GRUPOS');
end;

procedure TfrmCadGrupos.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadGrupos.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadGrupos.actLimparExecute(Sender: TObject);
begin
  ListarGrupos('GRP_DESCRICAO');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadGrupos.actNovoExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadGrupos.FormActivate(Sender: TObject);
begin
  inherited;
  ListarGrupos('GRP_DESCRICAO');
  dbDescricao.SetFocus;
end;

procedure TfrmCadGrupos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if dsSubGrupos.DataSet.State in [dsInsert, dsEdit] then
    dsSubGrupos.DataSet.Cancel;
end;

procedure TfrmCadGrupos.actProcurarExecute(Sender: TObject);
begin
  ListarGrupos('GRP_DESCRICAO');
  frmProcGrupos.ShowModal;
end;

procedure TfrmCadGrupos.dsCadastroDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if dsCadastro.DataSet.FieldByName('GRP_CODIGO').IsNull then
    FiltrarSubGrupos('GRP_CODIGO', '=', '0', 'SGR_DESCRICAO')
  else
    FiltrarSubGrupos('GRP_CODIGO', '=', dsCadastro.DataSet.FieldByName('GRP_CODIGO').Text, 'SGR_DESCRICAO');
end;

procedure TfrmCadGrupos.dsSubGruposStateChange(Sender: TObject);
begin
  if dsSubGrupos.DataSet.State in [dsInsert] then
  begin
    dsSubGrupos.DataSet.FieldByName('SGR_CODIGO').Text := GetCodSubGrupo(dsCadastro.DataSet.FieldByName('GRP_CODIGO').Value);
    dsSubGrupos.DataSet.FieldByName('GRP_CODIGO').Value := dsCadastro.DataSet.FieldByName('GRP_CODIGO').Value;
  end;
  if True then
  if dsSubGrupos.DataSet.State in [dsInsert, dsEdit] then
  begin
    sbNovoSG.Enabled := False;
    sbExcluirSG.Enabled := False;
    sbGravarSG.Enabled := True;
    sbCancelaSG.Enabled := True;
  end
  else
  begin
    sbNovoSG.Enabled := True;
    sbExcluirSG.Enabled := True;
    sbGravarSG.Enabled := False;
    sbCancelaSG.Enabled := False;
  end;
end;

end.
