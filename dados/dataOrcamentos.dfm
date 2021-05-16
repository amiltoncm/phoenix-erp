inherited dmOrcamentos: TdmOrcamentos
  OldCreateOrder = True
  inherited QGeraCodigo: TZQuery
    Left = 168
  end
  inherited QTemp: TZQuery
    Left = 256
  end
  object ScriptDelPrevRes: TZQuery
    Connection = database
    UpdateObject = updScriptDelPrevRes
    Params = <>
    Left = 608
    Top = 16
  end
  object updScriptDelPrevRes: TZUpdateSQL
    UseSequenceFieldForRefreshSQL = False
    Left = 704
    Top = 16
  end
  object ScriptDelPrevItens: TZQuery
    Connection = database
    UpdateObject = updScriptDelPrevItens
    Params = <>
    Left = 360
    Top = 16
  end
  object updScriptDelPrevItens: TZUpdateSQL
    UseSequenceFieldForRefreshSQL = False
    Left = 456
    Top = 16
  end
  object qyCalcItensPV: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      
        'i.pri_codigo, i.prv_numero, i.pri_quantidade, i.pro_codigo, p.pr' +
        'o_descricao,'
      
        'l.loc_descricao, p.uni_codigo, i.pri_vlrcusto, i.pri_vlrbrt, i.p' +
        'ri_vlrdesc,'
      'i.pri_percdesc, i.pri_vlrliq, i.pri_vlrtotal, i.pri_percmg'
      'from previtens i, produtos p, localizacao l'
      'where i.pro_codigo = p.pro_codigo'
      'and p.loc_codigo = l.loc_codigo'
      'order by i.pri_codigo')
    Params = <>
    Left = 40
    Top = 96
    object qyCalcItensPVpri_codigo: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'pri_codigo'
      Required = True
      Visible = False
    end
    object qyCalcItensPVprv_numero: TIntegerField
      DisplayLabel = 'Pr'#233'-venda'
      FieldName = 'prv_numero'
      Required = True
      Visible = False
    end
    object qyCalcItensPVpri_quantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'pri_quantidade'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
    object qyCalcItensPVpro_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pro_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyCalcItensPVpro_descricao: TWideStringField
      DisplayLabel = 'Produto'
      FieldName = 'pro_descricao'
      Required = True
      Size = 100
    end
    object qyCalcItensPVloc_descricao: TWideStringField
      DisplayLabel = 'Localiza'#231#227'o'
      FieldName = 'loc_descricao'
      Required = True
    end
    object qyCalcItensPVuni_codigo: TWideStringField
      DisplayLabel = 'Un.'
      FieldName = 'uni_codigo'
      Required = True
      Size = 2
    end
    object qyCalcItensPVpri_vlrcusto: TFloatField
      DisplayLabel = 'Vlr Custo'
      FieldName = 'pri_vlrcusto'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
    object qyCalcItensPVpri_vlrbrt: TFloatField
      DisplayLabel = 'Vlr. Bruto'
      FieldName = 'pri_vlrbrt'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
    object qyCalcItensPVpri_vlrdesc: TFloatField
      DisplayLabel = 'Vlr. Desc.'
      FieldName = 'pri_vlrdesc'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
    object qyCalcItensPVpri_percdesc: TFloatField
      DisplayLabel = 'Desc. %'
      FieldName = 'pri_percdesc'
      Required = True
      DisplayFormat = '#0.0'
    end
    object qyCalcItensPVpri_vlrliq: TFloatField
      DisplayLabel = 'Vlr. Liq.'
      FieldName = 'pri_vlrliq'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyCalcItensPVpri_vlrtotal: TFloatField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'pri_vlrtotal'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyCalcItensPVpri_percmg: TFloatField
      DisplayLabel = 'Margem %'
      FieldName = 'pri_percmg'
      Required = True
      DisplayFormat = '#,##0.0'
    end
  end
  object qyAtualizaTotalORC: TZQuery
    Connection = database
    SQL.Strings = (
      'select sum(ort_vlrcusto * ort_quantidade) as totcusto,'
      'sum(ort_vlrtotal) as total'
      'from orcitens'
      'where orc_numero = 0')
    Params = <>
    Left = 152
    Top = 96
    object qyAtualizaTotalORCtotcusto: TFloatField
      DisplayLabel = 'Vlr. Custo'
      FieldName = 'totcusto'
      ReadOnly = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyAtualizaTotalORCtotal: TFloatField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'total'
      ReadOnly = True
      DisplayFormat = '#,###,###,##0.000'
    end
  end
  object qyAtualizaTotalPREV: TZQuery
    Connection = database
    SQL.Strings = (
      'select sum(pri_vlrcusto * pri_quantidade) as totcusto,'
      'sum(pri_vlrtotal) as total'
      'from previtens where prv_numero = 0')
    Params = <>
    Left = 256
    Top = 96
    object qyAtualizaTotalPREVtotcusto: TFloatField
      DisplayLabel = 'Vlr. Custo'
      FieldName = 'totcusto'
      ReadOnly = True
      DisplayFormat = '#,###,###,##0.000'
    end
    object qyAtualizaTotalPREVtotal: TFloatField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'total'
      ReadOnly = True
      DisplayFormat = '#,###,###,##0.000'
    end
  end
  object qySomaProdutoRes: TZQuery
    Connection = database
    SQL.Strings = (
      'select sum(pri_quantidade)'
      'from prevres'
      'where pro_codigo = 0')
    Params = <>
    Left = 360
    Top = 96
    object qySomaProdutoRessum: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'sum'
      ReadOnly = True
      DisplayFormat = '#,###,###,##0.000'
    end
  end
  object qyRelEndEnt: TZQuery
    Connection = database
    SQL.Strings = (
      
        'select e.end_logradouro, e.end_numero, e.end_complemento, e.end_' +
        'bairro, c.cid_municipio,'
      'c.uf_sigla, e.end_cep, e.end_ptreferencia'
      'from enderecos e, cidades c, prevendent p'
      'where e.cid_codigo = c.cid_codigo'
      'and p.end_codigo = e.end_codigo'
      'and p.prv_numero = 0')
    Params = <>
    Left = 464
    Top = 96
    object qyRelEndEntend_logradouro: TWideStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'end_logradouro'
      Required = True
      Size = 50
    end
    object qyRelEndEntend_numero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'end_numero'
      Required = True
    end
    object qyRelEndEntend_complemento: TWideStringField
      DisplayLabel = 'Complemento'
      FieldName = 'end_complemento'
      Size = 15
    end
    object qyRelEndEntend_bairro: TWideStringField
      DisplayLabel = 'Bairro'
      FieldName = 'end_bairro'
      Required = True
      Size = 30
    end
    object qyRelEndEntcid_municipio: TWideStringField
      DisplayLabel = 'Munic'#237'pio'
      FieldName = 'cid_municipio'
      Required = True
      Size = 50
    end
    object qyRelEndEntuf_sigla: TWideStringField
      DisplayLabel = 'UF'
      FieldName = 'uf_sigla'
      Required = True
      Size = 2
    end
    object qyRelEndEntend_cep: TWideStringField
      DisplayLabel = 'CEP'
      FieldName = 'end_cep'
      Required = True
      Size = 9
    end
    object qyRelEndEntend_ptreferencia: TWideStringField
      DisplayLabel = 'Pt. Refer'#234'ncia'
      FieldName = 'end_ptreferencia'
      Size = 30
    end
  end
  object qyOrcamentos: TZQuery
    Connection = database
    UpdateObject = updOrcamentos
    AfterInsert = qyOrcamentosAfterInsert
    BeforePost = qyOrcamentosBeforePost
    AfterPost = qyOrcamentosAfterPost
    BeforeDelete = qyOrcamentosBeforeDelete
    AfterDelete = qyOrcamentosAfterDelete
    OnPostError = qyOrcamentosPostError
    SQL.Strings = (
      'select'
      
        'o.orc_numero, o.orc_data, o.pes_codigo, p.pes_nome, p.pes_fone, ' +
        'o.orc_contato,'
      
        'o.fun_codigo, f.fun_nome, o.orc_tabvenda, o.orc_referente, o.orc' +
        '_obs,'
      
        'o.orc_vlrcusto, o.orc_subtotal, o.orc_vlrdesc, o.orc_percdesc, o' +
        '.orc_vlrtotal,'
      
        'o.orc_percmg, o.orc_validade, o.prz_codigo, z.prz_descricao, o.f' +
        'rp_codigo,'
      
        'm.frp_descricao, o.orc_vlrlucro, o.mdf_codigo, e.mdf_descricao, ' +
        'o.sto_codigo,'
      's.sto_descricao, o.prv_numero, o.ent_codigo, g.ent_descricao'
      
        'from orcamentos o, pessoas p, funcionarios f, prazos z, formpag ' +
        'm,'
      'modfrete e, statusorc s, entrega g'
      'where o.pes_codigo = p.pes_codigo'
      'and o.fun_codigo = f.fun_codigo'
      'and o.prz_codigo = z.prz_codigo'
      'and o.frp_codigo = m.frp_codigo'
      'and o.mdf_codigo = e.mdf_codigo'
      'and o.sto_codigo = s.sto_codigo'
      'and o.ent_codigo = g.ent_codigo'
      'order by o.orc_numero')
    Params = <>
    Left = 40
    Top = 192
    object qyOrcamentosorc_numero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'orc_numero'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyOrcamentosorc_data: TDateField
      DisplayLabel = 'Data'
      FieldName = 'orc_data'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyOrcamentospes_codigo: TIntegerField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'pes_codigo'
      Required = True
      Visible = False
    end
    object qyOrcamentospes_nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'pes_nome'
      Required = True
      Size = 60
    end
    object qyOrcamentospes_fone: TWideStringField
      DisplayLabel = 'Telefone'
      FieldName = 'pes_fone'
      Required = True
      Size = 15
    end
    object qyOrcamentosorc_contato: TWideStringField
      DisplayLabel = 'Contato'
      FieldName = 'orc_contato'
    end
    object qyOrcamentosfun_codigo: TIntegerField
      DisplayLabel = 'Cod. Funcion'#225'rio'
      FieldName = 'fun_codigo'
      Required = True
    end
    object qyOrcamentosfun_nome: TWideStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'fun_nome'
      Required = True
      Size = 50
    end
    object qyOrcamentosorc_tabvenda: TIntegerField
      DisplayLabel = 'Tab. Venda'
      FieldName = 'orc_tabvenda'
      Required = True
    end
    object qyOrcamentosorc_referente: TWideStringField
      DisplayLabel = 'Referente'
      FieldName = 'orc_referente'
      Required = True
      Size = 100
    end
    object qyOrcamentosorc_obs: TWideStringField
      DisplayLabel = 'Obs'
      FieldName = 'orc_obs'
      Visible = False
      Size = 255
    end
    object qyOrcamentosorc_vlrcusto: TFloatField
      DisplayLabel = 'Vlr. Custo'
      FieldName = 'orc_vlrcusto'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyOrcamentosorc_subtotal: TFloatField
      DisplayLabel = 'Subtotal'
      FieldName = 'orc_subtotal'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyOrcamentosorc_vlrdesc: TFloatField
      DisplayLabel = 'Vlr. Desc.'
      FieldName = 'orc_vlrdesc'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyOrcamentosorc_percdesc: TFloatField
      DisplayLabel = 'Desc. %'
      FieldName = 'orc_percdesc'
      Required = True
      DisplayFormat = '#0.0'
    end
    object qyOrcamentosorc_vlrtotal: TFloatField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'orc_vlrtotal'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyOrcamentosorc_vlrlucro: TFloatField
      DisplayLabel = 'Vlr. Lucro'
      FieldName = 'orc_vlrlucro'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyOrcamentosorc_percmg: TFloatField
      DisplayLabel = 'Margem %'
      FieldName = 'orc_percmg'
      Required = True
      DisplayFormat = '#,##0.0'
    end
    object qyOrcamentosorc_validade: TIntegerField
      DisplayLabel = 'Validade'
      FieldName = 'orc_validade'
      Required = True
      DisplayFormat = '00'
    end
    object qyOrcamentosprz_codigo: TIntegerField
      DisplayLabel = 'Cod. Prazo'
      FieldName = 'prz_codigo'
      Required = True
      Visible = False
    end
    object qyOrcamentosprz_descricao: TWideStringField
      DisplayLabel = 'Prazo'
      FieldName = 'prz_descricao'
      Required = True
      Size = 30
    end
    object qyOrcamentosfrp_codigo: TIntegerField
      DisplayLabel = 'Cod. Forma'
      FieldName = 'frp_codigo'
      Required = True
      Visible = False
    end
    object qyOrcamentosfrp_descricao: TWideStringField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'frp_descricao'
      Required = True
    end
    object qyOrcamentosmdf_codigo: TIntegerField
      DisplayLabel = 'Cod. Frete'
      FieldName = 'mdf_codigo'
      Required = True
      Visible = False
    end
    object qyOrcamentosmdf_descricao: TWideStringField
      DisplayLabel = 'Frete'
      FieldName = 'mdf_descricao'
      Required = True
    end
    object qyOrcamentossto_codigo: TIntegerField
      DisplayLabel = 'Cod. Status'
      FieldName = 'sto_codigo'
      Required = True
      Visible = False
    end
    object qyOrcamentossto_descricao: TWideStringField
      DisplayLabel = 'Status'
      FieldName = 'sto_descricao'
      Required = True
    end
    object qyOrcamentosprv_numero: TIntegerField
      DisplayLabel = 'Prevenda'
      FieldName = 'prv_numero'
    end
    object qyOrcamentosent_codigo: TIntegerField
      DisplayLabel = 'Cod. Entrega'
      FieldName = 'ent_codigo'
      Required = True
      Visible = False
    end
    object qyOrcamentosent_descricao: TWideStringField
      DisplayLabel = 'Entrega'
      FieldName = 'ent_descricao'
      Required = True
    end
  end
  object qyOrcItens: TZQuery
    Connection = database
    UpdateObject = updOrcItens
    AfterInsert = qyOrcItensAfterInsert
    BeforePost = qyOrcItensBeforePost
    AfterPost = qyOrcItensAfterPost
    BeforeDelete = qyOrcItensBeforeDelete
    AfterDelete = qyOrcItensAfterDelete
    OnPostError = qyOrcItensPostError
    SQL.Strings = (
      'select'
      'o.ort_codigo, o.orc_numero, o.ort_quantidade, o.pro_codigo,'
      'p.pro_descricao, p.uni_codigo, ort_vlrcusto, o.ort_vlrbrt,'
      
        'o.ort_vlrdesc, o.ort_percdesc, o.ort_vlrliq, o.ort_vlrtotal, o.o' +
        'rt_percmg'
      'from orcitens o, produtos p'
      'order by o.ort_codigo')
    Params = <>
    Left = 224
    Top = 192
    object qyOrcItensort_quantidade: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'ort_quantidade'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
    object qyOrcItenspro_descricao: TWideStringField
      DisplayLabel = 'Produto'
      DisplayWidth = 54
      FieldName = 'pro_descricao'
      Required = True
      Size = 100
    end
    object qyOrcItensuni_codigo: TWideStringField
      DisplayLabel = 'Un.'
      DisplayWidth = 2
      FieldName = 'uni_codigo'
      Required = True
      Size = 2
    end
    object qyOrcItenspro_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'pro_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyOrcItensort_vlrbrt: TFloatField
      DisplayLabel = 'Vlr. Bruto'
      DisplayWidth = 12
      FieldName = 'ort_vlrbrt'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyOrcItensort_vlrdesc: TFloatField
      DisplayLabel = 'Vlr. Desconto'
      DisplayWidth = 12
      FieldName = 'ort_vlrdesc'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyOrcItensort_vlrliq: TFloatField
      DisplayLabel = 'Vlr. L'#237'quido'
      DisplayWidth = 12
      FieldName = 'ort_vlrliq'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyOrcItensort_percdesc: TFloatField
      DisplayLabel = '% Desc.'
      DisplayWidth = 8
      FieldName = 'ort_percdesc'
      Required = True
      DisplayFormat = '#0.0'
    end
    object qyOrcItensort_vlrtotal: TFloatField
      DisplayLabel = 'Vlr. Total'
      DisplayWidth = 12
      FieldName = 'ort_vlrtotal'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyOrcItensort_codigo: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'ort_codigo'
      Required = True
      Visible = False
    end
    object qyOrcItensorc_numero: TIntegerField
      DisplayLabel = 'Numero Orc.'
      FieldName = 'orc_numero'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyOrcItensort_vlrcusto: TFloatField
      DisplayLabel = 'Vlr. Custo'
      FieldName = 'ort_vlrcusto'
      Required = True
      Visible = False
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyOrcItensort_percmg: TFloatField
      DisplayLabel = 'Margem %'
      FieldName = 'ort_percmg'
      Required = True
      Visible = False
      DisplayFormat = '#,###,##0.0'
    end
  end
  object qyStatusOrc: TZQuery
    Connection = database
    UpdateObject = updStatusOrc
    BeforePost = qyStatusOrcBeforePost
    AfterPost = qyStatusOrcAfterPost
    BeforeDelete = qyStatusOrcBeforeDelete
    AfterDelete = qyStatusOrcAfterDelete
    OnPostError = qyStatusOrcPostError
    SQL.Strings = (
      'select'
      'sto_codigo, sto_descricao'
      'from statusorc'
      'order by sto_codigo')
    Params = <>
    Left = 416
    Top = 192
    object qyStatusOrcsto_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'sto_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyStatusOrcsto_descricao: TWideStringField
      DisplayLabel = 'Status'
      FieldName = 'sto_descricao'
      Required = True
    end
  end
  object qyPrevendas: TZQuery
    Connection = database
    UpdateObject = updPrevendas
    AfterInsert = qyPrevendasAfterInsert
    BeforePost = qyPrevendasBeforePost
    AfterPost = qyPrevendasAfterPost
    BeforeDelete = qyPrevendasBeforeDelete
    AfterDelete = qyPrevendasAfterDelete
    OnPostError = qyPrevendasPostError
    SQL.Strings = (
      'select'
      
        'p.prv_numero, p.prv_data, p.pes_codigo, c.pes_nome, c.pes_lograd' +
        'ouro,'
      
        'c.pes_bairro, c.pes_numero, c.cid_codigo, m.cid_municipio, m.uf_' +
        'sigla, c.pes_cep,'
      
        'c.pes_fone, p.fun_codigo, n.fun_nome, p.prv_tabvenda, p.prv_refe' +
        'rente,'
      
        'p.prv_obs, p.prv_vlrcusto, p.prv_subtotal, p.prv_vlrdesc, p.prv_' +
        'percdesc,'
      
        'p.prv_vlrtotal, p.prv_percmg, p.prz_codigo, z.prz_descricao, p.f' +
        'rp_codigo,'
      
        'f.frp_descricao, p.prv_vlrlucro, p.mdf_codigo, d.mdf_descricao, ' +
        'p.sto_codigo,'
      's.sto_descricao, p.orc_numero, p.ent_codigo, e.ent_descricao'
      'from'
      'prevendas p, pessoas c, cidades m, prazos z, formpag f,'
      'modfrete d, funcionarios n, statusorc s, entrega e'
      'where p.pes_codigo = c.pes_codigo'
      'and c.cid_codigo = m.cid_codigo'
      'and p.prz_codigo = z.prz_codigo'
      'and p.frp_codigo = f.frp_codigo'
      'and p.fun_codigo = n.fun_codigo'
      'and p.mdf_codigo = d.mdf_codigo'
      'and p.sto_codigo = s.sto_codigo'
      'and p.ent_codigo = e.ent_codigo'
      'order by p.prv_numero')
    Params = <>
    Left = 40
    Top = 280
    object qyPrevendasprv_numero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'prv_numero'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyPrevendasprv_data: TDateField
      DisplayLabel = 'Data'
      FieldName = 'prv_data'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyPrevendaspes_codigo: TIntegerField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'pes_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyPrevendaspes_nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'pes_nome'
      Required = True
      Size = 60
    end
    object qyPrevendaspes_logradouro: TWideStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'pes_logradouro'
      Required = True
      Size = 50
    end
    object qyPrevendaspes_bairro: TWideStringField
      DisplayLabel = 'Bairro'
      FieldName = 'pes_bairro'
      Required = True
      Size = 30
    end
    object qyPrevendaspes_numero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'pes_numero'
      Required = True
    end
    object qyPrevendascid_codigo: TIntegerField
      DisplayLabel = 'Cod. Cidade'
      FieldName = 'cid_codigo'
      Required = True
    end
    object qyPrevendascid_municipio: TWideStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cid_municipio'
      Required = True
      Size = 50
    end
    object qyPrevendasuf_sigla: TWideStringField
      DisplayLabel = 'UF'
      FieldName = 'uf_sigla'
      Required = True
      Size = 2
    end
    object qyPrevendaspes_cep: TWideStringField
      DisplayLabel = 'CEP'
      FieldName = 'pes_cep'
      Required = True
      Size = 9
    end
    object qyPrevendaspes_fone: TWideStringField
      DisplayLabel = 'Telefone'
      FieldName = 'pes_fone'
      Required = True
      Size = 15
    end
    object qyPrevendasfun_codigo: TIntegerField
      DisplayLabel = 'Cod. Funcion'#225'rio'
      FieldName = 'fun_codigo'
      Required = True
      Visible = False
    end
    object qyPrevendasfun_nome: TWideStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'fun_nome'
      Required = True
      Size = 50
    end
    object qyPrevendasprv_tabvenda: TIntegerField
      DisplayLabel = 'Tab. Venda'
      FieldName = 'prv_tabvenda'
      Required = True
    end
    object qyPrevendasprv_referente: TWideStringField
      DisplayLabel = 'Referente'
      FieldName = 'prv_referente'
      Required = True
      Size = 100
    end
    object qyPrevendasprv_obs: TWideStringField
      DisplayLabel = 'Obs'
      FieldName = 'prv_obs'
      Visible = False
      Size = 255
    end
    object qyPrevendasprv_vlrcusto: TFloatField
      DisplayLabel = 'Vlr. Custo'
      FieldName = 'prv_vlrcusto'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyPrevendasprv_subtotal: TFloatField
      DisplayLabel = 'Vlr. Subtotal'
      FieldName = 'prv_subtotal'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyPrevendasprv_vlrdesc: TFloatField
      DisplayLabel = 'Vlr. Desc.'
      FieldName = 'prv_vlrdesc'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyPrevendasprv_percdesc: TFloatField
      DisplayLabel = 'Desc. %'
      FieldName = 'prv_percdesc'
      Required = True
      DisplayFormat = '#0.0'
    end
    object qyPrevendasprv_vlrtotal: TFloatField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'prv_vlrtotal'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyPrevendasprv_percmg: TFloatField
      DisplayLabel = 'Margem %'
      FieldName = 'prv_percmg'
      Required = True
      DisplayFormat = '#,###,###,##0.0'
    end
    object qyPrevendasprv_vlrlucro: TFloatField
      DisplayLabel = 'Vlr. Lucro'
      FieldName = 'prv_vlrlucro'
      Required = True
      Visible = False
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyPrevendasprz_codigo: TIntegerField
      DisplayLabel = 'Cod. Prazo'
      FieldName = 'prz_codigo'
      Required = True
      Visible = False
    end
    object qyPrevendasprz_descricao: TWideStringField
      DisplayLabel = 'Prazo'
      FieldName = 'prz_descricao'
      Required = True
      Size = 30
    end
    object qyPrevendasfrp_codigo: TIntegerField
      DisplayLabel = 'Cod. Forma'
      FieldName = 'frp_codigo'
      Required = True
      Visible = False
    end
    object qyPrevendasfrp_descricao: TWideStringField
      DisplayLabel = 'Forma Pag.'
      FieldName = 'frp_descricao'
      Required = True
    end
    object qyPrevendasmdf_codigo: TIntegerField
      DisplayLabel = 'Cod. Frete'
      FieldName = 'mdf_codigo'
      Required = True
      Visible = False
    end
    object qyPrevendasmdf_descricao: TWideStringField
      DisplayLabel = 'Frete'
      FieldName = 'mdf_descricao'
      Required = True
    end
    object qyPrevendasent_codigo: TIntegerField
      DisplayLabel = 'Cod. Entrega'
      FieldName = 'ent_codigo'
      Required = True
      Visible = False
    end
    object qyPrevendasent_descricao: TWideStringField
      DisplayLabel = 'Entrega'
      FieldName = 'ent_descricao'
      Required = True
    end
    object qyPrevendassto_codigo: TIntegerField
      DisplayLabel = 'Cod. Status'
      FieldName = 'sto_codigo'
      Required = True
    end
    object qyPrevendassto_descricao: TWideStringField
      DisplayLabel = 'Status'
      FieldName = 'sto_descricao'
      Required = True
    end
    object qyPrevendasorc_numero: TIntegerField
      DisplayLabel = 'Or'#231'amento'
      FieldName = 'orc_numero'
      DisplayFormat = '000,000'
    end
  end
  object qyPrevItens: TZQuery
    Connection = database
    UpdateObject = updPrevItens
    AfterInsert = qyPrevItensAfterInsert
    BeforePost = qyPrevItensBeforePost
    AfterPost = qyPrevItensAfterPost
    BeforeDelete = qyPrevItensBeforeDelete
    AfterDelete = qyPrevItensAfterDelete
    OnPostError = qyPrevItensPostError
    SQL.Strings = (
      'select'
      
        'i.pri_codigo, i.prv_numero, i.pri_quantidade, i.pro_codigo, p.pr' +
        'o_descricao,'
      
        'l.loc_descricao, p.uni_codigo, i.pri_vlrcusto, i.pri_vlrbrt, i.p' +
        'ri_vlrdesc,'
      'i.pri_percdesc, i.pri_vlrliq, i.pri_vlrtotal, i.pri_percmg'
      'from previtens i, produtos p, localizacao l'
      'where i.pro_codigo = p.pro_codigo'
      'and p.loc_codigo = l.loc_codigo'
      'order by i.pri_codigo')
    Params = <>
    Left = 224
    Top = 280
    object qyPrevItenspri_quantidade: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'pri_quantidade'
      Required = True
      DisplayFormat = '###,###,###,##0.000'
    end
    object qyPrevItenspro_codigo: TIntegerField
      DisplayLabel = 'Cod. Produto'
      DisplayWidth = 10
      FieldName = 'pro_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyPrevItenspro_descricao: TWideStringField
      DisplayLabel = 'Produto / Servi'#231'o'
      DisplayWidth = 60
      FieldName = 'pro_descricao'
      Required = True
      Size = 100
    end
    object qyPrevItensuni_codigo: TWideStringField
      DisplayLabel = 'Un.'
      DisplayWidth = 2
      FieldName = 'uni_codigo'
      Required = True
      Size = 2
    end
    object qyPrevItenspri_vlrbrt: TFloatField
      DisplayLabel = 'Vlr. Bruto'
      DisplayWidth = 10
      FieldName = 'pri_vlrbrt'
      Required = True
      DisplayFormat = '###,###,###,##0.000'
    end
    object qyPrevItenspri_vlrdesc: TFloatField
      DisplayLabel = 'Vlr. Desc.'
      DisplayWidth = 10
      FieldName = 'pri_vlrdesc'
      Required = True
      DisplayFormat = '###,###,###,##0.000'
    end
    object qyPrevItenspri_percdesc: TFloatField
      DisplayLabel = 'Desc. %'
      DisplayWidth = 10
      FieldName = 'pri_percdesc'
      Required = True
      DisplayFormat = '#0.0'
    end
    object qyPrevItenspri_vlrliq: TFloatField
      DisplayLabel = 'Vlr. L'#237'quido'
      DisplayWidth = 10
      FieldName = 'pri_vlrliq'
      Required = True
      DisplayFormat = '###,###,###,##0.00'
    end
    object qyPrevItenspri_vlrtotal: TFloatField
      DisplayLabel = 'Vlr. Total'
      DisplayWidth = 10
      FieldName = 'pri_vlrtotal'
      Required = True
      DisplayFormat = '###,###,###,##0.00'
    end
    object qyPrevItensprv_numero: TIntegerField
      DisplayLabel = 'Pr'#233'-venda'
      DisplayWidth = 10
      FieldName = 'prv_numero'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyPrevItenspri_percmg: TFloatField
      DisplayLabel = 'Margem %'
      DisplayWidth = 10
      FieldName = 'pri_percmg'
      Required = True
      Visible = False
      DisplayFormat = '#,###,##0.0'
    end
    object qyPrevItensloc_descricao: TWideStringField
      DisplayLabel = 'Localiza'#231#227'o'
      DisplayWidth = 20
      FieldName = 'loc_descricao'
      Required = True
      Visible = False
    end
    object qyPrevItenspri_vlrcusto: TFloatField
      DisplayLabel = 'Vlr. Custo'
      DisplayWidth = 10
      FieldName = 'pri_vlrcusto'
      Required = True
      Visible = False
      DisplayFormat = '###,###,###,##0.000'
    end
    object qyPrevItenspri_codigo: TIntegerField
      DisplayLabel = 'Cod. Item'
      FieldName = 'pri_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
  end
  object qyPrevEndEnt: TZQuery
    Connection = database
    UpdateObject = updPrevEndEnt
    BeforePost = qyPrevEndEntBeforePost
    AfterPost = qyPrevEndEntAfterPost
    BeforeDelete = qyPrevEndEntBeforeDelete
    AfterDelete = qyPrevEndEntAfterDelete
    OnPostError = qyPrevEndEntPostError
    SQL.Strings = (
      'select prv_numero, end_codigo'
      'from prevendent')
    Params = <>
    Left = 416
    Top = 280
    object qyPrevEndEntprv_numero: TIntegerField
      DisplayLabel = 'Pr'#233'-venda'
      FieldName = 'prv_numero'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyPrevEndEntend_codigo: TIntegerField
      DisplayLabel = 'Cod. Endere'#231'o'
      FieldName = 'end_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
  end
  object qyPrevRes: TZQuery
    Connection = database
    UpdateObject = updPrevRes
    BeforePost = qyPrevResBeforePost
    AfterPost = qyPrevResAfterPost
    BeforeDelete = qyPrevResBeforeDelete
    AfterDelete = qyPrevResAfterDelete
    OnPostError = qyPrevResPostError
    SQL.Strings = (
      'select'
      'pri_codigo, prv_numero, pro_codigo, pri_quantidade'
      'from prevres'
      'order by pri_codigo')
    Params = <>
    Left = 40
    Top = 368
    object qyPrevRespri_codigo: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'pri_codigo'
      Required = True
      Visible = False
    end
    object qyPrevResprv_numero: TIntegerField
      DisplayLabel = 'Pr'#233'-venda'
      FieldName = 'prv_numero'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyPrevRespro_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pro_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyPrevRespri_quantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'pri_quantidade'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
  end
  object updOrcamentos: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM orcamentos'
      'WHERE'
      '  orcamentos.orc_numero = :OLD_orc_numero')
    InsertSQL.Strings = (
      'INSERT INTO orcamentos'
      
        '  (orc_numero, orc_data, pes_codigo, orc_contato, fun_codigo, or' +
        'c_tabvenda, '
      
        '   orc_referente, orc_obs, orc_vlrcusto, orc_subtotal, orc_vlrde' +
        'sc, orc_percdesc, '
      
        '   orc_vlrtotal, orc_percmg, orc_validade, prz_codigo, frp_codig' +
        'o, orc_vlrlucro, '
      '   mdf_codigo, sto_codigo, prv_numero, ent_codigo)'
      'VALUES'
      
        '  (:orc_numero, :orc_data, :pes_codigo, :orc_contato, :fun_codig' +
        'o, :orc_tabvenda, '
      
        '   :orc_referente, :orc_obs, :orc_vlrcusto, :orc_subtotal, :orc_' +
        'vlrdesc, '
      
        '   :orc_percdesc, :orc_vlrtotal, :orc_percmg, :orc_validade, :pr' +
        'z_codigo, '
      
        '   :frp_codigo, :orc_vlrlucro, :mdf_codigo, :sto_codigo, :prv_nu' +
        'mero, :ent_codigo)')
    ModifySQL.Strings = (
      'UPDATE orcamentos SET'
      '  orc_numero = :orc_numero,'
      '  orc_data = :orc_data,'
      '  pes_codigo = :pes_codigo,'
      '  orc_contato = :orc_contato,'
      '  fun_codigo = :fun_codigo,'
      '  orc_tabvenda = :orc_tabvenda,'
      '  orc_referente = :orc_referente,'
      '  orc_obs = :orc_obs,'
      '  orc_vlrcusto = :orc_vlrcusto,'
      '  orc_subtotal = :orc_subtotal,'
      '  orc_vlrdesc = :orc_vlrdesc,'
      '  orc_percdesc = :orc_percdesc,'
      '  orc_vlrtotal = :orc_vlrtotal,'
      '  orc_percmg = :orc_percmg,'
      '  orc_validade = :orc_validade,'
      '  prz_codigo = :prz_codigo,'
      '  frp_codigo = :frp_codigo,'
      '  orc_vlrlucro = :orc_vlrlucro,'
      '  mdf_codigo = :mdf_codigo,'
      '  sto_codigo = :sto_codigo,'
      '  prv_numero = :prv_numero,'
      '  ent_codigo = :ent_codigo'
      'WHERE'
      '  orcamentos.orc_numero = :OLD_orc_numero')
    UseSequenceFieldForRefreshSQL = False
    Left = 120
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'orc_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'orc_data'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'orc_contato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fun_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'orc_tabvenda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'orc_referente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'orc_obs'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'orc_vlrcusto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'orc_subtotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'orc_vlrdesc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'orc_percdesc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'orc_vlrtotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'orc_percmg'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'orc_validade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prz_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'frp_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'orc_vlrlucro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mdf_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sto_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prv_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ent_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_orc_numero'
        ParamType = ptUnknown
      end>
  end
  object updOrcItens: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM orcitens'
      'WHERE'
      '  orcitens.ort_codigo = :OLD_ort_codigo')
    InsertSQL.Strings = (
      'INSERT INTO orcitens'
      
        '  (ort_codigo, orc_numero, ort_quantidade, pro_codigo, ort_vlrcu' +
        'sto, ort_vlrbrt, '
      
        '   ort_vlrdesc, ort_percdesc, ort_vlrliq, ort_vlrtotal, ort_perc' +
        'mg)'
      'VALUES'
      
        '  (:ort_codigo, :orc_numero, :ort_quantidade, :pro_codigo, :ort_' +
        'vlrcusto, '
      
        '   :ort_vlrbrt, :ort_vlrdesc, :ort_percdesc, :ort_vlrliq, :ort_v' +
        'lrtotal, '
      '   :ort_percmg)')
    ModifySQL.Strings = (
      'UPDATE orcitens SET'
      '  ort_codigo = :ort_codigo,'
      '  orc_numero = :orc_numero,'
      '  ort_quantidade = :ort_quantidade,'
      '  pro_codigo = :pro_codigo,'
      '  ort_vlrcusto = :ort_vlrcusto,'
      '  ort_vlrbrt = :ort_vlrbrt,'
      '  ort_vlrdesc = :ort_vlrdesc,'
      '  ort_percdesc = :ort_percdesc,'
      '  ort_vlrliq = :ort_vlrliq,'
      '  ort_vlrtotal = :ort_vlrtotal,'
      '  ort_percmg = :ort_percmg'
      'WHERE'
      '  orcitens.ort_codigo = :OLD_ort_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 296
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ort_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'orc_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ort_quantidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ort_vlrcusto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ort_vlrbrt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ort_vlrdesc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ort_percdesc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ort_vlrliq'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ort_vlrtotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ort_percmg'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ort_codigo'
        ParamType = ptUnknown
      end>
  end
  object updStatusOrc: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM statusorc'
      'WHERE'
      '  statusorc.sto_codigo = :OLD_sto_codigo')
    InsertSQL.Strings = (
      'INSERT INTO statusorc'
      '  (sto_codigo, sto_descricao)'
      'VALUES'
      '  (:sto_codigo, :sto_descricao)')
    ModifySQL.Strings = (
      'UPDATE statusorc SET'
      '  sto_codigo = :sto_codigo,'
      '  sto_descricao = :sto_descricao'
      'WHERE'
      '  statusorc.sto_codigo = :OLD_sto_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 488
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sto_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sto_descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_sto_codigo'
        ParamType = ptUnknown
      end>
  end
  object updPrevendas: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM prevendas'
      'WHERE'
      '  prevendas.prv_numero = :OLD_prv_numero')
    InsertSQL.Strings = (
      'INSERT INTO prevendas'
      
        '  (prv_numero, prv_data, pes_codigo, fun_codigo, prv_tabvenda, p' +
        'rv_referente, '
      
        '   prv_obs, prv_vlrcusto, prv_subtotal, prv_vlrdesc, prv_percdes' +
        'c, prv_vlrtotal, '
      
        '   prv_percmg, prz_codigo, frp_codigo, prv_vlrlucro, mdf_codigo,' +
        ' sto_codigo, '
      '   orc_numero, ent_codigo)'
      'VALUES'
      
        '  (:prv_numero, :prv_data, :pes_codigo, :fun_codigo, :prv_tabven' +
        'da, :prv_referente, '
      
        '   :prv_obs, :prv_vlrcusto, :prv_subtotal, :prv_vlrdesc, :prv_pe' +
        'rcdesc, '
      
        '   :prv_vlrtotal, :prv_percmg, :prz_codigo, :frp_codigo, :prv_vl' +
        'rlucro, '
      '   :mdf_codigo, :sto_codigo, :orc_numero, :ent_codigo)')
    ModifySQL.Strings = (
      'UPDATE prevendas SET'
      '  prv_numero = :prv_numero,'
      '  prv_data = :prv_data,'
      '  pes_codigo = :pes_codigo,'
      '  fun_codigo = :fun_codigo,'
      '  prv_tabvenda = :prv_tabvenda,'
      '  prv_referente = :prv_referente,'
      '  prv_obs = :prv_obs,'
      '  prv_vlrcusto = :prv_vlrcusto,'
      '  prv_subtotal = :prv_subtotal,'
      '  prv_vlrdesc = :prv_vlrdesc,'
      '  prv_percdesc = :prv_percdesc,'
      '  prv_vlrtotal = :prv_vlrtotal,'
      '  prv_percmg = :prv_percmg,'
      '  prz_codigo = :prz_codigo,'
      '  frp_codigo = :frp_codigo,'
      '  prv_vlrlucro = :prv_vlrlucro,'
      '  mdf_codigo = :mdf_codigo,'
      '  sto_codigo = :sto_codigo,'
      '  orc_numero = :orc_numero,'
      '  ent_codigo = :ent_codigo'
      'WHERE'
      '  prevendas.prv_numero = :OLD_prv_numero')
    UseSequenceFieldForRefreshSQL = False
    Left = 120
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'prv_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prv_data'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fun_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prv_tabvenda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prv_referente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prv_obs'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prv_vlrcusto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prv_subtotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prv_vlrdesc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prv_percdesc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prv_vlrtotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prv_percmg'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prz_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'frp_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prv_vlrlucro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mdf_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sto_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'orc_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ent_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_prv_numero'
        ParamType = ptUnknown
      end>
  end
  object updPrevItens: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM previtens'
      'WHERE'
      '  previtens.pri_codigo = :OLD_pri_codigo')
    InsertSQL.Strings = (
      'INSERT INTO previtens'
      
        '  (pri_codigo, prv_numero, pri_quantidade, pro_codigo, pri_vlrcu' +
        'sto, pri_vlrbrt, '
      
        '   pri_vlrdesc, pri_percdesc, pri_vlrliq, pri_vlrtotal, pri_perc' +
        'mg)'
      'VALUES'
      
        '  (:pri_codigo, :prv_numero, :pri_quantidade, :pro_codigo, :pri_' +
        'vlrcusto, '
      
        '   :pri_vlrbrt, :pri_vlrdesc, :pri_percdesc, :pri_vlrliq, :pri_v' +
        'lrtotal, '
      '   :pri_percmg)')
    ModifySQL.Strings = (
      'UPDATE previtens SET'
      '  pri_codigo = :pri_codigo,'
      '  prv_numero = :prv_numero,'
      '  pri_quantidade = :pri_quantidade,'
      '  pro_codigo = :pro_codigo,'
      '  pri_vlrcusto = :pri_vlrcusto,'
      '  pri_vlrbrt = :pri_vlrbrt,'
      '  pri_vlrdesc = :pri_vlrdesc,'
      '  pri_percdesc = :pri_percdesc,'
      '  pri_vlrliq = :pri_vlrliq,'
      '  pri_vlrtotal = :pri_vlrtotal,'
      '  pri_percmg = :pri_percmg'
      'WHERE'
      '  previtens.pri_codigo = :OLD_pri_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 296
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pri_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prv_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pri_quantidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pri_vlrcusto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pri_vlrbrt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pri_vlrdesc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pri_percdesc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pri_vlrliq'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pri_vlrtotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pri_percmg'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_pri_codigo'
        ParamType = ptUnknown
      end>
  end
  object updPrevEndEnt: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM prevendent'
      'WHERE'
      '  prevendent.prv_numero = :OLD_prv_numero')
    InsertSQL.Strings = (
      'INSERT INTO prevendent'
      '  (prv_numero, end_codigo)'
      'VALUES'
      '  (:prv_numero, :end_codigo)')
    ModifySQL.Strings = (
      'UPDATE prevendent SET'
      '  prv_numero = :prv_numero,'
      '  end_codigo = :end_codigo'
      'WHERE'
      '  prevendent.prv_numero = :OLD_prv_numero')
    UseSequenceFieldForRefreshSQL = False
    Left = 496
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'prv_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'end_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_prv_numero'
        ParamType = ptUnknown
      end>
  end
  object updPrevRes: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM prevres'
      'WHERE'
      '  prevres.pri_codigo = :OLD_pri_codigo')
    InsertSQL.Strings = (
      'INSERT INTO prevres'
      '  (pri_codigo, prv_numero, pro_codigo, pri_quantidade)'
      'VALUES'
      '  (:pri_codigo, :prv_numero, :pro_codigo, :pri_quantidade)')
    ModifySQL.Strings = (
      'UPDATE prevres SET'
      '  pri_codigo = :pri_codigo,'
      '  prv_numero = :prv_numero,'
      '  pro_codigo = :pro_codigo,'
      '  pri_quantidade = :pri_quantidade'
      'WHERE'
      '  prevres.pri_codigo = :OLD_pri_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 120
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pri_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prv_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pri_quantidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_pri_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyConsPrevRes: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'pri_codigo, prv_numero, pro_codigo, pri_quantidade'
      'from prevres'
      'order by pri_codigo')
    Params = <>
    Left = 200
    Top = 368
    object qyConsPrevRespri_codigo: TIntegerField
      DisplayLabel = 'Cod. Item'
      FieldName = 'pri_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyConsPrevResprv_numero: TIntegerField
      DisplayLabel = 'P'#233'-venda'
      FieldName = 'prv_numero'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyConsPrevRespro_codigo: TIntegerField
      DisplayLabel = 'Cod. Prduto'
      FieldName = 'pro_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyConsPrevRespri_quantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'pri_quantidade'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
  end
end
