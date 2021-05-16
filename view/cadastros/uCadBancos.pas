unit uCadBancos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, 
  Vcl.ImgList, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, 
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, System.ImageList, System.Actions;

type
  TfrmCadBancos = class(TfrmTmpCadastro)
    lbCodigo: TLabel;
    dbCodigo: TDBEdit;
    lbDescricao: TLabel;
    dbDescricao: TDBEdit;
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
  frmCadBancos: TfrmCadBancos;

implementation

{$R *.dfm}

uses dataCadastros, uDaoBancos, uProcBancos, uDaoLookups;

procedure TfrmCadBancos.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadBancos <> nil then
    frmCadBancos := nil;
end;

procedure TfrmCadBancos.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbCodigo.SetFocus;
end;

procedure TfrmCadBancos.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadBancos.actGravarExecute(Sender: TObject);
begin
  inherited;
  AtualizarLookup('BANCOS');
end;

procedure TfrmCadBancos.actLimparExecute(Sender: TObject);
begin
  ListarBancos('BAN_DESCRICAO');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadBancos.actNovoExecute(Sender: TObject);
begin
  inherited;
  dbCodigo.SetFocus;
end;

procedure TfrmCadBancos.FormActivate(Sender: TObject);
begin
  inherited;
  ListarBancos('BAN_DESCRICAO');
  dbCodigo.SetFocus;
end;

procedure TfrmCadBancos.actProcurarExecute(Sender: TObject);
begin
  ListarBancos('BAN_DESCRICAO');
  frmProcBancos.ShowModal;
end;

end.
