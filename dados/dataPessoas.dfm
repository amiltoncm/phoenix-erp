inherited dmPessoas: TdmPessoas
  OldCreateOrder = True
  object qyPessoas: TZQuery
    Connection = database
    UpdateObject = updPessoas
    AfterInsert = qyPessoasAfterInsert
    BeforePost = qyPessoasBeforePost
    AfterPost = qyPessoasAfterPost
    BeforeDelete = qyPessoasBeforeDelete
    AfterDelete = qyPessoasAfterDelete
    OnPostError = qyPessoasPostError
    SQL.Strings = (
      'select'
      'p.pes_codigo, p.pes_nome, p.pes_nomefantasia, p.pes_documento,'
      
        'p.pes_identificacao, p.tpl_codigo, l.tpl_descricao, p.pes_lograd' +
        'ouro,'
      'p.pes_numero, p.pes_complemento, p.pes_bairro, p.cid_codigo,'
      
        'c.cid_municipio, c.uf_sigla, p.pes_ptreferencia, p.pes_fone, p.p' +
        'es_cep, p.pes_cliente,'
      
        'p.pes_fornecedor, p.pes_transportadora, p.pes_tipo, p.pes_ativo,' +
        ' p.pes_datacad, p.pes_email'
      'from pessoas p, logradourostipo l, cidades c'
      'where p.tpl_codigo = l.tpl_codigo'
      'and p.cid_codigo = c.cid_codigo'
      'order by p.pes_nome')
    Params = <>
    Left = 48
    Top = 112
    object qyPessoaspes_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pes_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyPessoaspes_nome: TWideStringField
      DisplayLabel = 'Nome / Raz'#227'o Social'
      FieldName = 'pes_nome'
      Required = True
      Size = 60
    end
    object qyPessoaspes_nomefantasia: TWideStringField
      DisplayLabel = 'Apelido / Nome Fantasia'
      FieldName = 'pes_nomefantasia'
      Required = True
      Size = 50
    end
    object qyPessoaspes_documento: TWideStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'pes_documento'
      Required = True
      Size = 18
    end
    object qyPessoaspes_identificacao: TWideStringField
      DisplayLabel = 'RG / Insc. Est.'
      FieldName = 'pes_identificacao'
      Required = True
      Size = 15
    end
    object qyPessoastpl_codigo: TIntegerField
      DisplayLabel = 'Cod. Tp. Logradouro'
      FieldName = 'tpl_codigo'
      Required = True
      Visible = False
    end
    object qyPessoastpl_descricao: TWideStringField
      DisplayLabel = 'Tp. Logradouro'
      FieldName = 'tpl_descricao'
      Required = True
    end
    object qyPessoaspes_logradouro: TWideStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'pes_logradouro'
      Required = True
      Size = 50
    end
    object qyPessoaspes_numero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'pes_numero'
      Required = True
    end
    object qyPessoaspes_complemento: TWideStringField
      DisplayLabel = 'Complemento'
      FieldName = 'pes_complemento'
      Size = 15
    end
    object qyPessoaspes_bairro: TWideStringField
      DisplayLabel = 'Bairro'
      FieldName = 'pes_bairro'
      Required = True
      Size = 30
    end
    object qyPessoascid_codigo: TIntegerField
      DisplayLabel = 'C'#243'd. Munic'#237'pio'
      FieldName = 'cid_codigo'
      Required = True
      Visible = False
    end
    object qyPessoascid_municipio: TWideStringField
      DisplayLabel = 'Munic'#237'pio'
      FieldName = 'cid_municipio'
      Required = True
      Size = 50
    end
    object qyPessoasuf_sigla: TWideStringField
      DisplayLabel = 'UF'
      FieldName = 'uf_sigla'
      Required = True
      Size = 2
    end
    object qyPessoaspes_ptreferencia: TWideStringField
      DisplayLabel = 'Pt. de Refer'#234'ncia'
      FieldName = 'pes_ptreferencia'
      Size = 30
    end
    object qyPessoaspes_fone: TWideStringField
      DisplayLabel = 'Telefone'
      FieldName = 'pes_fone'
      Required = True
      Size = 15
    end
    object qyPessoaspes_cep: TWideStringField
      DisplayLabel = 'CEP'
      FieldName = 'pes_cep'
      Required = True
      Size = 9
    end
    object qyPessoaspes_email: TWideStringField
      DisplayLabel = 'e-mail'
      FieldName = 'pes_email'
      Size = 60
    end
    object qyPessoaspes_cliente: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'pes_cliente'
      Required = True
      Visible = False
      Size = 1
    end
    object qyPessoaspes_fornecedor: TWideStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'pes_fornecedor'
      Required = True
      Visible = False
      Size = 1
    end
    object qyPessoaspes_transportadora: TWideStringField
      DisplayLabel = 'Transportadora'
      FieldName = 'pes_transportadora'
      Required = True
      Visible = False
      Size = 1
    end
    object qyPessoaspes_tipo: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'pes_tipo'
      Required = True
      Visible = False
      Size = 1
    end
    object qyPessoaspes_ativo: TWideStringField
      DisplayLabel = 'Ativo'
      FieldName = 'pes_ativo'
      Required = True
      Size = 1
    end
    object qyPessoaspes_datacad: TDateField
      DisplayLabel = 'Data Cad.'
      FieldName = 'pes_datacad'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
  end
  object qyPessoasObs: TZQuery
    Connection = database
    UpdateObject = updPessoasObs
    BeforePost = qyPessoasObsBeforePost
    AfterPost = qyPessoasObsAfterPost
    BeforeDelete = qyPessoasObsBeforeDelete
    AfterDelete = qyPessoasObsAfterDelete
    OnPostError = qyPessoasObsPostError
    SQL.Strings = (
      'select'
      'pes_codigo, pes_obs'
      'from'
      'pessoasobs'
      'order by pes_codigo')
    Params = <>
    Left = 232
    Top = 112
    object qyPessoasObspes_codigo: TIntegerField
      DisplayLabel = 'Cod. Pessoa'
      FieldName = 'pes_codigo'
      Required = True
      Visible = False
    end
    object qyPessoasObspes_obs: TWideStringField
      DisplayLabel = 'Obs'
      FieldName = 'pes_obs'
      Required = True
      Size = 1000
    end
  end
  object qyPessoasFinanc: TZQuery
    Connection = database
    UpdateObject = updPessoasFinanc
    AfterInsert = qyPessoasFinancAfterInsert
    BeforePost = qyPessoasFinancBeforePost
    AfterPost = qyPessoasFinancAfterPost
    BeforeDelete = qyPessoasFinancBeforeDelete
    AfterDelete = qyPessoasFinancAfterDelete
    OnPostError = qyPessoasFinancPostError
    SQL.Strings = (
      'select'
      
        'pes_codigo, pef_tabvenda, pef_limcred, pef_inadimplente, pef_con' +
        'sfin,'
      'pef_salorcap, pef_indest'
      'from'
      'pessoasfinanc'
      'where pes_codigo = 0')
    Params = <>
    Left = 440
    Top = 112
    object qyPessoasFinancpes_codigo: TIntegerField
      DisplayLabel = 'Cod. Pessoa'
      FieldName = 'pes_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyPessoasFinancpef_tabvenda: TIntegerField
      DisplayLabel = 'Tab. Venda'
      FieldName = 'pef_tabvenda'
      Required = True
      DisplayFormat = '00'
    end
    object qyPessoasFinancpef_limcred: TFloatField
      DisplayLabel = 'Limite de Cr'#233'dito'
      FieldName = 'pef_limcred'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
    object qyPessoasFinancpef_inadimplente: TWideStringField
      DisplayLabel = 'Inadimplente'
      FieldName = 'pef_inadimplente'
      Required = True
      Size = 1
    end
    object qyPessoasFinancpef_consfin: TIntegerField
      DisplayLabel = 'Tipo de Consumidor'
      FieldName = 'pef_consfin'
      Required = True
    end
    object qyPessoasFinancpef_salorcap: TFloatField
      DisplayLabel = 'Sal'#225'rio / Capital Social'
      FieldName = 'pef_salorcap'
      Required = True
    end
    object qyPessoasFinancpef_indest: TIntegerField
      DisplayLabel = 'ICMS'
      FieldName = 'pef_indest'
      Required = True
    end
  end
  object qyEndEletro: TZQuery
    Connection = database
    UpdateObject = updEndEletro
    AfterInsert = qyEndEletroAfterInsert
    BeforePost = qyEndEletroBeforePost
    AfterPost = qyEndEletroAfterPost
    BeforeDelete = qyEndEletroBeforeDelete
    AfterDelete = qyEndEletroAfterDelete
    OnPostError = qyEndEletroPostError
    SQL.Strings = (
      'select'
      'e.tpn_codigo, t.tpn_descricao, e.enl_codigo, e.enl_endereco,'
      'e.pes_codigo, e.set_codigo, s.set_descricao, e.enl_contato'
      'from endeletro e, endeletrotipo t, setor s'
      
        'where e.tpn_codigo = t.tpn_codigo and e.set_codigo = s.set_codig' +
        'o'
      'order by t.tpn_descricao')
    Params = <>
    Left = 48
    Top = 200
    object qyEndEletrotpn_codigo: TIntegerField
      DisplayLabel = 'Cod. Tipo'
      FieldName = 'tpn_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyEndEletrotpn_descricao: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'tpn_descricao'
    end
    object qyEndEletroenl_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'enl_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyEndEletroenl_endereco: TWideStringField
      DisplayLabel = 'endere'#231'o eletr'#244'nico'
      FieldName = 'enl_endereco'
      Required = True
      Size = 50
    end
    object qyEndEletropes_codigo: TIntegerField
      DisplayLabel = 'Cod. Pessoa'
      FieldName = 'pes_codigo'
      Required = True
      Visible = False
    end
    object qyEndEletroset_codigo: TIntegerField
      DisplayLabel = 'Cod. Setor'
      FieldName = 'set_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyEndEletroset_descricao: TWideStringField
      DisplayLabel = 'Setor'
      FieldName = 'set_descricao'
      Required = True
    end
    object qyEndEletroenl_contato: TWideStringField
      DisplayLabel = 'Contato'
      FieldName = 'enl_contato'
    end
  end
  object qyEnderecos: TZQuery
    Connection = database
    UpdateObject = updEnderecos
    AfterInsert = qyEnderecosAfterInsert
    BeforePost = qyEnderecosBeforePost
    AfterPost = qyEnderecosAfterPost
    BeforeDelete = qyEnderecosBeforeDelete
    AfterDelete = qyEnderecosAfterDelete
    OnPostError = qyEnderecosPostError
    SQL.Strings = (
      'select'
      
        'e.end_codigo, e.pes_codigo, e.tpe_codigo, t.tpe_descricao, e.tpl' +
        '_codigo,'
      
        'l.tpl_descricao, e.end_logradouro, e.end_numero, e.end_complemen' +
        'to, e.end_bairro,'
      
        'e.end_ptreferencia, e.cid_codigo, c.cid_municipio, c.uf_sigla, e' +
        '.end_cep'
      'from enderecos e, enderecostipo t, logradourostipo l, cidades c'
      'where e.tpe_codigo = t.tpe_codigo'
      'and e.tpl_codigo = l.tpl_codigo'
      'and e.cid_codigo = c.cid_codigo'
      'order by e.tpe_codigo')
    Params = <>
    Left = 232
    Top = 200
    object qyEnderecosend_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'end_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyEnderecospes_codigo: TIntegerField
      DisplayLabel = 'Cod. Pessoa'
      FieldName = 'pes_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyEnderecostpe_codigo: TIntegerField
      DisplayLabel = 'Cpd. Tp. Endereco'
      FieldName = 'tpe_codigo'
      Required = True
      Visible = False
    end
    object qyEnderecostpe_descricao: TWideStringField
      DisplayLabel = 'Tp. de Endere'#231'o'
      FieldName = 'tpe_descricao'
      Required = True
    end
    object qyEnderecostpl_codigo: TIntegerField
      DisplayLabel = 'Cod. Tp. Logradouro'
      FieldName = 'tpl_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000'
    end
    object qyEnderecostpl_descricao: TWideStringField
      DisplayLabel = 'Tp. de Logradouro'
      FieldName = 'tpl_descricao'
      Required = True
    end
    object qyEnderecosend_logradouro: TWideStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'end_logradouro'
      Required = True
      Size = 50
    end
    object qyEnderecosend_numero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'end_numero'
      Required = True
    end
    object qyEnderecosend_complemento: TWideStringField
      DisplayLabel = 'Complemento'
      FieldName = 'end_complemento'
      Size = 15
    end
    object qyEnderecosend_bairro: TWideStringField
      DisplayLabel = 'Bairro'
      FieldName = 'end_bairro'
      Required = True
      Size = 30
    end
    object qyEnderecosend_ptreferencia: TWideStringField
      DisplayLabel = 'Pt. de Refer'#234'ncia'
      FieldName = 'end_ptreferencia'
      Size = 30
    end
    object qyEnderecoscid_codigo: TIntegerField
      DisplayLabel = 'Cod. Municipio'
      FieldName = 'cid_codigo'
      Required = True
      Visible = False
    end
    object qyEnderecoscid_municipio: TWideStringField
      DisplayLabel = 'Munic'#237'pio'
      FieldName = 'cid_municipio'
      Required = True
      Size = 50
    end
    object qyEnderecosuf_sigla: TWideStringField
      DisplayLabel = 'UF'
      FieldName = 'uf_sigla'
      Required = True
      Size = 2
    end
    object qyEnderecosend_cep: TWideStringField
      DisplayLabel = 'CEP'
      FieldName = 'end_cep'
      Required = True
      Size = 9
    end
  end
  object qyFones: TZQuery
    Connection = database
    UpdateObject = updFones
    AfterInsert = qyFonesAfterInsert
    BeforePost = qyFonesBeforePost
    AfterPost = qyFonesAfterPost
    BeforeDelete = qyFonesBeforeDelete
    AfterDelete = qyFonesAfterDelete
    OnPostError = qyFonesPostError
    SQL.Strings = (
      'select'
      'f.fon_codigo, f.set_codigo, s.set_descricao, f.tpf_codigo,'
      't.tpf_descricao, f.fon_numero,  f.pes_codigo, f.fon_contato'
      'from'
      'fones f, fonestipo t, setor s'
      'where f.tpf_codigo = t.tpf_codigo'
      'and f.set_codigo = s.set_codigo'
      'order by s.set_descricao')
    Params = <>
    Left = 48
    Top = 288
    object qyFonesfon_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'fon_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyFonesset_codigo: TIntegerField
      DisplayLabel = 'Cod. Setor'
      FieldName = 'set_codigo'
      Required = True
      Visible = False
    end
    object qyFonesset_descricao: TWideStringField
      DisplayLabel = 'Setor'
      FieldName = 'set_descricao'
      Required = True
    end
    object qyFonestpf_codigo: TIntegerField
      DisplayLabel = 'Cod. Tp. Fone'
      FieldName = 'tpf_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000'
    end
    object qyFonestpf_descricao: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'tpf_descricao'
      Required = True
    end
    object qyFonesfon_numero: TWideStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'fon_numero'
      Required = True
      Size = 15
    end
    object qyFonespes_codigo: TIntegerField
      DisplayLabel = 'Cod. Pessoa'
      FieldName = 'pes_codigo'
      Required = True
      Visible = False
    end
    object qyFonesfon_contato: TWideStringField
      DisplayLabel = 'Contato'
      FieldName = 'fon_contato'
    end
  end
  object updPessoas: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM pessoas'
      'WHERE'
      '  pessoas.pes_codigo = :OLD_pes_codigo')
    InsertSQL.Strings = (
      'INSERT INTO pessoas'
      
        '  (pes_codigo, pes_nome, pes_nomefantasia, pes_documento, pes_id' +
        'entificacao, '
      
        '   tpl_codigo, pes_logradouro, pes_numero, pes_complemento, pes_' +
        'bairro, '
      
        '   cid_codigo, pes_ptreferencia, pes_fone, pes_cep, pes_cliente,' +
        ' pes_fornecedor, '
      
        '   pes_transportadora, pes_tipo, pes_ativo, pes_email, pes_datac' +
        'ad)'
      'VALUES'
      
        '  (:pes_codigo, :pes_nome, :pes_nomefantasia, :pes_documento, :p' +
        'es_identificacao, '
      
        '   :tpl_codigo, :pes_logradouro, :pes_numero, :pes_complemento, ' +
        ':pes_bairro, '
      
        '   :cid_codigo, :pes_ptreferencia, :pes_fone, :pes_cep, :pes_cli' +
        'ente, :pes_fornecedor, '
      
        '   :pes_transportadora, :pes_tipo, :pes_ativo, :pes_email, :pes_' +
        'datacad)')
    ModifySQL.Strings = (
      'UPDATE pessoas SET'
      '  pes_codigo = :pes_codigo,'
      '  pes_nome = :pes_nome,'
      '  pes_nomefantasia = :pes_nomefantasia,'
      '  pes_documento = :pes_documento,'
      '  pes_identificacao = :pes_identificacao,'
      '  tpl_codigo = :tpl_codigo,'
      '  pes_logradouro = :pes_logradouro,'
      '  pes_numero = :pes_numero,'
      '  pes_complemento = :pes_complemento,'
      '  pes_bairro = :pes_bairro,'
      '  cid_codigo = :cid_codigo,'
      '  pes_ptreferencia = :pes_ptreferencia,'
      '  pes_fone = :pes_fone,'
      '  pes_cep = :pes_cep,'
      '  pes_cliente = :pes_cliente,'
      '  pes_fornecedor = :pes_fornecedor,'
      '  pes_transportadora = :pes_transportadora,'
      '  pes_tipo = :pes_tipo,'
      '  pes_ativo = :pes_ativo,'
      '  pes_email = :pes_email,'
      '  pes_datacad = :pes_datacad'
      'WHERE'
      '  pessoas.pes_codigo = :OLD_pes_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 120
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pes_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_nome'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_nomefantasia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_documento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_identificacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tpl_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_logradouro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_complemento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_bairro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cid_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_ptreferencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_fone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_cep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_fornecedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_transportadora'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_ativo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_datacad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_pes_codigo'
        ParamType = ptUnknown
      end>
  end
  object updPessoasObs: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM pessoasobs'
      'WHERE'
      '  pessoasobs.pes_codigo = :OLD_pes_codigo')
    InsertSQL.Strings = (
      'INSERT INTO pessoasobs'
      '  (pes_codigo, pes_obs)'
      'VALUES'
      '  (:pes_codigo, :pes_obs)')
    ModifySQL.Strings = (
      'UPDATE pessoasobs SET'
      '  pes_codigo = :pes_codigo,'
      '  pes_obs = :pes_obs'
      'WHERE'
      '  pessoasobs.pes_codigo = :OLD_pes_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 312
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pes_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_obs'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_pes_codigo'
        ParamType = ptUnknown
      end>
  end
  object updPessoasFinanc: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM pessoasfinanc'
      'WHERE'
      '  pessoasfinanc.pes_codigo = :OLD_pes_codigo')
    InsertSQL.Strings = (
      'INSERT INTO pessoasfinanc'
      
        '  (pes_codigo, pef_tabvenda, pef_limcred, pef_inadimplente, pef_' +
        'consfin, '
      '   pef_salorcap, pef_indest)'
      'VALUES'
      
        '  (:pes_codigo, :pef_tabvenda, :pef_limcred, :pef_inadimplente, ' +
        ':pef_consfin, '
      '   :pef_salorcap, :pef_indest)')
    ModifySQL.Strings = (
      'UPDATE pessoasfinanc SET'
      '  pes_codigo = :pes_codigo,'
      '  pef_tabvenda = :pef_tabvenda,'
      '  pef_limcred = :pef_limcred,'
      '  pef_inadimplente = :pef_inadimplente,'
      '  pef_consfin = :pef_consfin,'
      '  pef_salorcap = :pef_salorcap,'
      '  pef_indest = :pef_indest'
      'WHERE'
      '  pessoasfinanc.pes_codigo = :OLD_pes_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 512
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pes_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pef_tabvenda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pef_limcred'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pef_inadimplente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pef_consfin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pef_salorcap'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pef_indest'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_pes_codigo'
        ParamType = ptUnknown
      end>
  end
  object updEndEletro: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM endeletro'
      'WHERE'
      '  endeletro.enl_codigo = :OLD_enl_codigo')
    InsertSQL.Strings = (
      'INSERT INTO endeletro'
      
        '  (enl_codigo, enl_endereco, tpn_codigo, pes_codigo, set_codigo,' +
        ' enl_contato)'
      'VALUES'
      
        '  (:enl_codigo, :enl_endereco, :tpn_codigo, :pes_codigo, :set_co' +
        'digo, :enl_contato)')
    ModifySQL.Strings = (
      'UPDATE endeletro SET'
      '  enl_codigo = :enl_codigo,'
      '  enl_endereco = :enl_endereco,'
      '  tpn_codigo = :tpn_codigo,'
      '  pes_codigo = :pes_codigo,'
      '  set_codigo = :set_codigo,'
      '  enl_contato = :enl_contato'
      'WHERE'
      '  endeletro.enl_codigo = :OLD_enl_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 120
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'enl_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'enl_endereco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tpn_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'set_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'enl_contato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_enl_codigo'
        ParamType = ptUnknown
      end>
  end
  object updEnderecos: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM enderecos'
      'WHERE'
      '  enderecos.end_codigo = :OLD_end_codigo')
    InsertSQL.Strings = (
      'INSERT INTO enderecos'
      
        '  (end_codigo, pes_codigo, tpe_codigo, tpl_codigo, end_logradour' +
        'o, end_numero, '
      
        '   end_complemento, end_bairro, end_ptreferencia, cid_codigo, en' +
        'd_cep)'
      'VALUES'
      
        '  (:end_codigo, :pes_codigo, :tpe_codigo, :tpl_codigo, :end_logr' +
        'adouro, '
      
        '   :end_numero, :end_complemento, :end_bairro, :end_ptreferencia' +
        ', :cid_codigo, '
      '   :end_cep)')
    ModifySQL.Strings = (
      'UPDATE enderecos SET'
      '  end_codigo = :end_codigo,'
      '  pes_codigo = :pes_codigo,'
      '  tpe_codigo = :tpe_codigo,'
      '  tpl_codigo = :tpl_codigo,'
      '  end_logradouro = :end_logradouro,'
      '  end_numero = :end_numero,'
      '  end_complemento = :end_complemento,'
      '  end_bairro = :end_bairro,'
      '  end_ptreferencia = :end_ptreferencia,'
      '  cid_codigo = :cid_codigo,'
      '  end_cep = :end_cep'
      'WHERE'
      '  enderecos.end_codigo = :OLD_end_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 304
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'end_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tpe_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tpl_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'end_logradouro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'end_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'end_complemento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'end_bairro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'end_ptreferencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cid_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'end_cep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_end_codigo'
        ParamType = ptUnknown
      end>
  end
  object updFones: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM fones'
      'WHERE'
      '  fones.fon_codigo = :OLD_fon_codigo')
    InsertSQL.Strings = (
      'INSERT INTO fones'
      
        '  (fon_codigo, fon_numero, tpf_codigo, set_codigo, pes_codigo, f' +
        'on_contato)'
      'VALUES'
      
        '  (:fon_codigo, :fon_numero, :tpf_codigo, :set_codigo, :pes_codi' +
        'go, :fon_contato)')
    ModifySQL.Strings = (
      'UPDATE fones SET'
      '  fon_codigo = :fon_codigo,'
      '  fon_numero = :fon_numero,'
      '  tpf_codigo = :tpf_codigo,'
      '  set_codigo = :set_codigo,'
      '  pes_codigo = :pes_codigo,'
      '  fon_contato = :fon_contato'
      'WHERE'
      '  fones.fon_codigo = :OLD_fon_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 120
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fon_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fon_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tpf_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'set_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fon_contato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_fon_codigo'
        ParamType = ptUnknown
      end>
  end
end
