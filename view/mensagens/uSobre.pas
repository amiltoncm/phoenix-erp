unit uSobre;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Menus, Inifiles, ShellAPI, uTmpForm, Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage;

type
  TfrmSobre = class(TfrmTmpForm)
    Panel1: TPanel;
    OKButton: TButton;
    ImgBase: TImage;
    lbBase: TLabel;
    ImgSobre: TImage;
    lbSoftware: TLabel;
    Label2: TLabel;
    lbVersao: TLabel;
    lbSerial: TLabel;
    lbID: TLabel;
    lbDtFile: TLabel;
    Image: TImage;
    lbSQL: TLabel;
    procedure OKButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ImageClick(Sender: TObject);
    procedure ImgBaseClick(Sender: TObject);
    procedure lbSQLDblClick(Sender: TObject);
    procedure ImgSobreDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

uses uSql, uFuncoesSistema, uFuncoesSeguranca, uVarGlobal, uCfgBase, uDaoUpdate,
  uConstants;

{$R *.DFM}

procedure TfrmSobre.OKButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmSobre.FormActivate(Sender: TObject);
Var
vEstacao, vSerial, vDateFile, vImgBase, vRegistro: String;
vControl: TInifile;
begin
  lbSoftware.Caption := ctSystem;
  vDateFile := DateTimeToStr
    (FileDateToDateTime(FileAge(vgPath + '\' + RetornaExecutavelSemExtensao +
    '.exe')));
  lbDtFile.Caption := vDateFile;
  vControl := TInifile.create(vgArqIni);
  vEstacao := vControl.ReadString('Splash', 'Estacao', '');
  vSerial := vControl.ReadString('Splash', 'Serial', '');
  vRegistro := vControl.ReadString('Splash', 'Registro', '');
  vImgBase := vControl.ReadString('Imagens', 'LogoBase', '');
  lbBase.Caption := vControl.ReadString('Base', 'Protocol', '');
  vControl.free;
  lbBase.Caption := lbBase.Caption + ' - Update: ' + IntToStr(GetUpdate);
  lbSerial.Caption := vSerial;
  // Pega a Vers�o via fun��o;
  lbVersao.Caption := VersaoSistema(0);
  lbID.Caption := vEstacao + ' - ' + vRegistro;
  ImgBase.Picture.LoadFromFile(vImgBase);
  ImgBase.Hint := ImgBase.Hint + #13 + lbBase.Caption;
end;

procedure TfrmSobre.FormCreate(Sender: TObject);
Var
  hSysMenu: HMENU;
begin
  hSysMenu := GetSystemMenu(Self.Handle, False);
  if hSysMenu <> 0 then
  begin
    EnableMenuItem(hSysMenu, SC_CLOSE, MF_BYCOMMAND Or MF_GRAYED);
    DrawMenuBar(Self.Handle);
  end;
end;

procedure TfrmSobre.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    close;
end;

procedure TfrmSobre.ImageClick(Sender: TObject);
begin
  ShellExecute(Handle, 'OPEN', Pchar('www.microsoft.com.br'), nil, nil,
    sw_ShowNormal);
end;

procedure TfrmSobre.ImgBaseClick(Sender: TObject);
begin
  if lbBase.Caption = 'FIREBIRD' then
    ShellExecute(Handle, 'OPEN', Pchar('www.firebirdsql.org'), nil, nil,
      sw_ShowNormal);
  if lbBase.Caption = 'MYSQL' then
    ShellExecute(Handle, 'OPEN', Pchar('www.mysql.com'), nil, nil,
      sw_ShowNormal);
  if lbBase.Caption = 'POSTGRESQL' then
    ShellExecute(Handle, 'OPEN', Pchar('www.postgresql.com'), nil, nil,
      sw_ShowNormal);
end;

procedure TfrmSobre.ImgSobreDblClick(Sender: TObject);
begin
  frmCfgBase.ShowModal;
end;

procedure TfrmSobre.lbSQLDblClick(Sender: TObject);
begin
  frmSql.ShowModal;
end;

end.
