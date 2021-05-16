unit uReplicar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmReplicar = class(TfrmTmpFormNormal)
    pnQuadra: TPanel;
    Label1: TLabel;
    edDias: TEdit;
    Label2: TLabel;
    edAgendamentos: TEdit;
    btSimular: TBitBtn;
    btConfirmar: TBitBtn;
    DBGrid1: TDBGrid;
    dsTemp: TDataSource;
    pnDados: TPanel;
    Label3: TLabel;
    lbCliente: TLabel;
    Label4: TLabel;
    lbQuadra: TLabel;
    Label5: TLabel;
    lbHorario: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btSimularClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReplicar: TfrmReplicar;

implementation

{$R *.dfm}

uses uVarGlobal, dataTemp, uDaoAgenda, uClassAgenda, uFuncoesDB, uDaoAgeItens,
  uDaoQuadras;

procedure TfrmReplicar.btConfirmarClick(Sender: TObject);
Var
vTestAgd: Boolean;
vAgenda: TAgenda;
vCodProd: Integer;
vLancados: Integer;
vCont: Integer;
begin
  if Not(dmTemp.mdAgendaTempDataAg.IsNull) then
  begin
    vCont := 0;
    vLancados := 0;
    dsTemp.DataSet.First;
    Repeat
      vCont := vCont + 1;
      vTestAgd := TestaAgenda(dsTemp.DataSet.FieldByName('DataAg').Text,
                              dsTemp.DataSet.FieldByName('HoraAg').Text,
                              vgAgCodQda);
      if vTestAgd = false then
      begin
        // Lança agenda
        vAgenda := TAgenda.Create;
        vAgenda.Codigo := 0;
        vAgenda.Codpes := StrToInt(vgCodCliAge);
        vAgenda.CodQuadra := StrToInt(vgAgCodQda);
        vAgenda.Dataag := dsTemp.DataSet.FieldByName('DataAg').Value;
        vAgenda.Horaag := dsTemp.DataSet.FieldByName('HoraAg').Value;
        vAgenda.Datalanc := GetDateServerPG;
        vAgenda.Horalanc := GetTimeServerPG;
        vAgenda.Obs := 'Lançamento gerado automaticamente!';
        vAgenda.Atendimento := 0;
        vAgenda.Codusuario := StrToInt(vgCodUsuarioLog);
        InsAgenda;
        SetValuesAgenda(vAgenda);
        PostAgenda;
        vLancados := vLancados + 1;
        // Testa e lança item na agenda
        vCodProd := ConsQdaProd(vgAgCodQda);
        if vCodProd <> 0 then
        begin
          InsAgeItens;
          SetValuesAgeItens(0, vgNewCodAge, vCodProd);
          PostAgeItens;
        end;
        vAgenda.Free;
      end
      else
        MessageDlg('O horário Data: ' + dsTemp.DataSet.FieldByName('DataAg').Text +
                   ' Hora: ' + dsTemp.DataSet.FieldByName('DataAg').Text +
                   ' Quadra: ' + vgAgQda + ' já está reservada', mtWarning, [mbOk], 0);
      dsTemp.DataSet.Next;
    Until dsTemp.DataSet.Eof = True;

    MessageDlg('Replicação concluída!' + #13 + 'Lançados: ' + IntToStr(vLancados) +
               ' de ' + IntToStr(vCont), mtInformation, [mbOk], 0);
    Close;
  end
  else
    MessageDlg('É necessário fazer a simulação!', mtWarning, [mbOk], 0);
end;

procedure TfrmReplicar.btSimularClick(Sender: TObject);
Var
vFreq: Integer;
vAged: Integer;
vCont: Integer;
vDataAg: TDate;
begin
  dmTemp.mdAgendaTemp.Close;
  dmTemp.mdAgendaTemp.Open;
  if edDias.Text <> '' then
  begin
    if edAgendamentos.Text <> '' then
    begin
      vFreq := StrToInt(edDias.Text);
      vAged := StrToInt(edAgendamentos.Text);
      vDataAg := vgAgData + vFreq;
      for vCont := 1 to vAged do
      begin
        dmTemp.mdAgendaTemp.Append;
        dmTemp.mdAgendaTempDataAg.Value := vDataAg;
        dmTemp.mdAgendaTempHoraAg.Value := vgAgHora;
        dmTemp.mdAgendaTemp.Post;
        vDataAg := vDataAg + vFreq;
      end;
    end
    else
      MessageDlg('É necessário preencher a quantidade de agendamentos!', mtWarning, [mbOk], 0);
  end
  else
    MessageDlg('É necessário preencher a frequencia em dias!', mtWarning, [mbOk], 0);
end;

procedure TfrmReplicar.FormActivate(Sender: TObject);
begin
  inherited;
  dmTemp.mdAgendaTemp.Active := True;
  lbCliente.Caption := vgCliAge + ' (' + vgCodCliAge+ ')';
  lbQuadra.Caption := vgAgCodQda + ' (' + vgAgQda + ')';
  lbHorario.Caption := DateToStr(vgAgData) + ' / ' + TimeToStr(vgAgHora);
  edDias.Text := '7';
  edAgendamentos.Text := '4';
end;

procedure TfrmReplicar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmTemp.mdAgendaTemp.Active := False;
end;

procedure TfrmReplicar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

end.
