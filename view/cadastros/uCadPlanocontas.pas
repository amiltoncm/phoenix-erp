unit uCadPlanocontas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB,
  Vcl.ImgList, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, wwdbedit, Wwdotdot, Wwdbcomb,
  System.ImageList, System.Actions;

type
  TfrmCadPlanocontas = class(TfrmTmpCadastro)
    lbCodigo: TLabel;
    dbCodigo: TDBEdit;
    lbDescricao: TLabel;
    dbDescricao: TDBEdit;
    cbTipo: TwwDBComboBox;
    Label1: TLabel;
    procedure FormDestroy(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actAtualizarExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
    procedure actProcurarExecute(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPlanocontas: TfrmCadPlanocontas;

implementation

{$R *.dfm}

uses dataCadastros, uDaoPlanocontas, uProcPlanocontas, uDaoLookups, uFuncoesDB;

procedure TfrmCadPlanocontas.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadPlanocontas <> nil then
    frmCadPlanocontas := nil;
end;

procedure TfrmCadPlanocontas.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadPlanocontas.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadPlanocontas.actGravarExecute(Sender: TObject);
begin
  if dsCadastro.DataSet.State in [dsInsert] then
    dsCadastro.DataSet.FieldByName('PLC_CODIGO').Value := GetCodigo('PLC_CODIGO', 'PLANOCONTAS');
  inherited;
  AtualizarLookup('PLANOCONTAS');
end;

procedure TfrmCadPlanocontas.actLimparExecute(Sender: TObject);
begin
  ListarPlanocontas('PLC_DESCRICAO');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadPlanocontas.actNovoExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadPlanocontas.FormActivate(Sender: TObject);
begin
  inherited;
  ListarPlanocontas('PLC_DESCRICAO');
  dbDescricao.SetFocus;
end;

procedure TfrmCadPlanocontas.actProcurarExecute(Sender: TObject);
begin
  ListarPlanocontas('PLC_DESCRICAO');
  frmProcPlanocontas.ShowModal;
end;

end.

