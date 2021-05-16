unit uCartoesPV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Wwdbigrd, Wwdbgrid, Data.DB;

type
  TfrmCartoesPV = class(TfrmTmpFormNormal)
    pnClientePV: TPanel;
    pnPrazo: TPanel;
    btGravar: TBitBtn;
    Label1: TLabel;
    wwDBGrid1: TwwDBGrid;
    dsCartoes: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCartoesPV: TfrmCartoesPV;

implementation

{$R *.dfm}

uses uDaoPessoas, uVarGlobal, uDaoFormpag, uDaoPrazos, uDaoCaixa, uClassCaixa,
  uFuncoesDB, dataTemp, uDaoContas, uDaoPrevendas;

procedure TfrmCartoesPV.btGravarClick(Sender: TObject);
Var
vCaixa: TCaixa;
begin
  inherited;
  // Crédito -------------------------------------------------------------------
  if vgFormaCt = 2 then
  begin
    dsCartoes.DataSet.First;
    repeat
    begin
      vCaixa := TCaixa.Create;
      vCaixa.Codigo := GetCodigo('cai_codigo', 'caixa');
      vCaixa.ID := vgIDCaixa;
      vCaixa.CodConta := dsCartoes.DataSet.FieldByName('CodConta').Value;
      vCaixa.Descricao := 'PV: ' + FormatFloat('000,000', vgPVCt) + ' / Ct. Crédito';
      vCaixa.Numdoc := vgPVCt;
      vCaixa.Valor := vgValorPVCt;
      vCaixa.CodPlano := 3;
      vCaixa.CodUsuario := StrToInt(vgCodUsuarioLog);
      vCaixa.Data := GetDateServerPG;
      vCaixa.DataEfet := dsCartoes.DataSet.FieldByName('Data').Value;
      vCaixa.CodPag := 0;
      vCaixa.CodRec := 0;
      vCaixa.CodMdc := '00';
      InsCaixa;
      SetValuesCaixa(vCaixa);
      PostCaixa;
      vCaixa.Free;
      dsCartoes.DataSet.Next;
    end;
    until dsCartoes.DataSet.Eof = True;
  end;
  // Débito --------------------------------------------------------------------
  if vgFormaCt = 3 then
  begin
    vCaixa := TCaixa.Create;
    vCaixa.Codigo := GetCodigo('cai_codigo', 'caixa');
    vCaixa.ID := vgIDCaixa;
    vCaixa.CodConta := dsCartoes.DataSet.FieldByName('CodConta').Value;
    vCaixa.Descricao := 'PV: ' + FormatFloat('000,000', vgPVCt) + ' / Ct. Débito';
    vCaixa.Numdoc := vgPVCt;
    vCaixa.Valor := vgValorPVCt;
    vCaixa.CodPlano := 3;
    vCaixa.CodUsuario := StrToInt(vgCodUsuarioLog);
    vCaixa.Data := GetDateServerPG;
    vCaixa.DataEfet := dsCartoes.DataSet.FieldByName('Data').Value;
    vCaixa.CodPag := 0;
    vCaixa.CodRec := 0;
    vCaixa.CodMdc := '00';
    InsCaixa;
    SetValuesCaixa(vCaixa);
    PostCaixa;
    vCaixa.Free;
  end;
  // Mudar status PV ---------------------------------------------------
  SetDataEfetPV(GetDateServerPG);
  SetStatusPrev(5);
  Close;
end;

procedure TfrmCartoesPV.FormActivate(Sender: TObject);
Var
vConta, vIntervalo, vParc, vCont: Integer;
vVenc: TDate;
vVlrParc: Real;
begin
  dsCartoes.DataSet.Active := True;
  inherited;
  FiltrarPessoas('pes_codigo', '=', IntToStr(vgCodClienteCt), '0');
  pnClientePV.Caption := GetNomePes + ' (' + IntToStr(vgCodClienteCt) + ') - ' +
                         'PV: ' + FormatFloat('000,000', vgPVCt);
  pnPrazo.Caption := 'Forma de pagamento: ' + GetDescFormpag(vgFormaCt) + ' (' +
                     IntToStr(vgFormaCt) + ') / ' +
                     'Prazo de pagamento: ' + GetDescPrazos(vgPrazoCt) + ' (' +
                     IntToStr(vgPrazoCt) + ')';
  // Carreganga prazo e conta que vai creditar
  // Crédito -------------------------------------------------------------------
  if vgFormaCt = 2 then
  begin
    vConta := GetContaCred(2);
    vParc := GetNumParc(vgPrazoCt);
    if vConta <> 0 then
    begin
      vIntervalo := GetIntervCred(2);
      if vParc = 1 then
      begin
        vVenc := GetDateServerPG + vIntervalo;
        dsCartoes.DataSet.Append;
        dsCartoes.DataSet.FieldByName('Lancamento').Value := 1;
        dsCartoes.DataSet.FieldByName('Data').Value := vVenc;
        dsCartoes.DataSet.FieldByName('CodConta').Value := vConta;
        dsCartoes.DataSet.FieldByName('Conta').Value := GetDescConta(vConta);
        dsCartoes.DataSet.FieldByName('Valor').Value := vgValorPVCt;
        dsCartoes.DataSet.Post;
      end
      else
      begin
        vCont := 0;
        vVenc := GetDateServerPG;
        vVlrParc := vgValorPVCt / vParc;
        repeat
          vCont := vCont + 1;
          vVenc := vVenc + vIntervalo;
          dsCartoes.DataSet.Append;
          dsCartoes.DataSet.FieldByName('Lancamento').Value := vCont;
          dsCartoes.DataSet.FieldByName('Data').Value := vVenc;
          dsCartoes.DataSet.FieldByName('CodConta').Value := vConta;
          dsCartoes.DataSet.FieldByName('Conta').Value := GetDescConta(vConta);
          dsCartoes.DataSet.FieldByName('Valor').Value := vVlrParc;
          dsCartoes.DataSet.Post;
        until vCont = vParc;
      end;
    end
    else
    begin
      MessageDlg('Conta de crédito não configurada!', mtWarning, [mbOk], 0);
      Close;
    end;
  end;
  // Débito --------------------------------------------------------------------
  if vgFormaCt = 3 then
  begin
    vConta := GetContaCred(3);
    if vConta <> 0 then
    begin
      vIntervalo := GetIntervCred(3);
      vVenc := GetDateServerPG + vIntervalo;
      dsCartoes.DataSet.Append;
      dsCartoes.DataSet.FieldByName('Lancamento').Value := 1;
      dsCartoes.DataSet.FieldByName('Data').Value := vVenc;
      dsCartoes.DataSet.FieldByName('CodConta').Value := vConta;
      dsCartoes.DataSet.FieldByName('Conta').Value := GetDescConta(vConta);
      dsCartoes.DataSet.FieldByName('Valor').Value := vgValorPVCt;
      dsCartoes.DataSet.Post;
    end
    else
    begin
      MessageDlg('Conta de débito não configurada!', mtWarning, [mbOk], 0);
      Close;
    end;
  end;
  btGravar.SetFocus;
end;

procedure TfrmCartoesPV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsCartoes.DataSet.Active := True;
  inherited;
end;

end.
