unit uSplash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Inifiles, Registry, ComCtrls, Gauges, JvExControls, JvComponent,
  Vcl.Imaging.pngimage;

type
  TfrmSplash = class(TForm)
    lbSoftware: TLabel;
    lbBase: TLabel;
    lbVersao: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lbID: TLabel;
    Label1: TLabel;
    lbComp: TLabel;
    lbSerial: TLabel;
    imgLogo: TImage;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

uses uFuncoesSistema, uConstants, uVarGlobal;

{$R *.DFM}

procedure TfrmSplash.FormActivate(Sender: TObject);
Var
vPath: String;
vControl: Tinifile;
vDateFile: String;
vArqIni: String;
vEstacao: String;
vSerial: String;
vRegistro: String;
vImgLogo: String;
begin
  if ctSystem = 'AMBakery' then
    vImgLogo := vgDirImagens + '\splash_bakery.png';
  if ctSystem = 'AMRest' then
    vImgLogo := vgDirImagens + '\splash_rest.png';
  if ctSystem = 'AMSoccer' then
    vImgLogo := vgDirImagens + '\splash_soccer.png';
  imgLogo.Picture.LoadFromFile(vImgLogo);
  vPath := DiretorioSemBarra(ExtractFileDir(Application.ExeName));
  vArqIni := (vPath + '\' + RetornaExecutavelSemExtensao + '.ini');
  lbSoftware.Caption := ctSystem;
  lbVersao.Caption := VersaoSistema(0);
  vDateFile := DateTimeToStr
    (FileDateToDateTime(FileAge(vPath + '\' + RetornaExecutavelSemExtensao + '.exe')));
  lbComp.Caption := vDateFile;
  vControl := TInifile.create(vArqIni);
  lbBase.Caption := vControl.ReadString('Base', 'Protocol', '');
  vEstacao := vControl.ReadString('Splash', 'Estacao', '');
  vSerial := vControl.ReadString('Splash', 'Serial', '');
  vRegistro := vControl.ReadString('Splash', 'Registro', '');
  vControl.free;
  lbSerial.Caption := vSerial;
  lbID.Caption := vEstacao + ' - ' + vRegistro;
end;

end.
