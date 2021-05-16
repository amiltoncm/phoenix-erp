inherited dmGestao: TdmGestao
  OldCreateOrder = True
  inherited QGeraCodigo: TZQuery
    Left = 136
  end
  inherited QTemp: TZQuery
    Left = 224
  end
  object qyAgenda: TZQuery
    Connection = database
    UpdateObject = updAgenda
    BeforePost = qyAgendaBeforePost
    AfterPost = qyAgendaAfterPost
    BeforeDelete = qyAgendaBeforeDelete
    AfterDelete = qyAgendaAfterDelete
    OnPostError = qyAgendaPostError
    SQL.Strings = (
      'select'
      
        'a.agd_codigo, a.pes_codigo, c.pes_nome, c.pes_fone, a.agd_dataag' +
        ','
      
        'a.agd_horaag, a.agd_datalanc, a.agd_horalanc, a.qda_codigo, q.qd' +
        'a_descricao,'
      'a.agd_atendimento, a.agd_obs, a.usu_codigo'
      'from agenda a, pessoas c, quadras q'
      'where a.pes_codigo = c.pes_codigo'
      'and a.qda_codigo = q.qda_codigo')
    Params = <>
    Left = 40
    Top = 96
    object qyAgendaagd_codigo: TIntegerField
      DisplayLabel = 'Agendamento'
      FieldName = 'agd_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyAgendapes_codigo: TIntegerField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'pes_codigo'
      Required = True
    end
    object qyAgendapes_nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'pes_nome'
      Required = True
      Size = 60
    end
    object qyAgendapes_fone: TWideStringField
      DisplayLabel = 'Telefone'
      FieldName = 'pes_fone'
      Required = True
      Size = 15
    end
    object qyAgendaagd_dataag: TDateField
      DisplayLabel = 'Data'
      FieldName = 'agd_dataag'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyAgendaagd_horaag: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'agd_horaag'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object qyAgendaagd_datalanc: TDateField
      DisplayLabel = 'Data Lanc.'
      FieldName = 'agd_datalanc'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyAgendaagd_horalanc: TTimeField
      DisplayLabel = 'Hora Lanc.'
      FieldName = 'agd_horalanc'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object qyAgendaqda_codigo: TIntegerField
      DisplayLabel = 'Cod. Quadra'
      FieldName = 'qda_codigo'
      Required = True
    end
    object qyAgendaqda_descricao: TWideStringField
      DisplayLabel = 'Quadra'
      FieldName = 'qda_descricao'
      Required = True
    end
    object qyAgendaagd_atendimento: TIntegerField
      DisplayLabel = 'Atendimento'
      FieldName = 'agd_atendimento'
      Required = True
    end
    object qyAgendaagd_obs: TWideStringField
      DisplayLabel = 'Obs'
      FieldName = 'agd_obs'
      Visible = False
      Size = 500
    end
    object qyAgendausu_codigo: TIntegerField
      DisplayLabel = 'Cod. Usu'#225'rio'
      FieldName = 'usu_codigo'
      Required = True
      Visible = False
    end
  end
  object updAgenda: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM agenda'
      'WHERE'
      '  agenda.agd_codigo = :OLD_agd_codigo')
    InsertSQL.Strings = (
      'INSERT INTO agenda'
      
        '  (agd_codigo, qda_codigo, pes_codigo, agd_dataag, agd_horaag, a' +
        'gd_datalanc, '
      '   agd_horalanc, agd_obs, agd_atendimento, usu_codigo)'
      'VALUES'
      
        '  (:agd_codigo, :qda_codigo, :pes_codigo, :agd_dataag, :agd_hora' +
        'ag, :agd_datalanc, '
      '   :agd_horalanc, :agd_obs, :agd_atendimento, :usu_codigo)')
    ModifySQL.Strings = (
      'UPDATE agenda SET'
      '  agd_codigo = :agd_codigo,'
      '  qda_codigo = :qda_codigo,'
      '  pes_codigo = :pes_codigo,'
      '  agd_dataag = :agd_dataag,'
      '  agd_horaag = :agd_horaag,'
      '  agd_datalanc = :agd_datalanc,'
      '  agd_horalanc = :agd_horalanc,'
      '  agd_obs = :agd_obs,'
      '  agd_atendimento = :agd_atendimento,'
      '  usu_codigo = :usu_codigo'
      'WHERE'
      '  agenda.agd_codigo = :OLD_agd_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 136
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'agd_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'qda_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'agd_dataag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'agd_horaag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'agd_datalanc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'agd_horalanc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'agd_obs'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'agd_atendimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'usu_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_agd_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyAgeItens: TZQuery
    Connection = database
    UpdateObject = updAgeItens
    BeforePost = qyAgeItensBeforePost
    AfterPost = qyAgeItensAfterPost
    BeforeDelete = qyAgeItensBeforeDelete
    AfterDelete = qyAgeItensAfterDelete
    OnPostError = qyAgeItensPostError
    SQL.Strings = (
      'select'
      
        'i.agi_codigo, i.agd_codigo, a.agd_dataag, a.agd_horaag, p.pes_no' +
        'me,'
      'i.pro_codigo, s.pro_descricao'
      'from ageitens i, agenda a, produtos s, pessoas p'
      'where i.agd_codigo = a.agd_codigo'
      'and i.pro_codigo = s.pro_codigo'
      'and a.pes_codigo = p.pes_codigo')
    Params = <>
    Left = 264
    Top = 96
    object qyAgeItensagi_codigo: TIntegerField
      DisplayLabel = 'Agendamento'
      FieldName = 'agi_codigo'
      Required = True
      Visible = False
    end
    object qyAgeItensagd_codigo: TIntegerField
      DisplayLabel = 'Cod. Agenda'
      FieldName = 'agd_codigo'
      Required = True
      Visible = False
    end
    object qyAgeItensagd_dataag: TDateField
      DisplayLabel = 'Data'
      FieldName = 'agd_dataag'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyAgeItensagd_horaag: TTimeField
      DisplayLabel = 'Hor'#225'rio'
      FieldName = 'agd_horaag'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object qyAgeItenspes_nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'pes_nome'
      Required = True
      Size = 60
    end
    object qyAgeItenspro_codigo: TIntegerField
      DisplayLabel = 'Cod. Produto / Servi'#231'o'
      FieldName = 'pro_codigo'
      Required = True
      Visible = False
    end
    object qyAgeItenspro_descricao: TWideStringField
      DisplayLabel = 'Produto / Servi'#231'o'
      FieldName = 'pro_descricao'
      Required = True
      Size = 100
    end
  end
  object updAgeItens: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM ageitens'
      'WHERE'
      '  ageitens.agi_codigo = :OLD_agi_codigo')
    InsertSQL.Strings = (
      'INSERT INTO ageitens'
      '  (agi_codigo, agd_codigo, pro_codigo)'
      'VALUES'
      '  (:agi_codigo, :agd_codigo, :pro_codigo)')
    ModifySQL.Strings = (
      'UPDATE ageitens SET'
      '  agi_codigo = :agi_codigo,'
      '  agd_codigo = :agd_codigo,'
      '  pro_codigo = :pro_codigo'
      'WHERE'
      '  ageitens.agi_codigo = :OLD_agi_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 360
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'agi_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'agd_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_agi_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyConsAgenda: TZQuery
    Connection = database
    SQL.Strings = (
      
        'select h.hor_horas, a.agd_dataag, a.agd_codigo, a.pes_codigo, c.' +
        'pes_nome,'
      
        'c.pes_fone, a.agd_datalanc, a.agd_horalanc, a.agd_atendimento, a' +
        '.qda_codigo'
      'from horarios h'
      'left join agenda a on h.hor_horas = a.agd_horaag'
      'and a.agd_dataag = '#39'01/01/2000'#39
      'and a.qda_codigo = 0'
      'left join pessoas c on a.pes_codigo = c.pes_codigo'
      'order by h.hor_horas')
    Params = <>
    Left = 584
    Top = 88
    object qyConsAgendaagd_dataag: TDateField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'agd_dataag'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyConsAgendahor_horas: TTimeField
      DisplayLabel = 'Hor'#225'rio'
      DisplayWidth = 10
      FieldName = 'hor_horas'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object qyConsAgendapes_nome: TWideStringField
      DisplayLabel = 'Cliente'
      DisplayWidth = 60
      FieldName = 'pes_nome'
      Required = True
      Size = 60
    end
    object qyConsAgendapes_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'pes_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyConsAgendapes_fone: TWideStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 15
      FieldName = 'pes_fone'
      Required = True
      Size = 15
    end
    object qyConsAgendaagd_atendimento: TIntegerField
      DisplayLabel = 'Atendimento'
      DisplayWidth = 10
      FieldName = 'agd_atendimento'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyConsAgendaagd_datalanc: TDateField
      DisplayLabel = 'Data lanc.'
      DisplayWidth = 10
      FieldName = 'agd_datalanc'
      Required = True
      Visible = False
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyConsAgendaagd_horalanc: TTimeField
      DisplayLabel = 'Hora lanc.'
      DisplayWidth = 10
      FieldName = 'agd_horalanc'
      Required = True
      Visible = False
      DisplayFormat = 'hh:mm'
    end
    object qyConsAgendaagd_codigo: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'agd_codigo'
      Required = True
      Visible = False
    end
    object qyConsAgendaqda_codigo: TIntegerField
      DisplayLabel = 'Cod. Quadra'
      FieldName = 'qda_codigo'
      Required = True
      Visible = False
    end
  end
  object qyQuadras: TZQuery
    Connection = database
    UpdateObject = updQuadras
    BeforePost = qyQuadrasBeforePost
    AfterPost = qyQuadrasAfterPost
    BeforeDelete = qyQuadrasBeforeDelete
    AfterDelete = qyQuadrasAfterDelete
    OnPostError = qyQuadrasPostError
    SQL.Strings = (
      'select qda_codigo, qda_descricao, pro_codigo from quadras'
      'order by qda_descricao')
    Params = <>
    Left = 504
    Top = 352
    object qyQuadrasqda_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'qda_codigo'
      Required = True
      DisplayFormat = '00'
    end
    object qyQuadrasqda_descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'qda_descricao'
      Required = True
    end
    object qyQuadraspro_codigo: TIntegerField
      DisplayLabel = 'Cod. Produto'
      FieldName = 'pro_codigo'
      DisplayFormat = '000,000'
    end
  end
  object updQuadras: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM quadras'
      'WHERE'
      '  quadras.qda_codigo = :OLD_qda_codigo')
    InsertSQL.Strings = (
      'INSERT INTO quadras'
      '  (qda_codigo, qda_descricao, pro_codigo)'
      'VALUES'
      '  (:qda_codigo, :qda_descricao, :pro_codigo)')
    ModifySQL.Strings = (
      'UPDATE quadras SET'
      '  qda_codigo = :qda_codigo,'
      '  qda_descricao = :qda_descricao,'
      '  pro_codigo = :pro_codigo'
      'WHERE'
      '  quadras.qda_codigo = :OLD_qda_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 576
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'qda_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'qda_descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_qda_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyComandas: TZQuery
    Connection = database
    UpdateObject = updComandas
    AfterInsert = qyComandasAfterInsert
    BeforePost = qyComandasBeforePost
    AfterPost = qyComandasAfterPost
    BeforeDelete = qyComandasBeforeDelete
    AfterDelete = qyComandasAfterDelete
    OnPostError = qyComandasPostError
    SQL.Strings = (
      'select cma_codigo, cma_descricao, cma_ativa from comandas')
    Params = <>
    Left = 40
    Top = 176
    object qyComandascma_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'cma_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyComandascma_descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'cma_descricao'
      Required = True
    end
    object qyComandascma_ativa: TIntegerField
      DisplayLabel = 'Ativa'
      FieldName = 'cma_ativa'
      Required = True
      Visible = False
    end
  end
  object updComandas: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM comandas'
      'WHERE'
      '  comandas.cma_codigo = :OLD_cma_codigo')
    InsertSQL.Strings = (
      'INSERT INTO comandas'
      '  (cma_codigo, cma_descricao, cma_ativa)'
      'VALUES'
      '  (:cma_codigo, :cma_descricao, :cma_ativa)')
    ModifySQL.Strings = (
      'UPDATE comandas SET'
      '  cma_codigo = :cma_codigo,'
      '  cma_descricao = :cma_descricao,'
      '  cma_ativa = :cma_ativa'
      'WHERE'
      '  comandas.cma_codigo = :OLD_cma_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 136
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cma_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cma_descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cma_ativa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_cma_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyComandasItens: TZQuery
    Connection = database
    UpdateObject = updComandasItens
    BeforePost = qyComandasItensBeforePost
    AfterPost = qyComandasItensAfterPost
    BeforeDelete = qyComandasItensBeforeDelete
    AfterDelete = qyComandasItensAfterDelete
    OnPostError = qyComandasItensPostError
    SQL.Strings = (
      'select'
      
        'i.cmi_codigo, i.cma_codigo, i.cmi_quantidade, i.pro_codigo, p.pr' +
        'o_descricao,'
      
        'p.uni_codigo, i.cmi_vlrunitario, i.cmi_vlrtotcusto, i.cmi_vlrtot' +
        'al, i.prv_numero,'
      'i.cmi_copa, i.cmi_cozinha, i.cmi_datetime, i.sat_codigo'
      'from comandasitens i, produtos p'
      'where i.pro_codigo = p.pro_codigo')
    Params = <>
    Left = 496
    Top = 176
    object qyComandasItenscmi_codigo: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'cmi_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyComandasItenscma_codigo: TIntegerField
      DisplayLabel = 'Comanda'
      FieldName = 'cma_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyComandasItenscmi_quantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'cmi_quantidade'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
    object qyComandasItenspro_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pro_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyComandasItenspro_descricao: TWideStringField
      DisplayLabel = 'Produto'
      FieldName = 'pro_descricao'
      Required = True
      Size = 100
    end
    object qyComandasItensuni_codigo: TWideStringField
      DisplayLabel = 'Un.'
      FieldName = 'uni_codigo'
      Required = True
      Size = 2
    end
    object qyComandasItenscmi_vlrunitario: TFloatField
      DisplayLabel = 'Vlr. Unit'#225'rio'
      FieldName = 'cmi_vlrunitario'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyComandasItenscmi_vlrtotcusto: TFloatField
      DisplayLabel = 'Vlr. Total Custo'
      FieldName = 'cmi_vlrtotcusto'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyComandasItenscmi_vlrtotal: TFloatField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'cmi_vlrtotal'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyComandasItensprv_numero: TIntegerField
      DisplayLabel = 'Pr'#233'-venda'
      FieldName = 'prv_numero'
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyComandasItenscmi_copa: TIntegerField
      DisplayLabel = 'Copa'
      FieldName = 'cmi_copa'
      Required = True
      Visible = False
    end
    object qyComandasItenscmi_cozinha: TIntegerField
      DisplayLabel = 'Cozinha'
      FieldName = 'cmi_cozinha'
      Required = True
      Visible = False
    end
    object qyComandasItenscmi_datetime: TDateTimeField
      DisplayLabel = 'Data / Hora'
      FieldName = 'cmi_datetime'
      Required = True
      Visible = False
      DisplayFormat = 'dd/MM/yyyy hh:mm'
    end
    object qyComandasItenssat_codigo: TIntegerField
      DisplayLabel = 'Cod. Status'
      FieldName = 'sat_codigo'
      Required = True
      Visible = False
    end
  end
  object updComandasItens: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM comandasitens'
      'WHERE'
      '  comandasitens.cmi_codigo = :OLD_cmi_codigo')
    InsertSQL.Strings = (
      'INSERT INTO comandasitens'
      
        '  (cmi_codigo, cma_codigo, cmi_quantidade, pro_codigo, cmi_vlrun' +
        'itario, '
      
        '   cmi_vlrtotcusto, cmi_vlrtotal, prv_numero, cmi_copa, cmi_cozi' +
        'nha, cmi_datetime, '
      '   sat_codigo)'
      'VALUES'
      
        '  (:cmi_codigo, :cma_codigo, :cmi_quantidade, :pro_codigo, :cmi_' +
        'vlrunitario, '
      
        '   :cmi_vlrtotcusto, :cmi_vlrtotal, :prv_numero, :cmi_copa, :cmi' +
        '_cozinha, '
      '   :cmi_datetime, :sat_codigo)')
    ModifySQL.Strings = (
      'UPDATE comandasitens SET'
      '  cmi_codigo = :cmi_codigo,'
      '  cma_codigo = :cma_codigo,'
      '  cmi_quantidade = :cmi_quantidade,'
      '  pro_codigo = :pro_codigo,'
      '  cmi_vlrunitario = :cmi_vlrunitario,'
      '  cmi_vlrtotcusto = :cmi_vlrtotcusto,'
      '  cmi_vlrtotal = :cmi_vlrtotal,'
      '  prv_numero = :prv_numero,'
      '  cmi_copa = :cmi_copa,'
      '  cmi_cozinha = :cmi_cozinha,'
      '  cmi_datetime = :cmi_datetime,'
      '  sat_codigo = :sat_codigo'
      'WHERE'
      '  comandasitens.cmi_codigo = :OLD_cmi_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 592
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cmi_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cma_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cmi_quantidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cmi_vlrunitario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cmi_vlrtotcusto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cmi_vlrtotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prv_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cmi_copa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cmi_cozinha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cmi_datetime'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sat_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_cmi_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyMesas: TZQuery
    Connection = database
    UpdateObject = updMesas
    AfterInsert = qyMesasAfterInsert
    BeforePost = qyMesasBeforePost
    AfterPost = qyMesasAfterPost
    BeforeDelete = qyMesasBeforeDelete
    AfterDelete = qyMesasAfterDelete
    OnPostError = qyMesasPostError
    SQL.Strings = (
      'select mes_codigo, mes_descricao, mes_ativa from mesas')
    Params = <>
    Left = 48
    Top = 352
    object qyMesasmes_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'mes_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyMesasmes_descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'mes_descricao'
      Required = True
    end
    object qyMesasmes_ativa: TIntegerField
      DisplayLabel = 'Ativa'
      FieldName = 'mes_ativa'
      Required = True
      Visible = False
    end
  end
  object updMesas: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM mesas'
      'WHERE'
      '  mesas.mes_codigo = :OLD_mes_codigo')
    InsertSQL.Strings = (
      'INSERT INTO mesas'
      '  (mes_codigo, mes_descricao, mes_ativa)'
      'VALUES'
      '  (:mes_codigo, :mes_descricao, :mes_ativa)')
    ModifySQL.Strings = (
      'UPDATE mesas SET'
      '  mes_codigo = :mes_codigo,'
      '  mes_descricao = :mes_descricao,'
      '  mes_ativa = :mes_ativa'
      'WHERE'
      '  mesas.mes_codigo = :OLD_mes_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 128
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'mes_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mes_descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mes_ativa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_mes_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyComandasAtend: TZQuery
    Connection = database
    UpdateObject = updComandasAtend
    AfterInsert = qyComandasAtendAfterInsert
    BeforePost = qyComandasAtendBeforePost
    AfterPost = qyComandasAtendAfterPost
    BeforeDelete = qyComandasAtendBeforeDelete
    AfterDelete = qyComandasAtendAfterDelete
    OnPostError = qyComandasAtendPostError
    SQL.Strings = (
      'select'
      
        'a.cmu_codigo, a.cma_codigo, c.cma_descricao, a.mes_codigo, a.prv' +
        '_numero, a.cmu_vlrtotcusto, a.cmu_valortotal'
      'from comandasatend a, comandas c'
      'where a.cma_codigo = c.cma_codigo')
    Params = <>
    Left = 256
    Top = 176
    object qyComandasAtendcmu_codigo: TIntegerField
      DisplayLabel = 'Atendimento'
      FieldName = 'cmu_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyComandasAtendcma_codigo: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Comanda'
      FieldName = 'cma_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyComandasAtendcma_descricao: TWideStringField
      DisplayLabel = 'Comanda'
      FieldName = 'cma_descricao'
      Required = True
    end
    object qyComandasAtendmes_codigo: TIntegerField
      DisplayLabel = 'Mesa'
      FieldName = 'mes_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyComandasAtendprv_numero: TIntegerField
      DisplayLabel = 'Pr'#233'-venda'
      FieldName = 'prv_numero'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyComandasAtendcmu_vlrtotcusto: TFloatField
      DisplayLabel = 'Vlr. Tot. Custo'
      FieldName = 'cmu_vlrtotcusto'
      Required = True
      Visible = False
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyComandasAtendcmu_valortotal: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'cmu_valortotal'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
  end
  object updComandasAtend: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM comandasatend'
      'WHERE'
      '  comandasatend.cmu_codigo = :OLD_cmu_codigo')
    InsertSQL.Strings = (
      'INSERT INTO comandasatend'
      
        '  (cmu_codigo, cma_codigo, mes_codigo, prv_numero, cmu_vlrtotcus' +
        'to, cmu_valortotal)'
      'VALUES'
      
        '  (:cmu_codigo, :cma_codigo, :mes_codigo, :prv_numero, :cmu_vlrt' +
        'otcusto, '
      '   :cmu_valortotal)')
    ModifySQL.Strings = (
      'UPDATE comandasatend SET'
      '  cmu_codigo = :cmu_codigo,'
      '  cma_codigo = :cma_codigo,'
      '  mes_codigo = :mes_codigo,'
      '  prv_numero = :prv_numero,'
      '  cmu_vlrtotcusto = :cmu_vlrtotcusto,'
      '  cmu_valortotal = :cmu_valortotal'
      'WHERE'
      '  comandasatend.cmu_codigo = :OLD_cmu_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 360
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cmu_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cma_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mes_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prv_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cmu_vlrtotcusto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cmu_valortotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_cmu_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyProdComanda: TZQuery
    Connection = database
    UpdateObject = updProdComanda
    BeforePost = qyProdComandaBeforePost
    AfterPost = qyProdComandaAfterPost
    BeforeDelete = qyProdComandaBeforeDelete
    AfterDelete = qyProdComandaAfterDelete
    OnPostError = qyProdComandaPostError
    SQL.Strings = (
      'select pro_codigo, prd_copa, prd_cozinha from prodcomanda')
    Params = <>
    Left = 264
    Top = 352
    object qyProdComandapro_codigo: TIntegerField
      DisplayLabel = 'Cod. Produto'
      FieldName = 'pro_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyProdComandaprd_copa: TIntegerField
      DisplayLabel = 'Copa'
      FieldName = 'prd_copa'
      Required = True
      Visible = False
    end
    object qyProdComandaprd_cozinha: TIntegerField
      DisplayLabel = 'Cozinha'
      FieldName = 'prd_cozinha'
      Required = True
      Visible = False
    end
  end
  object updProdComanda: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM prodcomanda'
      'WHERE'
      '  prodcomanda.pro_codigo = :OLD_pro_codigo')
    InsertSQL.Strings = (
      'INSERT INTO prodcomanda'
      '  (pro_codigo, prd_copa, prd_cozinha)'
      'VALUES'
      '  (:pro_codigo, :prd_copa, :prd_cozinha)')
    ModifySQL.Strings = (
      'UPDATE prodcomanda SET'
      '  pro_codigo = :pro_codigo,'
      '  prd_copa = :prd_copa,'
      '  prd_cozinha = :prd_cozinha'
      'WHERE'
      '  prodcomanda.pro_codigo = :OLD_pro_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 360
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pro_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prd_copa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prd_cozinha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_pro_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyScriptComandasItens: TZQuery
    Connection = database
    UpdateObject = updScriptComandasItens
    BeforePost = qyScriptComandasItensBeforePost
    AfterPost = qyScriptComandasItensAfterPost
    BeforeDelete = qyScriptComandasItensBeforeDelete
    AfterDelete = qyScriptComandasItensAfterDelete
    OnPostError = qyScriptComandasItensPostError
    SQL.Strings = (
      'select'
      
        'cmi_codigo, cma_codigo, cmi_quantidade, pro_codigo, cmi_vlrunita' +
        'rio, cmi_vlrtotcusto,'
      
        'cmi_vlrtotal, prv_numero, cmi_copa, cmi_cozinha, cmi_datetime, s' +
        'at_codigo'
      'from comandasitens')
    Params = <>
    Left = 352
    Top = 16
  end
  object updScriptComandasItens: TZUpdateSQL
    UseSequenceFieldForRefreshSQL = False
    Left = 496
    Top = 16
  end
  object qyHorarios: TZQuery
    Connection = database
    UpdateObject = updHorarios
    SQL.Strings = (
      'select '
      'hor_horas'
      'from'
      'horarios')
    Params = <>
    Left = 48
    Top = 264
    object qyHorarioshor_horas: TTimeField
      DisplayLabel = 'Hor'#225'rio'
      FieldName = 'hor_horas'
      Required = True
      DisplayFormat = 'hh:mm'
    end
  end
  object updHorarios: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM horarios'
      'WHERE'
      '  horarios.hor_horas = :OLD_hor_horas')
    InsertSQL.Strings = (
      'INSERT INTO horarios'
      '  (hor_horas)'
      'VALUES'
      '  (:hor_horas)')
    ModifySQL.Strings = (
      'UPDATE horarios SET'
      '  hor_horas = :hor_horas'
      'WHERE'
      '  horarios.hor_horas = :OLD_hor_horas')
    UseSequenceFieldForRefreshSQL = False
    Left = 136
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'hor_horas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_hor_horas'
        ParamType = ptUnknown
      end>
  end
  object scriptDelHorarios: TZQuery
    Connection = database
    SQL.Strings = (
      'delete from horarios')
    Params = <>
    Left = 664
    Top = 16
  end
end
