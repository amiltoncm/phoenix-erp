unit uConsAgenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid;

type
  TfrmConsAgenda = class(TfrmTmpFormNormal)
    Panel1: TPanel;
    mcDataAge: TMonthCalendar;
    Label1: TLabel;
    Label2: TLabel;
    JvDBGrid1: TJvDBGrid;
    dsQuadras: TDataSource;
    JvDBGrid2: TJvDBGrid;
    Label3: TLabel;
    dsConsAgenda: TDataSource;
    procedure Consultar;
    procedure mcDataAgeClick(Sender: TObject);
    procedure JvDBGrid1CellClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure JvDBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGrid2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsAgenda: TfrmConsAgenda;

implementation

{$R *.dfm}

uses dataGestao, uDaoAgenda, uVarGlobal, uDaoQuadras, uAgendamento;

procedure TfrmConsAgenda.Consultar;
Var
vCodQuadra: String;
begin
  if dsQuadras.DataSet.FieldByName('qda_codigo').IsNull then
    vCodQuadra := '0'
  else
    vCodQuadra := dsQuadras.DataSet.FieldByName('qda_codigo').Text;
  ConsultarAgenda(FormatDateTime(vgMaskData, mcDataAge.Date), vCodQuadra);
end;

procedure TfrmConsAgenda.FormActivate(Sender: TObject);
begin
  inherited;
  ListarQuadras('qda_codigo');
  dsQuadras.DataSet.Active := True;
  dsConsAgenda.DataSet.Active := True;
end;

procedure TfrmConsAgenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

procedure TfrmConsAgenda.JvDBGrid1CellClick(Column: TColumn);
begin
  Consultar;
end;

procedure TfrmConsAgenda.JvDBGrid2DblClick(Sender: TObject);
begin
  if dsConsAgenda.DataSet.FieldByName('qda_codigo').IsNull then
  begin
    vgAgQda := dmGestao.qyQuadrasqda_descricao.Text;
    vgAgCodQda := dmGestao.qyQuadrasqda_codigo.Text;
    vgAgData := mcDataAge.Date;
    vgAgHora := dsConsAgenda.DataSet.FieldByName('hor_horas').Value;
    frmAgendamento.ShowModal;
    dsConsAgenda.DataSet.Refresh;
    ListarQuadras('qda_codigo');
  end
  else
    MessageDlg('Este horário já possui agendamento!', mtWarning, [mbOk], 0);
end;

procedure TfrmConsAgenda.JvDBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) then
  begin
    if Odd((Sender as TDBGrid).DataSource.DataSet.RecNo) then
      (Sender as TDBGrid).Canvas.Brush.Color:= clWhite
    else
      (Sender as TDBGrid).Canvas.Brush.Color:= $00F1F2F3; // leve cinza

    // Aplicando prto para a cor da fonte
    (Sender as TDBGrid).Canvas.Font.Color:= clBlack;

    (Sender as TDBGrid).Canvas.FillRect(Rect);
    (Sender as TDBGrid).Canvas.TextOut(Rect.Left + 2, Rect.Top,
    Column.Field.DisplayText);
  end;
end;

procedure TfrmConsAgenda.mcDataAgeClick(Sender: TObject);
begin
  Consultar;
end;

end.
