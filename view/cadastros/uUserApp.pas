unit uUserApp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Vcl.DBCtrls, Vcl.Mask, vcl.wwdbedit, vcl.wwdotdot,
  vcl.wwdbcomb;

type
  TfrmUserApp = class(TfrmTmpFormNormal)
    Label1: TLabel;
    cbUserApp: TwwDBComboBox;
    Label2: TLabel;
    dbSenhaApp: TDBEdit;
    dsCadastro: TDataSource;
    btGravar: TBitBtn;
    procedure btGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbUserAppExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUserApp: TfrmUserApp;

implementation

{$R *.dfm}

uses dataCadastros;

procedure TfrmUserApp.btGravarClick(Sender: TObject);
Var
vFechar: Boolean;
begin
  vFechar := False;
  if cbUserApp.Value = '0' then
  begin
    dbSenhaApp.Clear;
    dsCadastro.DataSet.Post;
    vFechar := True;
  end
  else
    if ((cbUserApp.Value = '1') and (dsCadastro.DataSet.FieldByName('usu_senhaapp').IsNull)) then
    begin
      MessageDlg('É necessário uma senha para o usuário do App!', mtWarning, [mbOk], 0);
      dbSenhaApp.SetFocus;
      vFechar := False;
    end
    else
        begin
          dsCadastro.DataSet.Post;
          vFechar := True;
        end;
  if vFechar = True then
    Close;
end;

procedure TfrmUserApp.cbUserAppExit(Sender: TObject);
begin
  if cbUserApp.Value = '0' then
    dbSenhaApp.Clear;
end;

procedure TfrmUserApp.FormActivate(Sender: TObject);
begin
  if not(dsCadastro.DataSet.State in [dsInsert, dsEdit]) then
    dsCadastro.DataSet.Edit;
end;

procedure TfrmUserApp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsCadastro.DataSet.State in [dsInsert, dsEdit] then
    dsCadastro.DataSet.Cancel;
  inherited;
end;

end.
