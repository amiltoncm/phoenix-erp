unit uUsuariosMod;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.DBCtrls, Data.DB;

type
  TfrmUsuariosMod = class(TfrmTmpFormNormal)
    dsUsuariosMod: TDataSource;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBText1: TDBText;
    Label1: TLabel;
    DBText2: TDBText;
    DBCheckBox3: TDBCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuariosMod: TfrmUsuariosMod;

implementation

{$R *.dfm}

uses dataCadastros, uCadUsuarios;

procedure TfrmUsuariosMod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsUsuariosMod.DataSet.State in [dsInsert, dsEdit] then
  begin
    try
      dsUsuariosMod.DataSet.Post;
    except
      MessageDlg('Erro ao gravar alterações!', mtError, [mbOk], 0);
    end;
  end;
  inherited;
end;

end.
