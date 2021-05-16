unit uDaoOrdCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

//procedure SetValuesOrdCompra(vfOrdCompra: TOrdCompra);
procedure InsOrdCompra;
procedure EdtOrdCompra;
procedure PostOrdCompra;
procedure DelOrdCompra;
procedure ListarOrdCompra(vfOrdem: String);
procedure FiltrarOrdCompra(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String);

const
ctCampos = 'c.ord_numero, c.ord_data, c.pes_codigo, r.pes_nome, r.pes_fone, c.ord_contato, ' +
           'c.fun_codigo, f.fun_nome, c.ord_referente, c.ord_obs, c.ord_subtotal, ' +
           'c.ord_vlrdesc, c.ord_percdesc, c.ord_vlrtotal, c.prz_codigo, p.prz_descricao, ' +
           'c.frp_codigo, o.frp_descricao, c.mdf_codigo, m.mdf_descricao, ' +
           'c.sto_codigo, s.sto_descricao, c.ent_codigo, e.ent_descricao, c.cot_numero';
ctTabelas = 'ordcompra c, pessoas r, funcionarios f, prazos p, formpag o, modfrete m, statusorc s, entrega e';

implementation

uses dataCompras;

{--- Seta algum valor na tabela -----------------------------------------------}

{
procedure SetValuesOrdCompra(vfOrdCompra: TOrdCompra);
begin
  //@VINCULAR
end;
}

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsOrdCompra;
begin
  if dmCompras.qyOrdCompra.Active = false then
    dmCompras.qyOrdCompra.Active := True;
  dmCompras.qyOrdCompra.Insert;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtOrdCompra;
begin
  dmCompras.qyOrdCompra.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostOrdCompra;
begin
  try
    //if dmCompras.qyOrdCompra.State in [dsInsert] then
      //dmCompras.qyOrdComprac.ord_numero.Value := GetCodigo('c.ord_numero', 'OrdCompra');
    dmCompras.qyOrdCompra.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmCompras.qyOrdCompra.Refresh;
    end;
  end;
end;

{--- Apaga registro da tabela -------------------------------------------------}

procedure DelOrdCompra;
begin
  try
    dmCompras.qyOrdCompra.Delete;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao excluir registro!' + #13 +
                 E.Message,mtError,[mbOk],0);
      dmCompras.qyOrdCompra.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarOrdCompra(vfOrdem: String);
begin
  dmCompras.qyOrdCompra.Close;
  dmCompras.qyOrdCompra.SQL.Clear;
  dmCompras.qyOrdCompra.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  dmCompras.qyOrdCompra.SQL.Add(' where c.pes_codigo = r.pes_codigo ' +
                                'and c.fun_codigo = f.fun_codigo ' +
                                'and c.prz_codigo = p.prz_codigo ' +
                                'and c.frp_codigo = o.frp_codigo ' +
                                'and c.mdf_codigo = m.mdf_codigo ' +
                                'and c.sto_codigo = s.sto_codigo ' +
                                'and c.ent_codigo = e.ent_codigo ');
  if vfOrdem <> '0' then
    dmCompras.qyOrdCompra.SQL.Add(' order by ' + vfOrdem);
  dmCompras.qyOrdCompra.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarOrdCompra(vfCampoFil: String; vfOperador: String; vfParametro:
		     String; vfOrdem: String);
begin
  dmCompras.qyOrdCompra.Close;
  dmCompras.qyOrdCompra.SQL.Clear;
  dmCompras.qyOrdCompra.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas);
  dmCompras.qyOrdCompra.SQL.Add(' where c.pes_codigo = r.pes_codigo ' +
                                'and c.fun_codigo = f.fun_codigo ' +
                                'and c.prz_codigo = p.prz_codigo ' +
                                'and c.frp_codigo = o.frp_codigo ' +
                                'and c.mdf_codigo = m.mdf_codigo ' +
                                'and c.sto_codigo = s.sto_codigo ' +
                                'and c.ent_codigo = e.ent_codigo and ');
  dmCompras.qyOrdCompra.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmCompras.qyOrdCompra.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmCompras.qyOrdCompra.SQL.Add(' order by ' + vfOrdem);
  dmCompras.qyOrdCompra.Open;
end;

end.
