unit uCadComandas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, 
  Vcl.ImgList, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, 
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, System.ImageList, System.Actions,
  vcl.wwdbedit, vcl.wwdotdot, vcl.wwdbcomb;

type
  TfrmCadComandas = class(TfrmTmpCadastro)
    dbDescricao: TDBEdit;
    dbCodigo: TDBEdit;
    lbCodigo: TLabel;
    lbDescricao: TLabel;
    cbAtiva: TwwDBComboBox;
    Label1: TLabel;
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
  frmCadComandas: TfrmCadComandas;

implementation

{$R *.dfm}

uses dataGestao, uDaoLookups, uDaoComandas, uProcComandas;

procedure TfrmCadComandas.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadComandas <> nil then
    frmCadComandas := nil;
end;

procedure TfrmCadComandas.actGravarExecute(Sender: TObject);
begin
  inherited;
  AtualizarLookup('COMANDAS');
end;

procedure TfrmCadComandas.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbCodigo.SetFocus;
end;

procedure TfrmCadComandas.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadComandas.actLimparExecute(Sender: TObject);
begin
  ListarComandas('cma_descricao');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadComandas.actNovoExecute(Sender: TObject);
begin
  inherited;
  dbCodigo.SetFocus;
end;

procedure TfrmCadComandas.FormActivate(Sender: TObject);
begin
  inherited;
  ListarComandas('cma_descricao');
  dbCodigo.SetFocus;
end;

procedure TfrmCadComandas.actProcurarExecute(Sender: TObject);
begin
  ListarComandas('cma_descricao');
  frmProcComandas.ShowModal;
end;

end.