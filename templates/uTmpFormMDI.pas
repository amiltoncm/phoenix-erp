unit uTmpFormMDI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, uTmpForm;

type
  TfrmTmpFormMDI = class(TfrmTmpForm)
    btFechar: TBitBtn;
    procedure btFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
  end;

var
  frmTmpFormMDI: TfrmTmpFormMDI;

implementation

{$R *.DFM}

procedure TfrmTmpFormMDI.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
var
Rect: TRect;
OurWidth: Integer;
OurHeight: Integer;
begin
  if Showing then
  begin
    // Obtem o retângulo da área cliente MDI
    Windows.GetWindowRect(Application.MainForm.ClientHandle, Rect);
    // Calcular largura e altura da área cliente
    OurWidth := Rect.Right - Rect.Left;
    OurHeight := Rect.Bottom - Rect.Top;
    // Calcula a nova posição
    ALeft := (OurWidth - Width) div 2;
    ATop := (OurHeight - Height) div 2;
  end;
  inherited SetBounds(ALeft, ATop, AWidth, AHeight);
end;

procedure TfrmTmpFormMDI.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTmpFormMDI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmTmpFormMDI.FormDestroy(Sender: TObject);
begin
  inherited;
  if Self <> nil then
    Self := nil;
end;

end.
