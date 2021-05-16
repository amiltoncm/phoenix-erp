unit uDetReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid;

type
  TfrmDetReceber = class(TfrmTmpFormNormal)
    Label1: TLabel;
    dbVencimento: TDBEdit;
    dsDetalhes: TDataSource;
    Label2: TLabel;
    dbCliente: TDBEdit;
    Label3: TLabel;
    dbNF: TDBEdit;
    Label4: TLabel;
    dbSerie: TDBEdit;
    Label5: TLabel;
    dbModelo: TDBEdit;
    Label6: TLabel;
    dbEmissao: TDBEdit;
    Label7: TLabel;
    dbParcela: TDBEdit;
    Label8: TLabel;
    dbChave: TDBEdit;
    Label9: TLabel;
    dbValor: TDBEdit;
    Label10: TLabel;
    dbAcrescimo: TDBEdit;
    Label11: TLabel;
    dbDesconto: TDBEdit;
    Label12: TLabel;
    dbPago: TDBEdit;
    Label13: TLabel;
    dbSaldo: TDBEdit;
    Label14: TLabel;
    dbStatus: TDBEdit;
    dsConsCaixa: TDataSource;
    Label15: TLabel;
    JvDBGrid1: TJvDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDetReceber: TfrmDetReceber;

implementation

{$R *.dfm}

uses uDaoConsultas, dataConsultas;

procedure TfrmDetReceber.FormActivate(Sender: TObject);
begin
  inherited;
  dsDetalhes.DataSet.Active := True;
  ConsRecCaixa(IntToStr(dsDetalhes.DataSet.FieldByName('rec_codigo').Value));
  btFechar.SetFocus;
end;

procedure TfrmDetReceber.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

end.
