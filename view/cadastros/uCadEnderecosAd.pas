unit uCadEnderecosAd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Vcl.Mask, Vcl.DBCtrls, wwdblook;

type
  TfrmCadEnderecosAd = class(TfrmTmpFormNormal)
    dsEnderecos: TDataSource;
    Label18: TLabel;
    cbTipoEnd: TwwDBLookupCombo;
    Label19: TLabel;
    cbTpLogradouroEnd: TwwDBLookupCombo;
    Label20: TLabel;
    dbLogradouroEnd: TDBEdit;
    Label21: TLabel;
    dbNumeroEnd: TDBEdit;
    Label22: TLabel;
    dbComplementoEnd: TDBEdit;
    Label23: TLabel;
    dbBairroEnd: TDBEdit;
    Label27: TLabel;
    dbCepEnd: TDBEdit;
    Label24: TLabel;
    dbPtReferenciaEnd: TDBEdit;
    Label28: TLabel;
    cbCidadeEnd: TwwDBLookupCombo;
    Label25: TLabel;
    dbUfEnd: TDBEdit;
    btGravar: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure cbTipoEndExit(Sender: TObject);
    procedure cbTpLogradouroEndExit(Sender: TObject);
    procedure cbCidadeEndExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEnderecosAd: TfrmCadEnderecosAd;

implementation

{$R *.dfm}

uses dataPessoas, uVarGlobal, uFuncoesWeb, dataLookups, uDaoEnderecos,
  uBuscaCEP, uDaoConfig;

procedure TfrmCadEnderecosAd.btGravarClick(Sender: TObject);
begin
  PostEnderecos;
  Close;
end;

procedure TfrmCadEnderecosAd.cbCidadeEndExit(Sender: TObject);
begin
  dsEnderecos.DataSet.FieldByName('CID_CODIGO').Value := dmLookups.qyLkCidadesCID_CODIGO.Value;
  dsEnderecos.DataSet.FieldByName('UF_SIGLA').Value := dmLookups.qyLkCidadesUF_SIGLA.Value;
end;

procedure TfrmCadEnderecosAd.cbTipoEndExit(Sender: TObject);
begin
  if dsEnderecos.DataSet.State in [dsInsert, dsEdit] then
    dsEnderecos.DataSet.FieldByName('TPE_CODIGO').Value := dmLookups.qyLkTpEnderecoTPE_CODIGO.Value;
end;

procedure TfrmCadEnderecosAd.cbTpLogradouroEndExit(Sender: TObject);
begin
  if dsEnderecos.DataSet.State in [dsInsert, dsEdit] then
    dsEnderecos.DataSet.FieldByName('TPL_CODIGO').Value := dmLookups.qyLkTpLogradouroTPL_CODIGO.Value;
end;

procedure TfrmCadEnderecosAd.FormActivate(Sender: TObject);
begin
  inherited;
  vgBuscaCEP := BuscaCEP;
  InsEnderecos;
  dsEnderecos.DataSet.FieldByName('PES_CODIGO').Value := vgCodClienteEnd;
  cbTipoEnd.PerformSearch;
  cbTpLogradouroEnd.PerformSearch;
  cbCidadeEnd.PerformSearch;
  dsEnderecos.DataSet.FieldByName('UF_SIGLA').Value := dmLookups.qyLkCidadesUF_SIGLA.Value;
  if vgBuscaCEP = 'S' then
    if ConectadoWeb = True then
      frmBuscaCEP.ShowModal;
  cbTipoEnd.SetFocus;
end;

procedure TfrmCadEnderecosAd.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if dsEnderecos.DataSet.State in [dsInsert, dsEdit] then
  begin
    if MessageDlg('Existem informações pendentes que serão perdidas,' + #13 +
                  'deseja fechar assim mesmo?', mtConfirmation, [mbYes, mbNo], 0)
                   = mrYes then
    begin
      dsEnderecos.DataSet.Cancel;
      CanClose := True;
    end
    else
      CanClose := False;
  end;
end;

procedure TfrmCadEnderecosAd.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

end.
