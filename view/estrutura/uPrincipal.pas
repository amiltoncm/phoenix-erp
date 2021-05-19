unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ToolWin, ComCtrls, Menus, ExtCtrls, ShellApi, Inifiles,
  ActnList, Registry, JvComponentBase, JvSerialMaker, Vcl.ActnMan, Vcl.Ribbon,
  Vcl.RibbonLunaStyleActnCtrls, Vcl.ActnCtrls, Vcl.ScreenTips, Vcl.ActnMenus,
  Vcl.RibbonActnMenus, JvExControls, JvButton, JvNavigationPane, Vcl.StdCtrls,
  Vcl.RibbonActnCtrls, Wwintl, System.Actions, System.ImageList,
  Vcl.RibbonObsidianStyleActnCtrls, Vcl.RibbonSilverStyleActnCtrls;

type
  TfrmPrincipal = class(TForm)
    Imagens16: TImageList;
    ImgFundoTela: TImage;
    Timer1: TTimer;
    StatusBarMain: TStatusBar;
    JvSerialMaker1: TJvSerialMaker;
    actManager: TActionManager;
    rbMain: TRibbon;
    rbPageCad: TRibbonPage;
    rgCadMain: TRibbonGroup;
    rgCadProd: TRibbonGroup;
    rgCadFin: TRibbonGroup;
    rgCadDiv: TRibbonGroup;
    rgCadCfg: TRibbonGroup;
    rbPageMov: TRibbonPage;
    rbMovCx: TRibbonGroup;
    rbMovPag: TRibbonGroup;
    rgMovCom: TRibbonGroup;
    rbPageCons: TRibbonPage;
    rgConsProdutos: TRibbonGroup;
    rbConsCaixa: TRibbonGroup;
    rbConPagar: TRibbonGroup;
    actCadPessoas: TAction;
    actCadUsuarios: TAction;
    actCadProdutos: TAction;
    actCadGrupos: TAction;
    actCadMarcas: TAction;
    actCadFuncionarios: TAction;
    actCadLocalizações: TAction;
    actCadUnidades: TAction;
    actCadBancos: TAction;
    actCadContas: TAction;
    actCadPlanoContas: TAction;
    actCadPrazo: TAction;
    actCadFormas: TAction;
    actCadCidades: TAction;
    actCadEstados: TAction;
    actCadPaises: TAction;
    actCadFuncoes: TAction;
    actCadSetores: TAction;
    actCadTpFone: TAction;
    actCadTpEnd: TAction;
    actCadTpEndEletro: TAction;
    actCadTpLograd: TAction;
    actEntCaixa: TAction;
    actSaiCaixa: TAction;
    actTransfCtas: TAction;
    actBxPagar: TAction;
    actImpXML: TAction;
    actLancPagar: TAction;
    actOrcamentos: TAction;
    actPreVendas: TAction;
    actConsProdutos: TAction;
    actConsCaixa: TAction;
    actConsPagar: TAction;
    actRelCaixa: TAction;
    actRelCaixaAg: TAction;
    actRelCaixaDet: TAction;
    actSaldo: TAction;
    actRelPagar: TAction;
    actRelPagas: TAction;
    actFechar: TAction;
    actBloquear: TAction;
    actSobre: TAction;
    actConfig: TAction;
    actEmpresa: TAction;
    actCfgBase: TAction;
    rbPageUteis: TRibbonPage;
    rgUtCfg: TRibbonGroup;
    rgUtTools: TRibbonGroup;
    rgUtSistema: TRibbonGroup;
    actBackup: TAction;
    actMaqReg: TAction;
    actCfgMail: TAction;
    actCfgEstacao: TAction;
    JvNavIconButton1: TJvNavIconButton;
    PopupJanelas: TPopupMenu;
    popMinWindows: TMenuItem;
    popMaxWindows: TMenuItem;
    N1: TMenuItem;
    popCloseWindow: TMenuItem;
    popCloseAllWindows: TMenuItem;
    N2: TMenuItem;
    SairdoSistema1: TMenuItem;
    actMaxWindows: TAction;
    actMinWindows: TAction;
    actCloseWindow: TAction;
    actCloseAll: TAction;
    actEntManual: TAction;
    rgMovRec: TRibbonGroup;
    actConsReceber: TAction;
    rbConReceber: TRibbonGroup;
    actConsReceberGer: TAction;
    actConsCred: TAction;
    rbConEstoque: TRibbonGroup;
    actConsProdMin: TAction;
    aactEstNeg: TAction;
    actBxCheques: TAction;
    actConsCheques: TAction;
    actConsPreVendas: TAction;
    rbConDiv: TRibbonGroup;
    rbMovCompras: TRibbonGroup;
    actCotacao: TAction;
    actAgenda: TAction;
    actOrdCompra: TAction;
    rgCadEsp: TRibbonGroup;
    actCadComandas: TAction;
    actMesas: TAction;
    actComandasOpen: TAction;
    actHorarios: TAction;
    rgCadSoccer: TRibbonGroup;
    actCadQuadras: TAction;
    rgMovSoccer: TRibbonGroup;
    rgUtSoccer: TRibbonGroup;
    procedure DisplayHint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actCadPessoasExecute(Sender: TObject);
    procedure actCadUsuariosExecute(Sender: TObject);
    procedure actCadProdutosExecute(Sender: TObject);
    procedure actCadGruposExecute(Sender: TObject);
    procedure actCadMarcasExecute(Sender: TObject);
    procedure actCadFuncionariosExecute(Sender: TObject);
    procedure actCadLocalizaçõesExecute(Sender: TObject);
    procedure actCadUnidadesExecute(Sender: TObject);
    procedure actCadBancosExecute(Sender: TObject);
    procedure actCadContasExecute(Sender: TObject);
    procedure actCadPlanoContasExecute(Sender: TObject);
    procedure actCadPrazoExecute(Sender: TObject);
    procedure actCadFormasExecute(Sender: TObject);
    procedure actCadCidadesExecute(Sender: TObject);
    procedure actCadEstadosExecute(Sender: TObject);
    procedure actCadPaisesExecute(Sender: TObject);
    procedure actCadFuncoesExecute(Sender: TObject);
    procedure actCadSetoresExecute(Sender: TObject);
    procedure actCadTpFoneExecute(Sender: TObject);
    procedure actCadTpEndExecute(Sender: TObject);
    procedure actCadTpEndEletroExecute(Sender: TObject);
    procedure actCadTpLogradExecute(Sender: TObject);
    procedure actEntCaixaExecute(Sender: TObject);
    procedure actSaiCaixaExecute(Sender: TObject);
    procedure actTransfCtasExecute(Sender: TObject);
    procedure actBxPagarExecute(Sender: TObject);
    procedure actImpXMLExecute(Sender: TObject);
    procedure actLancPagarExecute(Sender: TObject);
    procedure actOrcamentosExecute(Sender: TObject);
    procedure actPreVendasExecute(Sender: TObject);
    procedure Action9Execute(Sender: TObject);
    procedure actConsCaixaExecute(Sender: TObject);
    procedure actConsPagarExecute(Sender: TObject);
    procedure actRelCaixaExecute(Sender: TObject);
    procedure actRelCaixaAgExecute(Sender: TObject);
    procedure actRelCaixaDetExecute(Sender: TObject);
    procedure actSaldoExecute(Sender: TObject);
    procedure actRelPagarExecute(Sender: TObject);
    procedure actRelPagasExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actBloquearExecute(Sender: TObject);
    procedure actSobreExecute(Sender: TObject);
    procedure actConfigExecute(Sender: TObject);
    procedure actEmpresaExecute(Sender: TObject);
    procedure actCfgBaseExecute(Sender: TObject);
    procedure actBackupExecute(Sender: TObject);
    procedure actMaqRegExecute(Sender: TObject);
    procedure actCfgMailExecute(Sender: TObject);
    procedure actCfgEstacaoExecute(Sender: TObject);
    procedure actMaxWindowsExecute(Sender: TObject);
    procedure actMinWindowsExecute(Sender: TObject);
    procedure actCloseWindowExecute(Sender: TObject);
    procedure actCloseAllExecute(Sender: TObject);
    procedure actEntManualExecute(Sender: TObject);
    procedure actConsReceberExecute(Sender: TObject);
    procedure actConsReceberGerExecute(Sender: TObject);
    procedure actConsCredExecute(Sender: TObject);
    procedure actConsProdMinExecute(Sender: TObject);
    procedure aactEstNegExecute(Sender: TObject);
    procedure actBxChequesExecute(Sender: TObject);
    procedure actConsChequesExecute(Sender: TObject);
    procedure actConsPreVendasExecute(Sender: TObject);
    procedure actCotacaoExecute(Sender: TObject);
    procedure actAgendaExecute(Sender: TObject);
    procedure actOrdCompraExecute(Sender: TObject);
    procedure actCadComandasExecute(Sender: TObject);
    procedure actMesasExecute(Sender: TObject);
    procedure actComandasOpenExecute(Sender: TObject);
    procedure actHorariosExecute(Sender: TObject);
    procedure actCadQuadrasExecute(Sender: TObject);

  private

    FClientInstance, FPrevClient: TFarProc;
    Procedure ClientWindow(Var Message: TMessage);

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uVarGlobal, uFuncoesSistema, uSenha, uSobre, uFuncoesMsg, uCadUsuarios,
uDaoSistema, uFuncoesSeguranca, dataCadastros, uCadBancos, uCadCidades,
  uCadContas, uConfig, uEmpresa, uCadPessoas, uTmpSenhaMaster, uSenhaCfgBase,
  uSenhaConfig, uCadPlanocontas, uCadPais, uCadSetor, uCadUf,
  uCadLogradourostipo, uCadEndeletrotipo, uCadEnderecostipo, uCadFonestipo,
  uFuncoesRegistro, uImpXMLPag, uConsPagarGer, uConsPagar, uLancPagMan,
  uSaiCaixa, uEntCaixa, uTransfContas, uConsCaixa, uRelCaixa, uRelCaixaAg,
  uRelCaixaDet, uRelSaldoContas, uRelPagar, uSenhaEstacao, uCfgMail,
  uDaoUsuMails, uCadGrupos, uCadUnidades, uCadMarcas, uCadLocalizacao,
  uCadProdutos, uCadPrazos, uCadFormpag, uCadFuncoes, uCadFuncionarios,
  uOrcamento, uEstacoes, uDaoOrcamentos, uPrevenda, uConsProdutos,
  uSenhaCfgMail, uDaoConfig, uDaoEmpresa, uBackupPG, uEntradaManual, uConsReceber,
  uConsReceberGer, uConsCartoes, uConsEstMin, uConsEstNeg, uConsCheques,
  uConsChequesGer, uConsPreVendasGer, uCotacao, uCfgBase, uConfigIni, uAgenda,
  uCadQuadras, uOrdCompra, uCadComandas, uCadMesas, uComandas, uFuncoesVersao,
  uHorarios, uConstants, uFuncoesEstilo;

{$R *.dfm}

procedure TfrmPrincipal.DisplayHint(Sender: TObject);
begin
  StatusBarMain.Panels[5].Text := Application.Hint;
end;

procedure TfrmPrincipal.ClientWindow(Var Message: TMessage);
Var
DisplayContext: hDC;
Row, Col: Word;
Begin
  with Message do
  case Msg of
  WM_ERASEBKGND:
  Begin
    DisplayContext := TWMEraseBkGnd(Message).DC;
    For Row := 0 to ClientHeight DIV ImgFundoTela.Picture.Height DO
      For Col := 0 TO ClientWidth  DIV ImgFundoTela.Picture.Width DO
        BitBlt(DisplayContext, Col*ImgFundoTela.Picture.Width,
    Row * ImgFundoTela.Picture.Height,
    ImgFundoTela.Picture.Width, ImgFundoTela.Picture.Height,
    ImgFundoTela.Picture.BitMap.Canvas.Handle, 0, 0, SRCCOPY);
    Result := 1;
  end
  else
    Result := CallWindowProc(FPrevClient, ClientHandle, Msg, wParam, LParam);
  end;
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  if vgFirst = 1 then
  begin
    ListarEmpresa('0');
    ListarConfig('0');
    TraduzMensagens;
    VerRegistro;
    vgBuscaCEP := BuscaCEP;
    vgFirst := 0;
    {$IFDEF RELEASE}
      VerificaVersao;
      VersaoDatabase;
    {$ENDIF}
  end;
end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  {$IFDEF RELEASE}
    if MessageDlg('Deseja realmente sair do sistema?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Canclose := true
    else
      Canclose := false;
  {$ENDIF}
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
hSysMenu: HMENU;
vControl: TInifile;
begin
  if hSysMenu <> 0 then
  begin
    EnableMenuItem(hSysMenu, SC_CLOSE, MF_BYCOMMAND Or MF_GRAYED);
    DrawMenuBar(Self.Handle);
  end;
  hSysMenu := GetSystemMenu(Self.Handle, False);
  Application.HintPause := 1;
  Application.HintHidePause := 1;
  //Carrega variáveis padrões --------------------------------------------------
  vgPath := DiretorioSemBarra(ExtractFileDir(Application.exename));
  vgArqIni := (vgPath + '\' + RetornaExecutavelSemExtensao + '.ini');
  vControl := TInifile.create(vgArqIni);
  vgDirTemp := vControl.ReadString('Temp', 'Diretorio', '');
  vgDirImagens := vControl.ReadString('Imagens', 'Diretorio', '');
  vgFundo := vControl.ReadString('Imagens', 'Logo','');
  vgLogoRel := vControl.ReadString('Imagens', 'LogoRel','');
  vgMaskData := vControl.ReadString('Mascaras', 'Data','');
  vgMaskReal := vControl.ReadString('Mascaras', 'Moeda','');
  vgMaskHora := vControl.ReadString('Mascaras', 'Hora','');
  vgSimbolo := vControl.ReadString('Mascaras', 'Simbolo','');
  vgInteiro := vControl.ReadString('Mascaras', 'Inteiro','');
  vgPathXML := vControl.ReadString('XML', 'Path', '');
  vgHistory := vControl.ReadString('History', 'Path', '');
  vgTemp := vControl.ReadString('Temp', 'Diretorio', '');
  vgUtilizaNFe := vControl.ReadString('Certificado', 'Utilizar', '');
  vgSenhaMaster := vControl.ReadString('Splash', 'Master','');
  vgSenhaMaster := DecryptMsg(vgSenhaMaster, Length(vgSenhaMaster));
  vgCodBarPV := vControl.ReadString('CodBar', 'PV', '');
  vgIDCaixa := vControl.ReadInteger('Caixa', 'ID', 0);
  vgFirst := 1;
  vgStyle := vControl.ReadInteger('Style', 'Style', 0);
  //Contantes ------------------------------------------------------------------
  //Controle de sistema
  ctSystem := vControl.ReadString('Const', 'System', 'Phoenix');
  //Controle de módulo
  ctModulo := 'usm_erp';
  vControl.free;
  //Aplica o estilo no sistema
  LoadStyle(vgStyle);
  {$IFDEF DEBUG}
    frmPrincipal.Caption := ctSystem + ' - Vs. ' + VersaoSistema(0) + ' - (DEBUG)';
    vgCodUsuarioLog := '0';
    vgNomeUsuarioLog := 'MASTER';
  {$ELSE IF}
    frmPrincipal.Caption := ctSystem + ' - Vs. ' + VersaoSistema(0);
  {$ENDIF}
  rbMain.Caption := frmPrincipal.Caption;
  //Carrega imagem de fundo
  ImgFundoTela.Picture.LoadFromFile(vgFundo);
  FClientInstance := MakeObjectInstance(ClientWindow);
  FPrevClient := Pointer(GetWindowLong(ClientHandle, GWL_WNDPROC));
  SetWindowLong(ClientHandle, GWL_WNDPROC, Longint(FClientInstance));
  Application.OnHint := DisplayHint;

  //Desabilita atalhos específicos do AMSoccer ---------------------------------
  rgCadSoccer.Visible := False;
  rgMovSoccer.Visible := False;
  rgUtSoccer.Visible := False;
  // Carrega os menus do AMSoccer ----------------------------------------------
  if ctSystem = 'AMSoccer' then
  begin
    rgCadSoccer.Visible := True;
    rgMovSoccer.Visible := True;
    rgUtSoccer.Visible := True;
  end;
end;

procedure TfrmPrincipal.actComandasOpenExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmComandas, frmComandas);
end;

procedure TfrmPrincipal.actConfigExecute(Sender: TObject);
begin
  {$IFDEF RELEASE}
    frmSenhaConfig.ShowModal;
  {$ELSE IF}
    frmConfig.ShowModal;
  {$ENDIF}
end;

procedure TfrmPrincipal.actConsCaixaExecute(Sender: TObject);
begin
  frmConsCaixa.ShowModal;
end;

procedure TfrmPrincipal.actConsChequesExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmConsChequesGer, frmConsChequesGer);
end;

procedure TfrmPrincipal.actConsCredExecute(Sender: TObject);
begin
  frmConsCartoes.ShowModal;
end;

procedure TfrmPrincipal.actConsPagarExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmConsPagarGer, frmConsPagarGer);
end;

procedure TfrmPrincipal.actConsPreVendasExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmConsPrevendasGer, frmConsPrevendasGer);
end;

procedure TfrmPrincipal.actConsProdMinExecute(Sender: TObject);
begin
  frmConsEstMin.ShowModal;
end;

procedure TfrmPrincipal.actConsReceberExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmConsReceber, frmConsReceber);
end;

procedure TfrmPrincipal.actConsReceberGerExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmConsReceberGer, frmConsReceberGer);
end;

procedure TfrmPrincipal.actCotacaoExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCotacao, frmCotacao);
end;

procedure TfrmPrincipal.actRelCaixaExecute(Sender: TObject);
begin
  frmRelCaixa.ShowModal;
end;

procedure TfrmPrincipal.actRelCaixaAgExecute(Sender: TObject);
begin
  frmRelCaixaAg.ShowModal;
end;

procedure TfrmPrincipal.actRelCaixaDetExecute(Sender: TObject);
begin
  frmRelCaixaDet.ShowModal;
end;

procedure TfrmPrincipal.actSaldoExecute(Sender: TObject);
begin
  frmRelSaldoContas.ShowModal;
end;

procedure TfrmPrincipal.actSobreExecute(Sender: TObject);
begin
  frmSobre.ShowModal;
end;

procedure TfrmPrincipal.actRelPagarExecute(Sender: TObject);
begin
  vgPagar := 'R';
  frmRelPagar.ShowModal;
end;

procedure TfrmPrincipal.actRelPagasExecute(Sender: TObject);
begin
  vgPagar := 'S';
  frmRelPagar.ShowModal;
end;

procedure TfrmPrincipal.actEmpresaExecute(Sender: TObject);
begin
  frmEmpresa.ShowModal;
end;

procedure TfrmPrincipal.actEntCaixaExecute(Sender: TObject);
begin
  frmEntCaixa.ShowModal;
end;

procedure TfrmPrincipal.actEntManualExecute(Sender: TObject);
begin
  frmEntradaManual.ShowModal;
end;

procedure TfrmPrincipal.actFecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.actHorariosExecute(Sender: TObject);
begin
  frmHorarios.ShowModal;
end;

procedure TfrmPrincipal.actSaiCaixaExecute(Sender: TObject);
begin
  frmSaiCaixa.ShowModal;
end;

procedure TfrmPrincipal.actTransfCtasExecute(Sender: TObject);
begin
  frmTransfContas.ShowModal;
end;

procedure TfrmPrincipal.aactEstNegExecute(Sender: TObject);
begin
  frmConsEstNeg.ShowModal;
end;

procedure TfrmPrincipal.actAgendaExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmAgenda, frmAgenda);
end;

procedure TfrmPrincipal.actBackupExecute(Sender: TObject);
Var
vBackup: String;
Begin
  vBackup := vgPath + '\BackupPG.bat';
  if FileExists(vBackup) then
  begin
    vgBackupPG := vBackup;
    frmBackupPG.ShowModal;
  end;
end;

procedure TfrmPrincipal.actBloquearExecute(Sender: TObject);
begin
  frmSenha.ShowModal;
  frmPrincipal.StatusBarMain.Panels[4].Text := 'Usuário: ' + vgCodUsuarioLog + ' - ' + vgNomeUsuarioLog;
end;

procedure TfrmPrincipal.actBxChequesExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmConsCheques, frmConsCheques);
end;

procedure TfrmPrincipal.actBxPagarExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmConsPagar, frmConsPagar);
end;

procedure TfrmPrincipal.actImpXMLExecute(Sender: TObject);
begin
  frmImpXMLPag.ShowModal;
end;

procedure TfrmPrincipal.actLancPagarExecute(Sender: TObject);
begin
  frmLancPagMan.ShowModal;
end;

procedure TfrmPrincipal.actOrcamentosExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmOrcamento, frmOrcamento);
end;

procedure TfrmPrincipal.actOrdCompraExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmOrdCompra, frmOrdCompra);
end;

procedure TfrmPrincipal.actPreVendasExecute(Sender: TObject);
begin
  vgNumPVOpen := '0';
  CriaFormMDI(TfrmPreVenda, frmPreVenda);
end;

procedure TfrmPrincipal.actMaqRegExecute(Sender: TObject);
begin
  frmEstacoes.ShowModal;
end;

procedure TfrmPrincipal.actMaxWindowsExecute(Sender: TObject);
var
X : Byte;
begin
  try
    for X := 0 to Pred(MDIChildCount) do
      MDIChildren[X].WindowState := wsNormal;
    ActiveMDIChild.WindowState := wsNormal;
  except
  end;
end;

procedure TfrmPrincipal.actMesasExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadMesas, frmCadMesas);
end;

procedure TfrmPrincipal.actMinWindowsExecute(Sender: TObject);
var
X : Byte;
begin
  try
    for X := 0 to Pred(MDIChildCount) do
      MDIChildren[X].WindowState := wsMinimized;
    ActiveMDIChild.WindowState := wsMinimized;
  except
  end;
end;

procedure TfrmPrincipal.actCloseWindowExecute(Sender: TObject);
begin
  try
    ActiveMDIChild.Close;
  except
  end;
end;

procedure TfrmPrincipal.actCloseAllExecute(Sender: TObject);
var
X : Byte;
begin
  if MDIChildCount > 0 then
    for X := 0 to Pred(MDIChildCount) do
      MDIChildren[X].Close;
end;

procedure TfrmPrincipal.Action9Execute(Sender: TObject);
begin
  if frmCadProdutos = nil then
  begin
    vgConsProdutos := '0';
    frmConsProdutos.ShowModal;
  end;
end;

procedure TfrmPrincipal.actCadComandasExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadComandas, frmCadComandas);
end;

procedure TfrmPrincipal.actCadContasExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadContas, frmCadContas);
end;

procedure TfrmPrincipal.actCadPlanoContasExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadPlanoContas, frmCadPlanoContas);
end;

procedure TfrmPrincipal.actCadPrazoExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadPrazos, frmCadPrazos);
end;

procedure TfrmPrincipal.actCadFormasExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadFormPag, frmCadFormPag);
end;

procedure TfrmPrincipal.actCadCidadesExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadCidades, frmCadCidades);
end;

procedure TfrmPrincipal.actCadEstadosExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadUf, frmCadUf);
end;

procedure TfrmPrincipal.actCadPaisesExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadPais, frmCadPais);
end;

procedure TfrmPrincipal.actCadSetoresExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadSetor, frmCadSetor);
end;

procedure TfrmPrincipal.actCadTpFoneExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadFonestipo, frmCadFonestipo);
end;

procedure TfrmPrincipal.actCadTpEndExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadEnderecostipo, frmCadEnderecostipo);
end;

procedure TfrmPrincipal.actCadFuncoesExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadFuncoes, frmCadFuncoes);
end;

procedure TfrmPrincipal.actCadPessoasExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadPessoas, frmCadPessoas);
end;

procedure TfrmPrincipal.actCadTpEndEletroExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadEndEletrotipo, frmCadEndEletrotipo);
end;

procedure TfrmPrincipal.actCadTpLogradExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadLogradourostipo, frmCadLogradourostipo);
end;

procedure TfrmPrincipal.actCadUsuariosExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadUsuarios, frmCadUsuarios);
end;

procedure TfrmPrincipal.actCfgBaseExecute(Sender: TObject);
begin
  {$IFDEF RELEASE}
    frmSenhaCfgBase.ShowModal;
  {$ELSE IF}
    frmCfgBase.ShowModal;
  {$ENDIF}
end;

procedure TfrmPrincipal.actCfgEstacaoExecute(Sender: TObject);
begin
  {$IFDEF RELEASE}
    frmSenhaEstacao.ShowModal;
  {$ELSE IF}
    frmConfigIni.ShowModal;
  {$ENDIF}
end;

procedure TfrmPrincipal.actCfgMailExecute(Sender: TObject);
begin
  vgCodUsuMail := 0;
  FiltrarUsuMails('USU_CODIGO', '=', '0', '0');
  if dmCadastros.qyUsuMailsUSU_CODIGO.IsNull then
    InsUsuMails
  else
    EdtUsuMails;
  {$IFDEF RELEASE}
    frmSenhaCfgMail.ShowModal;
  {$ELSE IF}
    frmCfgMail.ShowModal;
  {$ENDIF}
end;

procedure TfrmPrincipal.actCadProdutosExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadProdutos, frmCadProdutos);
end;

procedure TfrmPrincipal.actCadQuadrasExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadQuadras, frmCadQuadras);
end;

procedure TfrmPrincipal.actCadGruposExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadGrupos, frmCadGrupos);
end;

procedure TfrmPrincipal.actCadMarcasExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadMarcas, frmCadMarcas);
end;

procedure TfrmPrincipal.actCadFuncionariosExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadFuncionarios, frmCadFuncionarios);
end;

procedure TfrmPrincipal.actCadLocalizaçõesExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadLocalizacao, frmCadLocalizacao);
end;

procedure TfrmPrincipal.actCadUnidadesExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadUnidades, frmCadUnidades);
end;

procedure TfrmPrincipal.actCadBancosExecute(Sender: TObject);
begin
  CriaFormMDI(TfrmCadBancos, frmCadBancos);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  {$IFDEF DEBUG}
    vgCodUsuarioLog := '0';
    vgNomeUsuarioLog := 'MASTER';
  {$ELSE IF}
    frmSenha.ShowModal;
  {$ENDIF}
  frmPrincipal.StatusBarMain.Panels[4].Text := 'Usuário: ' + vgCodUsuarioLog + ' - ' + vgNomeUsuarioLog;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBarMain.Panels[1].Text := DateToStr(now);
  StatusBarMain.Panels[3].Text := TimeToStr(now);
end;

end.
