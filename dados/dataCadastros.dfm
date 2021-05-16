inherited dmCadastros: TdmCadastros
  OldCreateOrder = True
  object qySistema: TZQuery
    Connection = database
    UpdateObject = updSistema
    BeforePost = qySistemaBeforePost
    AfterPost = qySistemaAfterPost
    BeforeDelete = qySistemaBeforeDelete
    AfterDelete = qySistemaAfterDelete
    OnPostError = qySistemaPostError
    SQL.Strings = (
      'select sis_codigo, sis_maquina, sis_id, sis_serial, sis_validate'
      'from'
      'sistema')
    Params = <>
    Left = 384
    Top = 16
    object qySistemasis_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'sis_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qySistemasis_maquina: TWideStringField
      DisplayLabel = 'M'#225'quina'
      FieldName = 'sis_maquina'
      Required = True
      Size = 25
    end
    object qySistemasis_id: TWideStringField
      DisplayLabel = 'ID'
      FieldName = 'sis_id'
      Size = 10
    end
    object qySistemasis_serial: TWideStringField
      DisplayLabel = 'Serial'
      FieldName = 'sis_serial'
      Size = 30
    end
    object qySistemasis_validate: TDateField
      DisplayLabel = 'Validade'
      FieldName = 'sis_validate'
      DisplayFormat = 'dd/MM/yyyy'
    end
  end
  object updSistema: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM sistema'
      'WHERE'
      '  sistema.sis_codigo = :OLD_sis_codigo')
    InsertSQL.Strings = (
      'INSERT INTO sistema'
      '  (sis_codigo, sis_maquina, sis_id, sis_serial, sis_validate)'
      'VALUES'
      
        '  (:sis_codigo, :sis_maquina, :sis_id, :sis_serial, :sis_validat' +
        'e)')
    ModifySQL.Strings = (
      'UPDATE sistema SET'
      '  sis_codigo = :sis_codigo,'
      '  sis_maquina = :sis_maquina,'
      '  sis_id = :sis_id,'
      '  sis_serial = :sis_serial,'
      '  sis_validate = :sis_validate'
      'WHERE'
      '  sistema.sis_codigo = :OLD_sis_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 456
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sis_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sis_maquina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sis_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sis_serial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sis_validate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_sis_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyEmailPadrao: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'usu_codigo, mai_host, mai_username, mai_password,'
      'mai_namefrom, mai_adressfrom, mai_porta, mai_authtype,'
      'mai_sslmethod, mai_sslmode, mai_usetls'
      'from usumails'
      'where usu_codigo = 0')
    Params = <>
    Left = 544
    Top = 16
    object qyEmailPadraousu_codigo: TIntegerField
      DisplayLabel = 'C'#243'd. Usu'#225'rio'
      FieldName = 'usu_codigo'
      Required = True
    end
    object qyEmailPadraomai_host: TWideStringField
      DisplayLabel = 'Host'
      FieldName = 'mai_host'
      Required = True
      Size = 50
    end
    object qyEmailPadraomai_username: TWideStringField
      DisplayLabel = 'User Name'
      FieldName = 'mai_username'
      Required = True
      Size = 50
    end
    object qyEmailPadraomai_password: TWideStringField
      DisplayLabel = 'Password'
      FieldName = 'mai_password'
      Required = True
      Size = 30
    end
    object qyEmailPadraomai_namefrom: TWideStringField
      DisplayLabel = 'Name From'
      FieldName = 'mai_namefrom'
      Required = True
      Size = 50
    end
    object qyEmailPadraomai_adressfrom: TWideStringField
      DisplayLabel = 'Adress From'
      FieldName = 'mai_adressfrom'
      Required = True
      Size = 50
    end
    object qyEmailPadraomai_porta: TIntegerField
      DisplayLabel = 'Porta'
      FieldName = 'mai_porta'
      Required = True
    end
    object qyEmailPadraomai_authtype: TIntegerField
      DisplayLabel = 'Auth Type'
      FieldName = 'mai_authtype'
      Required = True
    end
    object qyEmailPadraomai_sslmethod: TIntegerField
      DisplayLabel = 'SSL Method'
      FieldName = 'mai_sslmethod'
      Required = True
    end
    object qyEmailPadraomai_sslmode: TIntegerField
      DisplayLabel = 'SSL Mode'
      FieldName = 'mai_sslmode'
      Required = True
    end
    object qyEmailPadraomai_usetls: TIntegerField
      DisplayLabel = 'use TLS'
      FieldName = 'mai_usetls'
      Required = True
    end
  end
  object qyBancos: TZQuery
    Connection = database
    UpdateObject = updBancos
    BeforePost = qyBancosBeforePost
    AfterPost = qyBancosAfterPost
    BeforeDelete = qyBancosBeforeDelete
    AfterDelete = qyBancosAfterDelete
    OnPostError = qyBancosPostError
    SQL.Strings = (
      'select'
      'ban_codigo, ban_descricao'
      'from bancos'
      'order by ban_descricao')
    Params = <>
    Left = 48
    Top = 96
    object qyBancosban_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ban_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyBancosban_descricao: TWideStringField
      DisplayLabel = 'Banco'
      FieldName = 'ban_descricao'
      Required = True
      Size = 50
    end
  end
  object updBancos: TZUpdateSQL
    UseSequenceFieldForRefreshSQL = False
    Left = 112
    Top = 96
  end
  object qyCidades: TZQuery
    Connection = database
    UpdateObject = updCidades
    BeforePost = qyCidadesBeforePost
    AfterPost = qyCidadesAfterPost
    BeforeDelete = qyCidadesBeforeDelete
    AfterDelete = qyCidadesAfterDelete
    OnPostError = qyCidadesPostError
    SQL.Strings = (
      'select'
      'c.cid_codigo, c.cid_municipio, c.uf_sigla, c.cid_ceppadrao,'
      'u.uf_estado'
      'from cidades c, uf u'
      'where c.uf_sigla = u.uf_sigla'
      'order by c.cid_municipio')
    Params = <>
    Left = 192
    Top = 96
    object qyCidadescid_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'cid_codigo'
      Required = True
    end
    object qyCidadescid_municipio: TWideStringField
      DisplayLabel = 'Munic'#237'pio'
      FieldName = 'cid_municipio'
      Required = True
      Size = 50
    end
    object qyCidadesuf_sigla: TWideStringField
      DisplayLabel = 'UF'
      FieldName = 'uf_sigla'
      Required = True
      Size = 2
    end
    object qyCidadesuf_estado: TWideStringField
      DisplayLabel = 'Estado'
      FieldName = 'uf_estado'
      Required = True
      Size = 25
    end
    object qyCidadescid_ceppadrao: TWideStringField
      DisplayLabel = 'CEP Padr'#227'o'
      FieldName = 'cid_ceppadrao'
      Size = 9
    end
  end
  object updCidades: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM cidades'
      'WHERE'
      '  cidades.cid_codigo = :OLD_cid_codigo')
    InsertSQL.Strings = (
      'INSERT INTO cidades'
      '  (cid_codigo, cid_municipio, uf_sigla, cid_ceppadrao)'
      'VALUES'
      '  (:cid_codigo, :cid_municipio, :uf_sigla, :cid_ceppadrao)')
    ModifySQL.Strings = (
      'UPDATE cidades SET'
      '  cid_codigo = :cid_codigo,'
      '  cid_municipio = :cid_municipio,'
      '  uf_sigla = :uf_sigla,'
      '  cid_ceppadrao = :cid_ceppadrao'
      'WHERE'
      '  cidades.cid_codigo = :OLD_cid_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 256
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cid_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cid_municipio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'uf_sigla'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cid_ceppadrao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_cid_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyContas: TZQuery
    Connection = database
    UpdateObject = updContas
    AfterInsert = qyContasAfterInsert
    BeforePost = qyContasBeforePost
    AfterPost = qyContasAfterPost
    BeforeDelete = qyContasBeforeDelete
    AfterDelete = qyContasAfterDelete
    OnPostError = qyContasPostError
    SQL.Strings = (
      'select'
      'c.con_codigo, c.con_descricao, c.ban_codigo,'
      'b.ban_descricao, c.con_ativa'
      'from'
      'contas c, bancos b'
      'where c.ban_codigo = b.ban_codigo'
      'order by c.con_codigo')
    Params = <>
    Left = 336
    Top = 96
    object qyContascon_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'con_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyContascon_descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'con_descricao'
      Required = True
      Size = 30
    end
    object qyContasban_codigo: TIntegerField
      DisplayLabel = 'C'#243'd. Banco'
      FieldName = 'ban_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyContasban_descricao: TWideStringField
      DisplayLabel = 'Banco'
      FieldName = 'ban_descricao'
      Required = True
      Size = 50
    end
    object qyContascon_ativa: TWideStringField
      DisplayLabel = 'Ativa'
      FieldName = 'con_ativa'
      Required = True
      Visible = False
      Size = 1
    end
  end
  object updContas: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM contas'
      'WHERE'
      '  contas.con_codigo = :OLD_con_codigo')
    InsertSQL.Strings = (
      'INSERT INTO contas'
      '  (con_codigo, con_descricao, ban_codigo, con_ativa)'
      'VALUES'
      '  (:con_codigo, :con_descricao, :ban_codigo, :con_ativa)')
    ModifySQL.Strings = (
      'UPDATE contas SET'
      '  con_codigo = :con_codigo,'
      '  con_descricao = :con_descricao,'
      '  ban_codigo = :ban_codigo,'
      '  con_ativa = :con_ativa'
      'WHERE'
      '  contas.con_codigo = :OLD_con_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 400
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'con_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'con_descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ban_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'con_ativa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_con_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyGrupos: TZQuery
    Connection = database
    UpdateObject = updGrupos
    BeforePost = qyGruposBeforePost
    AfterPost = qyGruposAfterPost
    BeforeDelete = qyGruposBeforeDelete
    AfterDelete = qyGruposAfterDelete
    OnPostError = qyGruposPostError
    SQL.Strings = (
      'select'
      'grp_codigo, grp_descricao'
      'from grupos')
    Params = <>
    Left = 48
    Top = 168
    object qyGruposgrp_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'grp_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyGruposgrp_descricao: TWideStringField
      DisplayLabel = 'Grupo'
      FieldName = 'grp_descricao'
      Required = True
      Size = 25
    end
  end
  object updGrupos: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM grupos'
      'WHERE'
      '  grupos.grp_codigo = :OLD_grp_codigo')
    InsertSQL.Strings = (
      'INSERT INTO grupos'
      '  (grp_codigo, grp_descricao)'
      'VALUES'
      '  (:grp_codigo, :grp_descricao)')
    ModifySQL.Strings = (
      'UPDATE grupos SET'
      '  grp_codigo = :grp_codigo,'
      '  grp_descricao = :grp_descricao'
      'WHERE'
      '  grupos.grp_codigo = :OLD_grp_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 120
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'grp_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'grp_descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_grp_codigo'
        ParamType = ptUnknown
      end>
  end
  object qySubGrupos: TZQuery
    Connection = database
    UpdateObject = updSubGrupos
    BeforePost = qySubGruposBeforePost
    AfterPost = qySubGruposAfterPost
    BeforeDelete = qySubGruposBeforeDelete
    AfterDelete = qySubGruposAfterDelete
    OnPostError = qySubGruposPostError
    SQL.Strings = (
      'select'
      'sgr_codigo, sgr_descricao, grp_codigo, sgr_mkpatac, sgr_mkpvar'
      'from subgrupos')
    Params = <>
    Left = 200
    Top = 168
    object qySubGrupossgr_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'sgr_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qySubGrupossgr_descricao: TWideStringField
      DisplayLabel = 'Subgrupo'
      FieldName = 'sgr_descricao'
      Required = True
      Size = 25
    end
    object qySubGruposgrp_codigo: TIntegerField
      DisplayLabel = 'C'#243'd. Grupo'
      FieldName = 'grp_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qySubGrupossgr_mkpatac: TFloatField
      DisplayLabel = 'Mkp. Atacado'
      FieldName = 'sgr_mkpatac'
      Required = True
      DisplayFormat = '#0.0'
    end
    object qySubGrupossgr_mkpvar: TFloatField
      DisplayLabel = 'Mkp. Varejo'
      FieldName = 'sgr_mkpvar'
      Required = True
      DisplayFormat = '#0.0'
    end
  end
  object updSubGrupos: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM subgrupos'
      'WHERE'
      '  subgrupos.sgr_codigo = :OLD_sgr_codigo')
    InsertSQL.Strings = (
      'INSERT INTO subgrupos'
      
        '  (sgr_codigo, sgr_descricao, grp_codigo, sgr_mkpatac, sgr_mkpva' +
        'r)'
      'VALUES'
      
        '  (:sgr_codigo, :sgr_descricao, :grp_codigo, :sgr_mkpatac, :sgr_' +
        'mkpvar)')
    ModifySQL.Strings = (
      'UPDATE subgrupos SET'
      '  sgr_codigo = :sgr_codigo,'
      '  sgr_descricao = :sgr_descricao,'
      '  grp_codigo = :grp_codigo,'
      '  sgr_mkpatac = :sgr_mkpatac,'
      '  sgr_mkpvar = :sgr_mkpvar'
      'WHERE'
      '  subgrupos.sgr_codigo = :OLD_sgr_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 272
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sgr_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sgr_descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'grp_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sgr_mkpatac'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sgr_mkpvar'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_sgr_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyFuncionarios: TZQuery
    Connection = database
    UpdateObject = updFuncionarios
    AfterInsert = qyFuncionariosAfterInsert
    BeforePost = qyFuncionariosBeforePost
    AfterPost = qyFuncionariosAfterPost
    BeforeDelete = qyFuncionariosBeforeDelete
    AfterDelete = qyFuncionariosAfterDelete
    OnPostError = qyFuncionariosPostError
    SQL.Strings = (
      'select'
      
        'f.fun_codigo, f.fun_nome, f.fun_telefone, f.fun_ativo, f.fnc_cod' +
        'igo, n.fnc_descricao'
      'from funcionarios f, funcoes n'
      'where f.fnc_codigo = n.fnc_codigo'
      'order by f.fun_nome')
    Params = <>
    Left = 368
    Top = 168
    object qyFuncionariosfun_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'fun_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyFuncionariosfun_nome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'fun_nome'
      Required = True
      Size = 50
    end
    object qyFuncionariosfun_telefone: TWideStringField
      DisplayLabel = 'Telefone'
      FieldName = 'fun_telefone'
      Required = True
      EditMask = '(99) 99999-9999;1;_'
      Size = 15
    end
    object qyFuncionariosfnc_codigo: TIntegerField
      DisplayLabel = 'C'#243'd. Fun'#231#227'o'
      FieldName = 'fnc_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyFuncionariosfnc_descricao: TWideStringField
      DisplayLabel = 'Fun'#231#227'o'
      FieldName = 'fnc_descricao'
      Required = True
    end
    object qyFuncionariosfun_ativo: TWideStringField
      DisplayLabel = 'Ativo'
      FieldName = 'fun_ativo'
      Required = True
      Visible = False
      Size = 1
    end
  end
  object updFuncionarios: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM funcionarios'
      'WHERE'
      '  funcionarios.fun_codigo = :OLD_fun_codigo')
    InsertSQL.Strings = (
      'INSERT INTO funcionarios'
      '  (fun_codigo, fun_nome, fun_telefone, fun_ativo, fnc_codigo)'
      'VALUES'
      
        '  (:fun_codigo, :fun_nome, :fun_telefone, :fun_ativo, :fnc_codig' +
        'o)')
    ModifySQL.Strings = (
      'UPDATE funcionarios SET'
      '  fun_codigo = :fun_codigo,'
      '  fun_nome = :fun_nome,'
      '  fun_telefone = :fun_telefone,'
      '  fun_ativo = :fun_ativo,'
      '  fnc_codigo = :fnc_codigo'
      'WHERE'
      '  funcionarios.fun_codigo = :OLD_fun_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 448
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fun_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fun_nome'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fun_telefone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fun_ativo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fnc_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_fun_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyFuncoes: TZQuery
    Connection = database
    UpdateObject = updFuncoes
    BeforePost = qyFuncoesBeforePost
    AfterPost = qyFuncoesAfterPost
    BeforeDelete = qyFuncoesBeforeDelete
    AfterDelete = qyFuncoesAfterDelete
    OnPostError = qyFuncoesPostError
    SQL.Strings = (
      'select'
      'fnc_codigo, fnc_descricao'
      'from funcoes'
      'order by fnc_descricao')
    Params = <>
    Left = 544
    Top = 168
    object qyFuncoesfnc_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'fnc_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyFuncoesfnc_descricao: TWideStringField
      DisplayLabel = 'Fun'#231#227'o'
      FieldName = 'fnc_descricao'
      Required = True
    end
  end
  object updFuncoes: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM funcoes'
      'WHERE'
      '  funcoes.fnc_codigo = :OLD_fnc_codigo')
    InsertSQL.Strings = (
      'INSERT INTO funcoes'
      '  (fnc_codigo, fnc_descricao)'
      'VALUES'
      '  (:fnc_codigo, :fnc_descricao)')
    ModifySQL.Strings = (
      'UPDATE funcoes SET'
      '  fnc_codigo = :fnc_codigo,'
      '  fnc_descricao = :fnc_descricao'
      'WHERE'
      '  funcoes.fnc_codigo = :OLD_fnc_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 616
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fnc_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fnc_descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_fnc_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyLocalizacao: TZQuery
    Connection = database
    UpdateObject = updLocalizacao
    BeforePost = qyLocalizacaoBeforePost
    AfterPost = qyLocalizacaoAfterPost
    BeforeDelete = qyLocalizacaoBeforeDelete
    AfterDelete = qyLocalizacaoAfterDelete
    OnPostError = qyLocalizacaoPostError
    SQL.Strings = (
      'select'
      'loc_codigo, loc_descricao'
      'from localizacao'
      'order by loc_descricao')
    Params = <>
    Left = 48
    Top = 240
    object qyLocalizacaoloc_codigo: TIntegerField
      DisplayLabel = 'C'#243'dgo'
      FieldName = 'loc_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyLocalizacaoloc_descricao: TWideStringField
      DisplayLabel = 'Localiza'#231#227'o'
      FieldName = 'loc_descricao'
      Required = True
    end
  end
  object updLocalizacao: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM localizacao'
      'WHERE'
      '  localizacao.loc_codigo = :OLD_loc_codigo')
    InsertSQL.Strings = (
      'INSERT INTO localizacao'
      '  (loc_codigo, loc_descricao)'
      'VALUES'
      '  (:loc_codigo, :loc_descricao)')
    ModifySQL.Strings = (
      'UPDATE localizacao SET'
      '  loc_codigo = :loc_codigo,'
      '  loc_descricao = :loc_descricao'
      'WHERE'
      '  localizacao.loc_codigo = :OLD_loc_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 120
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'loc_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'loc_descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_loc_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyMarcas: TZQuery
    Connection = database
    UpdateObject = updMarcas
    BeforePost = qyMarcasBeforePost
    AfterPost = qyMarcasAfterPost
    BeforeDelete = qyMarcasBeforeDelete
    AfterDelete = qyMarcasAfterDelete
    OnPostError = qyMarcasPostError
    SQL.Strings = (
      'select'
      'mar_codigo, mar_descricao'
      'from marcas'
      'order by mar_descricao')
    Params = <>
    Left = 200
    Top = 240
    object qyMarcasmar_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'mar_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyMarcasmar_descricao: TWideStringField
      DisplayLabel = 'Marca'
      FieldName = 'mar_descricao'
      Required = True
      Size = 25
    end
  end
  object updMarcas: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM marcas'
      'WHERE'
      '  marcas.mar_codigo = :OLD_mar_codigo')
    InsertSQL.Strings = (
      'INSERT INTO marcas'
      '  (mar_codigo, mar_descricao)'
      'VALUES'
      '  (:mar_codigo, :mar_descricao)')
    ModifySQL.Strings = (
      'UPDATE marcas SET'
      '  mar_codigo = :mar_codigo,'
      '  mar_descricao = :mar_descricao'
      'WHERE'
      '  marcas.mar_codigo = :OLD_mar_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 264
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'mar_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mar_descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_mar_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyProdutos: TZQuery
    Connection = database
    UpdateObject = updProdutos
    AfterInsert = qyProdutosAfterInsert
    BeforePost = qyProdutosBeforePost
    AfterPost = qyProdutosAfterPost
    BeforeDelete = qyProdutosBeforeDelete
    AfterDelete = qyProdutosAfterDelete
    OnPostError = qyProdutosPostError
    SQL.Strings = (
      'select'
      'p.pro_codigo, p.pro_descricao, p.uni_codigo, u.uni_descricao,'
      'p.grp_codigo, g.grp_descricao, p.sgr_codigo, s.sgr_descricao,'
      'p.mar_codigo, m.mar_descricao, p.pro_codbarras, p.tip_codigo,'
      't.tip_descricao, p.pro_classfisc, p.pro_ncm, p.pro_vlrunitario,'
      
        'p.pro_credicms, p.pro_vlrfrete, p.pro_vlroutras, p.pro_vlrimport' +
        ','
      'p.pro_vlrcusto, p.pro_mkpatac, p.pro_mkpvar, p.pro_vlratac,'
      
        'p.pro_vlrvar, p.pro_mgmin, p.pro_desmax, p.pro_movest, p.loc_cod' +
        'igo,'
      'l.loc_descricao, p.pro_dtcad, p.pro_estmin, p.pro_estideal,'
      'p.pro_pesobruto, p.pro_pesoliq, p.pro_origem, p.pro_inatzerar,'
      'p.pro_embalagem, p.pro_codbarrasemb, p.pro_cest, p.pro_status'
      'from'
      'produtos p, unidades u, grupos g, subgrupos s,'
      'marcas m, tipoitem t, localizacao l'
      'where p.uni_codigo = u.uni_codigo'
      'and p.grp_codigo = g.grp_codigo'
      'and p.sgr_codigo = s.sgr_codigo'
      'and p.mar_codigo = m.mar_codigo'
      'and p.tip_codigo = t.tip_codigo'
      'and p.loc_codigo = l.loc_codigo'
      'order by p.pro_descricao')
    Params = <>
    Left = 368
    Top = 240
    object qyProdutospro_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pro_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyProdutospro_descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'pro_descricao'
      Required = True
      Size = 100
    end
    object qyProdutosuni_codigo: TWideStringField
      DisplayLabel = 'C'#243'd. Un.'
      FieldName = 'uni_codigo'
      Required = True
      Size = 2
    end
    object qyProdutosuni_descricao: TWideStringField
      DisplayLabel = 'Unidade'
      FieldName = 'uni_descricao'
      Required = True
      Size = 15
    end
    object qyProdutosgrp_codigo: TIntegerField
      DisplayLabel = 'C'#243'd. Grupo'
      FieldName = 'grp_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000'
    end
    object qyProdutosgrp_descricao: TWideStringField
      DisplayLabel = 'Grupo'
      FieldName = 'grp_descricao'
      Required = True
      Size = 25
    end
    object qyProdutossgr_codigo: TIntegerField
      DisplayLabel = 'C'#243'd. Subgrupo'
      FieldName = 'sgr_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000'
    end
    object qyProdutossgr_descricao: TWideStringField
      DisplayLabel = 'Subgrupo'
      FieldName = 'sgr_descricao'
      Required = True
      Size = 25
    end
    object qyProdutosmar_codigo: TIntegerField
      DisplayLabel = 'Cod.Marca'
      FieldName = 'mar_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000'
    end
    object qyProdutosmar_descricao: TWideStringField
      DisplayLabel = 'Marca'
      FieldName = 'mar_descricao'
      Required = True
      Size = 25
    end
    object qyProdutospro_codbarras: TWideStringField
      DisplayLabel = 'C'#243'd. Barras'
      FieldName = 'pro_codbarras'
      Size = 14
    end
    object qyProdutostip_codigo: TIntegerField
      DisplayLabel = 'C'#243'd. Tipo'
      FieldName = 'tip_codigo'
      Required = True
      Visible = False
      DisplayFormat = '00'
    end
    object qyProdutostip_descricao: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'tip_descricao'
      Required = True
      Size = 30
    end
    object qyProdutospro_classfisc: TIntegerField
      DisplayLabel = 'Class. Fiscal'
      FieldName = 'pro_classfisc'
      Required = True
    end
    object qyProdutospro_ncm: TWideStringField
      DisplayLabel = 'NCM'
      FieldName = 'pro_ncm'
      Required = True
      Size = 10
    end
    object qyProdutospro_vlrunitario: TFloatField
      DisplayLabel = 'Vlr. Unit'#225'rio'
      FieldName = 'pro_vlrunitario'
      Required = True
      DisplayFormat = '#,###,###,##0.0000'
    end
    object qyProdutospro_credicms: TFloatField
      DisplayLabel = 'Vlr. Cr'#233'd. ICMS'
      FieldName = 'pro_credicms'
      Required = True
      DisplayFormat = '#,###,###,##0.0000'
    end
    object qyProdutospro_vlrfrete: TFloatField
      DisplayLabel = 'Vlr. Frete'
      FieldName = 'pro_vlrfrete'
      Required = True
      DisplayFormat = '#,###,###,##0.0000'
    end
    object qyProdutospro_vlroutras: TFloatField
      DisplayLabel = 'Vlr. Outras'
      FieldName = 'pro_vlroutras'
      Required = True
      DisplayFormat = '#,###,###,##0.0000'
    end
    object qyProdutospro_vlrimport: TFloatField
      DisplayLabel = 'Vlr. Importa'#231#227'o'
      FieldName = 'pro_vlrimport'
      Required = True
      DisplayFormat = '#,###,###,##0.0000'
    end
    object qyProdutospro_vlrcusto: TFloatField
      DisplayLabel = 'Vlr. Custo'
      FieldName = 'pro_vlrcusto'
      Required = True
      DisplayFormat = '#,###,###,##0.0000'
    end
    object qyProdutospro_mkpatac: TFloatField
      DisplayLabel = 'Mkp. Atacado'
      FieldName = 'pro_mkpatac'
      Required = True
      DisplayFormat = '#,##0.0'
    end
    object qyProdutospro_mkpvar: TFloatField
      DisplayLabel = 'Mkp. Varejo'
      FieldName = 'pro_mkpvar'
      Required = True
      DisplayFormat = '#,##0.0'
    end
    object qyProdutospro_vlratac: TFloatField
      DisplayLabel = 'Vlr. Atacado'
      FieldName = 'pro_vlratac'
      Required = True
      DisplayFormat = '#,###,###,##0.0000'
    end
    object qyProdutospro_vlrvar: TFloatField
      DisplayLabel = 'Vlr. Varejo'
      FieldName = 'pro_vlrvar'
      Required = True
      DisplayFormat = '#,###,###,##0.0000'
    end
    object qyProdutospro_mgmin: TFloatField
      DisplayLabel = 'Mg. Min.'
      FieldName = 'pro_mgmin'
      Required = True
      DisplayFormat = '#,##0.0'
    end
    object qyProdutospro_desmax: TFloatField
      DisplayLabel = 'Desc. Max.'
      FieldName = 'pro_desmax'
      Required = True
      DisplayFormat = '#,##0.0'
    end
    object qyProdutospro_movest: TWideStringField
      DisplayLabel = 'Mov. Est.'
      FieldName = 'pro_movest'
      Required = True
      Visible = False
      Size = 1
    end
    object qyProdutosloc_codigo: TIntegerField
      DisplayLabel = 'C'#243'd. Localiza'#231#227'o'
      FieldName = 'loc_codigo'
      Required = True
      Visible = False
    end
    object qyProdutosloc_descricao: TWideStringField
      DisplayLabel = 'Localiza'#231#227'o'
      FieldName = 'loc_descricao'
      Required = True
    end
    object qyProdutospro_dtcad: TDateField
      Alignment = taRightJustify
      DisplayLabel = 'Dt. Cad.'
      FieldName = 'pro_dtcad'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyProdutospro_estmin: TFloatField
      DisplayLabel = 'Est. Min.'
      FieldName = 'pro_estmin'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
    object qyProdutospro_estideal: TFloatField
      DisplayLabel = 'Est. Ideal'
      FieldName = 'pro_estideal'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
    object qyProdutospro_pesobruto: TFloatField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'pro_pesobruto'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
    object qyProdutospro_pesoliq: TFloatField
      DisplayLabel = 'Peso L'#237'quido'
      FieldName = 'pro_pesoliq'
      Required = True
      DisplayFormat = '#,###,###,##0.0000'
    end
    object qyProdutospro_origem: TIntegerField
      DisplayLabel = 'Origem'
      FieldName = 'pro_origem'
      Required = True
      Visible = False
    end
    object qyProdutospro_inatzerar: TIntegerField
      DisplayLabel = 'Inativar'
      FieldName = 'pro_inatzerar'
      Required = True
      Visible = False
    end
    object qyProdutospro_embalagem: TFloatField
      DisplayLabel = 'Embalagem'
      FieldName = 'pro_embalagem'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
    object qyProdutospro_codbarrasemb: TWideStringField
      DisplayLabel = 'C'#243'd. Barras Emb.'
      FieldName = 'pro_codbarrasemb'
      Size = 14
    end
    object qyProdutospro_cest: TWideStringField
      DisplayLabel = 'CEST'
      FieldName = 'pro_cest'
      Required = True
      Size = 7
    end
    object qyProdutospro_status: TWideStringField
      DisplayLabel = 'Status'
      FieldName = 'pro_status'
      Required = True
      Visible = False
      Size = 1
    end
  end
  object updProdutos: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM produtos'
      'WHERE'
      '  produtos.pro_codigo = :OLD_pro_codigo')
    InsertSQL.Strings = (
      'INSERT INTO produtos'
      
        '  (pro_codigo, pro_descricao, uni_codigo, grp_codigo, sgr_codigo' +
        ', mar_codigo, '
      
        '   pro_codbarras, tip_codigo, pro_classfisc, pro_vlrunitario, pr' +
        'o_credicms, '
      
        '   pro_vlrfrete, pro_vlroutras, pro_vlrimport, pro_vlrcusto, pro' +
        '_mkpatac, '
      
        '   pro_mkpvar, pro_vlratac, pro_vlrvar, pro_mgmin, pro_desmax, p' +
        'ro_movest, '
      
        '   loc_codigo, pro_dtcad, pro_estmin, pro_estideal, pro_pesobrut' +
        'o, pro_pesoliq, '
      
        '   pro_origem, pro_inatzerar, pro_ncm, pro_embalagem, pro_codbar' +
        'rasemb, '
      '   pro_cest, pro_status)'
      'VALUES'
      
        '  (:pro_codigo, :pro_descricao, :uni_codigo, :grp_codigo, :sgr_c' +
        'odigo, '
      
        '   :mar_codigo, :pro_codbarras, :tip_codigo, :pro_classfisc, :pr' +
        'o_vlrunitario, '
      
        '   :pro_credicms, :pro_vlrfrete, :pro_vlroutras, :pro_vlrimport,' +
        ' :pro_vlrcusto, '
      
        '   :pro_mkpatac, :pro_mkpvar, :pro_vlratac, :pro_vlrvar, :pro_mg' +
        'min, :pro_desmax, '
      
        '   :pro_movest, :loc_codigo, :pro_dtcad, :pro_estmin, :pro_estid' +
        'eal, :pro_pesobruto, '
      
        '   :pro_pesoliq, :pro_origem, :pro_inatzerar, :pro_ncm, :pro_emb' +
        'alagem, '
      '   :pro_codbarrasemb, :pro_cest, :pro_status)')
    ModifySQL.Strings = (
      'UPDATE produtos SET'
      '  pro_codigo = :pro_codigo,'
      '  pro_descricao = :pro_descricao,'
      '  uni_codigo = :uni_codigo,'
      '  grp_codigo = :grp_codigo,'
      '  sgr_codigo = :sgr_codigo,'
      '  mar_codigo = :mar_codigo,'
      '  pro_codbarras = :pro_codbarras,'
      '  tip_codigo = :tip_codigo,'
      '  pro_classfisc = :pro_classfisc,'
      '  pro_vlrunitario = :pro_vlrunitario,'
      '  pro_credicms = :pro_credicms,'
      '  pro_vlrfrete = :pro_vlrfrete,'
      '  pro_vlroutras = :pro_vlroutras,'
      '  pro_vlrimport = :pro_vlrimport,'
      '  pro_vlrcusto = :pro_vlrcusto,'
      '  pro_mkpatac = :pro_mkpatac,'
      '  pro_mkpvar = :pro_mkpvar,'
      '  pro_vlratac = :pro_vlratac,'
      '  pro_vlrvar = :pro_vlrvar,'
      '  pro_mgmin = :pro_mgmin,'
      '  pro_desmax = :pro_desmax,'
      '  pro_movest = :pro_movest,'
      '  loc_codigo = :loc_codigo,'
      '  pro_dtcad = :pro_dtcad,'
      '  pro_estmin = :pro_estmin,'
      '  pro_estideal = :pro_estideal,'
      '  pro_pesobruto = :pro_pesobruto,'
      '  pro_pesoliq = :pro_pesoliq,'
      '  pro_origem = :pro_origem,'
      '  pro_inatzerar = :pro_inatzerar,'
      '  pro_ncm = :pro_ncm,'
      '  pro_embalagem = :pro_embalagem,'
      '  pro_codbarrasemb = :pro_codbarrasemb,'
      '  pro_cest = :pro_cest,'
      '  pro_status = :pro_status'
      'WHERE'
      '  produtos.pro_codigo = :OLD_pro_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 440
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pro_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'uni_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'grp_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sgr_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mar_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_codbarras'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tip_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_classfisc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_vlrunitario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_credicms'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_vlrfrete'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_vlroutras'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_vlrimport'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_vlrcusto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_mkpatac'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_mkpvar'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_vlratac'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_vlrvar'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_mgmin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_desmax'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_movest'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'loc_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_dtcad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_estmin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_estideal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_pesobruto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_pesoliq'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_origem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_inatzerar'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_ncm'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_embalagem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_codbarrasemb'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_cest'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_pro_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyPlanoContas: TZQuery
    Connection = database
    UpdateObject = updPlanoContas
    BeforePost = qyPlanoContasBeforePost
    AfterPost = qyPlanoContasAfterPost
    BeforeDelete = qyPlanoContasBeforeDelete
    AfterDelete = qyPlanoContasAfterDelete
    OnPostError = qyPlanoContasPostError
    SQL.Strings = (
      'select'
      'plc_codigo, plc_descricao, plc_tipo'
      'from planocontas'
      'order by plc_descricao')
    Params = <>
    Left = 536
    Top = 240
    object qyPlanoContasplc_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'plc_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyPlanoContasplc_descricao: TWideStringField
      DisplayLabel = 'Plano de Contas'
      FieldName = 'plc_descricao'
      Required = True
      Size = 30
    end
    object qyPlanoContasplc_tipo: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'plc_tipo'
      Required = True
      Size = 1
    end
  end
  object updPlanoContas: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM planocontas'
      'WHERE'
      '  planocontas.plc_codigo = :OLD_plc_codigo')
    InsertSQL.Strings = (
      'INSERT INTO planocontas'
      '  (plc_codigo, plc_descricao, plc_tipo)'
      'VALUES'
      '  (:plc_codigo, :plc_descricao, :plc_tipo)')
    ModifySQL.Strings = (
      'UPDATE planocontas SET'
      '  plc_codigo = :plc_codigo,'
      '  plc_descricao = :plc_descricao,'
      '  plc_tipo = :plc_tipo'
      'WHERE'
      '  planocontas.plc_codigo = :OLD_plc_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 624
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'plc_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'plc_descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'plc_tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_plc_codigo'
        ParamType = ptUnknown
      end>
  end
  object updUnidades: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM unidades'
      'WHERE'
      '  unidades.uni_codigo = :OLD_uni_codigo')
    InsertSQL.Strings = (
      'INSERT INTO unidades'
      '  (uni_codigo, uni_descricao)'
      'VALUES'
      '  (:uni_codigo, :uni_descricao)')
    ModifySQL.Strings = (
      'UPDATE unidades SET'
      '  uni_codigo = :uni_codigo,'
      '  uni_descricao = :uni_descricao'
      'WHERE'
      '  unidades.uni_codigo = :OLD_uni_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 304
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'uni_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'uni_descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_uni_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyUnidades: TZQuery
    Connection = database
    UpdateObject = updUnidades
    BeforePost = qyUnidadesBeforePost
    AfterPost = qyUnidadesAfterPost
    BeforeDelete = qyUnidadesBeforeDelete
    AfterDelete = qyUnidadesAfterDelete
    OnPostError = qyUnidadesPostError
    SQL.Strings = (
      'select'
      'uni_codigo, uni_descricao'
      'from unidades'
      'order by uni_descricao')
    Params = <>
    Left = 232
    Top = 312
    object qyUnidadesuni_codigo: TWideStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'uni_codigo'
      Required = True
      Size = 2
    end
    object qyUnidadesuni_descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'uni_descricao'
      Required = True
      Size = 15
    end
  end
  object qyUsuarios: TZQuery
    Connection = database
    UpdateObject = updUsuarios
    AfterInsert = qyUsuariosAfterInsert
    BeforePost = qyUsuariosBeforePost
    AfterPost = qyUsuariosAfterPost
    BeforeDelete = qyUsuariosBeforeDelete
    AfterDelete = qyUsuariosAfterDelete
    OnPostError = qyUsuariosPostError
    SQL.Strings = (
      'select u.usu_codigo, u.usu_nome, u.usu_senha,'
      'u.usu_ativo, u.ace_codigo, a.ace_descricao,'
      'u.usu_userapp, u.usu_senhaapp'
      'from usuarios u, acesso a'
      'where u.ace_codigo = a.ace_codigo'
      'and u.usu_codigo > 0'
      'order by u.usu_nome')
    Params = <>
    Left = 48
    Top = 376
    object qyUsuariosusu_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'usu_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyUsuariosusu_nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'usu_nome'
      Required = True
    end
    object qyUsuariosusu_senha: TWideStringField
      DisplayLabel = 'Senha'
      FieldName = 'usu_senha'
      Required = True
      Visible = False
    end
    object qyUsuariosusu_ativo: TWideStringField
      DisplayLabel = 'Atvo'
      FieldName = 'usu_ativo'
      Required = True
      Size = 1
    end
    object qyUsuariosace_codigo: TIntegerField
      DisplayLabel = 'N'#237'vel de Acesso'
      FieldName = 'ace_codigo'
      Required = True
      Visible = False
    end
    object qyUsuariosace_descricao: TWideStringField
      DisplayLabel = 'Acesso'
      FieldName = 'ace_descricao'
      Required = True
    end
    object qyUsuariosusu_userapp: TIntegerField
      DisplayLabel = 'Usu'#225'rio App'
      FieldName = 'usu_userapp'
      Required = True
      Visible = False
    end
    object qyUsuariosusu_senhaapp: TWideStringField
      DisplayLabel = 'Senha App'
      FieldName = 'usu_senhaapp'
      Visible = False
      Size = 10
    end
  end
  object qyUsuMails: TZQuery
    Connection = database
    UpdateObject = updUsuMails
    BeforePost = qyUsuMailsBeforePost
    AfterPost = qyUsuMailsAfterPost
    BeforeDelete = qyUsuMailsBeforeDelete
    AfterDelete = qyUsuMailsAfterDelete
    OnPostError = qyUsuMailsPostError
    SQL.Strings = (
      'select'
      'usu_codigo, mai_host, mai_username, mai_password, mai_namefrom,'
      
        'mai_adressfrom, mai_porta, mai_authtype, mai_sslmethod, mai_sslm' +
        'ode, mai_usetls'
      'from usumails'
      'where'
      'usu_codigo = 0')
    Params = <>
    Left = 424
    Top = 376
    object qyUsuMailsusu_codigo: TIntegerField
      DisplayLabel = 'C'#243'd. Usu'#225'rio'
      FieldName = 'usu_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyUsuMailsmai_host: TWideStringField
      DisplayLabel = 'Host'
      FieldName = 'mai_host'
      Required = True
      Size = 50
    end
    object qyUsuMailsmai_username: TWideStringField
      DisplayLabel = 'User Name'
      FieldName = 'mai_username'
      Required = True
      Size = 50
    end
    object qyUsuMailsmai_password: TWideStringField
      DisplayLabel = 'Password'
      FieldName = 'mai_password'
      Required = True
      Visible = False
      Size = 30
    end
    object qyUsuMailsmai_namefrom: TWideStringField
      DisplayLabel = 'Name From'
      FieldName = 'mai_namefrom'
      Required = True
      Size = 50
    end
    object qyUsuMailsmai_adressfrom: TWideStringField
      DisplayLabel = 'Adress From'
      FieldName = 'mai_adressfrom'
      Required = True
      Size = 50
    end
    object qyUsuMailsmai_porta: TIntegerField
      DisplayLabel = 'Porta'
      FieldName = 'mai_porta'
      Required = True
    end
    object qyUsuMailsmai_authtype: TIntegerField
      DisplayLabel = 'Auth Type'
      FieldName = 'mai_authtype'
      Required = True
    end
    object qyUsuMailsmai_sslmethod: TIntegerField
      DisplayLabel = 'SSL Method'
      FieldName = 'mai_sslmethod'
      Required = True
    end
    object qyUsuMailsmai_sslmode: TIntegerField
      DisplayLabel = 'SSL Mode'
      FieldName = 'mai_sslmode'
      Required = True
    end
    object qyUsuMailsmai_usetls: TIntegerField
      DisplayLabel = 'Use TLS'
      FieldName = 'mai_usetls'
      Required = True
    end
  end
  object updUsuarios: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM usuarios'
      'WHERE'
      '  usuarios.usu_codigo = :OLD_usu_codigo')
    InsertSQL.Strings = (
      'INSERT INTO usuarios'
      
        '  (usu_codigo, usu_nome, usu_senha, usu_ativo, ace_codigo, usu_u' +
        'serapp, '
      '   usu_senhaapp)'
      'VALUES'
      
        '  (:usu_codigo, :usu_nome, :usu_senha, :usu_ativo, :ace_codigo, ' +
        ':usu_userapp, '
      '   :usu_senhaapp)')
    ModifySQL.Strings = (
      'UPDATE usuarios SET'
      '  usu_codigo = :usu_codigo,'
      '  usu_nome = :usu_nome,'
      '  usu_senha = :usu_senha,'
      '  usu_ativo = :usu_ativo,'
      '  ace_codigo = :ace_codigo,'
      '  usu_userapp = :usu_userapp,'
      '  usu_senhaapp = :usu_senhaapp'
      'WHERE'
      '  usuarios.usu_codigo = :OLD_usu_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 112
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'usu_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'usu_nome'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'usu_senha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'usu_ativo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ace_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'usu_userapp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'usu_senhaapp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_usu_codigo'
        ParamType = ptUnknown
      end>
  end
  object updUsuMails: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM usumails'
      'WHERE'
      '  usumails.usu_codigo = :OLD_usu_codigo')
    InsertSQL.Strings = (
      'INSERT INTO usumails'
      
        '  (usu_codigo, mai_host, mai_username, mai_password, mai_namefro' +
        'm, mai_adressfrom, '
      
        '   mai_porta, mai_authtype, mai_sslmethod, mai_sslmode, mai_uset' +
        'ls)'
      'VALUES'
      
        '  (:usu_codigo, :mai_host, :mai_username, :mai_password, :mai_na' +
        'mefrom, '
      
        '   :mai_adressfrom, :mai_porta, :mai_authtype, :mai_sslmethod, :' +
        'mai_sslmode, '
      '   :mai_usetls)')
    ModifySQL.Strings = (
      'UPDATE usumails SET'
      '  usu_codigo = :usu_codigo,'
      '  mai_host = :mai_host,'
      '  mai_username = :mai_username,'
      '  mai_password = :mai_password,'
      '  mai_namefrom = :mai_namefrom,'
      '  mai_adressfrom = :mai_adressfrom,'
      '  mai_porta = :mai_porta,'
      '  mai_authtype = :mai_authtype,'
      '  mai_sslmethod = :mai_sslmethod,'
      '  mai_sslmode = :mai_sslmode,'
      '  mai_usetls = :mai_usetls'
      'WHERE'
      '  usumails.usu_codigo = :OLD_usu_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 496
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'usu_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mai_host'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mai_username'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mai_password'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mai_namefrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mai_adressfrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mai_porta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mai_authtype'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mai_sslmethod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mai_sslmode'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mai_usetls'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_usu_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyUsuariosMod: TZQuery
    Connection = database
    UpdateObject = updUsuariosMod
    AfterInsert = qyUsuariosModAfterInsert
    BeforePost = qyUsuariosModBeforePost
    AfterPost = qyUsuariosModAfterPost
    BeforeDelete = qyUsuariosModBeforeDelete
    AfterDelete = qyUsuariosModAfterDelete
    OnPostError = qyUsuariosModPostError
    SQL.Strings = (
      'select usu_codigo, usm_erp, usm_comandas, usm_delivery'
      'from usuariosmod')
    Params = <>
    Left = 224
    Top = 376
    object qyUsuariosModusu_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'usu_codigo'
      Required = True
    end
    object qyUsuariosModusm_erp: TIntegerField
      DisplayLabel = 'ERP'
      FieldName = 'usm_erp'
      Required = True
    end
    object qyUsuariosModusm_comandas: TIntegerField
      DisplayLabel = 'Comandas'
      FieldName = 'usm_comandas'
      Required = True
    end
    object qyUsuariosModusm_delivery: TIntegerField
      DisplayLabel = 'Delivery'
      FieldName = 'usm_delivery'
      Required = True
    end
  end
  object updUsuariosMod: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM usuariosmod'
      'WHERE'
      '  usuariosmod.usu_codigo = :OLD_usu_codigo')
    InsertSQL.Strings = (
      'INSERT INTO usuariosmod'
      '  (usu_codigo, usm_erp, usm_comandas, usm_delivery)'
      'VALUES'
      '  (:usu_codigo, :usm_erp, :usm_comandas, :usm_delivery)')
    ModifySQL.Strings = (
      'UPDATE usuariosmod SET'
      '  usu_codigo = :usu_codigo,'
      '  usm_erp = :usm_erp,'
      '  usm_comandas = :usm_comandas,'
      '  usm_delivery = :usm_delivery'
      'WHERE'
      '  usuariosmod.usu_codigo = :OLD_usu_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 304
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'usu_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'usm_erp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'usm_comandas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'usm_delivery'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_usu_codigo'
        ParamType = ptUnknown
      end>
  end
end
