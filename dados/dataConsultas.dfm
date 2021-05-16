inherited dmConsultas: TdmConsultas
  OldCreateOrder = True
  object SQL: TZQuery
    Connection = database
    Params = <>
    Left = 376
    Top = 16
  end
  object qyConsPagar: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      
        'p.pag_vencimento, f.pes_nome, p.pag_numero, p.pag_serie, p.pag_p' +
        'arcela,'
      
        'p.pag_valor, p.pag_acrescimo, p.pag_desconto, p.pag_pago, p.pag_' +
        'saldo, s.sta_descricao,'
      
        'p.pag_chavenfe, p.pag_duplicata, p.pag_emissao, p.pag_modelo, p.' +
        'pag_codigo'
      'from pagar p, pessoas f, statusmov s'
      'where p.pes_codigo = f.pes_codigo'
      'and p.sta_codigo = s.sta_codigo')
    Params = <>
    Left = 40
    Top = 88
    object qyConsPagarpag_vencimento: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'pag_vencimento'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyConsPagarpes_nome: TWideStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'pes_nome'
      Required = True
      Size = 60
    end
    object qyConsPagarpag_numero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'pag_numero'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyConsPagarpag_serie: TIntegerField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'pag_serie'
      Required = True
      DisplayFormat = '00'
    end
    object qyConsPagarpag_parcela: TIntegerField
      DisplayLabel = 'Parcela'
      FieldName = 'pag_parcela'
      Required = True
      DisplayFormat = '00'
    end
    object qyConsPagarpag_valor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'pag_valor'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyConsPagarpag_acrescimo: TFloatField
      DisplayLabel = 'Acr'#233'scimo'
      FieldName = 'pag_acrescimo'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyConsPagarpag_desconto: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'pag_desconto'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyConsPagarpag_pago: TFloatField
      DisplayLabel = 'Pago'
      FieldName = 'pag_pago'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyConsPagarpag_saldo: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'pag_saldo'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyConsPagarsta_descricao: TWideStringField
      DisplayLabel = 'Status'
      FieldName = 'sta_descricao'
      Required = True
    end
    object qyConsPagarpag_chavenfe: TWideStringField
      DisplayLabel = 'Chave NFe'
      FieldName = 'pag_chavenfe'
      Size = 44
    end
    object qyConsPagarpag_duplicata: TWideStringField
      DisplayLabel = 'Duplicata'
      FieldName = 'pag_duplicata'
      Required = True
      Size = 15
    end
    object qyConsPagarpag_emissao: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'pag_emissao'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyConsPagarpag_modelo: TWideStringField
      DefaultExpression = '00'
      DisplayLabel = 'Modelo'
      FieldName = 'pag_modelo'
      Required = True
      Size = 2
    end
    object qyConsPagarpag_codigo: TIntegerField
      DisplayLabel = 'Cod. Lanc.'
      FieldName = 'pag_codigo'
      Required = True
      Visible = False
    end
  end
  object qyConsPagCaixa: TZQuery
    Connection = database
    SQL.Strings = (
      
        'select c.cai_data, c.cai_codigo, t.con_descricao, p.plc_descrica' +
        'o,'
      'c.cai_descricao, c.cai_numdoc, c.cai_valor, u.usu_nome'
      'from caixa c, contas t, planocontas p, usuarios u'
      'where c.con_codigo = t.con_codigo'
      'and c.plc_codigo = p.plc_codigo'
      'and c.usu_codigo = u.usu_codigo')
    Params = <>
    Left = 136
    Top = 88
    object qyConsPagCaixacai_data: TDateField
      DisplayLabel = 'Data'
      FieldName = 'cai_data'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyConsPagCaixacai_codigo: TIntegerField
      DisplayLabel = 'Cod. Caixa'
      FieldName = 'cai_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyConsPagCaixacon_descricao: TWideStringField
      DisplayLabel = 'Conta'
      FieldName = 'con_descricao'
      Required = True
      Size = 30
    end
    object qyConsPagCaixaplc_descricao: TWideStringField
      DisplayLabel = 'Plano de Contas'
      FieldName = 'plc_descricao'
      Required = True
      Size = 30
    end
    object qyConsPagCaixacai_descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'cai_descricao'
      Size = 25
    end
    object qyConsPagCaixacai_numdoc: TIntegerField
      DisplayLabel = 'Num. Doc.'
      FieldName = 'cai_numdoc'
      Required = True
    end
    object qyConsPagCaixacai_valor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'cai_valor'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyConsPagCaixausu_nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'usu_nome'
      Required = True
    end
  end
  object qyRelPagar: TZQuery
    Connection = database
    SQL.Strings = (
      'select p.pag_vencimento, p.pag_emissao, p.pag_numero,'
      'p.pag_serie, p.pag_parcela, f.pes_nome, p.pag_valor,'
      'p.pag_desconto, p.pag_acrescimo, p.pag_pago, p.pag_saldo'
      'from pagar p, pessoas f'
      'where p.pes_codigo = f.pes_codigo')
    Params = <>
    Left = 296
    Top = 88
    object qyRelPagarpag_vencimento: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'pag_vencimento'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyRelPagarpag_emissao: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'pag_emissao'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyRelPagarpag_numero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'pag_numero'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyRelPagarpag_serie: TIntegerField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'pag_serie'
      Required = True
      DisplayFormat = '00'
    end
    object qyRelPagarpag_parcela: TIntegerField
      DisplayLabel = 'Parcela'
      FieldName = 'pag_parcela'
      Required = True
    end
    object qyRelPagarpes_nome: TWideStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'pes_nome'
      Required = True
      Size = 60
    end
    object qyRelPagarpag_valor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'pag_valor'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyRelPagarpag_desconto: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'pag_desconto'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyRelPagarpag_acrescimo: TFloatField
      DisplayLabel = 'Acr'#233'scimo'
      FieldName = 'pag_acrescimo'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyRelPagarpag_pago: TFloatField
      DisplayLabel = 'Pago'
      FieldName = 'pag_pago'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyRelPagarpag_saldo: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'pag_saldo'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
  end
  object qyConsProdutosEst: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'pro_codigo, est_fisico, est_reservas, est_disponivel'
      'from produtosest'
      'where pro_codigo = 0')
    Params = <>
    Left = 416
    Top = 88
    object qyConsProdutosEstpro_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pro_codigo'
      Required = True
    end
    object qyConsProdutosEstest_fisico: TFloatField
      DisplayLabel = 'Est. F'#237'sico'
      FieldName = 'est_fisico'
      Required = True
      DisplayFormat = '#,###,###,###,##0.000'
    end
    object qyConsProdutosEstest_reservas: TFloatField
      DisplayLabel = 'Reservas'
      FieldName = 'est_reservas'
      Required = True
      DisplayFormat = '#,###,###,###,##0.000'
    end
    object qyConsProdutosEstest_disponivel: TFloatField
      DisplayLabel = 'Est. Dispon'#237'vel'
      FieldName = 'est_disponivel'
      Required = True
      DisplayFormat = '#,###,###,###,##0.000'
    end
  end
  object qyConsProdutosMov: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      
        'm.prm_codigo, m.pro_codigo, m.prm_data, m.pes_codigo, p.pes_nome' +
        ', m.prm_nota,'
      
        'm.prm_serie, m.prm_modelo, m.prm_quantidade, m.prm_tipo, m.prm_v' +
        'alor'
      'from produtosmov m, pessoas p'
      'where m.pes_codigo = p.pes_codigo'
      'order by m.prm_data desc')
    Params = <>
    Left = 536
    Top = 88
    object qyConsProdutosMovprm_codigo: TIntegerField
      DisplayLabel = 'Cod. Mov.'
      FieldName = 'prm_codigo'
      Required = True
      DisplayFormat = '000,000,000'
    end
    object qyConsProdutosMovpro_codigo: TIntegerField
      DisplayLabel = 'Cod. Produto'
      FieldName = 'pro_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyConsProdutosMovprm_data: TDateField
      DisplayLabel = 'Data'
      FieldName = 'prm_data'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyConsProdutosMovpes_codigo: TIntegerField
      DisplayLabel = 'Cod. Pessoa'
      FieldName = 'pes_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyConsProdutosMovpes_nome: TWideStringField
      DisplayLabel = 'Pessoa'
      FieldName = 'pes_nome'
      Required = True
      Size = 60
    end
    object qyConsProdutosMovprm_nota: TIntegerField
      DisplayLabel = 'Nota'
      FieldName = 'prm_nota'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyConsProdutosMovprm_serie: TIntegerField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'prm_serie'
      Required = True
      DisplayFormat = '00'
    end
    object qyConsProdutosMovprm_modelo: TIntegerField
      DisplayLabel = 'Modelo'
      FieldName = 'prm_modelo'
      Required = True
      DisplayFormat = '00'
    end
    object qyConsProdutosMovprm_quantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'prm_quantidade'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
    object qyConsProdutosMovprm_tipo: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'prm_tipo'
      Required = True
      Size = 3
    end
    object qyConsProdutosMovprm_valor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'prm_valor'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
  end
  object qyRelCaixaAg: TZQuery
    Connection = database
    SQL.Strings = (
      
        'select c.cai_data, t.con_descricao, p.plc_descricao, sum(c.cai_v' +
        'alor)'
      'from caixa c, contas t, planocontas p, usuarios u'
      'where c.con_codigo = t.con_codigo'
      'and c.plc_codigo = p.plc_codigo'
      'and c.usu_codigo = u.usu_codigo'
      'and c.cai_data >= '#39'01/01/2019'#39
      'and c.cai_data <= '#39'31/01/2019'#39
      'group by c.cai_data, t.con_descricao, p.plc_descricao'
      'order by c.cai_data, p.plc_descricao')
    Params = <>
    Left = 40
    Top = 168
    object qyRelCaixaAgcai_data: TDateField
      DisplayLabel = 'Data'
      FieldName = 'cai_data'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyRelCaixaAgcon_descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'con_descricao'
      Required = True
      Size = 30
    end
    object qyRelCaixaAgplc_descricao: TWideStringField
      DisplayLabel = 'Plano de contas'
      FieldName = 'plc_descricao'
      Required = True
      Size = 30
    end
    object qyRelCaixaAgsum: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'sum'
      ReadOnly = True
      DisplayFormat = '#,###,###,##0.00'
    end
  end
  object qyRelCaixaDet: TZQuery
    Connection = database
    SQL.Strings = (
      'select c.cai_data, t.con_descricao, p.plc_descricao,'
      'c.cai_descricao, c.cai_numdoc, c.cai_valor'
      'from caixa c, contas t, planocontas p, usuarios u'
      'where c.con_codigo = t.con_codigo'
      'and c.plc_codigo = p.plc_codigo'
      'and c.usu_codigo = u.usu_codigo'
      'and c.cai_data >= '#39'01/01/2019'#39
      'and c.cai_data <= '#39'31/01/2019'#39
      'order by c.cai_data, p.plc_descricao')
    Params = <>
    Left = 136
    Top = 168
    object qyRelCaixaDetcai_data: TDateField
      DisplayLabel = 'Data'
      FieldName = 'cai_data'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyRelCaixaDetcon_descricao: TWideStringField
      DisplayLabel = 'Conta'
      FieldName = 'con_descricao'
      Required = True
      Size = 30
    end
    object qyRelCaixaDetplc_descricao: TWideStringField
      DisplayLabel = 'Plano de Contas'
      FieldName = 'plc_descricao'
      Required = True
      Size = 30
    end
    object qyRelCaixaDetcai_descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'cai_descricao'
      Size = 25
    end
    object qyRelCaixaDetcai_numdoc: TIntegerField
      DisplayLabel = 'Num. Doc.'
      FieldName = 'cai_numdoc'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyRelCaixaDetcai_valor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'cai_valor'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
  end
  object qyConsSaldos: TZQuery
    Connection = database
    SQL.Strings = (
      'select t.con_descricao, t.con_codigo, sum(c.cai_valor)'
      'from caixa c, contas t'
      'where c.con_codigo = t.con_codigo'
      'group by t.con_descricao, t.con_codigo'
      'order by t.con_descricao')
    Params = <>
    Left = 248
    Top = 168
    object qyConsSaldoscon_descricao: TWideStringField
      DisplayLabel = 'Conta'
      FieldName = 'con_descricao'
      Required = True
      Size = 30
    end
    object qyConsSaldoscon_codigo: TIntegerField
      DisplayLabel = 'Cod. Conta'
      FieldName = 'con_codigo'
      Required = True
    end
    object qyConsSaldossum: TFloatField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'sum'
      ReadOnly = True
      DisplayFormat = '#,###,###,##0.00'
    end
  end
  object qyProdEstMin: TZQuery
    Connection = database
    SQL.Strings = (
      'select p.pro_descricao, p.pro_codigo, p.uni_codigo,p.grp_codigo,'
      'g.grp_descricao, p.sgr_codigo, s.sgr_descricao, p.mar_codigo,'
      'm.mar_descricao, p.pro_vlrcusto, p.pro_estmin, p.pro_estideal,'
      'e.est_fisico, e.est_reservas, e.est_disponivel'
      'from produtos p, produtosest e, grupos g, subgrupos s, marcas m'
      'where p.pro_codigo = e.pro_codigo'
      'and p.grp_codigo = g.grp_codigo'
      'and p.sgr_codigo = s.sgr_codigo'
      'and p.mar_codigo = m.mar_codigo'
      'and p.pro_status = '#39'A'#39)
    Params = <>
    Left = 352
    Top = 168
    object qyProdEstMinpro_descricao: TWideStringField
      DisplayLabel = 'Produto'
      FieldName = 'pro_descricao'
      Required = True
      Size = 100
    end
    object qyProdEstMinpro_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pro_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyProdEstMinuni_codigo: TWideStringField
      DisplayLabel = 'Un.'
      FieldName = 'uni_codigo'
      Required = True
      Size = 2
    end
    object qyProdEstMingrp_codigo: TIntegerField
      DisplayLabel = 'Cod. Grupo'
      FieldName = 'grp_codigo'
      Required = True
      Visible = False
    end
    object qyProdEstMingrp_descricao: TWideStringField
      DisplayLabel = 'Grupo'
      FieldName = 'grp_descricao'
      Required = True
      Size = 25
    end
    object qyProdEstMinsgr_codigo: TIntegerField
      DisplayLabel = 'Cod. Subgrupo'
      FieldName = 'sgr_codigo'
      Required = True
      Visible = False
    end
    object qyProdEstMinsgr_descricao: TWideStringField
      DisplayLabel = 'Subgrupo'
      FieldName = 'sgr_descricao'
      Required = True
      Size = 25
    end
    object qyProdEstMinmar_codigo: TIntegerField
      DisplayLabel = 'Cod. Marca'
      FieldName = 'mar_codigo'
      Required = True
      Visible = False
    end
    object qyProdEstMinmar_descricao: TWideStringField
      DisplayLabel = 'Marca'
      FieldName = 'mar_descricao'
      Required = True
      Size = 25
    end
    object qyProdEstMinpro_vlrcusto: TFloatField
      DisplayLabel = 'Vlr. Custo'
      FieldName = 'pro_vlrcusto'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyProdEstMinpro_estmin: TFloatField
      DisplayLabel = 'Est. Min.'
      FieldName = 'pro_estmin'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyProdEstMinpro_estideal: TFloatField
      DisplayLabel = 'Est. Ideal'
      FieldName = 'pro_estideal'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyProdEstMinest_fisico: TFloatField
      DisplayLabel = 'Est. F'#237'sico'
      FieldName = 'est_fisico'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyProdEstMinest_reservas: TFloatField
      DisplayLabel = 'Reservas'
      FieldName = 'est_reservas'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyProdEstMinest_disponivel: TFloatField
      DisplayLabel = 'Est. Dispon'#237'vel'
      FieldName = 'est_disponivel'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
  end
  object qyConsReceber: TZQuery
    Connection = database
    SQL.Strings = (
      
        'select r.rec_codigo, r.rec_emissao, r.rec_vencimento, p.pes_codi' +
        'go, p.pes_nome,'
      
        'r.rec_numero, r.rec_serie, r.mdc_codigo, r.rec_parcela, r.rec_du' +
        'plicata,'
      
        'r.rec_valor, r.rec_pago, r.rec_acrescimo, r.rec_desconto, r.rec_' +
        'saldo,'
      'r.sta_codigo, r.frp_codigo, s.sta_descricao'
      'from receber r, statusmov s, pessoas p'
      'where r.pes_codigo = p.pes_codigo'
      'and r.sta_codigo = s.sta_codigo')
    Params = <>
    Left = 448
    Top = 168
    object qyConsReceberrec_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'rec_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyConsReceberrec_emissao: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'rec_emissao'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyConsReceberrec_vencimento: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'rec_vencimento'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyConsReceberpes_codigo: TIntegerField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'pes_codigo'
      Required = True
      Visible = False
    end
    object qyConsReceberpes_nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'pes_nome'
      Required = True
      Size = 60
    end
    object qyConsReceberrec_numero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'rec_numero'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyConsReceberrec_serie: TIntegerField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'rec_serie'
      Required = True
      DisplayFormat = '00'
    end
    object qyConsRecebermdc_codigo: TWideStringField
      DisplayLabel = 'Mod.'
      FieldName = 'mdc_codigo'
      Required = True
      Size = 2
    end
    object qyConsReceberrec_parcela: TIntegerField
      DisplayLabel = 'Parcela'
      FieldName = 'rec_parcela'
      Required = True
      DisplayFormat = '00'
    end
    object qyConsReceberrec_duplicata: TWideStringField
      DisplayLabel = 'Duplicata'
      FieldName = 'rec_duplicata'
      Required = True
      Size = 12
    end
    object qyConsReceberrec_valor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'rec_valor'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyConsReceberrec_pago: TFloatField
      DisplayLabel = 'Pago'
      FieldName = 'rec_pago'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyConsReceberrec_acrescimo: TFloatField
      DisplayLabel = 'Acr'#233'scimo'
      FieldName = 'rec_acrescimo'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyConsReceberrec_desconto: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'rec_desconto'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyConsReceberrec_saldo: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'rec_saldo'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyConsRecebersta_codigo: TIntegerField
      DisplayLabel = 'Cod. Status'
      FieldName = 'sta_codigo'
      Required = True
      Visible = False
      DisplayFormat = '00'
    end
    object qyConsReceberfrp_codigo: TIntegerField
      DisplayLabel = 'Cod. Forma'
      FieldName = 'frp_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000'
    end
    object qyConsRecebersta_descricao: TWideStringField
      DisplayLabel = 'Status'
      FieldName = 'sta_descricao'
      Required = True
    end
  end
  object qyConsRecCaixa: TZQuery
    Connection = database
    SQL.Strings = (
      
        'select c.cai_data, c.cai_codigo, t.con_descricao, p.plc_descrica' +
        'o,'
      'c.cai_descricao, c.cai_numdoc, c.cai_valor, u.usu_nome'
      'from caixa c, contas t, planocontas p, usuarios u'
      'where c.con_codigo = t.con_codigo'
      'and c.plc_codigo = p.plc_codigo'
      'and c.usu_codigo = u.usu_codigo')
    Params = <>
    Left = 552
    Top = 168
    object qyConsRecCaixacai_data: TDateField
      DisplayLabel = 'Data'
      FieldName = 'cai_data'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyConsRecCaixacai_codigo: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'cai_codigo'
      Required = True
      Visible = False
    end
    object qyConsRecCaixacon_descricao: TWideStringField
      DisplayLabel = 'Conta'
      FieldName = 'con_descricao'
      Required = True
      Size = 30
    end
    object qyConsRecCaixaplc_descricao: TWideStringField
      DisplayLabel = 'Plano de Contas'
      FieldName = 'plc_descricao'
      Required = True
      Size = 30
    end
    object qyConsRecCaixacai_descricao: TWideStringField
      DisplayLabel = 'Descricao'
      FieldName = 'cai_descricao'
      Size = 25
    end
    object qyConsRecCaixacai_numdoc: TIntegerField
      DisplayLabel = 'Documento'
      FieldName = 'cai_numdoc'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyConsRecCaixacai_valor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'cai_valor'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyConsRecCaixausu_nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'usu_nome'
      Required = True
    end
  end
  object qyItensReservados: TZQuery
    Connection = database
    SQL.Strings = (
      'select r.prv_numero, v.prv_data, r.pro_codigo, p.pro_descricao,'
      'c.pes_nome, v.pes_codigo, r.pri_quantidade'
      'from prevres r, prevendas v, produtos p, pessoas c'
      'where r.prv_numero = v.prv_numero'
      'and v.pes_codigo = c.pes_codigo'
      'and r.pro_codigo = p.pro_codigo')
    Params = <>
    Left = 40
    Top = 240
    object qyItensReservadosprv_numero: TIntegerField
      DisplayLabel = 'Pr'#233'-venda'
      FieldName = 'prv_numero'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyItensReservadosprv_data: TDateField
      DisplayLabel = 'Data'
      FieldName = 'prv_data'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyItensReservadospro_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pro_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyItensReservadospro_descricao: TWideStringField
      DisplayLabel = 'Produto'
      FieldName = 'pro_descricao'
      Required = True
      Size = 100
    end
    object qyItensReservadospes_nome: TWideStringField
      DisplayLabel = 'Pessoa'
      FieldName = 'pes_nome'
      Required = True
      Size = 60
    end
    object qyItensReservadospes_codigo: TIntegerField
      DisplayLabel = 'Cod. Pessoa'
      FieldName = 'pes_codigo'
      Required = True
      Visible = False
    end
    object qyItensReservadospri_quantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'pri_quantidade'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
  end
  object qyConsCartoes: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      
        'c.cai_dataefet, c.cai_data, c.cai_id, p.pes_nome,  c.cai_numdoc,' +
        ' c.mdc_codigo,'
      'c.con_codigo, t.con_descricao, c.cai_valor'
      'from caixa c, contas t, prevendas v, pessoas p'
      'where c.con_codigo = t.con_codigo'
      'and c.cai_numdoc = v.prv_numero'
      'and v.pes_codigo = p.pes_codigo'
      'and ((v.frp_codigo = 2) or (v.frp_codigo = 3))')
    Params = <>
    Left = 144
    Top = 240
    object qyConsCartoescai_dataefet: TDateField
      DisplayLabel = 'Data Efet.'
      FieldName = 'cai_dataefet'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyConsCartoescai_data: TDateField
      DisplayLabel = 'Data Lanc.'
      FieldName = 'cai_data'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyConsCartoescai_id: TIntegerField
      DisplayLabel = 'Lan'#231'ament'
      FieldName = 'cai_id'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyConsCartoespes_nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'pes_nome'
      Required = True
      Size = 60
    end
    object qyConsCartoescai_numdoc: TIntegerField
      DisplayLabel = 'Documento'
      FieldName = 'cai_numdoc'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyConsCartoesmdc_codigo: TWideStringField
      DisplayLabel = 'Mod.'
      FieldName = 'mdc_codigo'
      Size = 2
    end
    object qyConsCartoescon_codigo: TIntegerField
      DisplayLabel = 'Cod. Conta'
      FieldName = 'con_codigo'
      Required = True
      Visible = False
    end
    object qyConsCartoescon_descricao: TWideStringField
      DisplayLabel = 'Conta'
      FieldName = 'con_descricao'
      Required = True
      Size = 30
    end
    object qyConsCartoescai_valor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'cai_valor'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
  end
  object qyProdEstNeg: TZQuery
    Connection = database
    SQL.Strings = (
      'select p.pro_descricao, p.pro_codigo, p.uni_codigo,p.grp_codigo,'
      'g.grp_descricao, p.sgr_codigo, s.sgr_descricao, p.mar_codigo,'
      'm.mar_descricao, p.pro_vlrcusto, p.pro_estmin, p.pro_estideal,'
      'e.est_fisico, e.est_reservas, e.est_disponivel'
      'from produtos p, produtosest e, grupos g, subgrupos s, marcas m'
      'where p.pro_codigo = e.pro_codigo'
      'and p.grp_codigo = g.grp_codigo'
      'and p.sgr_codigo = s.sgr_codigo'
      'and p.mar_codigo = m.mar_codigo'
      'and p.pro_status = '#39'A'#39)
    Params = <>
    Left = 232
    Top = 240
    object qyProdEstNegpro_descricao: TWideStringField
      DisplayLabel = 'Produto'
      FieldName = 'pro_descricao'
      Required = True
      Size = 100
    end
    object qyProdEstNegpro_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pro_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyProdEstNeguni_codigo: TWideStringField
      DisplayLabel = 'Un.'
      FieldName = 'uni_codigo'
      Required = True
      Size = 2
    end
    object qyProdEstNeggrp_codigo: TIntegerField
      DisplayLabel = 'Cod. Grupo'
      FieldName = 'grp_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000'
    end
    object qyProdEstNeggrp_descricao: TWideStringField
      DisplayLabel = 'Grupo'
      FieldName = 'grp_descricao'
      Required = True
      Size = 25
    end
    object qyProdEstNegsgr_codigo: TIntegerField
      DisplayLabel = 'Cod. Subgrupo'
      FieldName = 'sgr_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyProdEstNegsgr_descricao: TWideStringField
      DisplayLabel = 'Subgrupo'
      FieldName = 'sgr_descricao'
      Required = True
      Size = 25
    end
    object qyProdEstNegmar_codigo: TIntegerField
      DisplayLabel = 'Cod. Marca'
      FieldName = 'mar_codigo'
      Required = True
      Visible = False
    end
    object qyProdEstNegmar_descricao: TWideStringField
      DisplayLabel = 'Marca'
      FieldName = 'mar_descricao'
      Required = True
      Size = 25
    end
    object qyProdEstNegpro_vlrcusto: TFloatField
      DisplayLabel = 'Vlr. Custo'
      FieldName = 'pro_vlrcusto'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyProdEstNegpro_estmin: TFloatField
      DisplayLabel = 'Est. Min.'
      FieldName = 'pro_estmin'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
    object qyProdEstNegpro_estideal: TFloatField
      DisplayLabel = 'Est. Ideal'
      FieldName = 'pro_estideal'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
    object qyProdEstNegest_fisico: TFloatField
      DisplayLabel = 'Est. F'#237'sico'
      FieldName = 'est_fisico'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
    object qyProdEstNegest_reservas: TFloatField
      DisplayLabel = 'Reservas'
      FieldName = 'est_reservas'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
    object qyProdEstNegest_disponivel: TFloatField
      DisplayLabel = 'Est. Dispon'#237'vel'
      FieldName = 'est_disponivel'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
  end
  object qyConsCheques: TZQuery
    Connection = database
    SQL.Strings = (
      
        'select c.chq_lancamento, c.ban_codigo, c.chq_agencia, c.chq_cont' +
        'a,'
      'c.chq_cheque, c.chq_valor, c.chq_documento, c.chq_titular,'
      'c.chq_datalanc, c.chq_vencimento, c.pes_codigo, c.chq_endosso,'
      
        'c.chq_telefone, c.chq_destino, c.cai_codigo, c.sta_codigo, s.sta' +
        '_descricao'
      'from cheques c, statusmov s'
      'where c.sta_codigo = s.sta_codigo')
    Params = <>
    Left = 344
    Top = 240
    object qyConsChequeschq_lancamento: TIntegerField
      DisplayLabel = 'Lan'#231'amento'
      FieldName = 'chq_lancamento'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyConsChequesban_codigo: TIntegerField
      DisplayLabel = 'Cod. Banco'
      FieldName = 'ban_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyConsChequeschq_agencia: TIntegerField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'chq_agencia'
      Required = True
    end
    object qyConsChequeschq_conta: TIntegerField
      DisplayLabel = 'Conta'
      FieldName = 'chq_conta'
      Required = True
    end
    object qyConsChequeschq_cheque: TIntegerField
      DisplayLabel = 'Cheque'
      FieldName = 'chq_cheque'
      Required = True
    end
    object qyConsChequeschq_valor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'chq_valor'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyConsChequeschq_documento: TWideStringField
      DisplayLabel = 'Documento'
      FieldName = 'chq_documento'
      Required = True
      Size = 18
    end
    object qyConsChequeschq_titular: TWideStringField
      DisplayLabel = 'Titular'
      FieldName = 'chq_titular'
      Required = True
      Size = 50
    end
    object qyConsChequeschq_datalanc: TDateField
      DisplayLabel = 'Data Lanc.'
      FieldName = 'chq_datalanc'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyConsChequeschq_vencimento: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'chq_vencimento'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyConsChequespes_codigo: TIntegerField
      DisplayLabel = 'C'#243'd. Cliente'
      FieldName = 'pes_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyConsChequeschq_endosso: TWideStringField
      DisplayLabel = 'Endosso'
      FieldName = 'chq_endosso'
      Required = True
      Size = 50
    end
    object qyConsChequeschq_telefone: TWideStringField
      DisplayLabel = 'Telefone'
      FieldName = 'chq_telefone'
      Required = True
      Size = 15
    end
    object qyConsChequeschq_destino: TWideStringField
      DisplayLabel = 'Destino'
      FieldName = 'chq_destino'
      Size = 50
    end
    object qyConsChequescai_codigo: TIntegerField
      DisplayLabel = 'Cod. Caixa'
      FieldName = 'cai_codigo'
      Visible = False
    end
    object qyConsChequessta_codigo: TIntegerField
      DisplayLabel = 'Cod. Status'
      FieldName = 'sta_codigo'
      Required = True
      Visible = False
      DisplayFormat = '00'
    end
    object qyConsChequessta_descricao: TWideStringField
      DisplayLabel = 'Status'
      FieldName = 'sta_descricao'
      Required = True
    end
  end
  object qyConsPreVendas: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      
        'p.prv_numero, p.prv_data, p.pes_codigo, c.pes_nome, c.pes_lograd' +
        'ouro,'
      
        'c.pes_bairro, c.pes_numero, c.cid_codigo, m.cid_municipio, m.uf_' +
        'sigla, c.pes_cep,'
      'c.pes_fone, p.fun_codigo, n.fun_nome, p.prv_tabvenda,'
      
        'p.prv_referente, p.prv_obs, p.prv_vlrcusto, p.prv_subtotal, p.pr' +
        'v_vlrdesc,'
      
        'p.prv_percdesc, p.prv_vlrtotal, p.prv_percmg, p.prz_codigo, z.pr' +
        'z_descricao,'
      
        'p.frp_codigo, f.frp_descricao, p.prv_vlrlucro, p.mdf_codigo, d.m' +
        'df_descricao,'
      
        'p.sto_codigo, s.sto_descricao, p.orc_numero, p.ent_codigo, e.ent' +
        '_descricao'
      
        'from prevendas p, pessoas c, cidades m, prazos z, formpag f, mod' +
        'frete d,'
      'funcionarios n, statusorc s, entrega e'
      'where p.pes_codigo = c.pes_codigo'
      'and c.cid_codigo = m.cid_codigo'
      'and p.prz_codigo = z.prz_codigo'
      'and p.frp_codigo = f.frp_codigo'
      'and p.fun_codigo = n.fun_codigo'
      'and p.mdf_codigo = d.mdf_codigo'
      'and p.sto_codigo = s.sto_codigo'
      'and p.ent_codigo = e.ent_codigo'
      'and p.prv_data >= '#39'01/01/2000'#39
      'and p.prv_data <= '#39'01/01/2000'#39
      'and p.sto_codigo = 5'
      'order by p.prv_data')
    Params = <>
    Left = 448
    Top = 240
    object qyConsPreVendasprv_numero: TIntegerField
      DisplayLabel = 'Pr'#233'-venda'
      FieldName = 'prv_numero'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyConsPreVendasprv_data: TDateField
      DisplayLabel = 'Data'
      FieldName = 'prv_data'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyConsPreVendaspes_codigo: TIntegerField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'pes_codigo'
      Required = True
      Visible = False
    end
    object qyConsPreVendaspes_nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'pes_nome'
      Required = True
      Size = 60
    end
    object qyConsPreVendaspes_logradouro: TWideStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'pes_logradouro'
      Required = True
      Size = 50
    end
    object qyConsPreVendaspes_numero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'pes_numero'
      Required = True
    end
    object qyConsPreVendaspes_bairro: TWideStringField
      DisplayLabel = 'Bairro'
      FieldName = 'pes_bairro'
      Required = True
      Size = 30
    end
    object qyConsPreVendascid_codigo: TIntegerField
      DisplayLabel = 'Cod. Cidade'
      FieldName = 'cid_codigo'
      Required = True
      Visible = False
    end
    object qyConsPreVendascid_municipio: TWideStringField
      DisplayLabel = 'Munic'#237'pio'
      FieldName = 'cid_municipio'
      Required = True
      Size = 50
    end
    object qyConsPreVendasuf_sigla: TWideStringField
      DisplayLabel = 'UF'
      FieldName = 'uf_sigla'
      Required = True
      Size = 2
    end
    object qyConsPreVendaspes_cep: TWideStringField
      DisplayLabel = 'CEP'
      FieldName = 'pes_cep'
      Required = True
      Size = 9
    end
    object qyConsPreVendaspes_fone: TWideStringField
      DisplayLabel = 'Telefone'
      FieldName = 'pes_fone'
      Required = True
      Size = 15
    end
    object qyConsPreVendasfun_codigo: TIntegerField
      DisplayLabel = 'Cod. Funcion'#225'rio'
      FieldName = 'fun_codigo'
      Required = True
      Visible = False
    end
    object qyConsPreVendasfun_nome: TWideStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'fun_nome'
      Required = True
      Size = 50
    end
    object qyConsPreVendasprv_tabvenda: TIntegerField
      DisplayLabel = 'Tab. Venda'
      FieldName = 'prv_tabvenda'
      Required = True
    end
    object qyConsPreVendasprv_referente: TWideStringField
      DisplayLabel = 'Referente'
      FieldName = 'prv_referente'
      Required = True
      Size = 100
    end
    object qyConsPreVendasprv_obs: TWideStringField
      DisplayLabel = 'Obs.'
      FieldName = 'prv_obs'
      Visible = False
      Size = 255
    end
    object qyConsPreVendasprv_vlrcusto: TFloatField
      DisplayLabel = 'Vlr. Custo'
      FieldName = 'prv_vlrcusto'
      Required = True
      DisplayFormat = '#,###,###,###,##0.00'
    end
    object qyConsPreVendasprv_subtotal: TFloatField
      DisplayLabel = 'Vlr. Subtotal'
      FieldName = 'prv_subtotal'
      Required = True
      DisplayFormat = '#,###,###,###,##0.00'
    end
    object qyConsPreVendasprv_vlrdesc: TFloatField
      DisplayLabel = 'Vlr. Desc.'
      FieldName = 'prv_vlrdesc'
      Required = True
      DisplayFormat = '#,###,###,###,##0.00'
    end
    object qyConsPreVendasprv_percdesc: TFloatField
      DisplayLabel = '% Desc.'
      FieldName = 'prv_percdesc'
      Required = True
      DisplayFormat = '#0.0'
    end
    object qyConsPreVendasprv_vlrtotal: TFloatField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'prv_vlrtotal'
      Required = True
      DisplayFormat = '#,###,###,###,##0.00'
    end
    object qyConsPreVendasprv_percmg: TFloatField
      DisplayLabel = 'Margem %'
      FieldName = 'prv_percmg'
      Required = True
      DisplayFormat = '#0.0'
    end
    object qyConsPreVendasprz_codigo: TIntegerField
      DisplayLabel = 'Cod. Prazo'
      FieldName = 'prz_codigo'
      Required = True
      Visible = False
    end
    object qyConsPreVendasprz_descricao: TWideStringField
      DisplayLabel = 'Prazo'
      FieldName = 'prz_descricao'
      Required = True
      Size = 30
    end
    object qyConsPreVendasfrp_codigo: TIntegerField
      DisplayLabel = 'Cod. Forma'
      FieldName = 'frp_codigo'
      Required = True
      Visible = False
    end
    object qyConsPreVendasfrp_descricao: TWideStringField
      DisplayLabel = 'Forma de Pag.'
      FieldName = 'frp_descricao'
      Required = True
    end
    object qyConsPreVendasprv_vlrlucro: TFloatField
      DisplayLabel = 'Vlr. Lucro'
      FieldName = 'prv_vlrlucro'
      Required = True
      DisplayFormat = '#,###,###,###,##0.00'
    end
    object qyConsPreVendasmdf_codigo: TIntegerField
      DisplayLabel = 'Cod. Frete'
      FieldName = 'mdf_codigo'
      Required = True
      Visible = False
    end
    object qyConsPreVendasmdf_descricao: TWideStringField
      DisplayLabel = 'Frete'
      FieldName = 'mdf_descricao'
      Required = True
    end
    object qyConsPreVendassto_codigo: TIntegerField
      DisplayLabel = 'Cod. Status'
      FieldName = 'sto_codigo'
      Required = True
      Visible = False
    end
    object qyConsPreVendassto_descricao: TWideStringField
      DisplayLabel = 'Status'
      FieldName = 'sto_descricao'
      Required = True
    end
    object qyConsPreVendasorc_numero: TIntegerField
      DisplayLabel = 'Or'#231'amento'
      FieldName = 'orc_numero'
      DisplayFormat = '000,000'
    end
    object qyConsPreVendasent_codigo: TIntegerField
      DisplayLabel = 'Cod. Entrega'
      FieldName = 'ent_codigo'
      Required = True
      Visible = False
    end
    object qyConsPreVendasent_descricao: TWideStringField
      DisplayLabel = 'Entrega'
      FieldName = 'ent_descricao'
      Required = True
    end
  end
  object qyConsPrevItens: TZQuery
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
    Left = 560
    Top = 240
    object qyConsPrevItenspri_codigo: TIntegerField
      DisplayLabel = 'Cod. Item'
      FieldName = 'pri_codigo'
      Required = True
      Visible = False
    end
    object qyConsPrevItensprv_numero: TIntegerField
      DisplayLabel = 'Pr'#233'-venda'
      FieldName = 'prv_numero'
      Required = True
      Visible = False
    end
    object qyConsPrevItenspri_quantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'pri_quantidade'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
    object qyConsPrevItenspro_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pro_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyConsPrevItenspro_descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'pro_descricao'
      Required = True
      Size = 100
    end
    object qyConsPrevItensloc_descricao: TWideStringField
      DisplayLabel = 'Localiza'#231#227'o'
      FieldName = 'loc_descricao'
      Required = True
    end
    object qyConsPrevItensuni_codigo: TWideStringField
      DisplayLabel = 'Un.'
      FieldName = 'uni_codigo'
      Required = True
      Size = 2
    end
    object qyConsPrevItenspri_vlrcusto: TFloatField
      DisplayLabel = 'Vlr. Custo'
      FieldName = 'pri_vlrcusto'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyConsPrevItenspri_vlrbrt: TFloatField
      DisplayLabel = 'Vlr. Bruto'
      FieldName = 'pri_vlrbrt'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyConsPrevItenspri_vlrdesc: TFloatField
      DisplayLabel = 'Vlr. Desc.'
      FieldName = 'pri_vlrdesc'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyConsPrevItenspri_percdesc: TFloatField
      DisplayLabel = '% Desc.'
      FieldName = 'pri_percdesc'
      Required = True
      DisplayFormat = '#0.0'
    end
    object qyConsPrevItenspri_vlrliq: TFloatField
      DisplayLabel = 'Vlr. L'#237'quido'
      FieldName = 'pri_vlrliq'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyConsPrevItenspri_vlrtotal: TFloatField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'pri_vlrtotal'
      Required = True
    end
    object qyConsPrevItenspri_percmg: TFloatField
      DisplayLabel = 'Margem %'
      FieldName = 'pri_percmg'
      Required = True
      DisplayFormat = '#,###,###,##0.0'
    end
  end
end
