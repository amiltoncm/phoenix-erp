unit uComandas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormMDI, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.DB, System.ImageList, Vcl.ImgList, System.Actions,
  Vcl.ActnList, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.DBCtrls,
  Vcl.Menus;

type
  TfrmComandas = class(TfrmTmpFormMDI)
    pnCaption: TPanel;
    sbFechar: TSpeedButton;
    sbMinimizar: TSpeedButton;
    pnTop: TPanel;
    pnLeft: TPanel;
    pnClient: TPanel;
    GridAtend: TJvDBGrid;
    ActionList: TActionList;
    sbOpen: TSpeedButton;
    actOpenComanda: TAction;
    ImageList: TImageList;
    sbInsItem: TSpeedButton;
    sbFecharCom: TSpeedButton;
    actInsItem: TAction;
    actFechar: TAction;
    dsComandasAtend: TDataSource;
    pnComandaSel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    dsComandasItens: TDataSource;
    GridItens: TJvDBGrid;
    Label4: TLabel;
    DBText4: TDBText;
    PopupMenuItens: TPopupMenu;
    ExcluirItem1: TMenuItem;
    actRefreshItens: TAction;
    TimerUpdate: TTimer;
    SpeedButton1: TSpeedButton;
    N1: TMenuItem;
    Atualizaritens1: TMenuItem;
    DBText5: TDBText;
    PopComandas: TPopupMenu;
    Excluircomanda1: TMenuItem;
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbMinimizarClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure actOpenComandaExecute(Sender: TObject);
    procedure dsComandasAtendDataChange(Sender: TObject; Field: TField);
    procedure actInsItemExecute(Sender: TObject);
    procedure ExcluirItem1Click(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actRefreshItensExecute(Sender: TObject);
    procedure TimerUpdateTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Excluircomanda1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComandas: TfrmComandas;

implementation

{$R *.dfm}

uses uNewComanda, uDaoComandasAtend, dataGestao, uDaoComandasItens,
  uNewComandaItem, uVarGlobal, uSenhaDelItemCom, uDaoConfig, uClassPrevendas,
  uDaoPrevendas, uFuncoesSistema, uPrevenda;

procedure TfrmComandas.actFecharExecute(Sender: TObject);
Var
vComanda, vMesa: String;
begin
  vComanda := dsComandasAtend.DataSet.FieldByName('cma_codigo').Text;
  vMesa := dsComandasAtend.DataSet.FieldByName('mes_codigo').Text;
  if MessageDlg('Deseja realmente finalizar a comanda (' + vComanda + ' / ' + vMesa +
                ')?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if GetDivideCom = 0 then
    begin
      // Gera a pré-venda e entra para finalizar
      vgPreVenda := TPrevendas.Create;
      GerarDadosPV(dsComandasItens.DataSet.FieldByName('cma_codigo').Value);
      InsPrevendas;
      SetValuesPrevendas(vgPreVenda);
      PostPrevendas;
      vgPreVenda.Free;
      ExportComandasItens(dsComandasItens.DataSet.FieldByName('cma_codigo').Value, vgNumPVGer);
      // Coloca o número da pré-venda nos itens da comanda
      SetNumPVComandasItens(vgNumPVGer, dsComandasItens.DataSet.FieldByName('cma_codigo').Value);
      // Zera comandas
      EdtComandasAtend;
      dsComandasAtend.DataSet.FieldByName('prv_numero').Value := vgNumPVGer;
      PostComandasAtend;
      // Abrir PV para efetuar fechamento
      vgNumPVOpen := IntToStr(vgNumPVGer);
      CriaFormMDI(TfrmPrevenda, frmPrevenda);
      // Atualiza ComandasAtend
      FiltrarComandasAtend('prv_numero', '=', '0', 'cma_codigo');
      dsComandasAtend.DataSet.Refresh;
    end
    else
      MessageDlg('Função não disponível no momento!', mtInformation, [mbOk], 0);
  end;
end;

procedure TfrmComandas.actInsItemExecute(Sender: TObject);
begin
  if Not(dsComandasAtend.DataSet.FieldByName('cma_codigo').IsNull) then
  begin
    vgComanda := dsComandasAtend.DataSet.FieldByName('cma_codigo').Text;
    vgMesa := dsComandasAtend.DataSet.FieldByName('mes_codigo').Text;
    frmNewComandaItem.ShowModal;
    dsComandasItens.DataSet.Refresh;
    AtualizaTotalAtend(dsComandasAtend.DataSet.FieldByName('cma_codigo').Value,
                       dsComandasAtend.DataSet.FieldByName('cmu_codigo').Value);
    AtualizaTotalCustoAtend(dsComandasAtend.DataSet.FieldByName('cma_codigo').Value,
                       dsComandasAtend.DataSet.FieldByName('cmu_codigo').Value);
    FiltrarComandasAtend('prv_numero', '=', '0', 'cma_codigo');
  end;
end;

procedure TfrmComandas.actOpenComandaExecute(Sender: TObject);
begin
  frmNewComanda.ShowModal;
  dsComandasAtend.DataSet.Refresh;
end;

procedure TfrmComandas.actRefreshItensExecute(Sender: TObject);
begin
  dsComandasItens.DataSet.Refresh;
  dsComandasAtend.DataSet.Refresh;
end;

procedure TfrmComandas.dsComandasAtendDataChange(Sender: TObject;
  Field: TField);
begin
  if dsComandasAtend.DataSet.FieldByName('cma_codigo').IsNull then
    FiltrarComandasItensOpen('0')
  else
    FiltrarComandasItensOpen(dsComandasAtend.DataSet.FieldByName('cma_codigo').Text);
end;

procedure TfrmComandas.Excluircomanda1Click(Sender: TObject);
begin
  if dsComandasItens.DataSet.FieldByName('cmi_quantidade').IsNull then
  begin
    if MessageDlg('Deseja realmente excluir a comanda?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      DelComandasAtend;
  end
  else
    MessageDlg('Não é possível excluir comanda em uso!', mtWarning, [mbOk], 0);
end;

procedure TfrmComandas.ExcluirItem1Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir o item selecionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    vgDelItemComanda := false;
    frmSenhaDelItemCom.ShowModal;
    if vgDelItemComanda = true then
    begin
      dsComandasItens.DataSet.Delete;
      dsComandasItens.DataSet.Refresh;
      AtualizaTotalAtend(dsComandasAtend.DataSet.FieldByName('cma_codigo').Value,
                         dsComandasAtend.DataSet.FieldByName('cmu_codigo').Value);
      AtualizaTotalCustoAtend(dsComandasAtend.DataSet.FieldByName('cma_codigo').Value,
                         dsComandasAtend.DataSet.FieldByName('cmu_codigo').Value);
      FiltrarComandasAtend('prv_numero', '=', '0', 'cma_codigo');
      dsComandasAtend.DataSet.Refresh;
    end
    else
      MessageDlg('Não foi possível excluir o item!', mtWarning, [mbOk], 0);
  end;
end;

procedure TfrmComandas.FormActivate(Sender: TObject);
begin
  Self.WindowState := wsMaximized;
  FiltrarComandasAtend('prv_numero', '=', '0', 'cma_codigo');
  dsComandasAtend.DataSet.Active := True;
  dsComandasItens.DataSet.Active := True;
  if GetUpdComanda = 1 then
    TimerUpdate.Enabled := True;
  inherited;
end;

procedure TfrmComandas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TimerUpdate.Enabled := False;
  inherited;
end;

procedure TfrmComandas.FormDestroy(Sender: TObject);
begin
  inherited;
  if frmComandas <> nil then
    frmComandas := nil;
end;

procedure TfrmComandas.sbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmComandas.sbMinimizarClick(Sender: TObject);
begin
  Self.WindowState := wsMinimized;
end;

procedure TfrmComandas.TimerUpdateTimer(Sender: TObject);
begin
  actRefreshItens.Execute;
end;

end.
