unit uCadMarcas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, 
  Vcl.ImgList, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, 
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, System.ImageList, System.Actions;

type
  TfrmCadMarcas = class(TfrmTmpCadastro)
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
  frmCadMarcas: TfrmCadMarcas;

implementation

{$R *.dfm}

uses dataCadastros, uDaoLookups, uDaoMarcas, uFuncoesDB, uProcMarcas;

procedure TfrmCadMarcas.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadMarcas <> nil then
    frmCadMarcas := nil;
end;

procedure TfrmCadMarcas.actGravarExecute(Sender: TObject);
begin
  if dsCadastro.DataSet.State in [dsInsert] then
    dsCadastro.DataSet.FieldByName('MAR_CODIGO').Value := GetCodigo('MAR_CODIGO', 'MARCAS');
  inherited;
  AtualizarLookup('MARCAS');
end;

procedure TfrmCadMarcas.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadMarcas.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadMarcas.actLimparExecute(Sender: TObject);
begin
  ListarMarcas('MAR_DESCRICAO');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadMarcas.actNovoExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadMarcas.FormActivate(Sender: TObject);
begin
  inherited;
  ListarMarcas('MAR_DESCRICAO');
  dbDescricao.SetFocus;
end;

procedure TfrmCadMarcas.actProcurarExecute(Sender: TObject);
begin
  ListarMarcas('MAR_DESCRICAO');
  frmProcMarcas.ShowModal;
end;

end.
