unit uCadFonestipo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, 
  Vcl.ImgList, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, 
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, System.ImageList, System.Actions;

type
  TfrmCadFonestipo = class(TfrmTmpCadastro)
    lbCodigo: TLabel;
    dbCodigo: TDBEdit;
    lbDescricao: TLabel;
    dbDescricao: TDBEdit;
    lbMascara: TLabel;
    dbMascara: TDBEdit;
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
  frmCadFonestipo: TfrmCadFonestipo;

implementation

{$R *.dfm}

uses dataDiversos, uDaoLookups, uDaoFonestipo, uFuncoesDB, uProcFonestipo;

procedure TfrmCadFonestipo.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadFonestipo <> nil then
    frmCadFonestipo := nil;
end;

procedure TfrmCadFonestipo.actGravarExecute(Sender: TObject);
begin
  if dsCadastro.DataSet.State in [dsInsert] then
    dsCadastro.DataSet.FieldByName('TPF_CODIGO').Value := GetCodigo('TPF_CODIGO', 'FONESTIPO');
  inherited;
  AtualizarLookup('FONESTIPO');
end;

procedure TfrmCadFonestipo.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadFonestipo.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadFonestipo.actLimparExecute(Sender: TObject);
begin
  ListarFonestipo('TPF_DESCRICAO');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadFonestipo.actNovoExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadFonestipo.FormActivate(Sender: TObject);
begin
  inherited;
  ListarFonestipo('TPF_DESCRICAO');
  dbDescricao.SetFocus;
end;

procedure TfrmCadFonestipo.actProcurarExecute(Sender: TObject);
begin
  ListarFonestipo('TPF_DESCRICAO');
  frmProcFonestipo.ShowModal;
end;

end.

