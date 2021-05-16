unit uCadFormpag;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, 
  Vcl.ImgList, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, 
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook;

type
  TfrmCadFormpag = class(TfrmTmpCadastro)
    lbCodigo: TLabel;
    dbCodigo: TDBEdit;
    lbDescricao: TLabel;
    dbDescricao: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    dbTPag: TDBEdit;
    cbAtivo: TwwDBComboBox;
    Label3: TLabel;
    cbCodConta: TwwDBLookupCombo;
    Label4: TLabel;
    dbDias: TDBEdit;
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
  frmCadFormpag: TfrmCadFormpag;

implementation

{$R *.dfm}

uses dataFinanceiro, uDaoLookups, uDaoFormpag, uFuncoesDB, uProcFormpag,
  dataLookups;

procedure TfrmCadFormpag.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadFormpag <> nil then
    frmCadFormpag := nil;
end;

procedure TfrmCadFormpag.actGravarExecute(Sender: TObject);
begin
  if dsCadastro.DataSet.State in [dsInsert] then
    dsCadastro.DataSet.FieldByName('FRP_CODIGO').Value := GetCodigo('FRP_CODIGO', 'FORMPAG');
  inherited;
  AtualizarLookup('FORMPAG');
end;

procedure TfrmCadFormpag.actAlterarExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadFormpag.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadFormpag.actLimparExecute(Sender: TObject);
begin
  ListarFormpag('FRP_DESCRICAO');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadFormpag.actNovoExecute(Sender: TObject);
begin
  inherited;
  dbDescricao.SetFocus;
end;

procedure TfrmCadFormpag.FormActivate(Sender: TObject);
begin
  inherited;
  ListarFormpag('FRP_DESCRICAO');
  dbDescricao.SetFocus;
end;

procedure TfrmCadFormpag.actProcurarExecute(Sender: TObject);
begin
  ListarFormpag('FRP_CODIGO');
  frmProcFormpag.ShowModal;
end;

end.
