unit uHorarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Mask,
  JvExMask, JvSpin;

type
  TfrmHorarios = class(TfrmTmpFormNormal)
    dsHorarios: TDataSource;
    DBGrid1: TDBGrid;
    sbNew: TSpeedButton;
    sbDelete: TSpeedButton;
    pnAlt: TPanel;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    cbIni: TJvTimeEdit;
    cbEnd: TJvTimeEdit;
    Label3: TLabel;
    Label4: TLabel;
    cbInterval: TJvTimeEdit;
    procedure FormActivate(Sender: TObject);
    procedure sbDeleteClick(Sender: TObject);
    procedure sbNewClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHorarios: TfrmHorarios;

implementation

{$R *.dfm}

uses uDaoHorarios, uFuncoesValidacao, dataGestao;

procedure TfrmHorarios.FormActivate(Sender: TObject);
begin
  cbIni.Time := StrToTime('07:00');
  cbEnd.Time := StrToTime('18:00');
  cbInterval.Time := StrToTime('00:15');
  ListarHorarios('hor_horas');
  inherited;
  dsHorarios.DataSet.Active := True;
end;

procedure TfrmHorarios.sbDeleteClick(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o horário: ' +
                dsHorarios.DataSet.FieldByName('hor_horas').Text, mtConfirmation,
                [mbYes, mbNo], 0) = mrYes then
    DelHorarios;
end;

procedure TfrmHorarios.sbNewClick(Sender: TObject);
Var
vNovo: String;
begin
  InputQuery('Novo horário', 'Digite o novo horário', vNovo);
  if TestaHora(vNovo) = True then
  begin
    InsHorarios;
    dsHorarios.DataSet.FieldByName('hor_horas').Value := StrToTime(vNovo);
    PostHorarios;
    dsHorarios.DataSet.Refresh;
  end
  else
    MessageDlg('Valor inválido para hora! (' + vNovo + ')', mtWarning, [mbOk], 0);
end;

procedure TfrmHorarios.SpeedButton2Click(Sender: TObject);
Var
vHoraIni, vHoraFin, vIntervalo, vHora: TTime;
begin
 if MessageDlg('Este processo irá apagar os horários existentes!' + #13 +
               'Deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    vHoraIni := cbIni.Time;
    vHoraFin := cbEnd.Time;
    vIntervalo := cbInterval.Time;
    vHora := vHoraIni;
    DelAllHorarios;
    while (vHora < vHoraFin) do
    begin
      InsHorarios;
      dsHorarios.DataSet.FieldByName('hor_horas').Value := vHora;
      PostHorarios;
      vHora := vHora + vIntervalo;
    end;
    dsHorarios.DataSet.Refresh;
  end;
end;

end.
