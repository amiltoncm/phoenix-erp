unit uDaoAgenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB, uClassAgenda;

procedure SetValuesAgenda(vfAgenda: TAgenda);
procedure InsAgenda;
procedure EdtAgenda;
procedure PostAgenda;
procedure DelAgenda;
procedure ListarAgenda(vfOrdem: String);
procedure FiltrarAgenda(vfCampoFil: String; vfOperador: String; vfParametro:
		        String; vfOrdem: String);
procedure ConsultarAgenda(vfData: String; vfCodQda: String);
procedure SetAtendimento(vfCodPV: Integer);
function TestaAgdNull: boolean;
function TestaAgenda(vfData: String; vfHorario: String; vfQuadra: String): Boolean;

const
ctCampos = 'a.agd_codigo, a.pes_codigo, c.pes_nome, c.pes_fone, a.agd_dataag, ' +
           'a.agd_horaag, a.agd_datalanc, a.agd_horalanc, a.qda_codigo, q.qda_descricao,' +
           'a.agd_atendimento, a.agd_obs, a.usu_codigo';
ctTabelas = 'agenda a, pessoas c, quadras q';

implementation

uses dataConsultas, uFuncoesDB, dataGestao, uVarGlobal;

{--- Seta algum valor na tabela -----------------------------------------------}


procedure SetValuesAgenda(vfAgenda: TAgenda);
begin
  if vfAgenda.Codigo = 0 then
    dmGestao.qyAgendaagd_codigo.Value := GetCodigo('agd_codigo', 'agenda')
  else
    dmGestao.qyAgendaagd_codigo.Value := vfAgenda.Codigo;
  dmGestao.qyAgendapes_codigo.Value := vfAgenda.Codpes;
  dmGestao.qyAgendaqda_codigo.Value := vfAgenda.CodQuadra;
  dmGestao.qyAgendaagd_dataag.Value := vfAgenda.Dataag;
  dmGestao.qyAgendaagd_horaag.Value := vfAgenda.Horaag;
  dmGestao.qyAgendaagd_datalanc.Value := vfAgenda.Datalanc;
  dmGestao.qyAgendaagd_horalanc.Value := vfAgenda.Horalanc;
  dmGestao.qyAgendaagd_obs.Text := vfAgenda.Obs;
  dmGestao.qyAgendaagd_atendimento.Value := vfAgenda.Atendimento;
  dmGestao.qyAgendausu_codigo.Value := vfAgenda.Codusuario;
  // Ytilizado para lançar o item na replicação do agendamento
  vgNewCodAge := dmGestao.qyAgendaagd_codigo.Value;
end;


{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsAgenda;
begin
  if dmGestao.qyAgenda.Active = false then
    dmGestao.qyAgenda.Active := True;
  dmGestao.qyAgenda.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtAgenda;
begin
  dmGestao.qyAgenda.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostAgenda;
begin
  try
    //if dmGestao.qyAgenda.State in [dsInsert] then
      //dmGestao.qyAgendaagd_codigo.Value := GetCodigo('agd_codigo', 'agenda');
    dmGestao.qyAgenda.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmGestao.qyAgenda.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelAgenda;
begin
  try
    dmGestao.qyAgenda.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                 E.Message,mtError,[mbOk],0);
      dmGestao.qyAgenda.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarAgenda(vfOrdem: String);
begin
  dmGestao.qyAgenda.Close;
  dmGestao.qyAgenda.SQL.Clear;
  dmGestao.qyAgenda.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  dmGestao.qyAgenda.SQL.Add(' where a.pes_codigo = c.pes_codigo ' +
                              'and a.qda_codigo = q.qda_codigo');
  if vfOrdem <> '0' then
    dmGestao.qyAgenda.SQL.Add(' order by ' + vfOrdem);
  dmGestao.qyAgenda.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarAgenda(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmGestao.qyAgenda.Close;
  dmGestao.qyAgenda.SQL.Clear;
  dmGestao.qyAgenda.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  dmGestao.qyAgenda.SQL.Add(' where a.pes_codigo = c.pes_codigo ' +
                              'and a.qda_codigo = q.qda_codigo and ');
  dmGestao.qyAgenda.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmGestao.qyAgenda.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmGestao.qyAgenda.SQL.Add(' order by ' + vfOrdem);
  dmGestao.qyAgenda.Open;
end;

procedure ConsultarAgenda(vfData: String; vfCodQda: String);
begin
  dmGestao.qyConsAgenda.Close;
  dmGestao.qyConsAgenda.SQL.Clear;
  dmGestao.qyConsAgenda.SQL.Add('select h.hor_horas, a.agd_dataag,a.agd_codigo, ');
  dmGestao.qyConsAgenda.SQL.Add('a.pes_codigo, c.pes_nome, c.pes_fone, a.agd_datalanc, ');
  dmGestao.qyConsAgenda.SQL.Add('a.agd_horalanc, a.agd_atendimento, a.qda_codigo ');
  dmGestao.qyConsAgenda.SQL.Add('from horarios h ');
  dmGestao.qyConsAgenda.SQL.Add('left join agenda a on h.hor_horas = a.agd_horaag ');
  dmGestao.qyConsAgenda.SQL.Add('and a.agd_dataag = ' + QuotedStr(vfData));
  dmGestao.qyConsAgenda.SQL.Add('and a.qda_codigo = ' + vfCodQda);
  dmGestao.qyConsAgenda.SQL.Add('left join pessoas c on a.pes_codigo = c.pes_codigo ');
  dmGestao.qyConsAgenda.SQL.Add('order by h.hor_horas');
  dmGestao.qyConsAgenda.Open;
end;

procedure SetAtendimento(vfCodPV: Integer);
begin
  dmGestao.qyAgendaagd_atendimento.Value := vfCodPV;
end;

function TestaAgdNull: boolean;
begin
  if dmGestao.qyAgendaagd_codigo.IsNull then
    Result := true
  else
    Result := false;
end;

function TestaAgenda(vfData: String; vfHorario: String; vfQuadra: String): Boolean;
begin
  dmGestao.QTemp.Close;
  dmGestao.QTemp.SQL.Clear;
  dmGestao.QTemp.SQL.Add('select agd_codigo from agenda ');
  dmGestao.QTemp.SQL.Add('where agd_dataag = ' + QuotedStr(vfData));
  dmGestao.QTemp.SQL.Add(' and agd_horaag = ' + QuotedStr(vfHorario));
  dmGestao.QTemp.SQL.Add(' and qda_codigo = ' + vfQuadra);
  dmGestao.QTemp.Open;
  if dmGestao.QTemp.Fields[0].IsNull then
    Result := False
  else
    Result := True;
end;

end.
