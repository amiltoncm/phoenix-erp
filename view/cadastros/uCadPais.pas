unit uCadPais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB,
  Vcl.ImgList, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, System.ImageList, System.Actions;

type
  TfrmCadPais = class(TfrmTmpCadastro)
    lbCodigo: TLabel;
    dbCodigo: TDBEdit;
    lbPais: TLabel;
    dbPais: TDBEdit;
    lbAlpha3: TLabel;
    dbAlpha3: TDBEdit;
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
  frmCadPais: TfrmCadPais;

implementation

{$R *.dfm}

uses dataCadastros, uDaoPais, dataDiversos, uProcPais, uDaoLookups;

procedure TfrmCadPais.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadPais <> nil then
    frmCadPais := nil;
end;

procedure TfrmCadPais.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbCodigo.SetFocus;
end;

procedure TfrmCadPais.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadPais.actGravarExecute(Sender: TObject);
begin
  inherited;
  AtualizarLookup('PAIS');
end;

procedure TfrmCadPais.actLimparExecute(Sender: TObject);
begin
  ListarPais('PAI_PAIS');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadPais.actNovoExecute(Sender: TObject);
begin
  inherited;
  dbCodigo.SetFocus;
end;

procedure TfrmCadPais.FormActivate(Sender: TObject);
begin
  inherited;
  ListarPais('PAI_PAIS');
  dbCodigo.SetFocus;
end;

procedure TfrmCadPais.actProcurarExecute(Sender: TObject);
begin
  ListarPais('PAI_PAIS');
  frmProcPais.ShowModal;
end;

end.
