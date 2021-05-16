unit uCadPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpCadastro, Data.DB, Vcl.ImgList,
  Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, wwdbedit, Wwdotdot, Wwdbcomb, Vcl.Mask, Vcl.DBCtrls, wwdblook,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, wwriched, wwdbdatetimepicker,
  Wwdbdlg, JvExControls, JvDBLookup, Wwdbigrd, Wwdbgrid;

type
  TfrmCadPessoas = class(TfrmTmpCadastro)
    PageCadastro: TPageControl;
    tsCadastro: TTabSheet;
    Label1: TLabel;
    dbCodigo: TDBEdit;
    cbTipo: TwwDBComboBox;
    Label2: TLabel;
    Label3: TLabel;
    dbNome: TDBEdit;
    Label4: TLabel;
    dbFantasia: TDBEdit;
    Label5: TLabel;
    dbDocumento: TDBEdit;
    Label6: TLabel;
    dbIdentificacao: TDBEdit;
    cbTpLogradouro: TwwDBLookupCombo;
    Label7: TLabel;
    dbLogradouro: TDBEdit;
    Label8: TLabel;
    dbNumero: TDBEdit;
    Label9: TLabel;
    dbComplemento: TDBEdit;
    Label10: TLabel;
    dbBairro: TDBEdit;
    Label11: TLabel;
    cbCidade: TwwDBLookupCombo;
    Label12: TLabel;
    dbCodMunicipio: TDBEdit;
    Label13: TLabel;
    dbUf: TDBEdit;
    Label14: TLabel;
    dbPtRefer: TDBEdit;
    Label15: TLabel;
    dbFone: TDBEdit;
    Label16: TLabel;
    dbCep: TDBEdit;
    cbAtivo: TwwDBComboBox;
    Label17: TLabel;
    tsEnderecos: TTabSheet;
    tsContatos: TTabSheet;
    tsFinanceira: TTabSheet;
    Label18: TLabel;
    dsEnderecos: TDataSource;
    cbTipoEnd: TwwDBLookupCombo;
    pnEnderecos: TPanel;
    Label19: TLabel;
    cbTpLogradouroEnd: TwwDBLookupCombo;
    spAnterior: TSpeedButton;
    spProxima: TSpeedButton;
    Label20: TLabel;
    dbLogradouroEnd: TDBEdit;
    Label21: TLabel;
    dbNumeroEnd: TDBEdit;
    Label22: TLabel;
    dbComplementoEnd: TDBEdit;
    Label23: TLabel;
    dbBairroEnd: TDBEdit;
    Label24: TLabel;
    Label25: TLabel;
    dbUfEnd: TDBEdit;
    dbPtReferenciaEnd: TDBEdit;
    Label27: TLabel;
    dbCepEnd: TDBEdit;
    Label28: TLabel;
    cbCidadeEnd: TwwDBLookupCombo;
    GridEnderecos: TJvDBGrid;
    sbNovoEnd: TSpeedButton;
    sbExcluirEnd: TSpeedButton;
    sbGravarEnd: TSpeedButton;
    sbCancelarEnd: TSpeedButton;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    PageContatos: TPageControl;
    tsEnderecosElet: TTabSheet;
    tsTelefones: TTabSheet;
    Panel1: TPanel;
    sbNovoEndElet: TSpeedButton;
    sbExcluirEndElet: TSpeedButton;
    sbGravarEndElet: TSpeedButton;
    sbCancelarEndElet: TSpeedButton;
    Panel2: TPanel;
    sbNovoFone: TSpeedButton;
    sbExcluirFone: TSpeedButton;
    sbGravarFone: TSpeedButton;
    sbCancelarFone: TSpeedButton;
    Panel3: TPanel;
    sbGravarFicha: TSpeedButton;
    sbCancelarFicha: TSpeedButton;
    dsFones: TDataSource;
    Label30: TLabel;
    dbNumeroFone: TDBEdit;
    Label31: TLabel;
    dbContatoFone: TDBEdit;
    Label26: TLabel;
    Label29: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    cbSetores: TwwDBLookupCombo;
    cbTipoFone: TwwDBLookupCombo;
    GridFones: TJvDBGrid;
    Label34: TLabel;
    dsEndEletro: TDataSource;
    wwDBLookupCombo1: TwwDBLookupCombo;
    cbTpEndEletro: TwwDBLookupCombo;
    Label35: TLabel;
    cbSetorEndEletro: TwwDBLookupCombo;
    Label36: TLabel;
    dbEnderecoElet: TDBEdit;
    Label37: TLabel;
    dbContato: TDBEdit;
    GridEndEletro: TJvDBGrid;
    tsObs: TTabSheet;
    dsObs: TDataSource;
    Panel4: TPanel;
    sbSalvarObs: TSpeedButton;
    sbCancelarObs: TSpeedButton;
    memObs: TDBMemo;
    Label40: TLabel;
    dbDataCad: TDBEdit;
    dbEmail: TDBEdit;
    Label41: TLabel;
    dsPessoasFinanc: TDataSource;
    Label42: TLabel;
    Label43: TLabel;
    dbLimite: TDBEdit;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    dbSalario: TDBEdit;
    cbTabela: TwwDBComboBox;
    cbInadimplencia: TwwDBComboBox;
    cbConsFin: TwwDBComboBox;
    sbNovaFicha: TSpeedButton;
    sbExcluirFicha: TSpeedButton;
    Label47: TLabel;
    cbContICMS: TwwDBComboBox;
    dsLkProcRacas: TDataSource;
    procedure FormDestroy(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
    procedure actAtualizarExecute(Sender: TObject);
    procedure actProcurarExecute(Sender: TObject);
    procedure cbTpLogradouroExit(Sender: TObject);
    procedure cbCidadeExit(Sender: TObject);
    procedure spProximaClick(Sender: TObject);
    procedure spAnteriorClick(Sender: TObject);
    procedure tsCadastroShow(Sender: TObject);
    procedure tsFinanceiraShow(Sender: TObject);
    procedure tsEnderecosShow(Sender: TObject);
    procedure tsContatosShow(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure sbNovoEndClick(Sender: TObject);
    procedure sbExcluirEndClick(Sender: TObject);
    procedure sbGravarEndClick(Sender: TObject);
    procedure sbCancelarEndClick(Sender: TObject);
    procedure dsEnderecosStateChange(Sender: TObject);
    procedure cbTipoEndExit(Sender: TObject);
    procedure cbTpLogradouroEndExit(Sender: TObject);
    procedure cbCidadeEndExit(Sender: TObject);
    procedure sbNovoFoneClick(Sender: TObject);
    procedure sbExcluirFoneClick(Sender: TObject);
    procedure sbGravarFoneClick(Sender: TObject);
    procedure sbCancelarFoneClick(Sender: TObject);
    procedure cbSetoresExit(Sender: TObject);
    procedure cbTipoFoneExit(Sender: TObject);
    procedure dsFonesStateChange(Sender: TObject);
    procedure sbNovoEndEletClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsEndEletroStateChange(Sender: TObject);
    procedure sbExcluirEndEletClick(Sender: TObject);
    procedure sbGravarEndEletClick(Sender: TObject);
    procedure sbCancelarEndEletClick(Sender: TObject);
    procedure cbTpEndEletroExit(Sender: TObject);
    procedure cbSetorEndEletroExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dsObsStateChange(Sender: TObject);
    procedure sbSalvarObsClick(Sender: TObject);
    procedure sbCancelarObsClick(Sender: TObject);
    procedure dsPessoasFinancStateChange(Sender: TObject);
    procedure sbCancelarFichaClick(Sender: TObject);
    procedure sbGravarFichaClick(Sender: TObject);
    procedure sbExcluirFichaClick(Sender: TObject);
    procedure sbNovaFichaClick(Sender: TObject);
    procedure cbTipoExit(Sender: TObject);
    procedure dbNomeExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPessoas: TfrmCadPessoas;

implementation

{$R *.dfm}

uses dataPessoas, dataLookups, uDaoLookups, uDaoPessoas, uProcPessoas,
  uDaoEnderecos, uFuncoesValidacao, uDaoFones, uFuncoesDB, uDaoEndeletro,
  uDaoPessoasobs, uVarGlobal, uDaoConfig, uBuscaCEP, uFuncoesWeb,
  uDaoPessoasFinanc;

procedure TfrmCadPessoas.actAlterarExecute(Sender: TObject);
begin
  inherited;
  PageCadastro.ActivePage := tsCadastro;
  dbNome.SetFocus;
end;

procedure TfrmCadPessoas.actAtualizarExecute(Sender: TObject);
begin
  dsCadastro.DataSet.Refresh;
end;

procedure TfrmCadPessoas.actGravarExecute(Sender: TObject);
Var
vValida: Boolean;
begin
  vValida := False;
  //Verifica CPF
  if dsCadastro.DataSet.FieldByName('PES_TIPO').Text = 'F' then
  begin
    if Cpf(dsCadastro.DataSet.FieldByName('PES_DOCUMENTO').Text) = True then
      vValida := True
    else
    begin
      vValida := False;
      MessageDlg('Número de CPF inválido!', mtWarning, [mbOk], 0);
    end;
  end;
  //Verifica CNPJ
  if dsCadastro.DataSet.FieldByName('PES_TIPO').Text = 'J' then
  begin
    if Cnpj(dsCadastro.DataSet.FieldByName('PES_DOCUMENTO').Text) = True then
      vValida := True
    else
    begin
      vValida := False;
      MessageDlg('Número de CNPJ inválido!', mtWarning, [mbOk], 0);
    end;
  end;
  //Verifica CEP
  if VerificaCEP(dsCadastro.DataSet.FieldByName('PES_CEP').Text, dsCadastro.DataSet.FieldByName('UF_SIGLA').Text) = False then
  begin
    vValida := False;
    MessageDlg('O CEP: ' + dbCep.Text +' está fora da área selecionada: ' + dbUf.Text, mtWarning, [mbOk], 0);
  end;
  if vValida = True then
  begin
    if dsCadastro.DataSet.State in [dsInsert] then
      dsCadastro.DataSet.FieldByName('PES_CODIGO').Value := GetCodigo('PES_CODIGO', 'PESSOAS');
    inherited;
    AtualizarLookup('PESSOAS');
  end;
end;

procedure TfrmCadPessoas.actLimparExecute(Sender: TObject);
begin
  inherited;
  ListarPessoas('PES_NOME');
  sbPrincipal.Panels[3].Text := 'Inativo';
  inherited;
end;

procedure TfrmCadPessoas.actNovoExecute(Sender: TObject);
begin
  inherited;
  PageCadastro.ActivePage := tsCadastro;
  cbCidade.PerformSearch;
  dsCadastro.DataSet.FieldByName('UF_SIGLA').Text := dmLookups.qyLkCidadesUF_SIGLA.Text;
  if vgBuscaCEP = 'S' then
    if ConectadoWeb = True then
      frmBuscaCEP.ShowModal;
  cbTpLogradouro.Text := dsCadastro.DataSet.FieldByName('TPL_DESCRICAO').Text;
  cbTpLogradouro.PerformSearch;
  cbTipo.SetFocus;
end;

procedure TfrmCadPessoas.actProcurarExecute(Sender: TObject);
begin
  ListarPessoas('PES_NOME');
  frmProcPessoas.ShowModal;
end;

procedure TfrmCadPessoas.cbCidadeExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
  begin
    dsCadastro.DataSet.FieldByName('CID_CODIGO').Value := dmLookups.qyLkCidadesCID_CODIGO.Value;
    dsCadastro.DataSet.FieldByName('UF_SIGLA').Value := dmLookups.qyLkCidadesUF_SIGLA.Value;
  end;
end;

procedure TfrmCadPessoas.cbSetorEndEletroExit(Sender: TObject);
begin
  if dsEndEletro.DataSet.State in [dsInsert, dsEdit] then
    dsEndEletro.DataSet.FieldByName('SET_CODIGO').Value := dmLookups.qyLkSetorSET_CODIGO.Value;
end;

procedure TfrmCadPessoas.cbSetoresExit(Sender: TObject);
begin
  if dsFones.DataSet.State in [dsEdit, dsInsert] then
    dsFones.DataSet.FieldByName('SET_CODIGO').Value := dmLookups.qyLkSetorSET_CODIGO.Value;
end;

procedure TfrmCadPessoas.cbTipoEndExit(Sender: TObject);
begin
  if dsEnderecos.DataSet.State in [dsInsert, dsEdit] then
    dsEnderecos.DataSet.FieldByName('TPE_CODIGO').Value := dmLookups.qyLkTpEnderecoTPE_CODIGO.Value;
end;

procedure TfrmCadPessoas.cbTipoExit(Sender: TObject);
begin
  if dsCadastro.DataSet.State in [dsInsert] then
  begin
    if dsCadastro.DataSet.FieldByName('pes_tipo').Text = 'F' then
      dmPessoas.qyPessoasPES_DOCUMENTO.EditMask := '000.000.000-00'
    else
      dmPessoas.qyPessoasPES_DOCUMENTO.EditMask := '00.000.000/0000-00';
  end;
end;

procedure TfrmCadPessoas.cbTipoFoneExit(Sender: TObject);
begin
  if dsFones.DataSet.State in [dsEdit, dsInsert] then
  begin
    dsFones.DataSet.FieldByName('TPF_CODIGO').Value := dmLookups.qyLkTpFoneTPF_CODIGO.Value;
    dmPessoas.qyFonesFON_NUMERO.EditMask := dmLookups.qyLkTpFoneTPF_MASCARA.Text;
  end;
end;

procedure TfrmCadPessoas.cbTpEndEletroExit(Sender: TObject);
begin
  if dsEndEletro.DataSet.State in [dsInsert, dsEdit] then
    dsEndEletro.DataSet.FieldByName('TPN_CODIGO').Value := dmLookups.qyLkEndEletroTipoTPN_CODIGO.Value;
end;

procedure TfrmCadPessoas.cbTpLogradouroEndExit(Sender: TObject);
begin
  if dsEnderecos.DataSet.State in [dsInsert, dsEdit] then
    dsEnderecos.DataSet.FieldByName('TPL_CODIGO').Value := dmLookups.qyLkTpLogradouroTPL_CODIGO.Value;
end;

procedure TfrmCadPessoas.cbTpLogradouroExit(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.State in [dsEdit, dsInsert] then
    dsCadastro.DataSet.FieldByName('TPL_CODIGO').Value := dmLookups.qyLkTpLogradouroTPL_CODIGO.Value;
end;

procedure TfrmCadPessoas.dbNomeExit(Sender: TObject);
begin
  if dsCadastro.DataSet.State in [dsInsert] then
    if dsCadastro.DataSet.FieldByName('pes_nomefantasia').IsNull then
      dsCadastro.DataSet.FieldByName('pes_nomefantasia').Text := dsCadastro.DataSet.FieldByName('pes_nome').Text;
end;

procedure TfrmCadPessoas.dsCadastroDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if dsCadastro.DataSet.FieldByName('PES_CODIGO').IsNull then
  begin
    Self.panCaption.Caption := 'Cadastro de Pessoas';
    FiltrarEnderecos('PES_CODIGO', '=', '0', '0');
    FiltrarFones('PES_CODIGO', '=', '0', '0');
    FiltrarEndEletro('PES_CODIGO', '=', '0', '0');
    FiltrarPessoasObs('PES_CODIGO', '=', '0', '0');
    FiltrarPessoasFinanc('pes_codigo', '=', '0', '0');
  end
  else
  begin
    Self.panCaption.Caption := 'Cadastro de Pessoas: ' + dsCadastro.DataSet.FieldByName('PES_NOME').Text;
    FiltrarEnderecos('PES_CODIGO', '=', IntToStr(dsCadastro.DataSet.FieldByName('PES_CODIGO').Value), 'TPE_CODIGO');
    FiltrarFones('PES_CODIGO', '=', IntToStr(dsCadastro.DataSet.FieldByName('PES_CODIGO').Value), 'SET_DESCRICAO');
    FiltrarEndEletro('PES_CODIGO', '=', IntToStr(dsCadastro.DataSet.FieldByName('PES_CODIGO').Value), 'ENL_CODIGO');
    FiltrarPessoasObs('PES_CODIGO', '=', IntToStr(dsCadastro.DataSet.FieldByName('PES_CODIGO').Value), '0');
    FiltrarPessoasFinanc('pes_codigo', '=', IntToStr(dsCadastro.DataSet.FieldByName('PES_CODIGO').Value), '0');
  end;
end;

procedure TfrmCadPessoas.dsEndEletroStateChange(Sender: TObject);
begin
  if dsEndEletro.DataSet.State in [dsEdit, dsInsert] then
  begin
    sbNovoEndElet.Enabled := False;
    sbExcluirEndElet.Enabled := False;
    sbGravarEndElet.Enabled := True;
    sbCancelarEndElet.Enabled := True;
  end
  else
  begin
    sbNovoEndElet.Enabled := True;
    sbExcluirEndElet.Enabled := True;
    sbGravarEndElet.Enabled := False;
    sbCancelarEndElet.Enabled := False;
  end;
end;

procedure TfrmCadPessoas.dsEnderecosStateChange(Sender: TObject);
begin
  if dsEnderecos.DataSet.State in [dsEdit, dsInsert] then
  begin
    sbNovoEnd.Enabled := False;
    sbExcluirEnd.Enabled := False;
    sbGravarEnd.Enabled := True;
    sbCancelarEnd.Enabled := True;
  end
  else
  begin
    sbNovoEnd.Enabled := True;
    sbExcluirEnd.Enabled := True;
    sbGravarEnd.Enabled := False;
    sbCancelarEnd.Enabled := False;
  end;
end;

procedure TfrmCadPessoas.dsFonesStateChange(Sender: TObject);
begin
  if dsFones.DataSet.State in [dsEdit, dsInsert] then
  begin
    sbNovoFone.Enabled := False;
    sbExcluirFone.Enabled := False;
    sbGravarFone.Enabled := True;
    sbCancelarFone.Enabled := True;
  end
  else
  begin
    sbNovoFone.Enabled := True;
    sbExcluirFone.Enabled := True;
    sbGravarFone.Enabled := False;
    sbCancelarFone.Enabled := False;
  end;
end;

procedure TfrmCadPessoas.dsObsStateChange(Sender: TObject);
begin
  if dsObs.DataSet.State in [dsEdit, dsInsert] then
  begin
    SetPesObs(dsCadastro.DataSet.FieldByName('PES_CODIGO').Value);
    sbSalvarObs.Enabled := True;
    sbCancelarObs.Enabled := True;
  end
  else
  begin
    sbSalvarObs.Enabled := False;
    sbCancelarObs.Enabled := False;
  end;
end;

procedure TfrmCadPessoas.dsPessoasFinancStateChange(Sender: TObject);
begin
  if dsPessoasFinanc.DataSet.State in [dsEdit, dsInsert] then
  begin
    sbNovaFicha.Enabled := False;
    sbExcluirFicha.Enabled := False;
    sbGravarFicha.Enabled := True;
    sbCancelarFicha.Enabled := True;
  end
  else
  begin
    sbNovaFicha.Enabled := True;
    sbExcluirFicha.Enabled := True;
    sbGravarFicha.Enabled := False;
    sbCancelarFicha.Enabled := False;
  end;
end;

procedure TfrmCadPessoas.FormActivate(Sender: TObject);
begin
  inherited;
  vgBuscaCEP := BuscaCEP;
  dsEnderecos.DataSet.Active := True;
  PageCadastro.ActivePageIndex := 0;
  PageContatos.ActivePageIndex := 0;
  spAnterior.Enabled := False;
  ListarPessoas('PES_NOME');
end;

procedure TfrmCadPessoas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsEnderecos.DataSet.State in [dsInsert, dsEdit] then
    dsEnderecos.DataSet.Cancel;
  if dsFones.DataSet.State in [dsInsert, dsEdit] then
    dsFones.DataSet.Cancel;
  if dsEndEletro.DataSet.State in [dsInsert, dsEdit] then
    dsEndEletro.DataSet.Cancel;
  if dsObs.DataSet.State in [dsInsert, dsEdit] then
    dsObs.DataSet.Cancel;
  if dsPessoasFinanc.DataSet.State in [dsInsert, dsEdit] then
    dsPessoasFinanc.DataSet.Cancel;
  inherited;
end;

procedure TfrmCadPessoas.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmCadPessoas <> nil then
    frmCadPessoas := nil;
end;

procedure TfrmCadPessoas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

procedure TfrmCadPessoas.sbCancelarEndClick(Sender: TObject);
begin
  dsEnderecos.DataSet.Cancel;
end;

procedure TfrmCadPessoas.sbCancelarEndEletClick(Sender: TObject);
begin
  dsEndEletro.DataSet.Cancel;
end;

procedure TfrmCadPessoas.sbCancelarFichaClick(Sender: TObject);
begin
  dsPessoasFinanc.DataSet.Cancel;
end;

procedure TfrmCadPessoas.sbCancelarFoneClick(Sender: TObject);
begin
  dsFones.DataSet.Cancel;
end;

procedure TfrmCadPessoas.sbCancelarObsClick(Sender: TObject);
begin
  dsObs.DataSet.Cancel;
end;

procedure TfrmCadPessoas.sbExcluirEndClick(Sender: TObject);
begin
  if dsEnderecos.DataSet.FieldByName('END_CODIGO').IsNull then
    MessageDlg('Registro não encontrado!', mtWarning, [mbOk], 0)
  else
  if MessageDlg('Deseja realmente excluir o registro ' + cbTipoEnd.Text + ' - ' + cbTpLogradouroEnd.Text + ': ' +
                dbLogradouroEnd.Text + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    DelEnderecos;
end;

procedure TfrmCadPessoas.sbExcluirEndEletClick(Sender: TObject);
begin
  if dsEndEletro.DataSet.FieldByName('ENL_CODIGO').IsNull then
    MessageDlg('Registro não encontrado!', mtWarning, [mbOk], 0)
  else
    if MessageDlg('Deseja realmente excluir o registro ' + cbTpEndEletro.Text + ' - ' +
                  dbEnderecoElet.Text + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      DelEndEletro;
end;

procedure TfrmCadPessoas.sbExcluirFichaClick(Sender: TObject);
begin
  if dsPessoasFinanc.DataSet.FieldByName('pes_codigo').IsNull then
    MessageDlg('Registro não encontrado!', mtWarning, [mbOk], 0)
  else
    if MessageDlg('Deseja realmente excluir a ficha financeira?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      DelPessoasFinanc;
end;

procedure TfrmCadPessoas.sbExcluirFoneClick(Sender: TObject);
begin
  if dsFones.DataSet.FieldByName('FON_CODIGO').IsNull then
    MessageDlg('Registro não encontrado!', mtWarning, [mbOk], 0)
  else
    if MessageDlg('Deseja realmente excluir o registro ' + cbSetores.Text + ' - ' +
                  dbNumeroFone.Text + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      DelFones;
end;

procedure TfrmCadPessoas.sbGravarEndClick(Sender: TObject);
begin
  if VerificaCEP(dbCepEnd.Text, dbUfEnd.Text) = True then
    PostEnderecos
  else
    MessageDlg('O CEP: ' + dbCepEnd.Text +' está fora da área selecionada: ' + dbUfEnd.Text, mtWarning, [mbOk], 0);
end;

procedure TfrmCadPessoas.sbGravarEndEletClick(Sender: TObject);
begin
  PostEndEletro;
end;

procedure TfrmCadPessoas.sbGravarFichaClick(Sender: TObject);
begin
  PostPessoasFinanc;
end;

procedure TfrmCadPessoas.sbGravarFoneClick(Sender: TObject);
begin
  PostFones;
end;

procedure TfrmCadPessoas.sbNovaFichaClick(Sender: TObject);
begin
  if dsPessoasFinanc.DataSet.FieldByName('pes_codigo').IsNull then
  begin
    InsPessoasFinanc;
    SetCodPessoaFin(dsCadastro.DataSet.FieldByName('PES_CODIGO').Value);
  end
  else
    EdtPessoasFinanc;
  cbTabela.SetFocus;
end;

procedure TfrmCadPessoas.sbNovoEndClick(Sender: TObject);
begin
  InsEnderecos;
  dsEnderecos.DataSet.FieldByName('PES_CODIGO').Value := dsCadastro.DataSet.FieldByName('PES_CODIGO').Value;
  cbTipoEnd.PerformSearch;
  cbTpLogradouroEnd.PerformSearch;
  cbCidadeEnd.PerformSearch;
  dsEnderecos.DataSet.FieldByName('UF_SIGLA').Value := dmLookups.qyLkCidadesUF_SIGLA.Value;
  if vgBuscaCEP = 'S' then
    if ConectadoWeb = True then
      frmBuscaCEP.ShowModal;
  cbTipoEnd.SetFocus;
end;

procedure TfrmCadPessoas.sbNovoEndEletClick(Sender: TObject);
begin
  InsEndEletro;
  dsEndEletro.DataSet.FieldByName('PES_CODIGO').Value := dsCadastro.DataSet.FieldByName('PES_CODIGO').Value;
  cbTpEndEletro.Text := GetTpEndEletroPadrao;
  cbTpEndEletro.PerformSearch;
  cbSetorEndEletro.Text := GetSetorPadrao;
  cbSetorEndEletro.PerformSearch;
  cbTpEndEletro.SetFocus;
end;

procedure TfrmCadPessoas.sbNovoFoneClick(Sender: TObject);
begin
  InsFones;
  dsFones.DataSet.FieldByName('PES_CODIGO').Value := dsCadastro.DataSet.FieldByName('PES_CODIGO').Value;
  cbSetores.Text := GetSetorPadrao;
  cbSetores.PerformSearch;
  dsFones.DataSet.FieldByName('SET_DESCRICAO').Text := cbSetores.Text;
  cbTipoFone.Text := GetTipoFonePadrao;
  cbTipoFone.PerformSearch;
  dsFones.DataSet.FieldByName('TPF_DESCRICAO').Text := cbTipoFone.Text;
  cbSetores.SetFocus;
end;

procedure TfrmCadPessoas.sbSalvarObsClick(Sender: TObject);
begin
  PostPessoasobs;
end;

procedure TfrmCadPessoas.spAnteriorClick(Sender: TObject);
begin
  spProxima.Enabled := True;
  if PageCadastro.ActivePage <> tsCadastro then
    PageCadastro.ActivePageIndex := PageCadastro.ActivePageIndex - 1;
end;

procedure TfrmCadPessoas.spProximaClick(Sender: TObject);
begin
  spAnterior.Enabled := True;
  if PageCadastro.ActivePage <> tsFinanceira then
    PageCadastro.ActivePageIndex := PageCadastro.ActivePageIndex + 1;
end;

procedure TfrmCadPessoas.tsCadastroShow(Sender: TObject);
begin
  spAnterior.Enabled := False;
  spProxima.Enabled := True;
end;

procedure TfrmCadPessoas.tsContatosShow(Sender: TObject);
begin
  spAnterior.Enabled := True;
  spProxima.Enabled := True;
end;

procedure TfrmCadPessoas.tsEnderecosShow(Sender: TObject);
begin
  spAnterior.Enabled := True;
  spProxima.Enabled := True;
end;

procedure TfrmCadPessoas.tsFinanceiraShow(Sender: TObject);
begin
  spAnterior.Enabled := True;
  spProxima.Enabled := False;
end;

procedure TfrmCadPessoas.cbCidadeEndExit(Sender: TObject);
begin
  if dsEnderecos.DataSet.State in [dsInsert, dsEdit] then
  begin
    dsEnderecos.DataSet.FieldByName('CID_CODIGO').Value := dmLookups.qyLkCidadesCID_CODIGO.Value;
    dsEnderecos.DataSet.FieldByName('UF_SIGLA').Value := dmLookups.qyLkCidadesUF_SIGLA.Value;
  end;
end;

end.
