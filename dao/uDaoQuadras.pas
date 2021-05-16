unit uDaoQuadras;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure InsQuadras;
procedure EdtQuadras;
procedure PostQuadras;
procedure DelQuadras;
procedure ListarQuadras(vfOrdem: String);
procedure FiltrarQuadras(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
function ConsQdaProd(vfCodigo: String): Integer;
function GetNameQuadra(vfCodigo: String): String;

const
ctCampos = 'qda_codigo, qda_descricao, pro_codigo';
ctTabelas = 'quadras';

implementation

uses dataGestao;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsQuadras;
begin
  if dmGestao.qyQuadras.Active = false then
    dmGestao.qyQuadras.Active := True;
  dmGestao.qyQuadras.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtQuadras;
begin
  dmGestao.qyQuadras.Edit;
end;

{--- D� um post na tabela -----------------------------------------------------}

procedure PostQuadras;
begin
  try
    //if dmGestao.qyQuadra.State in [dsInsert] then
      //dmGestao.qyQuadraqda_codigo.Value := GetCodigo('qda_codigo', 'Quadra');
    dmGestao.qyQuadras.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Altera��o / Inser��o!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmGestao.qyQuadras.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelQuadras;
begin
  try
    dmGestao.qyQuadras.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                  E.Message,mtError,[mbOk],0);
      dmGestao.qyQuadras.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarQuadras(vfOrdem: String);
begin
  dmGestao.qyQuadras.Close;
  dmGestao.qyQuadras.SQL.Clear;
  dmGestao.qyQuadras.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  dmGestao.qyQuadras.SQL.Add('where qda_codigo > 0');
  if vfOrdem <> '0' then
    dmGestao.qyQuadras.SQL.Add(' order by ' + vfOrdem);
  dmGestao.qyQuadras.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarQuadras(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmGestao.qyQuadras.Close;
  dmGestao.qyQuadras.SQL.Clear;
  dmGestao.qyQuadras.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmGestao.qyQuadras.SQL.Add('where qda_codigo > 0 and ');
  dmGestao.qyQuadras.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmGestao.qyQuadras.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmGestao.qyQuadras.SQL.Add(' order by ' + vfOrdem);
  dmGestao.qyQuadras.Open;
end;

function ConsQdaProd(vfCodigo: String): Integer;
Var
vResult: Integer;
begin
  FiltrarQuadras('qda_codigo', '=', vfCodigo, '0');
  if dmGestao.qyQuadraspro_codigo.IsNull then
    vResult := 0
  else
    vResult := dmGestao.qyQuadraspro_codigo.Value;
  Result := vResult;
end;

function GetNameQuadra(vfCodigo: String): String;
begin
  dmGestao.QTemp.Close;
  dmGestao.QTemp.SQL.Clear;
  dmGestao.QTemp.SQL.Add('select qda_descricao from quadras ');
  dmGestao.QTemp.SQL.Add('where qda_codigo = ' + vfCodigo);
  dmGestao.QTemp.Open;
  if dmGestao.QTemp.Fields[0].IsNull then
    Result := 'NÃO DEFINIDA'
  else
    Result := dmGestao.QTemp.Fields[0].Text;
end;

end.
