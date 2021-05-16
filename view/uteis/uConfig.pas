unit uConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormalMov, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, wwdbedit, Wwdotdot, Wwdbcomb,
  Wwdbspin;

type
  TfrmConfig = class(TfrmTmpFormNormalMov)
    Label1: TLabel;
    dbCodigo: TDBEdit;
    Label2: TLabel;
    dbVersao: TDBEdit;
    Label3: TLabel;
    dbCodCidade: TDBEdit;
    btGravar: TBitBtn;
    Label4: TLabel;
    cbBuscaCep: TwwDBComboBox;
    cbLanc3: TwwDBComboBox;
    Label5: TLabel;
    wwDBSpinEdit1: TwwDBSpinEdit;
    Label6: TLabel;
    dbDescMax: TDBEdit;
    dbMgMin: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cbCaseProd: TwwDBComboBox;
    Label10: TLabel;
    Label11: TLabel;
    dbPIS: TDBEdit;
    dbCofins: TDBEdit;
    Label13: TLabel;
    dsFuncionarios: TDataSource;
    dbNomeFunc: TDBEdit;
    Label14: TLabel;
    cbEfetPV: TwwDBComboBox;
    Label12: TLabel;
    cbDivComanda: TwwDBComboBox;
    cbEfetPVAut: TwwDBComboBox;
    cbFechaPVAut: TwwDBComboBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    cbUserApp: TwwDBComboBox;
    Label18: TLabel;
    wwDBComboBox1: TwwDBComboBox;
    Label19: TLabel;
    cbDelivery: TwwDBComboBox;
    procedure FormActivate(Sender: TObject);
    procedure dsMovimentoStateChange(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dsFuncionariosStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfig: TfrmConfig;

implementation

{$R *.dfm}

uses dataConfig, uDaoConfig, uClassConfig, dataCadastros, uDaoFuncionarios;

procedure TfrmConfig.btGravarClick(Sender: TObject);
begin
  PostConfig;
  if dsFuncionarios.DataSet.State in [dsEdit] then
    PostFuncionarios;
  MessageDlg('Configurações alteradas com sucesso!', mtInformation, [mbOk], 0);
  Close;
end;

procedure TfrmConfig.dsFuncionariosStateChange(Sender: TObject);
begin
  if dsMovimento.DataSet.State in [dsEdit, dsInsert] then
    btGravar.Enabled := True
end;

procedure TfrmConfig.dsMovimentoStateChange(Sender: TObject);
begin
  if dsMovimento.DataSet.State in [dsEdit, dsInsert] then
    btGravar.Enabled := True
  else
    btGravar.Enabled := False;
end;

procedure TfrmConfig.FormActivate(Sender: TObject);
Var
vConfig: TConfig;
begin
  inherited;
  ListarConfig('CFG_CODIGO');
  //Configuração inicial
  if dmConfig.qyConfigCFG_CODIGO.IsNull then
  begin
    vConfig := TConfig.Create;
    vConfig.Codigo := 1;
    vConfig.Versao := '1.0';
    vConfig.Codcidade := 4202404;
    InsConfig;
    SetValuesConfig(vConfig);
    PostConfig;
    vConfig.Free;
  end;
  //Ajustes em tabelas adicionais
  FiltrarFuncionariosCfg('fun_codigo', '=', '0', '0');
  dbCodCidade.SetFocus;
end;

procedure TfrmConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsMovimento.DataSet.State in [dsEdit] then
    dsMovimento.DataSet.Cancel;
  if dsFuncionarios.DataSet.State in [dsEdit] then
    dsFuncionarios.DataSet.Cancel;
end;

procedure TfrmConfig.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

end.
