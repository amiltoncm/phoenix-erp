inherited dmFinanceiro: TdmFinanceiro
  OldCreateOrder = True
  object qyCaixa: TZQuery
    Connection = database
    UpdateObject = updCaixa
    BeforePost = qyCaixaBeforePost
    AfterPost = qyCaixaAfterPost
    BeforeDelete = qyCaixaBeforeDelete
    AfterDelete = qyCaixaAfterDelete
    OnPostError = qyCaixaPostError
    SQL.Strings = (
      'select'
      
        'cai_codigo, cai_id, cai_data, cai_dataefet, con_codigo, plc_codi' +
        'go, cai_valor, cai_numdoc,'
      'cai_descricao, pag_codigo, rec_codigo, mdc_codigo, usu_codigo'
      'from caixa'
      'order by cai_data')
    Params = <>
    Left = 40
    Top = 104
    object qyCaixacai_codigo: TIntegerField
      DisplayLabel = 'Lan'#231'amento'
      FieldName = 'cai_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyCaixacai_id: TIntegerField
      DisplayLabel = 'Caixa'
      FieldName = 'cai_id'
      Required = True
      DisplayFormat = '000'
    end
    object qyCaixacai_data: TDateField
      DisplayLabel = 'Data'
      FieldName = 'cai_data'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyCaixacai_dataefet: TDateField
      DisplayLabel = 'Efetiva'#231#227'o'
      FieldName = 'cai_dataefet'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyCaixacon_codigo: TIntegerField
      DisplayLabel = 'Cod. Conta'
      FieldName = 'con_codigo'
      Required = True
      Visible = False
    end
    object qyCaixaplc_codigo: TIntegerField
      DisplayLabel = 'Cod. Plano de Contas'
      FieldName = 'plc_codigo'
      Required = True
      Visible = False
    end
    object qyCaixacai_valor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'cai_valor'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyCaixacai_numdoc: TIntegerField
      DisplayLabel = 'Documento'
      FieldName = 'cai_numdoc'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyCaixacai_descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'cai_descricao'
      Size = 25
    end
    object qyCaixapag_codigo: TIntegerField
      DisplayLabel = 'Cod. Pagamento'
      FieldName = 'pag_codigo'
      Visible = False
    end
    object qyCaixarec_codigo: TIntegerField
      DisplayLabel = 'Cod. Recebimento'
      FieldName = 'rec_codigo'
      Visible = False
    end
    object qyCaixamdc_codigo: TWideStringField
      DisplayLabel = 'Mod.'
      FieldName = 'mdc_codigo'
      Visible = False
      Size = 2
    end
    object qyCaixausu_codigo: TIntegerField
      DisplayLabel = 'Cod. Usuario'
      FieldName = 'usu_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000'
    end
  end
  object qyCheques: TZQuery
    Connection = database
    UpdateObject = updCheques
    BeforePost = qyChequesBeforePost
    AfterPost = qyChequesAfterPost
    BeforeDelete = qyChequesBeforeDelete
    AfterDelete = qyChequesAfterDelete
    OnPostError = qyChequesPostError
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
    Left = 232
    Top = 104
    object qyChequeschq_lancamento: TIntegerField
      DisplayLabel = 'Lan'#231'amento'
      FieldName = 'chq_lancamento'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyChequesban_codigo: TIntegerField
      DisplayLabel = 'Cod. Banco'
      FieldName = 'ban_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyChequeschq_agencia: TIntegerField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'chq_agencia'
      Required = True
    end
    object qyChequeschq_conta: TIntegerField
      DisplayLabel = 'Conta'
      FieldName = 'chq_conta'
      Required = True
    end
    object qyChequeschq_cheque: TIntegerField
      DisplayLabel = 'Cheque'
      FieldName = 'chq_cheque'
      Required = True
    end
    object qyChequeschq_valor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'chq_valor'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyChequeschq_documento: TWideStringField
      DisplayLabel = 'Documento'
      FieldName = 'chq_documento'
      Required = True
      Size = 18
    end
    object qyChequeschq_titular: TWideStringField
      DisplayLabel = 'Titular'
      FieldName = 'chq_titular'
      Required = True
      Size = 50
    end
    object qyChequeschq_datalanc: TDateField
      DisplayLabel = 'Data'
      FieldName = 'chq_datalanc'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyChequeschq_vencimento: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'chq_vencimento'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyChequespes_codigo: TIntegerField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'pes_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyChequeschq_endosso: TWideStringField
      DisplayLabel = 'Endosso'
      FieldName = 'chq_endosso'
      Required = True
      Size = 50
    end
    object qyChequeschq_telefone: TWideStringField
      DisplayLabel = 'Telefone'
      FieldName = 'chq_telefone'
      Required = True
      Size = 15
    end
    object qyChequeschq_destino: TWideStringField
      DisplayLabel = 'Destino'
      FieldName = 'chq_destino'
      Size = 50
    end
    object qyChequescai_codigo: TIntegerField
      DisplayLabel = 'Cod. Caixa'
      FieldName = 'cai_codigo'
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyChequessta_codigo: TIntegerField
      DisplayLabel = 'Cod. Status'
      FieldName = 'sta_codigo'
      Required = True
      Visible = False
    end
    object qyChequessta_descricao: TWideStringField
      DisplayLabel = 'Status'
      FieldName = 'sta_descricao'
      Required = True
    end
  end
  object qyFormPag: TZQuery
    Connection = database
    UpdateObject = updFormPag
    BeforePost = qyFormPagBeforePost
    AfterPost = qyFormPagAfterPost
    BeforeDelete = qyFormPagBeforeDelete
    AfterDelete = qyFormPagAfterDelete
    OnPostError = qyFormPagPostError
    SQL.Strings = (
      'select'
      
        'frp_codigo, frp_descricao, frp_tpag, frp_ativo, con_codigo, frp_' +
        'dias'
      'from'
      'formpag'
      'where frp_ativo = '#39'S'#39
      'order by frp_descricao')
    Params = <>
    Left = 416
    Top = 104
    object qyFormPagfrp_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'frp_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyFormPagfrp_descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'frp_descricao'
      Required = True
    end
    object qyFormPagfrp_tpag: TIntegerField
      DisplayLabel = 'TPag'
      FieldName = 'frp_tpag'
      Required = True
    end
    object qyFormPagfrp_ativo: TWideStringField
      DisplayLabel = 'Ativo'
      FieldName = 'frp_ativo'
      Required = True
      Visible = False
      Size = 1
    end
    object qyFormPagcon_codigo: TIntegerField
      DisplayLabel = 'Cod. Conta'
      FieldName = 'con_codigo'
      Visible = False
      DisplayFormat = '000'
    end
    object qyFormPagfrp_dias: TIntegerField
      DisplayLabel = 'Dias'
      FieldName = 'frp_dias'
      DisplayFormat = '000'
    end
  end
  object qyPagar: TZQuery
    Connection = database
    UpdateObject = updPagar
    BeforePost = qyPagarBeforePost
    AfterPost = qyPagarAfterPost
    BeforeDelete = qyPagarBeforeDelete
    AfterDelete = qyPagarAfterDelete
    OnPostError = qyPagarPostError
    SQL.Strings = (
      'select'
      
        'p.pag_codigo, p.pag_emissao, p.pag_vencimento, p.pag_numero, p.p' +
        'ag_serie,'
      
        'p.pag_modelo, p.pag_parcela, p.pag_duplicata, p.pes_codigo, p.pa' +
        'g_valor,'
      
        'p.pag_pago, p.pag_acrescimo, p.pag_desconto, p.pag_saldo, p.pag_' +
        'chavenfe,'
      'p.sta_codigo, s.sta_descricao, f.pes_nome'
      'from pagar p, statusmov s, pessoas f'
      'where p.sta_codigo = s.sta_codigo'
      'and p.pes_codigo = f.pes_codigo'
      'order by p.pag_vencimento')
    Params = <>
    Left = 40
    Top = 192
    object qyPagarpag_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pag_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyPagarpag_vencimento: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'pag_vencimento'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyPagarpes_codigo: TIntegerField
      DisplayLabel = 'Cod. Fornecedor'
      FieldName = 'pes_codigo'
      Required = True
      Visible = False
    end
    object qyPagarpes_nome: TWideStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'pes_nome'
      Required = True
      Size = 60
    end
    object qyPagarpag_numero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'pag_numero'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyPagarpag_serie: TIntegerField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'pag_serie'
      Required = True
      DisplayFormat = '00'
    end
    object qyPagarpag_modelo: TWideStringField
      DisplayLabel = 'Mod.'
      FieldName = 'pag_modelo'
      Required = True
      Size = 2
    end
    object qyPagarpag_parcela: TIntegerField
      DisplayLabel = 'Parcela'
      FieldName = 'pag_parcela'
      Required = True
      DisplayFormat = '00'
    end
    object qyPagarpag_duplicata: TWideStringField
      DisplayLabel = 'Duplicata'
      FieldName = 'pag_duplicata'
      Required = True
      Size = 15
    end
    object qyPagarpag_valor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'pag_valor'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyPagarpag_pago: TFloatField
      DisplayLabel = 'Pago'
      FieldName = 'pag_pago'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyPagarpag_acrescimo: TFloatField
      DisplayLabel = 'Acr'#233'scimo'
      FieldName = 'pag_acrescimo'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyPagarpag_desconto: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'pag_desconto'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyPagarpag_saldo: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'pag_saldo'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyPagarpag_emissao: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'pag_emissao'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyPagarpag_chavenfe: TWideStringField
      DisplayLabel = 'Chave NFe'
      FieldName = 'pag_chavenfe'
      Size = 44
    end
    object qyPagarsta_codigo: TIntegerField
      DisplayLabel = 'Cod. Status'
      FieldName = 'sta_codigo'
      Required = True
      Visible = False
    end
    object qyPagarsta_descricao: TWideStringField
      DisplayLabel = 'Status'
      FieldName = 'sta_descricao'
      Required = True
    end
  end
  object qyPrazos: TZQuery
    Connection = database
    UpdateObject = updPrazos
    AfterInsert = qyPrazosAfterInsert
    BeforePost = qyPrazosBeforePost
    AfterPost = qyPrazosAfterPost
    BeforeDelete = qyPrazosBeforeDelete
    AfterDelete = qyPrazosAfterDelete
    OnPostError = qyPrazosPostError
    SQL.Strings = (
      'select'
      
        'prz_codigo, prz_descricao, prz_parcelas, prz_juros, prz_indpag, ' +
        'prz_periodo'
      'from'
      'prazos'
      'order by prz_descricao')
    Params = <>
    Left = 232
    Top = 192
    object qyPrazosprz_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'prz_codigo'
      Required = True
      DisplayFormat = '00'
    end
    object qyPrazosprz_descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'prz_descricao'
      Required = True
      Size = 30
    end
    object qyPrazosprz_parcelas: TIntegerField
      DisplayLabel = 'Parcelas'
      FieldName = 'prz_parcelas'
      Required = True
      DisplayFormat = '00'
    end
    object qyPrazosprz_juros: TFloatField
      DisplayLabel = 'Juros'
      FieldName = 'prz_juros'
      Required = True
      DisplayFormat = '#,##0.0'
    end
    object qyPrazosprz_periodo: TIntegerField
      DisplayLabel = 'Per'#237'odos'
      FieldName = 'prz_periodo'
      Required = True
      DisplayFormat = '00'
    end
    object qyPrazosprz_indpag: TIntegerField
      DisplayLabel = 'Ind. Pag.'
      FieldName = 'prz_indpag'
      Required = True
    end
  end
  object qyPrazosfrp: TZQuery
    Connection = database
    UpdateObject = updPrazosfrp
    BeforePost = qyPrazosfrpBeforePost
    AfterPost = qyPrazosfrpAfterPost
    BeforeDelete = qyPrazosfrpBeforeDelete
    AfterDelete = qyPrazosfrpAfterDelete
    OnPostError = qyPrazosfrpPostError
    SQL.Strings = (
      'select'
      'p.prz_codigo, p.frp_codigo, f.frp_descricao'
      'from'
      'prazosfrp p, formpag f'
      'where p.frp_codigo = f.frp_codigo')
    Params = <>
    Left = 416
    Top = 192
    object qyPrazosfrpprz_codigo: TIntegerField
      DisplayLabel = 'Cod. Prazo'
      FieldName = 'prz_codigo'
      Required = True
      Visible = False
    end
    object qyPrazosfrpfrp_codigo: TIntegerField
      DisplayLabel = 'Cod. Forma'
      FieldName = 'frp_codigo'
      Required = True
      Visible = False
    end
    object qyPrazosfrpfrp_descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'frp_descricao'
      Required = True
    end
  end
  object qyReceber: TZQuery
    Connection = database
    UpdateObject = updReceber
    BeforePost = qyReceberBeforePost
    AfterPost = qyReceberAfterPost
    BeforeDelete = qyReceberBeforeDelete
    AfterDelete = qyReceberAfterDelete
    OnPostError = qyReceberPostError
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
    Left = 40
    Top = 296
    object qyReceberrec_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'rec_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyReceberrec_vencimento: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'rec_vencimento'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyReceberpes_codigo: TIntegerField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'pes_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyReceberpes_nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'pes_nome'
      Required = True
      Size = 60
    end
    object qyReceberrec_numero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'rec_numero'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyReceberrec_serie: TIntegerField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'rec_serie'
      Required = True
      DisplayFormat = '00'
    end
    object qyRecebermdc_codigo: TWideStringField
      DisplayLabel = 'Mod.'
      FieldName = 'mdc_codigo'
      Required = True
      Size = 2
    end
    object qyReceberrec_parcela: TIntegerField
      DisplayLabel = 'Parcela'
      FieldName = 'rec_parcela'
      Required = True
      DisplayFormat = '00'
    end
    object qyReceberrec_duplicata: TWideStringField
      DisplayLabel = 'Duplicata'
      FieldName = 'rec_duplicata'
      Required = True
      Size = 12
    end
    object qyReceberrec_valor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'rec_valor'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyReceberrec_pago: TFloatField
      DisplayLabel = 'Pago'
      FieldName = 'rec_pago'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyReceberrec_acrescimo: TFloatField
      DisplayLabel = 'Acr'#233'scimo'
      FieldName = 'rec_acrescimo'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyReceberrec_desconto: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'rec_desconto'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyReceberrec_saldo: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'rec_saldo'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyRecebersta_codigo: TIntegerField
      DisplayLabel = 'Cod. Status'
      FieldName = 'sta_codigo'
      Required = True
      Visible = False
    end
    object qyReceberrec_emissao: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'rec_emissao'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyReceberfrp_codigo: TIntegerField
      DisplayLabel = 'Cod. Forma'
      FieldName = 'frp_codigo'
      Required = True
      Visible = False
    end
    object qyRecebersta_descricao: TWideStringField
      DisplayLabel = 'Status'
      FieldName = 'sta_descricao'
      Required = True
    end
  end
  object updCaixa: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM caixa'
      'WHERE'
      '  caixa.cai_codigo = :OLD_cai_codigo')
    InsertSQL.Strings = (
      'INSERT INTO caixa'
      
        '  (cai_codigo, cai_id, cai_data, cai_dataefet, con_codigo, plc_c' +
        'odigo, '
      
        '   cai_valor, cai_numdoc, cai_descricao, pag_codigo, rec_codigo,' +
        ' mdc_codigo, '
      '   usu_codigo)'
      'VALUES'
      
        '  (:cai_codigo, :cai_id, :cai_data, :cai_dataefet, :con_codigo, ' +
        ':plc_codigo, '
      
        '   :cai_valor, :cai_numdoc, :cai_descricao, :pag_codigo, :rec_co' +
        'digo, :mdc_codigo, '
      '   :usu_codigo)')
    ModifySQL.Strings = (
      'UPDATE caixa SET'
      '  cai_codigo = :cai_codigo,'
      '  cai_id = :cai_id,'
      '  cai_data = :cai_data,'
      '  cai_dataefet = :cai_dataefet,'
      '  con_codigo = :con_codigo,'
      '  plc_codigo = :plc_codigo,'
      '  cai_valor = :cai_valor,'
      '  cai_numdoc = :cai_numdoc,'
      '  cai_descricao = :cai_descricao,'
      '  pag_codigo = :pag_codigo,'
      '  rec_codigo = :rec_codigo,'
      '  mdc_codigo = :mdc_codigo,'
      '  usu_codigo = :usu_codigo'
      'WHERE'
      '  caixa.cai_codigo = :OLD_cai_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 112
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cai_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cai_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cai_data'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cai_dataefet'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'con_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'plc_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cai_valor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cai_numdoc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cai_descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pag_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rec_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mdc_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'usu_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_cai_codigo'
        ParamType = ptUnknown
      end>
  end
  object updCheques: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM cheques'
      'WHERE'
      '  cheques.chq_lancamento = :OLD_chq_lancamento')
    InsertSQL.Strings = (
      'INSERT INTO cheques'
      
        '  (chq_lancamento, ban_codigo, chq_agencia, chq_conta, chq_chequ' +
        'e, chq_valor, '
      
        '   chq_documento, chq_titular, chq_datalanc, chq_vencimento, pes' +
        '_codigo, '
      
        '   chq_endosso, chq_telefone, chq_destino, cai_codigo, sta_codig' +
        'o)'
      'VALUES'
      
        '  (:chq_lancamento, :ban_codigo, :chq_agencia, :chq_conta, :chq_' +
        'cheque, '
      
        '   :chq_valor, :chq_documento, :chq_titular, :chq_datalanc, :chq' +
        '_vencimento, '
      
        '   :pes_codigo, :chq_endosso, :chq_telefone, :chq_destino, :cai_' +
        'codigo, '
      '   :sta_codigo)')
    ModifySQL.Strings = (
      'UPDATE cheques SET'
      '  chq_lancamento = :chq_lancamento,'
      '  ban_codigo = :ban_codigo,'
      '  chq_agencia = :chq_agencia,'
      '  chq_conta = :chq_conta,'
      '  chq_cheque = :chq_cheque,'
      '  chq_valor = :chq_valor,'
      '  chq_documento = :chq_documento,'
      '  chq_titular = :chq_titular,'
      '  chq_datalanc = :chq_datalanc,'
      '  chq_vencimento = :chq_vencimento,'
      '  pes_codigo = :pes_codigo,'
      '  chq_endosso = :chq_endosso,'
      '  chq_telefone = :chq_telefone,'
      '  chq_destino = :chq_destino,'
      '  cai_codigo = :cai_codigo,'
      '  sta_codigo = :sta_codigo'
      'WHERE'
      '  cheques.chq_lancamento = :OLD_chq_lancamento')
    UseSequenceFieldForRefreshSQL = False
    Left = 304
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'chq_lancamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ban_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'chq_agencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'chq_conta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'chq_cheque'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'chq_valor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'chq_documento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'chq_titular'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'chq_datalanc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'chq_vencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'chq_endosso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'chq_telefone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'chq_destino'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cai_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sta_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_chq_lancamento'
        ParamType = ptUnknown
      end>
  end
  object updFormPag: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM formpag'
      'WHERE'
      '  formpag.frp_codigo = :OLD_frp_codigo')
    InsertSQL.Strings = (
      'INSERT INTO formpag'
      
        '  (frp_codigo, frp_descricao, frp_tpag, frp_ativo, con_codigo, f' +
        'rp_dias)'
      'VALUES'
      
        '  (:frp_codigo, :frp_descricao, :frp_tpag, :frp_ativo, :con_codi' +
        'go, :frp_dias)')
    ModifySQL.Strings = (
      'UPDATE formpag SET'
      '  frp_codigo = :frp_codigo,'
      '  frp_descricao = :frp_descricao,'
      '  frp_tpag = :frp_tpag,'
      '  frp_ativo = :frp_ativo,'
      '  con_codigo = :con_codigo,'
      '  frp_dias = :frp_dias'
      'WHERE'
      '  formpag.frp_codigo = :OLD_frp_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 480
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'frp_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'frp_descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'frp_tpag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'frp_ativo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'con_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'frp_dias'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_frp_codigo'
        ParamType = ptUnknown
      end>
  end
  object updPagar: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM pagar'
      'WHERE'
      '  pagar.pag_codigo = :OLD_pag_codigo')
    InsertSQL.Strings = (
      'INSERT INTO pagar'
      
        '  (pag_codigo, pag_emissao, pag_vencimento, pag_numero, pag_seri' +
        'e, pag_parcela, '
      
        '   pag_modelo, pag_duplicata, pes_codigo, pag_valor, pag_pago, p' +
        'ag_acrescimo, '
      '   pag_desconto, pag_saldo, pag_chavenfe, sta_codigo)'
      'VALUES'
      
        '  (:pag_codigo, :pag_emissao, :pag_vencimento, :pag_numero, :pag' +
        '_serie, '
      
        '   :pag_parcela, :pag_modelo, :pag_duplicata, :pes_codigo, :pag_' +
        'valor, '
      
        '   :pag_pago, :pag_acrescimo, :pag_desconto, :pag_saldo, :pag_ch' +
        'avenfe, '
      '   :sta_codigo)')
    ModifySQL.Strings = (
      'UPDATE pagar SET'
      '  pag_codigo = :pag_codigo,'
      '  pag_emissao = :pag_emissao,'
      '  pag_vencimento = :pag_vencimento,'
      '  pag_numero = :pag_numero,'
      '  pag_serie = :pag_serie,'
      '  pag_parcela = :pag_parcela,'
      '  pag_modelo = :pag_modelo,'
      '  pag_duplicata = :pag_duplicata,'
      '  pes_codigo = :pes_codigo,'
      '  pag_valor = :pag_valor,'
      '  pag_pago = :pag_pago,'
      '  pag_acrescimo = :pag_acrescimo,'
      '  pag_desconto = :pag_desconto,'
      '  pag_saldo = :pag_saldo,'
      '  pag_chavenfe = :pag_chavenfe,'
      '  sta_codigo = :sta_codigo'
      'WHERE'
      '  pagar.pag_codigo = :OLD_pag_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 112
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pag_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pag_emissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pag_vencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pag_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pag_serie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pag_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pag_modelo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pag_duplicata'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pag_valor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pag_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pag_acrescimo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pag_desconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pag_saldo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pag_chavenfe'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sta_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_pag_codigo'
        ParamType = ptUnknown
      end>
  end
  object updPrazos: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM prazos'
      'WHERE'
      '  prazos.prz_codigo = :OLD_prz_codigo')
    InsertSQL.Strings = (
      'INSERT INTO prazos'
      
        '  (prz_codigo, prz_descricao, prz_parcelas, prz_juros, prz_indpa' +
        'g, prz_periodo)'
      'VALUES'
      
        '  (:prz_codigo, :prz_descricao, :prz_parcelas, :prz_juros, :prz_' +
        'indpag, '
      '   :prz_periodo)')
    ModifySQL.Strings = (
      'UPDATE prazos SET'
      '  prz_codigo = :prz_codigo,'
      '  prz_descricao = :prz_descricao,'
      '  prz_parcelas = :prz_parcelas,'
      '  prz_juros = :prz_juros,'
      '  prz_indpag = :prz_indpag,'
      '  prz_periodo = :prz_periodo'
      'WHERE'
      '  prazos.prz_codigo = :OLD_prz_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 304
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'prz_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prz_descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prz_parcelas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prz_juros'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prz_indpag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prz_periodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_prz_codigo'
        ParamType = ptUnknown
      end>
  end
  object updPrazosfrp: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM prazosfrp'
      'WHERE'
      '  prazosfrp.prz_codigo = :OLD_prz_codigo AND'
      '  prazosfrp.frp_codigo = :OLD_frp_codigo')
    InsertSQL.Strings = (
      'INSERT INTO prazosfrp'
      '  (prz_codigo, frp_codigo)'
      'VALUES'
      '  (:prz_codigo, :frp_codigo)')
    ModifySQL.Strings = (
      'UPDATE prazosfrp SET'
      '  prz_codigo = :prz_codigo,'
      '  frp_codigo = :frp_codigo'
      'WHERE'
      '  prazosfrp.prz_codigo = :OLD_prz_codigo AND'
      '  prazosfrp.frp_codigo = :OLD_frp_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 480
    Top = 192
    ParamData = <
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
        Name = 'OLD_prz_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_frp_codigo'
        ParamType = ptUnknown
      end>
  end
  object updReceber: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM receber'
      'WHERE'
      '  receber.rec_codigo = :OLD_rec_codigo')
    InsertSQL.Strings = (
      'INSERT INTO receber'
      
        '  (rec_codigo, rec_emissao, rec_vencimento, rec_numero, rec_seri' +
        'e, mdc_codigo, '
      
        '   rec_parcela, rec_duplicata, pes_codigo, rec_valor, rec_pago, ' +
        'rec_acrescimo, '
      '   rec_desconto, rec_saldo, frp_codigo, sta_codigo)'
      'VALUES'
      
        '  (:rec_codigo, :rec_emissao, :rec_vencimento, :rec_numero, :rec' +
        '_serie, '
      
        '   :mdc_codigo, :rec_parcela, :rec_duplicata, :pes_codigo, :rec_' +
        'valor, '
      
        '   :rec_pago, :rec_acrescimo, :rec_desconto, :rec_saldo, :frp_co' +
        'digo, :sta_codigo)')
    ModifySQL.Strings = (
      'UPDATE receber SET'
      '  rec_codigo = :rec_codigo,'
      '  rec_emissao = :rec_emissao,'
      '  rec_vencimento = :rec_vencimento,'
      '  rec_numero = :rec_numero,'
      '  rec_serie = :rec_serie,'
      '  mdc_codigo = :mdc_codigo,'
      '  rec_parcela = :rec_parcela,'
      '  rec_duplicata = :rec_duplicata,'
      '  pes_codigo = :pes_codigo,'
      '  rec_valor = :rec_valor,'
      '  rec_pago = :rec_pago,'
      '  rec_acrescimo = :rec_acrescimo,'
      '  rec_desconto = :rec_desconto,'
      '  rec_saldo = :rec_saldo,'
      '  frp_codigo = :frp_codigo,'
      '  sta_codigo = :sta_codigo'
      'WHERE'
      '  receber.rec_codigo = :OLD_rec_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 112
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'rec_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rec_emissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rec_vencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rec_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rec_serie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mdc_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rec_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rec_duplicata'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rec_valor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rec_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rec_acrescimo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rec_desconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rec_saldo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'frp_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sta_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_rec_codigo'
        ParamType = ptUnknown
      end>
  end
end
