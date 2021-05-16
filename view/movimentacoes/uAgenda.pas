unit uAgenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormMDI, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Wwdbigrd, Wwdbgrid, wwdblook,
  Vcl.ComCtrls, Vcl.Menus, Vcl.ImgList, Vcl.ActnList, uClassPreVendas,
  System.ImageList, System.Actions;

type
  TfrmAgenda = class(TfrmTmpFormMDI)
    pnCaption: TPanel;
    sbFechar: TSpeedButton;
    sbMinimizar: TSpeedButton;
    pnTop: TPanel;
    GridAgenda: TwwDBGrid;
    dsConsAgenda: TDataSource;
    Label1: TLabel;
    dtpData: TDateTimePicker;
    Label2: TLabel;
    btLimpar: TBitBtn;
    sbNew: TSpeedButton;
    sbDelete: TSpeedButton;
    cbProcQuadras: TwwDBLookupCombo;
    ActionList: TActionList;
    actAgendar: TAction;
    actCancelar: TAction;
    actFinalizar: TAction;
    actObs: TAction;
    ImageList: TImageList;
    PopupMenu: TPopupMenu;
    sbFinalizar: TSpeedButton;
    sbObs: TSpeedButton;
    Agendar1: TMenuItem;
    Cancelar1: TMenuItem;
    N1: TMenuItem;
    Finalizar1: TMenuItem;
    N2: TMenuItem;
    Obs1: TMenuItem;
    pnDataSel: TPanel;
    dsAgeItens: TDataSource;
    btOverview: TBitBtn;
    actReplicar: TAction;
    N3: TMenuItem;
    Replicar1: TMenuItem;
    procedure Limpar;
    procedure Filtrar;
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbMinimizarClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actAgendarExecute(Sender: TObject);
    procedure GridAgendaDblClick(Sender: TObject);
    procedure dtpDataExit(Sender: TObject);
    procedure cbProcQuadrasExit(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actObsExecute(Sender: TObject);
    function GeraNovaPV: Integer;
    procedure actFinalizarExecute(Sender: TObject);
    procedure btOverviewClick(Sender: TObject);
    procedure actReplicarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgenda: TfrmAgenda;

implementation

{$R *.dfm}

uses uDaoAgenda, uVarGlobal, dataConsultas, uDaoLookups, dataLookups,
  uAgendamento, uAgendaObs, uDaoAgeItens, uFuncoesDatas, uDaoPrevendas,
  uFuncoesDB, uDaoPessoas, uClassPessoasend, uClassPrevitens, uDaoPessoasFinanc,
  uDaoPrevItens, uDaoProdutos, uFuncoesSistema, uPrevenda, dataDiversos,
  dataGestao, uConsAgenda, uReplicar, uDaoQuadras, uFuncoesFormatacao;

procedure TfrmAgenda.Limpar;
Var
vCodQda: String;
begin
  dtpData.Date := now;
  cbProcQuadras.Text := dmLookups.qyLkQuadrasqda_descricao.Text;
  cbProcQuadras.PerformSearch;
  if ((cbProcQuadras.Text = '') or (cbProcQuadras.Text = ' ')) then
    vCodQda := '0'
  else
    vCodQda := IntToStr(dmLookups.qyLkQuadrasqda_codigo.Value);
  ConsultarAgenda(FormatDateTime(vgMaskData, dtpData.Date),
                  IntToStr(dmLookups.qyLkQuadrasqda_codigo.Value));
  pnDataSel.Caption := 'Data selecionada: ' + FormatDateTime(vgMaskData, dtpData.Date) +
                       ' - ' + DiaDaSemana(dtpData.Date);
end;

procedure TfrmAgenda.Filtrar;
Var
vCodQda: String;
begin
  if ((cbProcQuadras.Text = '') or (cbProcQuadras.Text = ' ')) then
    vCodQda := '0'
  else
    vCodQda := IntToStr(dmLookups.qyLkQuadrasqda_codigo.Value);
  ConsultarAgenda(FormatDateTime(vgMaskData, dtpData.Date), vCodQda);
  pnDataSel.Caption := 'Data selecionada: ' + FormatDateTime('dd/MM/yyyy', dtpData.Date) +
                       ' - ' + DiaDaSemana(dtpData.Date);
end;

procedure TfrmAgenda.actAgendarExecute(Sender: TObject);
begin
  if dsConsAgenda.DataSet.FieldByName('qda_codigo').IsNull then
  begin
    vgAgQda := dmLookups.qyLkQuadrasqda_descricao.Text;
    vgAgCodQda := dmLookups.qyLkQuadrasqda_codigo.Text;
    vgAgData := dtpData.Date;
    vgAgHora := dsConsAgenda.DataSet.FieldByName('hor_horas').Value;
    frmAgendamento.ShowModal;
    dsConsAgenda.DataSet.Refresh;
  end
  else
    MessageDlg('Este horário já possui agendamento!', mtWarning, [mbOk], 0);
end;

procedure TfrmAgenda.actCancelarExecute(Sender: TObject);
begin
  if Not(dsConsAgenda.DataSet.FieldByName('agd_codigo').IsNull) then
  begin
    if dsConsAgenda.DataSet.FieldByName('agd_atendimento').Value = 0 then
    begin
      if MessageDlg('Deseja realmente excluir o agendamento?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        FiltrarAgenda('agd_codigo', '=', IntToStr(dsConsAgenda.DataSet.FieldByName('agd_codigo').Value), '0');
        if dmGestao.qyAgendaagd_codigo.IsNull then
          MessageDlg('Agendamento não encontrado!', mtWarning, [mbOk], 0)
        else
        begin
          FiltrarAgeItens('i.agd_codigo', '=', IntToStr(dsConsAgenda.DataSet.FieldByName('agd_codigo').Value), '0');
          if Not(dmGestao.qyAgeItensagi_codigo.IsNull) then
            DelAgeItens;
          DelAgenda;
        end;
        dsConsAgenda.DataSet.Refresh;
      end;
    end
    else
      MessageDlg('Este agendamento já foi finalizado!', mtWarning, [mbOk], 0);
  end;
end;

function TfrmAgenda.GeraNovaPV: Integer;
Var
vPrevendas: TPrevendas;
vCodPV: Integer;
vTabDefault: Integer;
begin
  vPrevendas := TPrevendas.Create;
  vCodPV := GetCodigo('prv_numero', 'prevendas');
  vPrevendas.Numero := vCodPV;
  vPrevendas.Data := GetDateServerPG;
  vPrevendas.Codcliente := dsConsAgenda.DataSet.FieldByName('pes_codigo').Value;
  vPrevendas.Cliente := dsConsAgenda.DataSet.FieldByName('pes_nome').Value;
  vgPessoasEnd := TPessoasEnd.Create;
  GetEndereco(vPrevendas.Codcliente);
  vPrevendas.Logradouro := vgPessoasEnd.Logradouro;
  vPrevendas.Bairro := vgPessoasEnd.Bairro;
  vPrevendas.Codcidade := vgPessoasEnd.Codcidade;
  vPrevendas.Cidade := vgPessoasEnd.Cidade;
  vPrevendas.Uf := vgPessoasEnd.Uf;
  vPrevendas.Cep := vgPessoasEnd.Cep;
  vPrevendas.Numero := vgPessoasEnd.Numero;
  vgPessoasEnd.Free;
  vPrevendas.Fone := dsConsAgenda.DataSet.FieldByName('pes_fone').Value;
  vPrevendas.Codfuncionario := 0;
  vPrevendas.Funcionario := 'NÃO DEFINIDO';
  //Busca no cadastro do cliente a tabela padrão ------------------------
  vTabDefault := GetTabVen(dsConsAgenda.DataSet.FieldByName('pes_codigo').Value);
  vPrevendas.Tabvenda := vTabDefault;
  vPrevendas.Referente := 'Atendimento: ' + FormatFloat('000,000', (dsConsAgenda.DataSet.FieldByName('agd_codigo').Value));
  vPrevendas.Obs := '';
  vPrevendas.Vlrcusto := 0;
  vPrevendas.Subtotal := 0;
  vPrevendas.Vlrdesc := 0;
  vPrevendas.Percdesc := 0;
  vPrevendas.Vlrtotal := 0;
  vPrevendas.Permg := 0;
  vPrevendas.Codprazo := 1;
  vPrevendas.Prazo := 'À VISTA';
  vPrevendas.Codforma := 0;
  vPrevendas.Forma := 'DINHEIRO';
  vPrevendas.Vlrlucro := 0;
  vPrevendas.Modfrete := 1;
  vPrevendas.CodEntrega := 3;
  vPrevendas.Entrega := 'CLIENTE LEVA NA HORA';
  vPrevendas.Codstatus := 1;
  vPrevendas.Numorc := 0;
  InsPrevendas;
  SetValuesPrevendas(vPrevendas);
  PostPrevendas;
  vPrevendas.Free;
  Result := vCodPV;
end;

procedure TfrmAgenda.actFinalizarExecute(Sender: TObject);
Var
vCodPV: Integer;
vTabDefault: Integer;
vPrevItens: TPrevItens;
vPVOpen: Integer;
begin
  if Not(dsConsAgenda.DataSet.FieldByName('agd_codigo').IsNull) then
  begin
    if dsConsAgenda.DataSet.FieldByName('agd_atendimento').Value = 0 then
    begin
      if MessageDlg('Deseja realmente finalizar o atendimento?',
                    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        // Verifica se tem Pré-venda em aberto e reutiliza
        vPVOpen := VerifPVOpenCli(IntToStr(dsConsAgenda.DataSet.FieldByName('pes_codigo').Value));
        if vPVOpen <> 0 then
        begin
          if MessageDlg('A Pré-venda ' + FormatFloat('000,000', vPVOpen) + ' está em aberto, deseja utilizá-la?',
                        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            vCodPV := vPVOpen
          else
            vCodPV := GeraNovaPV;
        end
        else
          vCodPV := GeraNovaPV;
        //Filtra PV Selecionada ou Criada nova ---------------------------------
        FiltrarPrevendas('p.prv_numero', '=', IntToStr(vCodPV), '0');
        //Insere itens na PV ---------------------------------------------------
        FiltrarAgeItens('i.agd_codigo', '=', IntToStr(dsConsAgenda.DataSet.FieldByName('agd_codigo').Value), '0');
        if Not(dsAgeItens.DataSet.FieldByName('agd_codigo').IsNull) then
        begin
          vPrevItens := TPrevitens.Create;
          vPrevItens.Codigo := GetCodigo('pri_codigo', 'previtens');
          vPrevItens.Numero := vCodPV;
          vPrevItens.Quantidade := 1;
          vPrevItens.Codproduto := dsAgeItens.DataSet.FieldByName('pro_codigo').Value;
          FiltrarProdutos('p.pro_codigo', '=', IntToStr(vPrevItens.Codproduto), '0');
          vPrevItens.Produto := GetDescProd;
          vPrevItens.Unidade := GetUniProd;
          vPrevItens.Vlrcusto := GetCustoProd;
          vTabDefault := GetTabVen(dsConsAgenda.DataSet.FieldByName('pes_codigo').Value);
          if vTabDefault = 1 then
            vPrevItens.Vlrbruto := GetTab1Prod;
          if vTabDefault = 2 then
            vPrevItens.Vlrbruto := GetTab2Prod;
          vPrevItens.Vlrdesc := 0;
          vPrevItens.Percdesc := 0;
          vPrevItens.Vlrliq := vPrevItens.Vlrbruto;
          vPrevItens.Vlrtotal := vPrevItens.Vlrbruto;
          vPrevItens.Permg := (((vPrevItens.Vlrbruto / vPrevItens.Vlrcusto) -1) * 100);
          vPrevItens.Localizacao := GetLocalizacao;
          InsPrevItens;
          SetValuesPrevItens(vPrevItens);
          PostPrevItens;
          vPrevItens.Free;
        end;
        // Atualiza agenda número da PV --------------------------------------------
        FiltrarAgenda('agd_codigo', '=', IntToStr(dsConsAgenda.DataSet.FieldByName('agd_codigo').Value), '0');
        EdtAgenda;
        SetAtendimento(vCodPV);
        PostAgenda;
        if MessageDlg('Atendimento finalizado com sucesso!' + #13 + #13 +
                   'Pré-venda: ' + FormatFloat('000,000', vCodPV) + #13 + #13 +
                   'Deseja abrí-la agora?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          vgNumPVOpen := IntToStr(vCodPV);
          CriaFormMDI(TfrmPreVenda, frmPreVenda);
        end;
        dsConsAgenda.DataSet.Refresh;
      end;
    end
    else
      MessageDlg('Este agendamento já foi finalizado!' +#13+#13 + 'Pré-venda: ' +
                 dsConsAgenda.DataSet.FieldByName('agd_atendimento').Text,
                 mtWarning, [mbOk], 0);
  end;
end;

procedure TfrmAgenda.actObsExecute(Sender: TObject);
begin
  if Not(dsConsAgenda.DataSet.FieldByName('agd_codigo').IsNull) then
  begin
    FiltrarAgenda('a.agd_codigo', '=', IntToStr(dsConsAgenda.DataSet.FieldByName('agd_codigo').Value), '0');
    FiltrarAgeItens('a.agd_codigo', '=', IntToStr(dsConsAgenda.DataSet.FieldByName('agd_codigo').Value), 's.pro_descricao');
    frmAgendaObs.ShowModal;
  end;
end;

procedure TfrmAgenda.actReplicarExecute(Sender: TObject);
begin
  if Not(dsConsAgenda.DataSet.FieldByName('agd_codigo').IsNull) then
  begin
    vgAgQda := GetNameQuadra(dsConsAgenda.DataSet.FieldByName('qda_codigo').Text);
    vgAgCodQda := dsConsAgenda.DataSet.FieldByName('qda_codigo').Text;
    vgAgData := dsConsAgenda.DataSet.FieldByName('agd_dataag').Value;
    vgAgHora := dsConsAgenda.DataSet.FieldByName('hor_horas').Value;
    vgCodCliAge := IntToStr(dsConsAgenda.DataSet.FieldByName('pes_codigo').Value);
    vgCliAge := dsConsAgenda.DataSet.FieldByName('pes_nome').Text;
    frmReplicar.ShowModal;
  end;
end;

procedure TfrmAgenda.btLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmAgenda.btOverviewClick(Sender: TObject);
begin
  frmConsAgenda.ShowModal;
  Limpar;
end;

procedure TfrmAgenda.cbProcQuadrasExit(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmAgenda.dtpDataExit(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmAgenda.FormActivate(Sender: TObject);
begin
  inherited;
  Self.WindowState := wsMaximized;
  Limpar;
  dsConsAgenda.DataSet.Active := True;
end;

procedure TfrmAgenda.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmAgenda <> nil then
    frmAgenda := nil;
end;

procedure TfrmAgenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F12 then
    Limpar;
end;

procedure TfrmAgenda.GridAgendaDblClick(Sender: TObject);
begin
  if dsConsAgenda.DataSet.FieldByName('qda_codigo').IsNull then
    actAgendar.Execute
  else
    actFinalizar.Execute;
end;

procedure TfrmAgenda.sbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAgenda.sbMinimizarClick(Sender: TObject);
begin
  Self.WindowState := wsMinimized;
end;

end.
