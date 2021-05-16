inherited dmConfig: TdmConfig
  OldCreateOrder = True
  object qyEmpresa: TZQuery
    Connection = database
    UpdateObject = updEmpresa
    BeforePost = qyEmpresaBeforePost
    AfterPost = qyEmpresaAfterPost
    BeforeDelete = qyEmpresaBeforeDelete
    AfterDelete = qyEmpresaAfterDelete
    OnPostError = qyEmpresaPostError
    SQL.Strings = (
      'select'
      
        'e.emp_codigo, e.emp_razao, e.emp_fantasia, e.emp_cnpj, e.emp_ie,' +
        ' e.emp_imun,'
      
        'e.emp_logradouro, e.emp_numero, e.emp_complemento, e.emp_bairro,' +
        ' e.emp_codcidade,'
      
        'e.emp_cidade, e.emp_uf, e.emp_codpais, e.emp_cep, e.emp_fone, e.' +
        'emp_email,'
      'e.emp_homepage, e.reg_codigo, r.reg_descricao'
      'from empresa e, regime r'
      'where e.reg_codigo = r.reg_codigo'
      'and emp_codigo = 1'
      'order by emp_codigo')
    Params = <>
    Left = 224
    Top = 112
    object qyEmpresaemp_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'emp_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyEmpresaemp_razao: TWideStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'emp_razao'
      Required = True
      Size = 50
    end
    object qyEmpresaemp_fantasia: TWideStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'emp_fantasia'
      Required = True
      Size = 50
    end
    object qyEmpresaemp_cnpj: TWideStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'emp_cnpj'
      Required = True
      EditMask = '99.999.999/9999-99;1;_'
      Size = 18
    end
    object qyEmpresaemp_ie: TWideStringField
      DisplayLabel = 'Insc. Est.'
      FieldName = 'emp_ie'
      Required = True
      Size = 15
    end
    object qyEmpresaemp_imun: TWideStringField
      DisplayLabel = 'Insc. Mun.'
      FieldName = 'emp_imun'
      Required = True
      Size = 10
    end
    object qyEmpresaemp_logradouro: TWideStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'emp_logradouro'
      Required = True
      Size = 50
    end
    object qyEmpresaemp_numero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'emp_numero'
      Required = True
    end
    object qyEmpresaemp_complemento: TWideStringField
      DisplayLabel = 'Complemento'
      FieldName = 'emp_complemento'
      Size = 15
    end
    object qyEmpresaemp_bairro: TWideStringField
      DisplayLabel = 'Bairro'
      FieldName = 'emp_bairro'
      Required = True
      Size = 30
    end
    object qyEmpresaemp_codcidade: TIntegerField
      DisplayLabel = 'Cod. Cidade'
      FieldName = 'emp_codcidade'
      Required = True
    end
    object qyEmpresaemp_cidade: TWideStringField
      DisplayLabel = 'Cidade'
      FieldName = 'emp_cidade'
      Required = True
      Size = 50
    end
    object qyEmpresaemp_uf: TWideStringField
      DisplayLabel = 'UF'
      FieldName = 'emp_uf'
      Required = True
      Size = 2
    end
    object qyEmpresaemp_codpais: TIntegerField
      DisplayLabel = 'Cod. Pa'#237's'
      FieldName = 'emp_codpais'
      Required = True
    end
    object qyEmpresaemp_cep: TWideStringField
      DisplayLabel = 'CEP'
      FieldName = 'emp_cep'
      Required = True
      EditMask = '99999-999;1;_'
      Size = 9
    end
    object qyEmpresaemp_fone: TWideStringField
      DisplayLabel = 'Telefone'
      FieldName = 'emp_fone'
      Required = True
      Size = 15
    end
    object qyEmpresaemp_email: TWideStringField
      DisplayLabel = 'e-mail'
      FieldName = 'emp_email'
      Required = True
      Size = 50
    end
    object qyEmpresaemp_homepage: TWideStringField
      DisplayLabel = 'Home Page'
      FieldName = 'emp_homepage'
      Size = 50
    end
    object qyEmpresareg_codigo: TIntegerField
      DisplayLabel = 'Cod. Regime'
      FieldName = 'reg_codigo'
      Required = True
    end
    object qyEmpresareg_descricao: TWideStringField
      DisplayLabel = 'Regime'
      FieldName = 'reg_descricao'
      Required = True
      Size = 60
    end
  end
  object updEmpresa: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM empresa'
      'WHERE'
      '  empresa.emp_codigo = :OLD_emp_codigo')
    InsertSQL.Strings = (
      'INSERT INTO empresa'
      
        '  (emp_codigo, emp_razao, emp_fantasia, emp_cnpj, emp_ie, emp_im' +
        'un, emp_logradouro, '
      
        '   emp_numero, emp_complemento, emp_bairro, emp_codcidade, emp_c' +
        'idade, '
      
        '   emp_uf, emp_codpais, emp_cep, emp_fone, emp_email, emp_homepa' +
        'ge, reg_codigo)'
      'VALUES'
      
        '  (:emp_codigo, :emp_razao, :emp_fantasia, :emp_cnpj, :emp_ie, :' +
        'emp_imun, '
      
        '   :emp_logradouro, :emp_numero, :emp_complemento, :emp_bairro, ' +
        ':emp_codcidade, '
      
        '   :emp_cidade, :emp_uf, :emp_codpais, :emp_cep, :emp_fone, :emp' +
        '_email, '
      '   :emp_homepage, :reg_codigo)')
    ModifySQL.Strings = (
      'UPDATE empresa SET'
      '  emp_codigo = :emp_codigo,'
      '  emp_razao = :emp_razao,'
      '  emp_fantasia = :emp_fantasia,'
      '  emp_cnpj = :emp_cnpj,'
      '  emp_ie = :emp_ie,'
      '  emp_imun = :emp_imun,'
      '  emp_logradouro = :emp_logradouro,'
      '  emp_numero = :emp_numero,'
      '  emp_complemento = :emp_complemento,'
      '  emp_bairro = :emp_bairro,'
      '  emp_codcidade = :emp_codcidade,'
      '  emp_cidade = :emp_cidade,'
      '  emp_uf = :emp_uf,'
      '  emp_codpais = :emp_codpais,'
      '  emp_cep = :emp_cep,'
      '  emp_fone = :emp_fone,'
      '  emp_email = :emp_email,'
      '  emp_homepage = :emp_homepage,'
      '  reg_codigo = :reg_codigo'
      'WHERE'
      '  empresa.emp_codigo = :OLD_emp_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 304
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'emp_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'emp_razao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'emp_fantasia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'emp_cnpj'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'emp_ie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'emp_imun'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'emp_logradouro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'emp_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'emp_complemento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'emp_bairro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'emp_codcidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'emp_cidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'emp_uf'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'emp_codpais'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'emp_cep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'emp_fone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'emp_email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'emp_homepage'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'reg_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_emp_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyDateTimePG: TZQuery
    Connection = database
    SQL.Strings = (
      'select current_date, current_timestamp')
    Params = <>
    Left = 392
    Top = 16
    object qyDateTimePGdate: TDateField
      FieldName = 'date'
      ReadOnly = True
    end
    object qyDateTimePGnow: TDateTimeField
      FieldName = 'now'
      ReadOnly = True
    end
  end
  object qyConfig: TZQuery
    Connection = database
    UpdateObject = updConfig
    BeforePost = qyConfigBeforePost
    AfterPost = qyConfigAfterPost
    BeforeDelete = qyConfigBeforeDelete
    AfterDelete = qyConfigAfterDelete
    OnPostError = qyConfigPostError
    SQL.Strings = (
      'select'
      
        'cfg_codigo, cfg_versao, cfg_codcidadepadrao, cfg_buscacep, cfg_l' +
        'annfter,'
      
        'cfg_valorc, cfg_descmax, cfg_mgmin, cfg_prodcase, cfg_pis, cfg_c' +
        'ofins,'
      
        'cfg_efetprv, cfg_divcomanda, cfg_efetprvaut, cfg_fechaprvaut, cf' +
        'g_userapp,'
      'cfg_autupdcom, cfg_delivery'
      'from'
      'config')
    Params = <>
    Left = 40
    Top = 112
    object qyConfigcfg_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'cfg_codigo'
      Required = True
    end
    object qyConfigcfg_versao: TWideStringField
      DisplayLabel = 'Vers'#227'o'
      FieldName = 'cfg_versao'
      Required = True
      Size = 10
    end
    object qyConfigcfg_codcidadepadrao: TIntegerField
      DisplayLabel = 'Cod. Cidade Padr'#227'o'
      FieldName = 'cfg_codcidadepadrao'
      Required = True
    end
    object qyConfigcfg_buscacep: TWideStringField
      DisplayLabel = 'Busca CEP'
      FieldName = 'cfg_buscacep'
      Required = True
      Size = 1
    end
    object qyConfigcfg_lannfter: TWideStringField
      DisplayLabel = 'Lanc. NFe Terc.'
      FieldName = 'cfg_lannfter'
      Required = True
      Size = 1
    end
    object qyConfigcfg_valorc: TIntegerField
      DisplayLabel = 'Val. Orc.'
      FieldName = 'cfg_valorc'
      Required = True
    end
    object qyConfigcfg_descmax: TFloatField
      DisplayLabel = 'Desc. Max.'
      FieldName = 'cfg_descmax'
      Required = True
    end
    object qyConfigcfg_mgmin: TFloatField
      DisplayLabel = 'Mg. Min.'
      FieldName = 'cfg_mgmin'
      Required = True
    end
    object qyConfigcfg_prodcase: TWideStringField
      DisplayLabel = 'CASE Produto'
      FieldName = 'cfg_prodcase'
      Required = True
      Size = 1
    end
    object qyConfigcfg_pis: TFloatField
      DisplayLabel = 'PIS'
      FieldName = 'cfg_pis'
      Required = True
    end
    object qyConfigcfg_cofins: TFloatField
      DisplayLabel = 'Cofins'
      FieldName = 'cfg_cofins'
      Required = True
    end
    object qyConfigcfg_efetprv: TIntegerField
      DisplayLabel = 'Efetiva Pr'#233'-venda'
      FieldName = 'cfg_efetprv'
      Required = True
    end
    object qyConfigcfg_divcomanda: TIntegerField
      DisplayLabel = 'Div. Comanda'
      FieldName = 'cfg_divcomanda'
      Required = True
      Visible = False
    end
    object qyConfigcfg_efetprvaut: TIntegerField
      DisplayLabel = 'Efetiva PV aut.'
      FieldName = 'cfg_efetprvaut'
      Required = True
    end
    object qyConfigcfg_fechaprvaut: TIntegerField
      DisplayLabel = 'Fecha PV Aut.'
      FieldName = 'cfg_fechaprvaut'
      Required = True
    end
    object qyConfigcfg_userapp: TIntegerField
      DisplayLabel = 'User App'
      FieldName = 'cfg_userapp'
      Required = True
      Visible = False
    end
    object qyConfigcfg_autupdcom: TIntegerField
      DisplayLabel = 'Auto atualizar comanda'
      FieldName = 'cfg_autupdcom'
      Required = True
      Visible = False
    end
    object qyConfigcfg_delivery: TIntegerField
      DisplayLabel = 'User Delivery'
      FieldName = 'cfg_delivery'
      Required = True
    end
  end
  object updConfig: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM config'
      'WHERE'
      '  config.cfg_codigo = :OLD_cfg_codigo')
    InsertSQL.Strings = (
      'INSERT INTO config'
      
        '  (cfg_codigo, cfg_versao, cfg_codcidadepadrao, cfg_buscacep, cf' +
        'g_lannfter, '
      
        '   cfg_valorc, cfg_descmax, cfg_mgmin, cfg_prodcase, cfg_pis, cf' +
        'g_cofins, '
      
        '   cfg_efetprv, cfg_divcomanda, cfg_efetprvaut, cfg_fechaprvaut,' +
        ' cfg_userapp, '
      '   cfg_autupdcom, cfg_delivery)'
      'VALUES'
      
        '  (:cfg_codigo, :cfg_versao, :cfg_codcidadepadrao, :cfg_buscacep' +
        ', :cfg_lannfter, '
      
        '   :cfg_valorc, :cfg_descmax, :cfg_mgmin, :cfg_prodcase, :cfg_pi' +
        's, :cfg_cofins, '
      
        '   :cfg_efetprv, :cfg_divcomanda, :cfg_efetprvaut, :cfg_fechaprv' +
        'aut, :cfg_userapp, '
      '   :cfg_autupdcom, :cfg_delivery)')
    ModifySQL.Strings = (
      'UPDATE config SET'
      '  cfg_codigo = :cfg_codigo,'
      '  cfg_versao = :cfg_versao,'
      '  cfg_codcidadepadrao = :cfg_codcidadepadrao,'
      '  cfg_buscacep = :cfg_buscacep,'
      '  cfg_lannfter = :cfg_lannfter,'
      '  cfg_valorc = :cfg_valorc,'
      '  cfg_descmax = :cfg_descmax,'
      '  cfg_mgmin = :cfg_mgmin,'
      '  cfg_prodcase = :cfg_prodcase,'
      '  cfg_pis = :cfg_pis,'
      '  cfg_cofins = :cfg_cofins,'
      '  cfg_efetprv = :cfg_efetprv,'
      '  cfg_divcomanda = :cfg_divcomanda,'
      '  cfg_efetprvaut = :cfg_efetprvaut,'
      '  cfg_fechaprvaut = :cfg_fechaprvaut,'
      '  cfg_userapp = :cfg_userapp,'
      '  cfg_autupdcom = :cfg_autupdcom,'
      '  cfg_delivery = :cfg_delivery'
      'WHERE'
      '  config.cfg_codigo = :OLD_cfg_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 112
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cfg_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cfg_versao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cfg_codcidadepadrao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cfg_buscacep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cfg_lannfter'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cfg_valorc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cfg_descmax'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cfg_mgmin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cfg_prodcase'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cfg_pis'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cfg_cofins'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cfg_efetprv'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cfg_divcomanda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cfg_efetprvaut'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cfg_fechaprvaut'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cfg_userapp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cfg_autupdcom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cfg_delivery'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_cfg_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyUpdate: TZQuery
    Connection = database
    UpdateObject = updUpdate
    BeforePost = qyUpdateBeforePost
    AfterPost = qyUpdateAfterPost
    BeforeDelete = qyUpdateBeforeDelete
    AfterDelete = qyUpdateAfterDelete
    OnPostError = qyUpdatePostError
    SQL.Strings = (
      'select upd_codigo from update')
    Params = <>
    Left = 512
    Top = 16
    object qyUpdateupd_codigo: TIntegerField
      FieldName = 'upd_codigo'
      Required = True
    end
  end
  object updUpdate: TZUpdateSQL
    UseSequenceFieldForRefreshSQL = False
    Left = 576
    Top = 16
  end
end
