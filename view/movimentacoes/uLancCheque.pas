unit uLancCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, DBCtrls, Db, Vcl.Imaging.pngimage;

type
  TfrmLancCheque = class(TForm)
    edEndosso: TEdit;
    btGravar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    dsCaixa: TDataSource;
    dsBanco: TDataSource;
    dsCheques: TDataSource;
    edTelefone: TMaskEdit;
    pnCheque: TPanel;
    lbValorExtenso: TLabel;
    lbDataExtenso: TLabel;
    edTitular: TEdit;
    edDoc: TMaskEdit;
    meBompara: TMaskEdit;
    StaticText1: TStaticText;
    pnComp: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    pnValor: TPanel;
    edValor: TEdit;
    Label5: TLabel;
    pnBanco: TPanel;
    Label6: TLabel;
    edNBanco: TEdit;
    pnAgencia: TPanel;
    Label7: TLabel;
    edAgencia: TEdit;
    pnC1: TPanel;
    Label9: TLabel;
    Label8: TLabel;
    pnConta: TPanel;
    Label10: TLabel;
    pnC2: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    pnNumCheq: TPanel;
    Label13: TLabel;
    edCheque: TEdit;
    edConta: TEdit;
    ImgSobre: TImage;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    lbEmpresa: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    meEmissao: TMaskEdit;
    Label22: TLabel;
    Label23: TLabel;
    lbBanco: TLabel;
    rgPessoa: TRadioGroup;
    procedure Limpar;
    procedure FormActivate(Sender: TObject);
    procedure edNBancoExit(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure edValorKeyPress(Sender: TObject; var Key: Char);
    procedure edValorExit(Sender: TObject);
    procedure edDocExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgPessoaClick(Sender: TObject);
    procedure meEmissaoExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    ComponentePro: TComponent;
    procedure ProCode(Sender: TObject);

  public
    { Public declarations }
  end;

var
  frmLancCheque: TfrmLancCheque;
  vlLanc: Integer;

implementation

uses uCadBancos, uDaoBancos, uDaoEmpresa, uFuncoesDatas, uFuncoesValidacao,
  uFuncoesFormatacao, uFuncoesDB, uDaoPessoas, uVarGlobal, uCadBancoMov,
  uDaoCheques, uClassCheques, uDaoCaixa;

{$R *.DFM}

procedure TfrmLancCheque.ProCode(Sender: TObject);
begin
  if Assigned(ComponentePro) then
    TEdit(ComponentePro).Color := clWindow; // cor ao sair
  if (ActiveControl is TCustomEdit) or
     (ActiveControl is TComboBox) or
     (ActiveControl is TMemo) then
  begin
    TEdit(ActiveControl).Color := clSkyBlue;  // cor ao focar
    ComponentePro := ActiveControl;
  end;
end;

procedure TfrmLancCheque.Limpar;
begin
  edNBanco.Clear;
  lbBanco.Caption := '';
  edAgencia.Clear;
  edConta.Clear;
  edCheque.Clear;
  if vlLanc = 1 then
  begin
    edValor.Text := FormatFloat('#,###,###,##0.00', vgValorPVChq);
    if ((edValor.Text <> '') and (edValor.Text <> ' ')) then
      lbValorExtenso.Caption := ValorPorExtenso(StrToFloat(edValor.Text))
    else
      lbValorExtenso.Caption := '';
  end
  else
  begin
    edValor.Clear;
    lbValorExtenso.Caption := '';
  end;
  lbEmpresa.Caption := GetNameEmp;
  meEmissao.Text := FormatDateTime('dd/MM/yyyy', GetDateServerPG);
  lbDataExtenso.Caption := DataExtenso(GetCidadeEmp, GetDateServerPG);
  edTitular.Clear;
  edDoc.Clear;
  edDoc.EditMask:= '999.999.999-99;1;_';
  rgPessoa.ItemIndex := 0;
  meBompara.Text := meEmissao.Text;
  FiltrarPessoas('pes_codigo', '=', IntToStr(vgCodClienteChq), '0');
  if vgCodClienteChq <> 0 then
  begin
    edTelefone.Text := GetNumFone(vgCodClienteChq);
    edEndosso.Text := GetNomePes;
    edTitular.Text := edEndosso.Text;
    edDoc.Text := GetCNPJPes;
  end;
  edNBanco.SetFocus;
  vlLanc := vlLanc + 1;
end;

procedure TfrmLancCheque.meEmissaoExit(Sender: TObject);
begin
  lbDataExtenso.Caption := DataExtenso(GetCidadeEmp, StrToDate(meEmissao.Text));
end;

procedure TfrmLancCheque.rgPessoaClick(Sender: TObject);
begin
  if rgPessoa.ItemIndex = 0 then
    edDoc.EditMask:= '999.999.999-99;1;_';
  if rgPessoa.ItemIndex = 1 then
    edDoc.EditMask := '99.999.999/9999-99;1;_';
end;

procedure TfrmLancCheque.FormActivate(Sender: TObject);
begin
  Screen.OnActiveControlChange := ProCode;
  vlLanc := 1;
  Limpar;
end;

procedure TfrmLancCheque.edNBancoExit(Sender: TObject);
begin
  if ((edNBanco.Text <> '') and (edNBanco.Text <> ' ')) then
  begin
    FiltrarBancos('ban_codigo', '=', edNBanco.Text, 'ban_codigo');
    if ((GetBanco <> '') and (GetBanco <> ' ')) then
    begin
      edNBanco.Text := FormatFloat('000', StrToFloat(edNBanco.Text));
      lbBanco.Caption := GetBanco;
      edAgencia.Clear;
      edAgencia.SetFocus;
    end
    else
    begin
      if Messagedlg('Banco não cadastrado!' + #13 + #10 + 'Deseja cadastrar?',
                    mtConfirmation, [mbYes, mbno], 0) = mrYes then
      begin
        frmCadBancoMov.ShowModal;
        edNBanco.SetFocus;
      end
      else
      begin
        edAgencia.Clear;
        edAgencia.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmLancCheque.btGravarClick(Sender: TObject);
Var
vCodigo: Integer;
vCheque: TCheques;
vObrigatorios: Integer;
begin
  // Testa campos obrigatórios
  vObrigatorios := 0;
  if ((edNBanco.Text = '') or (edNBanco.Text = ' ')) then
    vObrigatorios := 1;
  if ((edAgencia.Text = '') or (edAgencia.Text = ' ')) then
    vObrigatorios := 1;
  if ((edConta.Text = '') or (edConta.Text = ' ')) then
    vObrigatorios := 1;
  if ((edCheque.Text = '') or (edCheque.Text = ' ')) then
    vObrigatorios := 1;
  if ((edValor.Text = '') or (edValor.Text = ' ')) then
    vObrigatorios := 1;
  if ((edTitular.Text = '') or (edTitular.Text = ' ')) then
    vObrigatorios := 1;
  if ((edEndosso.Text = '') or (edEndosso.Text = ' ')) then
    vObrigatorios := 1;
  if TestaData(meEmissao.Text) = false then
    vObrigatorios := 1;
  if edTelefone.Text = '(  )      -    ' then
    vObrigatorios := 1;
  if TestaData(meBompara.Text) = false then
    vObrigatorios := 1;
  if rgPessoa.ItemIndex = 0 then
  begin
    try
      if Cpf(edDoc.Text) = false then
      begin
        Messagedlg('CPF inválido!', mterror,[mbok], 0);
        vObrigatorios := 1;
      end;
    except
      vObrigatorios := 1;
    end;
  end;
  if rgPessoa.ItemIndex = 1 then
  begin
    try
    if Cnpj(edDoc.Text) = false then
    begin
      Messagedlg('CNPJ inválido!', mterror, [mbok], 0);
      vObrigatorios := 1;
    end;
    except
      vObrigatorios := 1;
    end;
  end;
  if vObrigatorios = 0 then
  begin
    // Lança cheque no controle de cheques
    vCheque := TCheques.Create;
    vCheque.Lancamento := 0;
    vCheque.Banco := StrToInt(edNBanco.Text);
    vCheque.Agencia := StrToInt(edAgencia.Text);
    vCheque.Conta := StrToInt(edConta.Text);
    vCheque.Cheque := StrToInt(edCheque.Text);
    vCheque.Valor := StrToFloat(edValor.Text);
    vCheque.Documento := edDoc.Text;
    vCheque.Titular := edTitular.Text;
    vCheque.Datalanc := StrToDate(meEmissao.Text);
    vCheque.Vencimento := StrToDate(meBompara.Text);
    vCheque.Codpessoa := vgCodClienteChq;
    vCheque.Endosso := edEndosso.Text;
    vCheque.Telefone := edTelefone.Text;
    vCheque.Destino := '0';
    vCheque.Codcaixa := vgCodCaixaChq;
    vCheque.Codstatus := 1;
    InsCheques;
    SetValuesCheques(vCheque);
    PostCheques;
    if vCheque.Datalanc <> vCheque.Vencimento then
    begin
      FiltrarCaixa('cai_codigo', '=', IntToStr(vgCodCaixaChq), '0');
      EdtCaixa;
      SetDataEfet(vCheque.Vencimento);
      PostCaixa;
    end;
    vCheque.Free;
    if messagedlg('Deseja cadastrar outro CHEQUE?', mtconfirmation, [mbyes,mbno], 0) = mryes then
      Limpar
    else
      Close;
  end
  else
    MessageDlg('Por favor verifique o preenchimento de todos os campos!', mtWarning, [mbOk], 0);
end;

procedure TfrmLancCheque.edValorKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in [',','.'] then
    Key := FormatSettings.DecimalSeparator;
  if not (Key in ['0'..'9',FormatSettings.DecimalSeparator, Chr(8)]) then
    Key := #0;
end;

procedure TfrmLancCheque.edValorExit(Sender: TObject);
begin
  if ((edValor.Text <> '') and (edValor.Text <> ' ')) then
  begin
    if TestaReal(edValor.Text) = True then
    begin
      edValor.text := FloatToStrf((strtofloat(edValor.text)), fffixed, 15, 2);
      lbValorExtenso.Caption := ValorPorExtenso(StrToFloat(edValor.Text));
    end
    else
    begin
      MessageDlg('Valor do cheque inválido!', mtError, [mbOk], 0);
      edValor.SetFocus;
    end;
  end;
end;

procedure TfrmLancCheque.edDocExit(Sender: TObject);
begin
  if ((edDoc.Text <> '') or (edDoc.Text <> ' ')) then
  begin
    if rgPessoa.ItemIndex = 0 then
      if Cpf(edDoc.Text) = false then
        Messagedlg('CPF inválido!', mterror,[mbok], 0);
    if rgPessoa.ItemIndex = 1 then
      if Cnpj(edDoc.Text) = false then
        Messagedlg('CNPJ inválido!', mterror, [mbok], 0);
  end;
end;

procedure TfrmLancCheque.FormCreate(Sender: TObject);
Var
vHwndHandle: THANDLE;
vHMenuHandle: HMenu;
begin
  vHwndHandle := Self.Handle;
  if (vHwndHandle <> 0) then
  begin
    vHMenuHandle := GetSystemMenu(vHwndHandle, False);
    if (vHMenuHandle <> 0) then
      DeleteMenu(vHMenuHandle, SC_CLOSE, MF_BYCOMMAND);
  end;
end;

procedure TfrmLancCheque.FormDestroy(Sender: TObject);
begin
  Screen.OnActiveControlChange := nil;
end;

procedure TfrmLancCheque.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

end.
