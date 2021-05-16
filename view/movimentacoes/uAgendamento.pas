unit uAgendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, JvExControls, JvTFManager, JvTFGlance, JvTFWeeks,
  Vcl.Grids, Vcl.DBGrids, wwdblook, Data.DB;

type
  TfrmAgendamento = class(TfrmTmpFormNormal)
    pnTop: TPanel;
    Label1: TLabel;
    cbPessoas: TwwDBLookupCombo;
    memObs: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    cbServicos: TwwDBLookupCombo;
    GridServ: TDBGrid;
    dsServicos: TDataSource;
    btAgendar: TBitBtn;
    sbServ: TSpeedButton;
    Label2: TLabel;
    edQuadra: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbServClick(Sender: TObject);
    procedure btAgendarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgendamento: TfrmAgendamento;

implementation

{$R *.dfm}

uses uVarGlobal, uFuncoesDatas, uClassAgenda, dataLookups, dataTemp, uDaoAgenda,
uFuncoesDB, uDaoAgeItens, uDaoQuadras, uDaoProdutos;

procedure TfrmAgendamento.btAgendarClick(Sender: TObject);
Var
vAgenda: Tagenda;
vCodAgenda: Integer;
begin
  // Executa o agendamento -----------------------------------------------------
  vAgenda := TAgenda.Create;
  vCodAgenda := GetCodigo('agd_codigo', 'agenda');
  vAgenda.Codigo := vCodAgenda;
  vAgenda.Codpes := dmLookups.qyLkClientesPES_CODIGO.Value;
  vAgenda.CodQuadra := StrToInt(vgAgCodQda);
  vAgenda.Dataag := vgAgData;
  vAgenda.Horaag := vgAgHora;
  vAgenda.Datalanc := now;
  vAgenda.Horalanc := now;
  vAgenda.Obs := memObs.Text;
  vAgenda.Atendimento := 0;
  InsAgenda;
  SetValuesAgenda(vAgenda);
  PostAgenda;
  vAgenda.Free;
  // Verifica e lança o(s) produto(s) ------------------------------------------
  if Not(dmTemp.mdServicopro_codigo.IsNull) then
  begin
    InsAgeItens;
    SetValuesAgeItens(0, vCodAgenda, dmTemp.mdServicopro_codigo.Value);
    PostAgeItens;
  end;
  Close;
end;

procedure TfrmAgendamento.FormActivate(Sender: TObject);
Var
vCodProd: Integer;
begin
  inherited;
  memObs.Clear;
  cbPessoas.Text := '';
  cbPessoas.PerformSearch;
  cbServicos.Text := '';
  dsServicos.DataSet.Active := True;
  pnTop.Caption := vgAgQda + ' (' + vgAgCodQda + ') - ' +
                   FormatDateTime('dd/MM/yyyy', vgAgData) +
                   ' (' + DiaDaSemana(vgAgData) + ')' +
                   ' as ' + FormatDateTime(vgMaskHora, vgAgHora);
  edQuadra.Text := vgAgQda + ' (' + vgAgCodQda + ')';
  //Verifica se existe serviço vinculado e efetua o vínculo
  vCodProd := ConsQdaProd(vgAgCodQda);
  if vCodProd <> 0 then
  begin
    dmTemp.mdServico.Insert;
    FiltrarProdutos('pro_codigo', '=', IntToStr(vCodProd), '0');
    dmTemp.mdServicopro_codigo.Value := vCodProd;
    dmTemp.mdServicopro_descricao.Text := GetDescProd;
    dmTemp.mdServicouni_codigo.Text := GetUniProd;
    dmTemp.mdServico.Post;
  end;
  cbPessoas.SetFocus;
end;

procedure TfrmAgendamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsServicos.DataSet.Active := False;
  inherited;
end;

procedure TfrmAgendamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

procedure TfrmAgendamento.sbServClick(Sender: TObject);
begin
  if ((cbServicos.Text <> '') and (cbServicos.Text <> ' ')) then
  begin
    if (dmTemp.mdServicopro_codigo.IsNull) then
    begin
      dmTemp.mdServico.Insert;
      dmTemp.mdServicopro_codigo.Value := dmLookups.qyLkServicospro_codigo.Value;
      dmTemp.mdServicopro_descricao.Text := dmLookups.qyLkServicospro_descricao.Text;
      dmTemp.mdServicouni_codigo.Text := dmLookups.qyLkServicosuni_codigo.Text;
      dmTemp.mdServico.Post;
      cbServicos.Text := '';
    end;
  end;
end;

end.
