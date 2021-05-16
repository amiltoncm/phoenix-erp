inherited dmDiversos: TdmDiversos
  OldCreateOrder = True
  object qyEmailsDest: TZQuery
    Connection = database
    UpdateObject = updEmailsDest
    BeforePost = qyEmailsDestBeforePost
    AfterPost = qyEmailsDestAfterPost
    BeforeDelete = qyEmailsDestBeforeDelete
    AfterDelete = qyEmailsDestAfterDelete
    OnPostError = qyEmailsDestPostError
    SQL.Strings = (
      'select'
      'emd_codigo, emd_endereco'
      'from emailsdest'
      'order by emd_endereco')
    Params = <>
    Left = 440
    Top = 96
    object qyEmailsDestemd_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'emd_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyEmailsDestemd_endereco: TWideStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'emd_endereco'
      Required = True
      Size = 50
    end
  end
  object updEmailsDest: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM emailsdest'
      'WHERE'
      '  emailsdest.emd_codigo = :OLD_emd_codigo')
    InsertSQL.Strings = (
      'INSERT INTO emailsdest'
      '  (emd_codigo, emd_endereco)'
      'VALUES'
      '  (:emd_codigo, :emd_endereco)')
    ModifySQL.Strings = (
      'UPDATE emailsdest SET'
      '  emd_codigo = :emd_codigo,'
      '  emd_endereco = :emd_endereco'
      'WHERE'
      '  emailsdest.emd_codigo = :OLD_emd_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 528
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'emd_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'emd_endereco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_emd_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyEndEletroTipo: TZQuery
    Connection = database
    UpdateObject = updEndEletroTipo
    BeforePost = qyEndEletroTipoBeforePost
    AfterPost = qyEndEletroTipoAfterPost
    BeforeDelete = qyEndEletroTipoBeforeDelete
    AfterDelete = qyEndEletroTipoAfterDelete
    OnPostError = qyEndEletroTipoPostError
    SQL.Strings = (
      'select'
      'tpn_codigo, tpn_descricao'
      'from'
      'endeletrotipo'
      'order by tpn_descricao')
    Params = <>
    Left = 40
    Top = 168
    object qyEndEletroTipotpn_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'tpn_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyEndEletroTipotpn_descricao: TWideStringField
      DisplayLabel = 'Tp. Endere'#231'o'
      FieldName = 'tpn_descricao'
    end
  end
  object updEndEletroTipo: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM endeletrotipo'
      'WHERE'
      '  endeletrotipo.tpn_codigo = :OLD_tpn_codigo')
    InsertSQL.Strings = (
      'INSERT INTO endeletrotipo'
      '  (tpn_codigo, tpn_descricao)'
      'VALUES'
      '  (:tpn_codigo, :tpn_descricao)')
    ModifySQL.Strings = (
      'UPDATE endeletrotipo SET'
      '  tpn_codigo = :tpn_codigo,'
      '  tpn_descricao = :tpn_descricao'
      'WHERE'
      '  endeletrotipo.tpn_codigo = :OLD_tpn_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 136
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tpn_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tpn_descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_tpn_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyEnderecosTipo: TZQuery
    Connection = database
    UpdateObject = updEnderecosTipo
    BeforePost = qyEnderecosTipoBeforePost
    AfterPost = qyEnderecosTipoAfterPost
    BeforeDelete = qyEnderecosTipoBeforeDelete
    AfterDelete = qyEnderecosTipoAfterDelete
    OnPostError = qyEnderecosTipoPostError
    SQL.Strings = (
      'select'
      'tpe_codigo, tpe_descricao'
      'from'
      'enderecostipo'
      'order by tpe_descricao')
    Params = <>
    Left = 248
    Top = 168
    object qyEnderecosTipotpe_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'tpe_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyEnderecosTipotpe_descricao: TWideStringField
      DisplayLabel = 'Tipo deEndere'#231'o'
      FieldName = 'tpe_descricao'
      Required = True
    end
  end
  object updEnderecosTipo: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM enderecostipo'
      'WHERE'
      '  enderecostipo.tpe_codigo = :OLD_tpe_codigo')
    InsertSQL.Strings = (
      'INSERT INTO enderecostipo'
      '  (tpe_codigo, tpe_descricao)'
      'VALUES'
      '  (:tpe_codigo, :tpe_descricao)')
    ModifySQL.Strings = (
      'UPDATE enderecostipo SET'
      '  tpe_codigo = :tpe_codigo,'
      '  tpe_descricao = :tpe_descricao'
      'WHERE'
      '  enderecostipo.tpe_codigo = :OLD_tpe_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 344
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tpe_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tpe_descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_tpe_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyFonesTipo: TZQuery
    Connection = database
    UpdateObject = updFonesTipo
    BeforePost = qyFonesTipoBeforePost
    AfterPost = qyFonesTipoAfterPost
    BeforeDelete = qyFonesTipoBeforeDelete
    AfterDelete = qyFonesTipoAfterDelete
    OnPostError = qyFonesTipoPostError
    SQL.Strings = (
      'select'
      'tpf_codigo, tpf_descricao, tpf_mascara'
      'from'
      'fonestipo'
      'order by tpf_descricao')
    Params = <>
    Left = 448
    Top = 168
    object qyFonesTipotpf_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'tpf_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyFonesTipotpf_descricao: TWideStringField
      DisplayLabel = 'Tipos de Telefone'
      FieldName = 'tpf_descricao'
      Required = True
    end
    object qyFonesTipotpf_mascara: TWideStringField
      DisplayLabel = 'M'#225'scara'
      FieldName = 'tpf_mascara'
      Required = True
    end
  end
  object updFonesTipo: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM fonestipo'
      'WHERE'
      '  fonestipo.tpf_codigo = :OLD_tpf_codigo')
    InsertSQL.Strings = (
      'INSERT INTO fonestipo'
      '  (tpf_codigo, tpf_descricao, tpf_mascara)'
      'VALUES'
      '  (:tpf_codigo, :tpf_descricao, :tpf_mascara)')
    ModifySQL.Strings = (
      'UPDATE fonestipo SET'
      '  tpf_codigo = :tpf_codigo,'
      '  tpf_descricao = :tpf_descricao,'
      '  tpf_mascara = :tpf_mascara'
      'WHERE'
      '  fonestipo.tpf_codigo = :OLD_tpf_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 520
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tpf_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tpf_descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tpf_mascara'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_tpf_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyLogradourosTipo: TZQuery
    Connection = database
    UpdateObject = updLogradourosTipo
    BeforePost = qyLogradourosTipoBeforePost
    AfterPost = qyLogradourosTipoAfterPost
    BeforeDelete = qyLogradourosTipoBeforeDelete
    AfterDelete = qyLogradourosTipoAfterDelete
    OnPostError = qyLogradourosTipoPostError
    SQL.Strings = (
      'select'
      'tpl_codigo, tpl_descricao'
      'from'
      'logradourostipo'
      'order by tpl_descricao')
    Params = <>
    Left = 40
    Top = 248
    object qyLogradourosTipotpl_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'tpl_codigo'
      Required = True
    end
    object qyLogradourosTipotpl_descricao: TWideStringField
      DisplayLabel = 'Tp. Logradouro'
      FieldName = 'tpl_descricao'
      Required = True
    end
  end
  object updLogradourosTipo: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM logradourostipo'
      'WHERE'
      '  logradourostipo.tpl_codigo = :OLD_tpl_codigo')
    InsertSQL.Strings = (
      'INSERT INTO logradourostipo'
      '  (tpl_codigo, tpl_descricao)'
      'VALUES'
      '  (:tpl_codigo, :tpl_descricao)')
    ModifySQL.Strings = (
      'UPDATE logradourostipo SET'
      '  tpl_codigo = :tpl_codigo,'
      '  tpl_descricao = :tpl_descricao'
      'WHERE'
      '  logradourostipo.tpl_codigo = :OLD_tpl_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 136
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tpl_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tpl_descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_tpl_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyPais: TZQuery
    Connection = database
    UpdateObject = updPais
    BeforePost = qyPaisBeforePost
    AfterPost = qyPaisAfterPost
    BeforeDelete = qyPaisBeforeDelete
    AfterDelete = qyPaisAfterDelete
    OnPostError = qyPaisPostError
    SQL.Strings = (
      'select'
      'pai_codigo, pai_pais, pai_alpha3'
      'from'
      'pais'
      'order by pai_pais')
    Params = <>
    Left = 40
    Top = 336
    object qyPaispai_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pai_codigo'
      Required = True
      DisplayFormat = '0000'
    end
    object qyPaispai_pais: TWideStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'pai_pais'
      Required = True
      Size = 50
    end
    object qyPaispai_alpha3: TWideStringField
      DisplayLabel = 'Alpha3'
      FieldName = 'pai_alpha3'
      Size = 3
    end
  end
  object qySetor: TZQuery
    Connection = database
    UpdateObject = updSetor
    BeforePost = qySetorBeforePost
    AfterPost = qySetorAfterPost
    BeforeDelete = qySetorBeforeDelete
    AfterDelete = qySetorAfterDelete
    OnPostError = qySetorPostError
    SQL.Strings = (
      'select'
      'set_codigo, set_descricao'
      'from'
      'setor'
      'order by set_descricao')
    Params = <>
    Left = 248
    Top = 336
    object qySetorset_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'set_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qySetorset_descricao: TWideStringField
      DisplayLabel = 'Setor'
      FieldName = 'set_descricao'
      Required = True
    end
  end
  object qyUf: TZQuery
    Connection = database
    UpdateObject = updUf
    AfterInsert = qyUfAfterInsert
    BeforePost = qyUfBeforePost
    AfterPost = qyUfAfterPost
    BeforeDelete = qyUfBeforeDelete
    AfterDelete = qyUfAfterDelete
    OnPostError = qyUfPostError
    SQL.Strings = (
      'select'
      
        'u.uf_sigla, u.uf_estado, u.uf_codigo, u.pai_codigo, p.pai_pais, ' +
        'u.uf_icmsint'
      'from uf u, pais p'
      'where u.pai_codigo = p.pai_codigo'
      'order by u.uf_estado')
    Params = <>
    Left = 456
    Top = 336
    object qyUfuf_sigla: TWideStringField
      DisplayLabel = 'Sigla'
      FieldName = 'uf_sigla'
      Required = True
      Size = 2
    end
    object qyUfuf_estado: TWideStringField
      DisplayLabel = 'Estado'
      FieldName = 'uf_estado'
      Required = True
      Size = 25
    end
    object qyUfuf_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'uf_codigo'
      Required = True
    end
    object qyUfpai_codigo: TIntegerField
      DisplayLabel = 'C'#243'd. Pa'#237's'
      FieldName = 'pai_codigo'
      Visible = False
    end
    object qyUfpai_pais: TWideStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'pai_pais'
      Required = True
      Size = 50
    end
    object qyUfuf_icmsint: TFloatField
      DisplayLabel = 'ICMS Int.'
      FieldName = 'uf_icmsint'
    end
  end
  object updPais: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM pais'
      'WHERE'
      '  pais.pai_codigo = :OLD_pai_codigo')
    InsertSQL.Strings = (
      'INSERT INTO pais'
      '  (pai_codigo, pai_pais, pai_alpha3)'
      'VALUES'
      '  (:pai_codigo, :pai_pais, :pai_alpha3)')
    ModifySQL.Strings = (
      'UPDATE pais SET'
      '  pai_codigo = :pai_codigo,'
      '  pai_pais = :pai_pais,'
      '  pai_alpha3 = :pai_alpha3'
      'WHERE'
      '  pais.pai_codigo = :OLD_pai_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 112
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pai_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pai_pais'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pai_alpha3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_pai_codigo'
        ParamType = ptUnknown
      end>
  end
  object updSetor: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM setor'
      'WHERE'
      '  setor.set_codigo = :OLD_set_codigo')
    InsertSQL.Strings = (
      'INSERT INTO setor'
      '  (set_codigo, set_descricao)'
      'VALUES'
      '  (:set_codigo, :set_descricao)')
    ModifySQL.Strings = (
      'UPDATE setor SET'
      '  set_codigo = :set_codigo,'
      '  set_descricao = :set_descricao'
      'WHERE'
      '  setor.set_codigo = :OLD_set_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 312
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'set_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'set_descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_set_codigo'
        ParamType = ptUnknown
      end>
  end
  object updUf: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM uf'
      'WHERE'
      '  uf.uf_sigla = :OLD_uf_sigla')
    InsertSQL.Strings = (
      'INSERT INTO uf'
      '  (uf_sigla, uf_estado, uf_codigo, pai_codigo, uf_icmsint)'
      'VALUES'
      '  (:uf_sigla, :uf_estado, :uf_codigo, :pai_codigo, :uf_icmsint)')
    ModifySQL.Strings = (
      'UPDATE uf SET'
      '  uf_sigla = :uf_sigla,'
      '  uf_estado = :uf_estado,'
      '  uf_codigo = :uf_codigo,'
      '  pai_codigo = :pai_codigo,'
      '  uf_icmsint = :uf_icmsint'
      'WHERE'
      '  uf.uf_sigla = :OLD_uf_sigla')
    UseSequenceFieldForRefreshSQL = False
    Left = 536
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'uf_sigla'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'uf_estado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'uf_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pai_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'uf_icmsint'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_uf_sigla'
        ParamType = ptUnknown
      end>
  end
end
