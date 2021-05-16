unit uConsEstMin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Wwdbigrd, Wwdbgrid, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid;

type
  TfrmConsEstMin = class(TfrmTmpFormNormal)
    dsConsulta: TDataSource;
    GridEstMin: TJvDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    sbReservas: TSpeedButton;
    procedure Reservas;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GridEstMinTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure GridEstMinDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbReservasClick(Sender: TObject);
    procedure GridEstMinDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsEstMin: TfrmConsEstMin;

implementation

{$R *.dfm}

uses dataConsultas, uDaoConsultas, uDaoPrevRes, uVerItensReserv;

procedure TfrmConsEstMin.Reservas;
begin
  if not(dsConsulta.DataSet.FieldByName('pro_codigo').IsNull) then
  begin
    if dsConsulta.DataSet.FieldByName('est_reservas').Value > 0 then
    begin
      ItensReservados(IntToStr(dsConsulta.DataSet.FieldByName('pro_codigo').Value));
      frmVerItensReserv.ShowModal;
    end;
  end;
end;

procedure TfrmConsEstMin.FormActivate(Sender: TObject);
begin
  inherited;
  ConsEstMin('p.pro_descricao');
end;

procedure TfrmConsEstMin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsConsulta.DataSet.Close;
  inherited;
end;

procedure TfrmConsEstMin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

procedure TfrmConsEstMin.GridEstMinDblClick(Sender: TObject);
begin
  Reservas;
end;

procedure TfrmConsEstMin.GridEstMinDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if dsConsulta.DataSet.FieldByName('est_fisico').Value <= dsConsulta.DataSet.FieldByName('pro_estmin').Value then
    GridEstMin.Canvas.Font.Color:= clRed
  else
    GridEstMin.Canvas.Font.Color:= clBlack;
  GridEstMin.DefaultDrawDataCell(Rect, GridEstMin.columns[datacol].field, State);
end;

procedure TfrmConsEstMin.GridEstMinTitleBtnClick(Sender: TObject; ACol: Integer;
  Field: TField);
begin
  case (ACol + 1) of
    1: ConsEstMin('p.pro_descricao');
    2: ConsEstMin('p.pro_codigo');
    3: ConsEstMin('p.uni_codigo');
    4: ConsEstMin('g.grp_descricao');
    5: ConsEstMin('s.sgr_descricao');
    6: ConsEstMin('m.mar_descricao');
    7: ConsEstMin('p.pro_vlrcusto');
    8: ConsEstMin('p.pro_estmin');
    9: ConsEstMin('p.pro_estideal');
    10: ConsEstMin('e.est_fisico');
    11: ConsEstMin('e.est_reservas');
    12: ConsEstMin('e.est_disponivel');
  end;
end;

procedure TfrmConsEstMin.sbReservasClick(Sender: TObject);
begin
  Reservas;
end;

end.
