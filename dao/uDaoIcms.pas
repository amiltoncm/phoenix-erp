unit uDaoIcms;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

procedure InsIcms;
procedure EdtIcms;
procedure PostIcms;
procedure DelIcms;
procedure ListarIcms(vfOrdem: String);
procedure FiltrarIcms(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
function GetPercICMS(vfUFDest: String): Real;

const
ctCampos = 'icm_uforig, icm_ufdest, icm_perc';
ctTabelas = 'icms';

implementation

uses dataDiversos, uDaoEmpresa, uDaoUf;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsIcms;
begin
  if dmDiversos.qyIcms.Active = false then
    dmDiversos.qyIcms.Active := True;
  dmDiversos.qyIcms.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtIcms;
begin
  dmDiversos.qyIcms.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostIcms;
begin
  try
    dmDiversos.qyIcms.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmDiversos.qyIcms.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelIcms;
begin
  try
    dmDiversos.qyIcms.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                  E.Message,mtError,[mbOk],0);
      dmDiversos.qyIcms.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarIcms(vfOrdem: String);
begin
  dmDiversos.qyIcms.Close;
  dmDiversos.qyIcms.SQL.Clear;
  dmDiversos.qyIcms.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  if vfOrdem <> '0' then
    dmDiversos.qyIcms.SQL.Add(' order by ' + vfOrdem);
  dmDiversos.qyIcms.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarIcms(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmDiversos.qyIcms.Close;
  dmDiversos.qyIcms.SQL.Clear;
  dmDiversos.qyIcms.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas + ' where ');
  dmDiversos.qyIcms.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmDiversos.qyIcms.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmDiversos.qyIcms.SQL.Add(' order by ' + vfOrdem);
  dmDiversos.qyIcms.Open;
end;

function GetPercICMS(vfUFDest: String): Real;
Var
vUFOrig: String;
vPerc: Real;
begin
  vUFOrig := GetUFOrig;
  if vUFOrig = vfUFDest then
    vPerc := GetPercInt(vUFOrig)
  else
  begin
    dmDiversos.qyIcms.Close;
    dmDiversos.qyIcms.SQL.Clear;
    dmDiversos.qyIcms.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
    dmDiversos.qyIcms.SQL.Add('where icm_uforig = ' + QuotedStr(vUFOrig));
    dmDiversos.qyIcms.SQL.Add('and icm_ufdest = ' + QuotedStr(vfUFDest));
    dmDiversos.qyIcms.Open;
    vPerc := dmDiversos.qyIcmsicm_perc.Value;
  end;
  Result := vPerc;
end;

end.
