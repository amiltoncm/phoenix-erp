unit uDaoConfig;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassConfig;

procedure SetValuesConfig(vfConfig: TConfig);
procedure InsConfig;
procedure EdtConfig;
procedure PostConfig;
procedure ListarConfig(vfOrdem: String);
procedure FiltrarConfig(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
procedure setVersao(vfVersao: String);
function GetCidPadrao: Integer;
function BuscaCEP: String;
function LancaTerc: Boolean;
function GetValOrc: Integer;
function GetDescMax: Real;
function GetMgMin: Real;
function GetProdCase: String;
function GetPercPIS: Real;
function GetPercCOFINS: Real;
function GetEfetPrv: Integer;
function GetEfetPrvAut: Integer;
function FechaPVAuto: Integer;
function GetDivideCom: Integer;
function GetUserApp: Integer;
function GetUpdComanda: Integer;
function GetUserDelivery: Integer;

const
ctCampos = 'cfg_codigo, cfg_versao, cfg_codcidadepadrao, cfg_buscacep, cfg_lannfter, ' +
           'cfg_valorc, cfg_descmax, cfg_mgmin, cfg_prodcase, cfg_pis, cfg_cofins, ' +
           'cfg_efetprv, cfg_divcomanda, cfg_efetprvaut, cfg_fechaprvaut, cfg_userapp, ' +
           'cfg_autupdcom, cfg_delivery';
ctTabelas = 'config';

implementation

uses dataConfig;

{--- Seta algum valor na tabela -----------------------------------------------}

procedure SetValuesConfig(vfConfig: TConfig);
begin
  dmConfig.qyConfigcfg_codigo.Value := vfConfig.Codigo;
  dmConfig.qyConfigcfg_versao.Value := vfConfig.Versao;
  dmConfig.qyConfigcfg_codcidadepadrao.Value := vfConfig.CodCidade;
end;

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsConfig;
begin
  if dmConfig.qyConfig.Active = false then
    dmConfig.qyConfig.Active := True;
  dmConfig.qyConfig.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtConfig;
begin
  dmConfig.qyConfig.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostConfig;
begin
  try
    dmConfig.qyConfig.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmConfig.qyConfig.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarConfig(vfOrdem: String);
begin
  dmConfig.qyConfig.Close;
  dmConfig.qyConfig.SQL.Clear;
  dmConfig.qyConfig.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  if vfOrdem <> '0' then
    dmConfig.qyConfig.SQL.Add(' order by ' + vfOrdem);
  dmConfig.qyConfig.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarConfig(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmConfig.qyConfig.Close;
  dmConfig.qyConfig.SQL.Clear;
  dmConfig.qyConfig.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas + ' where ');
  dmConfig.qyConfig.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmConfig.qyConfig.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmConfig.qyConfig.SQL.Add(' order by ' + vfOrdem);
  dmConfig.qyConfig.Open;
end;

procedure setVersao(vfVersao: String);
begin
  EdtConfig;
  dmConfig.qyConfigcfg_versao.Value := vfVersao;
  PostConfig;
end;

function GetCidPadrao: Integer;
begin
  Result := dmConfig.qyConfigcfg_codcidadepadrao.Value;
end;

function BuscaCEP: String;
begin
  Result := dmConfig.qyConfigcfg_buscacep.Value;
end;

function LancaTerc: Boolean;
begin
  if dmConfig.qyConfigcfg_lannfter.Text = 'S' then
    Result := True
  else
    Result := False;
end;

function GetValOrc: Integer;
begin
  Result := dmConfig.qyConfigcfg_valorc.Value;
end;

function GetDescMax: Real;
begin
  Result := dmConfig.qyConfigcfg_descmax.Value;
end;

function GetMgMin: Real;
begin
  Result := dmConfig.qyConfigcfg_mgmin.Value;
end;

function GetProdCase: String;
begin
  Result := dmConfig.qyConfigcfg_prodcase.Text;
end;

function GetPercPIS: Real;
begin
  Result := dmConfig.qyConfigcfg_pis.Value;
end;

function GetPercCOFINS: Real;
begin
  Result := dmConfig.qyConfigcfg_cofins.Value;
end;

function GetEfetPrv: Integer;
begin
  Result := dmConfig.qyConfigcfg_efetprv.Value;
end;

function GetEfetPrvAut: Integer;
begin
  Result := dmConfig.qyConfigcfg_efetprvaut.Value;
end;

function FechaPVAuto: Integer;
begin
  Result := dmConfig.qyConfigcfg_fechaprvaut.Value;
end;

function GetDivideCom: Integer;
begin
  Result := dmConfig.qyConfigcfg_divcomanda.Value;
end;

function GetUserApp: Integer;
begin
  Result := dmConfig.qyConfigcfg_userapp.Value;
end;

function GetUpdComanda: Integer;
begin
  Result := dmConfig.qyConfigcfg_autupdcom.Value;
end;

function GetUserDelivery: Integer;
begin
  Result := dmConfig.qyConfigcfg_delivery.Value;
end;

end.
