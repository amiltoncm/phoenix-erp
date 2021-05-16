unit uCadMesas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, 
  Vcl.ImgList, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, 
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, vcl.wwdbedit, vcl.wwdotdot, vcl.wwdbcomb,
  System.ImageList, System.Actions;

type
  TfrmCadMesas = class(TfrmTmpCadastro)
    lbCodigo: TLabel;
    dbCodigo: TDBEdit;
    lbDescricao: TLabel;
    dbDescricao: TDBEdit;
    Label1: TLabel;
    cbAtiva: TwwDBComboBox;
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
  frmCadMesas: TfrmCadMesas;

implementation

{$R *.dfm}

uses dataGestao, uDaoLookups, uDaoMesas, uProcMesas, uFuncoesDB;

procedure TfrmCadMesas.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadMesas <> nil then
    frmCadMesas := nil;
end;

procedure TfrmCadMesas.actGravarExecute(Sender: TObject);
begin
  if dsCadastro.DataSet.State in [dsInsert] then
      dmGestao.qyMesasmes_codigo.Value := GetCodigo('mes_codigo', 'mesas');
  inherited;
  AtualizarLookup('MESAS');
end;

procedure TfrmCadMesas.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadMesas.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadMesas.actLimparExecute(Sender: TObject);
begin
  ListarMesas('mes_descricao');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadMesas.actNovoExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadMesas.FormActivate(Sender: TObject);
begin
  inherited;
  ListarMesas('mes_descricao');
  dbDescricao.SetFocus;
end;

procedure TfrmCadMesas.actProcurarExecute(Sender: TObject);
begin
  ListarMesas('mes_descricao');
  frmProcMesas.ShowModal;
end;

end.
