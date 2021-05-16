unit uDaoCotacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

//procedure SetValuesCotacao(vfCotacao: TCotacao);
procedure InsCotacao;
procedure EdtCotacao;
procedure PostCotacao;
procedure DelCotacao;
procedure ListarCotacao(vfOrdem: String);
procedure FiltrarCotacao(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);

const
ctCampos = 'c.cot_numero, c.cot_data, c.pes_codigo, r.pes_nome, r.pes_fone, ' +
           'c.cot_contato, c.fun_codigo, f.fun_nome, c.cot_referente, c.cot_obs, ' +
           'c.cot_subtotal, c.cot_vlrdesc, c.cot_percdesc, c.cot_vlrtotal, ' +
           'c.prz_codigo, p.prz_descricao, c.frp_codigo, o.frp_descricao, ' +
           'c.mdf_codigo, m.mdf_descricao, c.sto_codigo, s.sto_descricao, ' +
           'c.ent_codigo, e.ent_descricao, c.ord_numero';
ctTabelas = 'cotacao c, pessoas r, funcionarios f, prazos p, formpag o, modfrete m, statusorc s, entrega e';

implementation

uses dataCompras;

{--- Seta algum valor na tabela -----------------------------------------------}

{
procedure SetValuesCotacao(vfCotacao: TCotacao);
begin
  //@VINCULAR
end;
}

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsCotacao;
begin
  if dmCompras.qyCotacao.Active = false then
    dmCompras.qyCotacao.Active := True;
  dmCompras.qyCotacao.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtCotacao;
begin
  dmCompras.qyCotacao.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostCotacao;
begin
  try
    //if dmCompras.qyCotacao.State in [dsInsert] then
      //dmCompras.qyCotacaoc.cot_numero.Value := GetCodigo('c.cot_numero', 'Cotacao');
    dmCompras.qyCotacao.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmCompras.qyCotacao.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelCotacao;
begin
  try
    dmCompras.qyCotacao.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                 E.Message,mtError,[mbOk],0);
      dmCompras.qyCotacao.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarCotacao(vfOrdem: String);
begin
  dmCompras.qyCotacao.Close;
  dmCompras.qyCotacao.SQL.Clear;
  dmCompras.qyCotacao.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  dmCompras.qyCotacao.SQL.Add(' where c.pes_codigo = r.pes_codigo and c.fun_codigo = f.fun_codigo and c.prz_codigo = p.prz_codigo and c.frp_codigo = o.frp_codigo and c.mdf_codigo = m.mdf_codigo and c.sto_codigo = s.sto_codigo and c.ent_codigo = e.ent_codigo ');
  if vfOrdem <> '0' then
    dmCompras.qyCotacao.SQL.Add(' order by ' + vfOrdem);
  dmCompras.qyCotacao.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarCotacao(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);
begin
  dmCompras.qyCotacao.Close;
  dmCompras.qyCotacao.SQL.Clear;
  dmCompras.qyCotacao.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmCompras.qyCotacao.SQL.Add(' where c.pes_codigo = r.pes_codigo and c.fun_codigo = f.fun_codigo and c.prz_codigo = p.prz_codigo and c.frp_codigo = o.frp_codigo and c.mdf_codigo = m.mdf_codigo and c.sto_codigo = s.sto_codigo and c.ent_codigo = e.ent_codigo and ');
  dmCompras.qyCotacao.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCompras.qyCotacao.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmCompras.qyCotacao.SQL.Add(' order by ' + vfOrdem);
  dmCompras.qyCotacao.Open;
end;

end.
