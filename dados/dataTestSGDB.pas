unit dataTestSGDB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Inifiles, uClassConexao, ZAbstractConnection, ZConnection;


type
  TdmTestSGDB = class(TDataModule)
    Conexao: TZConnection;
  private
    { Private declarations }
  public
    function TestaConexao(vfConexao: TConexao): boolean;
  end;

var
  dmTestSGDB: TdmTestSGDB;

implementation

{$R *.dfm}

function TdmTestSGDB.TestaConexao(vfConexao: TConexao): boolean;
begin
    Conexao.Connected := false;
    Conexao.Protocol := vfConexao.Protocol;
    Conexao.HostName := vfConexao.HostName;
    Conexao.User := vfConexao.User;
    Conexao.Password := vfConexao.Password;
    Conexao.Port := vfConexao.Port;
    Conexao.Database := vfConexao.Database;
    Conexao.ClientCodepage := vfConexao.ClientCodePage;
    Conexao.LibraryLocation := vfConexao.LibraryLocation;
  try
    Conexao.Connected := True;
    Result := True
  except
    Result := False;
  end;
end;

end.
