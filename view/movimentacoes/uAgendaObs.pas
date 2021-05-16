unit uAgendaObs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.DBCtrls, Data.DB, Vcl.Grids, wwDataInspector, Vcl.DBGrids;

type
  TfrmAgendaObs = class(TfrmTmpFormNormal)
    wwDataInspector1: TwwDataInspector;
    dsAgenda: TDataSource;
    memObs: TDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    dsAgeItens: TDataSource;
    GridServ: TDBGrid;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgendaObs: TfrmAgendaObs;

implementation

{$R *.dfm}

uses dataGestao;

procedure TfrmAgendaObs.FormActivate(Sender: TObject);
begin
  inherited;
  dsAgenda.DataSet.Active := True;
  dsAgeItens.DataSet.Active := True;
  btFechar.SetFocus;
end;

procedure TfrmAgendaObs.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #27 then
    Close;
end;

end.
