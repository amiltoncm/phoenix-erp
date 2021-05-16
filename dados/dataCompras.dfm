inherited dmCompras: TdmCompras
  OldCreateOrder = True
  object qyCotacao: TZQuery
    Connection = database
    UpdateObject = updCotacao
    AfterInsert = qyCotacaoAfterInsert
    BeforePost = qyCotacaoBeforePost
    AfterPost = qyCotacaoAfterPost
    BeforeDelete = qyCotacaoBeforeDelete
    AfterDelete = qyCotacaoAfterDelete
    OnPostError = qyCotacaoPostError
    SQL.Strings = (
      
        'select c.cot_numero, c.cot_data, c.pes_codigo, r.pes_nome, r.pes' +
        '_fone, c.cot_contato,'
      
        'c.fun_codigo, f.fun_nome, c.cot_referente, c.cot_obs, c.cot_subt' +
        'otal,'
      
        'c.cot_vlrdesc, c.cot_percdesc, c.cot_vlrtotal, c.prz_codigo, p.p' +
        'rz_descricao,'
      'c.frp_codigo, o.frp_descricao, c.mdf_codigo, m.mdf_descricao,'
      
        'c.sto_codigo, s.sto_descricao, c.ent_codigo, e.ent_descricao, c.' +
        'ord_numero'
      
        'from cotacao c, pessoas r, funcionarios f, prazos p, formpag o, ' +
        'modfrete m, statusorc s, entrega e'
      'where c.pes_codigo = r.pes_codigo'
      'and c.fun_codigo = f.fun_codigo'
      'and c.prz_codigo = p.prz_codigo'
      'and c.frp_codigo = o.frp_codigo'
      'and c.mdf_codigo = m.mdf_codigo'
      'and c.sto_codigo = s.sto_codigo'
      'and c.ent_codigo = e.ent_codigo')
    Params = <>
    Left = 48
    Top = 104
    object qyCotacaocot_numero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'cot_numero'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyCotacaocot_data: TDateField
      DisplayLabel = 'Data'
      FieldName = 'cot_data'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyCotacaopes_codigo: TIntegerField
      DisplayLabel = 'Cod. Fornecedor'
      FieldName = 'pes_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyCotacaopes_nome: TWideStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'pes_nome'
      Required = True
      Size = 60
    end
    object qyCotacaopes_fone: TWideStringField
      DisplayLabel = 'Telefone'
      FieldName = 'pes_fone'
      Required = True
      Size = 15
    end
    object qyCotacaocot_contato: TWideStringField
      DisplayLabel = 'Contato'
      FieldName = 'cot_contato'
    end
    object qyCotacaofun_codigo: TIntegerField
      DisplayLabel = 'C'#243'd. Funcion'#225'rio'
      FieldName = 'fun_codigo'
      Required = True
      Visible = False
    end
    object qyCotacaofun_nome: TWideStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'fun_nome'
      Required = True
      Size = 50
    end
    object qyCotacaocot_referente: TWideStringField
      DisplayLabel = 'Referente'
      FieldName = 'cot_referente'
      Size = 100
    end
    object qyCotacaocot_obs: TWideStringField
      DisplayLabel = 'Obs'
      FieldName = 'cot_obs'
      Visible = False
      Size = 255
    end
    object qyCotacaocot_subtotal: TFloatField
      DisplayLabel = 'Vlr. Subtotal'
      FieldName = 'cot_subtotal'
      Required = True
      DisplayFormat = '#,###,###.##0.00'
    end
    object qyCotacaocot_vlrdesc: TFloatField
      DisplayLabel = 'Vlr. Desconto'
      FieldName = 'cot_vlrdesc'
      Required = True
      DisplayFormat = '#,###,###.##0.00'
    end
    object qyCotacaocot_percdesc: TFloatField
      DisplayLabel = '% Desc.'
      FieldName = 'cot_percdesc'
      Required = True
      DisplayFormat = '#0.0'
    end
    object qyCotacaocot_vlrtotal: TFloatField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'cot_vlrtotal'
      Required = True
      DisplayFormat = '#,###,###.##0.00'
    end
    object qyCotacaoprz_codigo: TIntegerField
      DisplayLabel = 'Cod. Prazo'
      FieldName = 'prz_codigo'
      Required = True
      Visible = False
    end
    object qyCotacaoprz_descricao: TWideStringField
      DisplayLabel = 'Prazo'
      FieldName = 'prz_descricao'
      Required = True
      Size = 30
    end
    object qyCotacaofrp_codigo: TIntegerField
      DisplayLabel = 'Cod. Forma'
      FieldName = 'frp_codigo'
      Required = True
      Visible = False
    end
    object qyCotacaofrp_descricao: TWideStringField
      DisplayLabel = 'Format'
      FieldName = 'frp_descricao'
      Required = True
    end
    object qyCotacaomdf_codigo: TIntegerField
      DisplayLabel = 'Cod. Frete'
      FieldName = 'mdf_codigo'
      Required = True
      Visible = False
    end
    object qyCotacaomdf_descricao: TWideStringField
      DisplayLabel = 'Frete'
      FieldName = 'mdf_descricao'
      Required = True
    end
    object qyCotacaosto_codigo: TIntegerField
      DisplayLabel = 'Cod. Status'
      FieldName = 'sto_codigo'
      Required = True
      Visible = False
    end
    object qyCotacaosto_descricao: TWideStringField
      DisplayLabel = 'Status'
      FieldName = 'sto_descricao'
      Required = True
    end
    object qyCotacaoent_codigo: TIntegerField
      DisplayLabel = 'Cod. Entrega'
      FieldName = 'ent_codigo'
      Required = True
      Visible = False
    end
    object qyCotacaoent_descricao: TWideStringField
      DisplayLabel = 'Entrega'
      FieldName = 'ent_descricao'
      Required = True
    end
    object qyCotacaoord_numero: TIntegerField
      DisplayLabel = 'Num. Ordem'
      FieldName = 'ord_numero'
      Visible = False
    end
  end
  object qyOrdCompra: TZQuery
    Connection = database
    UpdateObject = updOrdCompra
    BeforePost = qyOrdCompraBeforePost
    AfterPost = qyOrdCompraAfterPost
    BeforeDelete = qyOrdCompraBeforeDelete
    AfterDelete = qyOrdCompraAfterDelete
    OnPostError = qyOrdCompraPostError
    SQL.Strings = (
      'select'
      
        'c.ord_numero, c.ord_data, c.pes_codigo, r.pes_nome, r.pes_fone, ' +
        'c.ord_contato,'
      
        'c.fun_codigo, f.fun_nome, c.ord_referente, c.ord_obs, c.ord_subt' +
        'otal,'
      
        'c.ord_vlrdesc, c.ord_percdesc, c.ord_vlrtotal, c.prz_codigo, p.p' +
        'rz_descricao,'
      'c.frp_codigo, o.frp_descricao, c.mdf_codigo, m.mdf_descricao,'
      
        'c.sto_codigo, s.sto_descricao, c.ent_codigo, e.ent_descricao, c.' +
        'cot_numero'
      
        'from ordcompra c, pessoas r, funcionarios f, prazos p, formpag o' +
        ', modfrete m, statusorc s, entrega e'
      'where'
      'c.pes_codigo = r.pes_codigo'
      'and c.fun_codigo = f.fun_codigo'
      'and c.prz_codigo = p.prz_codigo'
      'and c.frp_codigo = o.frp_codigo'
      'and c.mdf_codigo = m.mdf_codigo'
      'and c.sto_codigo = s.sto_codigo'
      'and c.ent_codigo = e.ent_codigo')
    Params = <>
    Left = 256
    Top = 104
    object qyOrdCompraord_numero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'ord_numero'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyOrdCompraord_data: TDateField
      DisplayLabel = 'Data'
      FieldName = 'ord_data'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyOrdComprapes_codigo: TIntegerField
      DisplayLabel = 'Cod. Fornecedor'
      FieldName = 'pes_codigo'
      Required = True
      Visible = False
    end
    object qyOrdComprapes_nome: TWideStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'pes_nome'
      Required = True
      Size = 60
    end
    object qyOrdComprapes_fone: TWideStringField
      DisplayLabel = 'Telefone'
      FieldName = 'pes_fone'
      Required = True
      Size = 15
    end
    object qyOrdCompraord_contato: TWideStringField
      DisplayLabel = 'Contato'
      FieldName = 'ord_contato'
      Size = 30
    end
    object qyOrdComprafun_codigo: TIntegerField
      DisplayLabel = 'Cod. Funcionario'
      FieldName = 'fun_codigo'
      Required = True
      Visible = False
    end
    object qyOrdComprafun_nome: TWideStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'fun_nome'
      Required = True
      Size = 50
    end
    object qyOrdCompraord_referente: TWideStringField
      DisplayLabel = 'Referente'
      FieldName = 'ord_referente'
      Size = 100
    end
    object qyOrdCompraord_obs: TWideStringField
      DisplayLabel = 'Obs'
      FieldName = 'ord_obs'
      Visible = False
      Size = 255
    end
    object qyOrdCompraord_subtotal: TFloatField
      DisplayLabel = 'Vlr. Subtotal'
      FieldName = 'ord_subtotal'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyOrdCompraord_vlrdesc: TFloatField
      DisplayLabel = 'Vlr. Desc.'
      FieldName = 'ord_vlrdesc'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyOrdCompraord_percdesc: TFloatField
      DisplayLabel = '% Desc.'
      FieldName = 'ord_percdesc'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyOrdCompraord_vlrtotal: TFloatField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'ord_vlrtotal'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyOrdCompraprz_codigo: TIntegerField
      DisplayLabel = 'Cod. Prazo'
      FieldName = 'prz_codigo'
      Required = True
      Visible = False
    end
    object qyOrdCompraprz_descricao: TWideStringField
      DisplayLabel = 'Prazo'
      FieldName = 'prz_descricao'
      Required = True
      Size = 30
    end
    object qyOrdComprafrp_codigo: TIntegerField
      DisplayLabel = 'Cod. Forma'
      FieldName = 'frp_codigo'
      Required = True
      Visible = False
    end
    object qyOrdComprafrp_descricao: TWideStringField
      DisplayLabel = 'Form. Pag.'
      FieldName = 'frp_descricao'
      Required = True
    end
    object qyOrdCompramdf_codigo: TIntegerField
      DisplayLabel = 'Cod. Frete'
      FieldName = 'mdf_codigo'
      Required = True
      Visible = False
    end
    object qyOrdCompramdf_descricao: TWideStringField
      DisplayLabel = 'Frete'
      FieldName = 'mdf_descricao'
      Required = True
    end
    object qyOrdComprasto_codigo: TIntegerField
      DisplayLabel = 'Cod. Status'
      FieldName = 'sto_codigo'
      Required = True
      Visible = False
    end
    object qyOrdComprasto_descricao: TWideStringField
      DisplayLabel = 'Status'
      FieldName = 'sto_descricao'
      Required = True
    end
    object qyOrdCompraent_codigo: TIntegerField
      DisplayLabel = 'Cod. Entrega'
      FieldName = 'ent_codigo'
      Required = True
      Visible = False
    end
    object qyOrdCompraent_descricao: TWideStringField
      DisplayLabel = 'Entrega'
      FieldName = 'ent_descricao'
      Required = True
    end
    object qyOrdCompracot_numero: TIntegerField
      DisplayLabel = 'Cota'#231#227'o'
      FieldName = 'cot_numero'
    end
  end
  object qyCotItens: TZQuery
    Connection = database
    UpdateObject = updCotItens
    AfterInsert = qyCotItensAfterInsert
    BeforePost = qyCotItensBeforePost
    AfterPost = qyCotItensAfterPost
    BeforeDelete = qyCotItensBeforeDelete
    AfterDelete = qyCotItensAfterDelete
    OnPostError = qyCotItensPostError
    SQL.Strings = (
      'select'
      
        'i.cti_codigo, i.cot_numero, i.cti_quantidade, i.pro_codigo, p.pr' +
        'o_descricao,'
      
        'p.uni_codigo, i.cti_vlrbrt, i.cti_percdesc, i.cti_vlrdesc, i.cti' +
        '_vlrliq, i.cti_vlrtotal'
      'from cotitens i, produtos p'
      'where i.pro_codigo = p.pro_codigo')
    Params = <>
    Left = 48
    Top = 168
    object qyCotItenscti_codigo: TIntegerField
      DisplayLabel = 'Cod. Item'
      FieldName = 'cti_codigo'
      Required = True
      Visible = False
    end
    object qyCotItenscot_numero: TIntegerField
      DisplayLabel = 'Cota'#231#227'o'
      FieldName = 'cot_numero'
      Required = True
      Visible = False
    end
    object qyCotItenscti_quantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'cti_quantidade'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
    object qyCotItenspro_codigo: TIntegerField
      DisplayLabel = 'C'#243'd. Produto'
      FieldName = 'pro_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyCotItenspro_descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'pro_descricao'
      Required = True
      Size = 100
    end
    object qyCotItensuni_codigo: TWideStringField
      DisplayLabel = 'Un.'
      FieldName = 'uni_codigo'
      Required = True
      Size = 2
    end
    object qyCotItenscti_vlrbrt: TFloatField
      DisplayLabel = 'Vlr. Bruto'
      FieldName = 'cti_vlrbrt'
      Required = True
      DisplayFormat = '#,###,###,##0.0000'
    end
    object qyCotItenscti_percdesc: TFloatField
      DisplayLabel = '% Desc.'
      FieldName = 'cti_percdesc'
      Required = True
      DisplayFormat = '#0.0'
    end
    object qyCotItenscti_vlrdesc: TFloatField
      DisplayLabel = 'Vlr. Desc.'
      FieldName = 'cti_vlrdesc'
      Required = True
      DisplayFormat = '#,###,###,##0.0000'
    end
    object qyCotItenscti_vlrliq: TFloatField
      DisplayLabel = 'Vlr. Liq.'
      FieldName = 'cti_vlrliq'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyCotItenscti_vlrtotal: TFloatField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'cti_vlrtotal'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
  end
  object qyOrdItens: TZQuery
    Connection = database
    UpdateObject = updOrdItens
    BeforePost = qyOrdItensBeforePost
    AfterPost = qyOrdItensAfterPost
    BeforeDelete = qyOrdItensBeforeDelete
    AfterDelete = qyOrdItensAfterDelete
    OnPostError = qyOrdItensPostError
    SQL.Strings = (
      'select'
      
        'i.ori_codigo, i.ord_numero, i.ori_quantidade, i.pro_codigo, p.pr' +
        'o_descricao,'
      
        'p.uni_codigo, i.ori_vlrbrt, i.ori_vlrdesc, i.ori_percdesc, i.ori' +
        '_vlrliq, i.ori_vlrtotal'
      'from orditens i, produtos p'
      'where i.pro_codigo = p.pro_codigo')
    Params = <>
    Left = 256
    Top = 168
    object qyOrdItensori_quantidade: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'ori_quantidade'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
    object qyOrdItenspro_codigo: TIntegerField
      DisplayLabel = 'Cod. Produto'
      DisplayWidth = 10
      FieldName = 'pro_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyOrdItenspro_descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 100
      FieldName = 'pro_descricao'
      Required = True
      Size = 100
    end
    object qyOrdItensuni_codigo: TWideStringField
      DisplayLabel = 'Un.'
      DisplayWidth = 2
      FieldName = 'uni_codigo'
      Required = True
      Size = 2
    end
    object qyOrdItensori_vlrbrt: TFloatField
      DisplayLabel = 'Vlr. Bruto'
      DisplayWidth = 10
      FieldName = 'ori_vlrbrt'
      Required = True
      DisplayFormat = '#,###,###,##0.0000'
    end
    object qyOrdItensori_vlrdesc: TFloatField
      DisplayLabel = 'Vlr. Desc.'
      DisplayWidth = 10
      FieldName = 'ori_vlrdesc'
      Required = True
      DisplayFormat = '#,###,###,##0.0000'
    end
    object qyOrdItensori_percdesc: TFloatField
      DisplayLabel = '% Desc.'
      DisplayWidth = 10
      FieldName = 'ori_percdesc'
      Required = True
      DisplayFormat = '#0.0'
    end
    object qyOrdItensori_vlrliq: TFloatField
      DisplayLabel = 'Vlr. Liq.'
      DisplayWidth = 10
      FieldName = 'ori_vlrliq'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyOrdItensori_vlrtotal: TFloatField
      DisplayLabel = 'Vlr. Total'
      DisplayWidth = 10
      FieldName = 'ori_vlrtotal'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyOrdItensori_codigo: TIntegerField
      DisplayLabel = 'Cod. Item'
      FieldName = 'ori_codigo'
      Required = True
      Visible = False
    end
    object qyOrdItensord_numero: TIntegerField
      DisplayLabel = 'Ordem de Compra'
      FieldName = 'ord_numero'
      Required = True
      Visible = False
    end
  end
  object updCotacao: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM cotacao'
      'WHERE'
      '  cotacao.cot_numero = :OLD_cot_numero')
    InsertSQL.Strings = (
      'INSERT INTO cotacao'
      
        '  (cot_numero, cot_data, pes_codigo, cot_contato, fun_codigo, co' +
        't_referente, '
      
        '   cot_obs, cot_subtotal, cot_vlrdesc, cot_percdesc, cot_vlrtota' +
        'l, prz_codigo, '
      '   frp_codigo, mdf_codigo, sto_codigo, ent_codigo, ord_numero)'
      'VALUES'
      
        '  (:cot_numero, :cot_data, :pes_codigo, :cot_contato, :fun_codig' +
        'o, :cot_referente, '
      
        '   :cot_obs, :cot_subtotal, :cot_vlrdesc, :cot_percdesc, :cot_vl' +
        'rtotal, '
      
        '   :prz_codigo, :frp_codigo, :mdf_codigo, :sto_codigo, :ent_codi' +
        'go, :ord_numero)')
    ModifySQL.Strings = (
      'UPDATE cotacao SET'
      '  cot_numero = :cot_numero,'
      '  cot_data = :cot_data,'
      '  pes_codigo = :pes_codigo,'
      '  cot_contato = :cot_contato,'
      '  fun_codigo = :fun_codigo,'
      '  cot_referente = :cot_referente,'
      '  cot_obs = :cot_obs,'
      '  cot_subtotal = :cot_subtotal,'
      '  cot_vlrdesc = :cot_vlrdesc,'
      '  cot_percdesc = :cot_percdesc,'
      '  cot_vlrtotal = :cot_vlrtotal,'
      '  prz_codigo = :prz_codigo,'
      '  frp_codigo = :frp_codigo,'
      '  mdf_codigo = :mdf_codigo,'
      '  sto_codigo = :sto_codigo,'
      '  ent_codigo = :ent_codigo,'
      '  ord_numero = :ord_numero'
      'WHERE'
      '  cotacao.cot_numero = :OLD_cot_numero')
    UseSequenceFieldForRefreshSQL = False
    Left = 120
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cot_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cot_data'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cot_contato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fun_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cot_referente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cot_obs'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cot_subtotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cot_vlrdesc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cot_percdesc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cot_vlrtotal'
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
        Name = 'ent_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ord_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_cot_numero'
        ParamType = ptUnknown
      end>
  end
  object updOrdCompra: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM ordcompra'
      'WHERE'
      '  ordcompra.ord_numero = :OLD_ord_numero')
    InsertSQL.Strings = (
      'INSERT INTO ordcompra'
      
        '  (ord_numero, ord_data, pes_codigo, fun_codigo, ord_referente, ' +
        'ord_contato, '
      
        '   ord_obs, ord_subtotal, ord_vlrdesc, ord_percdesc, ord_vlrtota' +
        'l, prz_codigo, '
      '   frp_codigo, mdf_codigo, sto_codigo, cot_numero, ent_codigo)'
      'VALUES'
      
        '  (:ord_numero, :ord_data, :pes_codigo, :fun_codigo, :ord_refere' +
        'nte, :ord_contato, '
      
        '   :ord_obs, :ord_subtotal, :ord_vlrdesc, :ord_percdesc, :ord_vl' +
        'rtotal, '
      
        '   :prz_codigo, :frp_codigo, :mdf_codigo, :sto_codigo, :cot_nume' +
        'ro, :ent_codigo)')
    ModifySQL.Strings = (
      'UPDATE ordcompra SET'
      '  ord_numero = :ord_numero,'
      '  ord_data = :ord_data,'
      '  pes_codigo = :pes_codigo,'
      '  fun_codigo = :fun_codigo,'
      '  ord_referente = :ord_referente,'
      '  ord_contato = :ord_contato,'
      '  ord_obs = :ord_obs,'
      '  ord_subtotal = :ord_subtotal,'
      '  ord_vlrdesc = :ord_vlrdesc,'
      '  ord_percdesc = :ord_percdesc,'
      '  ord_vlrtotal = :ord_vlrtotal,'
      '  prz_codigo = :prz_codigo,'
      '  frp_codigo = :frp_codigo,'
      '  mdf_codigo = :mdf_codigo,'
      '  sto_codigo = :sto_codigo,'
      '  cot_numero = :cot_numero,'
      '  ent_codigo = :ent_codigo'
      'WHERE'
      '  ordcompra.ord_numero = :OLD_ord_numero')
    UseSequenceFieldForRefreshSQL = False
    Left = 336
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ord_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ord_data'
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
        Name = 'ord_referente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ord_contato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ord_obs'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ord_subtotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ord_vlrdesc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ord_percdesc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ord_vlrtotal'
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
        Name = 'cot_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ent_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ord_numero'
        ParamType = ptUnknown
      end>
  end
  object updCotItens: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM cotitens'
      'WHERE'
      '  cotitens.cti_codigo = :OLD_cti_codigo')
    InsertSQL.Strings = (
      'INSERT INTO cotitens'
      
        '  (cti_codigo, cot_numero, cti_quantidade, pro_codigo, cti_vlrbr' +
        't, cti_vlrdesc, '
      '   cti_percdesc, cti_vlrliq, cti_vlrtotal)'
      'VALUES'
      
        '  (:cti_codigo, :cot_numero, :cti_quantidade, :pro_codigo, :cti_' +
        'vlrbrt, '
      '   :cti_vlrdesc, :cti_percdesc, :cti_vlrliq, :cti_vlrtotal)')
    ModifySQL.Strings = (
      'UPDATE cotitens SET'
      '  cti_codigo = :cti_codigo,'
      '  cot_numero = :cot_numero,'
      '  cti_quantidade = :cti_quantidade,'
      '  pro_codigo = :pro_codigo,'
      '  cti_vlrbrt = :cti_vlrbrt,'
      '  cti_vlrdesc = :cti_vlrdesc,'
      '  cti_percdesc = :cti_percdesc,'
      '  cti_vlrliq = :cti_vlrliq,'
      '  cti_vlrtotal = :cti_vlrtotal'
      'WHERE'
      '  cotitens.cti_codigo = :OLD_cti_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 120
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cti_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cot_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cti_quantidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cti_vlrbrt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cti_vlrdesc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cti_percdesc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cti_vlrliq'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cti_vlrtotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_cti_codigo'
        ParamType = ptUnknown
      end>
  end
  object updOrdItens: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM orditens'
      'WHERE'
      '  orditens.ori_codigo = :OLD_ori_codigo')
    InsertSQL.Strings = (
      'INSERT INTO orditens'
      
        '  (ori_codigo, ord_numero, ori_quantidade, pro_codigo, ori_vlrbr' +
        't, ori_vlrdesc, '
      '   ori_percdesc, ori_vlrliq, ori_vlrtotal)'
      'VALUES'
      
        '  (:ori_codigo, :ord_numero, :ori_quantidade, :pro_codigo, :ori_' +
        'vlrbrt, '
      '   :ori_vlrdesc, :ori_percdesc, :ori_vlrliq, :ori_vlrtotal)')
    ModifySQL.Strings = (
      'UPDATE orditens SET'
      '  ori_codigo = :ori_codigo,'
      '  ord_numero = :ord_numero,'
      '  ori_quantidade = :ori_quantidade,'
      '  pro_codigo = :pro_codigo,'
      '  ori_vlrbrt = :ori_vlrbrt,'
      '  ori_vlrdesc = :ori_vlrdesc,'
      '  ori_percdesc = :ori_percdesc,'
      '  ori_vlrliq = :ori_vlrliq,'
      '  ori_vlrtotal = :ori_vlrtotal'
      'WHERE'
      '  orditens.ori_codigo = :OLD_ori_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 336
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ori_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ord_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ori_quantidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ori_vlrbrt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ori_vlrdesc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ori_percdesc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ori_vlrliq'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ori_vlrtotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ori_codigo'
        ParamType = ptUnknown
      end>
  end
end
