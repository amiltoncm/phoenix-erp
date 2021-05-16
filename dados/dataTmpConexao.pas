unit dataTmpConexao;

interface

uses
  System.SysUtils, System.Classes, Inifiles, ZAbstractConnection, ZConnection,
  Vcl.Dialogs, Forms, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TdmTmpConexao = class(TDataModule)
    database: TZConnection;
    QGeraCodigo: TZQuery;
    QTemp: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmTmpConexao: TdmTmpConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uErConexao, uFuncoesSistema, uVarGlobal, uFuncoesSeguranca;

{$R *.dfm}

procedure TdmTmpConexao.DataModuleCreate(Sender: TObject);
Var
vControl: TInifile;
vProtocol, vHostName, vUser, vPassword: String;
vDatabase, vClientCodepage, vLibraryLocation: String;
vPort: Integer;
begin
  try
    {$IFDEF RELEASE}
      if database.Connected = True then
      begin
        MessageDlg('O database ' + Self.Name + ' está ativo!', mtError, [mbOk], 0);
        Application.Terminate;
      end;
    {$ENDIF}
    database.Connected := false;
    if Not FileExists(vgArqIni) then
    begin
      Messagedlg('Arquivo ' + RetornaExecutavelSemExtensao + '.ini não encontrado!' +
                 #13 + #10 + 'Execute o Config para gerá-lo!', mtError, [mbok], 0);
      Application.Terminate;
    end;
    vControl := Tinifile.create(vgArqIni);
    vDatabase := vControl.readstring('Base', 'Database','');
    vProtocol := vControl.readstring('Base', 'Protocol','');
    vHostName := vControl.readstring('Base', 'HostName','');
    vUser := vControl.readstring('Base', 'User','');
    vPassword := vControl.readstring('Base', 'Password','');
    vPassword := DecryptMsg((vPassword), Length(vPassword));
    vPort := vControl.ReadInteger('Base', 'Port', 0);
    vClientCodepage := vControl.readstring('Base', 'ClientCodePage','');
    vLibraryLocation := vControl.readstring('Base', 'LibraryLocation','');
  except
    MessageDlg('Não foi possível carregar configuração do banco de dados!', mtError, [mbok], 0);
    MessageDlg('String de configuração: ' + vDatabase + vHostName + vProtocol +
               vUser, mtError, [mbok], 0);
    vControl.Free;
  end;
  database.Protocol := vProtocol;
  database.HostName := vHostName;
  database.User := vUser;
  database.Password := vPassword;
  database.Port := vPort;
  database.Database := vDatabase;
  database.ClientCodepage := vClientCodepage;
  database.LibraryLocation := vLibraryLocation;
  try
    database.Connected := True;
  except
    on E: Exception do
    Begin
      frmErConexao.memLogErro.Lines.Clear;
      frmErConexao.memLogErro.Lines.Add(E.Message);
      frmErConexao.Showmodal;
    end;
  end;
end;

end.
