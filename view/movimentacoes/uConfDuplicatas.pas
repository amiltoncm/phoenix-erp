unit uConfDuplicatas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormalMov, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, uClassPagar;

type
  TfrmConfDuplicatas = class(TfrmTmpFormNormalMov)
    JvDBGrid1: TJvDBGrid;
    btLancar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure btLancarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfDuplicatas: TfrmConfDuplicatas;

implementation

{$R *.dfm}

uses uAltDuplicata, uDaoPagar, dataTemp;

procedure TfrmConfDuplicatas.btLancarClick(Sender: TObject);
Var
vPagar: TPagar;
begin
  dsMovimento.DataSet.First;
  Repeat
    vPagar := TPagar.Create;
    vPagar.Codigo := 0;
    vPagar.Emissao := dsMovimento.DataSet.FieldByName('Emissao').Value;
    vPagar.Vencimento := dsMovimento.DataSet.FieldByName('Vencimento').Value;
    vPagar.Numero := dsMovimento.DataSet.FieldByName('Numero').Value;
    vPagar.Serie := dsMovimento.DataSet.FieldByName('Serie').Value;
    vPagar.Modelo := dsMovimento.DataSet.FieldByName('Modelo').Value;
    vPagar.Parcela := dsMovimento.DataSet.FieldByName('Parcela').Value;
    vPagar.Duplicata := dsMovimento.DataSet.FieldByName('Duplicata').Text;
    vPagar.PesCodigo := dsMovimento.DataSet.FieldByName('PesCodigo').Value;
    vPagar.Nome := dsMovimento.DataSet.FieldByName('Nome').Text;
    vPagar.Valor := dsMovimento.DataSet.FieldByName('Valor').Value;
    vPagar.Pago := dsMovimento.DataSet.FieldByName('Pago').Value;
    vPagar.Desconto := dsMovimento.DataSet.FieldByName('Desconto').Value;
    vPagar.Acrescimo := dsMovimento.DataSet.FieldByName('Acrescimo').Value;
    vPagar.Saldo := dsMovimento.DataSet.FieldByName('Saldo').Value;
    vPagar.Chavenfe := dsMovimento.DataSet.FieldByName('ChaveNFe').Text;
    vPagar.StaCodigo := dsMovimento.DataSet.FieldByName('StaCodigo').Value;
    vPagar.Descricao := 'ABERTO';
    InsPagar;
    SetValuesPagar(vPagar);
    PostPagar;
    vPagar.Free;
    dsMovimento.DataSet.Next;
  Until dsMovimento.DataSet.Eof = True;
  MessageDlg('Lançamentos efetuados com sucesso!', mtInformation, [mbOk], 0);
  Close;
end;

procedure TfrmConfDuplicatas.FormActivate(Sender: TObject);
begin
  //inherited;

end;

procedure TfrmConfDuplicatas.JvDBGrid1DblClick(Sender: TObject);
begin
  inherited;
  frmAltDuplicata.ShowModal;
end;

end.
