unit uPrazos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Wwdbigrd, Wwdbgrid,
  wwdbdatetimepicker, Vcl.Menus;

type
  TfrmPrazos = class(TfrmTmpFormNormal)
    pnPrazo: TPanel;
    Label1: TLabel;
    btGravar: TBitBtn;
    pnClientePV: TPanel;
    GridParcelas: TwwDBGrid;
    dsReceberTmp: TDataSource;
    cbVencimento: TwwDBDateTimePicker;
    PopupMenuJuros: TPopupMenu;
    Retirarjuros1: TMenuItem;
    procedure btGravarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbVencimentoExit(Sender: TObject);
    procedure Retirarjuros1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrazos: TfrmPrazos;

implementation

{$R *.dfm}

uses uDaoPrevendas, uDaoPessoas, uVarGlobal, uDaoFormpag, uDaoPrazos, dataTemp,
  uFuncoesDB, uSenhaZeraJuros, uDaoReceber, uClassReceber;

procedure TfrmPrazos.btGravarClick(Sender: TObject);
Var
vReceber: TReceber;
begin
  dsReceberTmp.DataSet.First;
  Repeat
  begin
    vReceber := TReceber.Create;
    vReceber.Codigo := 0;
    vReceber.Emissao := dsReceberTmp.DataSet.FieldByName('Emissao').Value;
    vReceber.Vencimento := dsReceberTmp.DataSet.FieldByName('Vencimento').Value;
    vReceber.Coppessoa := dsReceberTmp.DataSet.FieldByName('PesCodigo').Value;
    vReceber.Numero := dsReceberTmp.DataSet.FieldByName('Numero').Value;
    vReceber.Serie := dsReceberTmp.DataSet.FieldByName('Serie').Value;
    vReceber.Codmdc := dsReceberTmp.DataSet.FieldByName('Mod').Text;
    vReceber.Parcela := dsReceberTmp.DataSet.FieldByName('Parcela').Value;
    vReceber.Duplicata := dsReceberTmp.DataSet.FieldByName('Duplicata').Text;
    vReceber.Valor := dsReceberTmp.DataSet.FieldByName('Valor').Value;
    vReceber.Pago := dsReceberTmp.DataSet.FieldByName('Pago').Value;
    vReceber.Acrescimo := dsReceberTmp.DataSet.FieldByName('Acrescimo').Value;
    vReceber.Desconto := dsReceberTmp.DataSet.FieldByName('Desconto').Value;
    vReceber.Saldo := dsReceberTmp.DataSet.FieldByName('Saldo').Value;
    vReceber.Codforma := dsReceberTmp.DataSet.FieldByName('CodForma').Value;
    vReceber.Codstatus := dsReceberTmp.DataSet.FieldByName('CodStatus').Value;
    InsReceber;
    SetDataEfetPV(GetDateServerPG);
    SetValuesReceber(vReceber);
    PostReceber;
    vReceber.Free;
    dsReceberTmp.DataSet.Next;
  end;
  Until dsReceberTmp.DataSet.Eof = True;
  // Mudar status PV -----------------------------------------------------
  SetStatusPrev(5);
  Close;
end;

procedure TfrmPrazos.cbVencimentoExit(Sender: TObject);
begin
  if dsReceberTmp.DataSet.State in [dsEdit] then
    dsReceberTmp.DataSet.Post;
end;

procedure TfrmPrazos.FormActivate(Sender: TObject);
Var
vParc, vIntervalo, vDiasParc: Integer;
vJuros: Real;
vContParc: Integer;
begin
  inherited;
  dsReceberTmp.DataSet.Active := True;
  FiltrarPessoas('pes_codigo', '=', IntToStr(vgCodClienteRec), '0');
  pnClientePV.Caption := GetNomePes + ' (' + IntToStr(vgCodClienteRec) + ') - ' +
                         'PV: ' + FormatFloat('000,000', vgPVRec);
  pnPrazo.Caption := 'Forma de pagamento: ' + GetDescFormpag(vgFormaRec) + ' (' +
                     IntToStr(vgFormaRec) + ') / ' +
                     'Prazo de pagamento: ' + GetDescPrazos(vgPrazoRec) + ' (' +
                     IntToStr(vgPrazoRec) + ')';
  // Cria recebimento na tabela temporária
  vParc := GetNumParc(vgPrazoRec);
  vIntervalo := GetInterval(vgPrazoRec);
  vJuros := GetJurosPrz(vgPrazoRec);
  dsReceberTmp.DataSet.Active := True;
  if vParc = 1 then
  begin
    dmTemp.mdReceber.Insert;
    dmTemp.mdReceberCodigo.Value := 1;
    dmTemp.mdReceberEmissao.Value := GetDateServerPG;
    dmTemp.mdReceberVencimento.Value := GetDateServerPG + vIntervalo;
    dmTemp.mdReceberNumero.Value := vgPVRec;
    dmTemp.mdReceberSerie.Value := 2; // PV
    dmTemp.mdReceberMod.Text :=  '00'; // PV
    dmTemp.mdReceberParcela.Value := 1;
    dmTemp.mdReceberDuplicata.Text :=  FormatFloat('000000', vgPVRec) + // PV
                                       '00' + // Mod
                                       FormatFloat('00', 2) + // Serie
                                       FormatFloat('00', 1);  // Parcela
    dmTemp.mdReceberPesCodigo.Value := vgCodClienteRec;
    dmTemp.mdReceberValor.Value := vgValorPVRec;
    dmTemp.mdReceberSaldo.Value := vgValorPVRec + ((vgValorPVRec * vJuros) / 100);
    dmTemp.mdReceberPago.Value := 0;
    if dmTemp.mdReceberValor.Value = dmTemp.mdReceberSaldo.Value then
      dmTemp.mdReceberAcrescimo.Value := 0
    else
      dmTemp.mdReceberAcrescimo.Value := dmTemp.mdReceberSaldo.Value - dmTemp.mdReceberValor.Value;
    dmTemp.mdReceberDesconto.Value := 0;
    dmTemp.mdReceberCodForma.Value := vgFormaRec;
    dmTemp.mdReceberCodStatus.Value := 1;
    dmTemp.mdReceber.Post;
  end
  else
  begin
    vContParc := 0;
    vgValorPVRec := vgValorPVRec / vParc;
    vDiasParc := vIntervalo;
    Repeat
    begin
      vContParc := vContParc + 1;
      dmTemp.mdReceber.Append;
      dmTemp.mdReceberCodigo.Value := vContParc;
      dmTemp.mdReceberEmissao.Value := GetDateServerPG;
      dmTemp.mdReceberVencimento.Value := GetDateServerPG + vIntervalo;
      dmTemp.mdReceberNumero.Value := vgPVRec;
      dmTemp.mdReceberSerie.Value := 2; // PV
      dmTemp.mdReceberMod.Text :=  '00'; // PV
      dmTemp.mdReceberParcela.Value := vContParc;
      dmTemp.mdReceberDuplicata.Text :=  FormatFloat('000000', vgPVRec) + // PV
                                         '00' + // Mod
                                         FormatFloat('00', 2) + // Serie
                                         FormatFloat('00', vContParc);  // Parcela
      dmTemp.mdReceberPesCodigo.Value := vgCodClienteRec;
      dmTemp.mdReceberValor.Value := vgValorPVRec;
      dmTemp.mdReceberSaldo.Value := vgValorPVRec + ((vgValorPVRec * vJuros) / 100);
      dmTemp.mdReceberPago.Value := 0;
      if dmTemp.mdReceberValor.Value = dmTemp.mdReceberSaldo.Value then
        dmTemp.mdReceberAcrescimo.Value := 0
      else
        dmTemp.mdReceberAcrescimo.Value := dmTemp.mdReceberSaldo.Value - dmTemp.mdReceberValor.Value;
      dmTemp.mdReceberDesconto.Value := 0;
      dmTemp.mdReceberCodForma.Value := vgFormaRec;
      dmTemp.mdReceberCodStatus.Value := 1;
      dmTemp.mdReceber.Post;
      vIntervalo := vIntervalo + vDiasParc;
    end;
    Until vParc = vContParc;
  end;
  dsReceberTmp.DataSet.Refresh;
  btGravar.SetFocus;
end;

procedure TfrmPrazos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsReceberTmp.DataSet.Active := False;
  inherited;
end;

procedure TfrmPrazos.Retirarjuros1Click(Sender: TObject);
begin
  vgZeraJuros := false;
  frmSenhaZeraJuros.ShowModal;
  if vgZeraJuros = true then
  begin
    dsReceberTmp.DataSet.First;
    Repeat
    begin
      dsReceberTmp.DataSet.Edit;
      dsReceberTmp.DataSet.FieldByName('Saldo').Value := dsReceberTmp.DataSet.FieldByName('Valor').Value;
      dsReceberTmp.DataSet.FieldByName('Acrescimo').Value := 0;
      dsReceberTmp.DataSet.Post;
      dsReceberTmp.DataSet.Next;
    end;
    Until dsReceberTmp.DataSet.Eof = true;
  end;
end;

end.
