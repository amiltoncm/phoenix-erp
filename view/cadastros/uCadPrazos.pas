unit uCadPrazos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB,
  Vcl.ImgList, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, wwdbedit, Wwdotdot, Wwdbcomb, Vcl.Grids,
  Vcl.DBGrids, System.ImageList, System.Actions;

type
  TfrmCadPrazos = class(TfrmTmpCadastro)
    lbCodigo: TLabel;
    dbCodigo: TDBEdit;
    lbDescricao: TLabel;
    dbDescricao: TDBEdit;
    lbParcelas: TLabel;
    dbParcelas: TDBEdit;
    lbJuros: TLabel;
    dbJuros: TDBEdit;
    Label1: TLabel;
    cbIndicacao: TwwDBComboBox;
    Label2: TLabel;
    dbPeriodo: TDBEdit;
    Label3: TLabel;
    dsFormas: TDataSource;
    GridFomas: TDBGrid;
    sbNew: TSpeedButton;
    sbCancel: TSpeedButton;
    sbDelete: TSpeedButton;
    sbGravar: TSpeedButton;
    procedure FormDestroy(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actAtualizarExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
    procedure actProcurarExecute(Sender: TObject);
    procedure dsCadastroStateChange(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure sbNewClick(Sender: TObject);
    procedure dsFormasStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbGravarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPrazos: TfrmCadPrazos;

implementation

{$R *.dfm}

uses dataFinanceiro, uDaoLookups, uDaoPrazos, uFuncoesDB, uProcPrazos,
  uDaoPrazosFrp, uProcFormpag;

procedure TfrmCadPrazos.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadPrazos <> nil then
    frmCadPrazos := nil;
end;

procedure TfrmCadPrazos.sbGravarClick(Sender: TObject);
begin
  dsFormas.DataSet.Post;
  AtualizarLookup('PRAZOSFRP');
end;

procedure TfrmCadPrazos.sbNewClick(Sender: TObject);
begin
  dsFormas.DataSet.Insert;
  dsFormas.DataSet.FieldByName('prz_codigo').Value := dsCadastro.DataSet.FieldByName('prz_codigo').Value;
  frmProcFormpag.ShowModal;
end;

procedure TfrmCadPrazos.actGravarExecute(Sender: TObject);
begin
  if dsCadastro.DataSet.State in [dsInsert] then
    dsCadastro.DataSet.FieldByName('PRZ_CODIGO').Value := GetCodigo('PRZ_CODIGO', 'PRAZOS');
  inherited;
  AtualizarLookup('PRAZOS');
end;

procedure TfrmCadPrazos.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadPrazos.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadPrazos.actCancelarExecute(Sender: TObject);
begin
  dsFormas.DataSet.Delete;
end;

procedure TfrmCadPrazos.actLimparExecute(Sender: TObject);
begin
  ListarPrazos('PRZ_DESCRICAO');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadPrazos.actNovoExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadPrazos.FormActivate(Sender: TObject);
begin
  inherited;
  ListarPrazos('PRZ_DESCRICAO');
  dbDescricao.SetFocus;
end;

procedure TfrmCadPrazos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsFormas.DataSet.State in [dsInsert, dsEdit] then
    dsFormas.DataSet.Cancel;
  inherited;
end;

procedure TfrmCadPrazos.actProcurarExecute(Sender: TObject);
begin
  ListarPrazos('PRZ_DESCRICAO');
  frmProcPrazos.ShowModal;
end;

procedure TfrmCadPrazos.dsCadastroStateChange(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.FieldByName('prz_codigo').IsNull then
    FiltrarPrazosFrp('prz_codigo', '=', '0', '0')
  else
    FiltrarPrazosFrp('prz_codigo', '=',
                     IntToStr(dsCadastro.DataSet.FieldByName('prz_codigo').Value),
                     'frp_descricao');
end;

procedure TfrmCadPrazos.dsFormasStateChange(Sender: TObject);
begin
  if dsFormas.DataSet.State in [dsInsert] then
  begin
    sbNew.Enabled := False;
    sbGravar.Enabled := True;
    sbDelete.Enabled := False;
    sbCancel.Enabled := True;
  end
  else
  begin
    sbNew.Enabled := True;
    sbGravar.Enabled := False;
    sbDelete.Enabled := True;
    sbCancel.Enabled := False;
  end;
end;

end.
