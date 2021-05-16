inherited dmLookups: TdmLookups
  OldCreateOrder = True
  inherited database: TZConnection
    Left = 32
    Top = 8
  end
  inherited QGeraCodigo: TZQuery
    Left = 192
    Top = 8
  end
  inherited QTemp: TZQuery
    Left = 280
    Top = 8
  end
  object qyLkSubGruposCad: TZQuery
    Connection = database
    SQL.Strings = (
      'select sgr_descricao, sgr_codigo, grp_codigo,'
      'sgr_mkpatac, sgr_mkpvar from subgrupos'
      'where grp_codigo = 0'
      'order by sgr_descricao')
    Params = <>
    Left = 408
    Top = 8
    object qyLkSubGruposCadsgr_descricao: TWideStringField
      DisplayLabel = 'Subgrupo'
      FieldName = 'sgr_descricao'
      Required = True
      Size = 25
    end
    object qyLkSubGruposCadsgr_codigo: TIntegerField
      DisplayLabel = 'Cod. Subgrupo'
      FieldName = 'sgr_codigo'
      Required = True
    end
    object qyLkSubGruposCadgrp_codigo: TIntegerField
      DisplayLabel = 'Cod. Grupo'
      FieldName = 'grp_codigo'
      Required = True
      Visible = False
    end
    object qyLkSubGruposCadsgr_mkpatac: TFloatField
      DisplayLabel = 'Margem Atac.'
      FieldName = 'sgr_mkpatac'
      Required = True
      Visible = False
    end
    object qyLkSubGruposCadsgr_mkpvar: TFloatField
      DisplayLabel = 'Margem Varejo'
      FieldName = 'sgr_mkpvar'
      Required = True
      Visible = False
    end
  end
  object qyLkClientes: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'pes_nome, pes_nomefantasia, pes_documento, pes_codigo,'
      'pes_logradouro'
      'from pessoas'
      'where pes_cliente = '#39'S'#39
      'order by pes_nome')
    Params = <>
    Left = 560
    Top = 8
    object qyLkClientespes_nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'pes_nome'
      Required = True
      Size = 60
    end
    object qyLkClientespes_nomefantasia: TWideStringField
      DisplayLabel = 'Nome Fantasia/ Apelido'
      FieldName = 'pes_nomefantasia'
      Required = True
      Size = 50
    end
    object qyLkClientespes_documento: TWideStringField
      DisplayLabel = 'Documento'
      FieldName = 'pes_documento'
      Required = True
      Size = 18
    end
    object qyLkClientespes_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pes_codigo'
      Required = True
    end
    object qyLkClientespes_logradouro: TWideStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'pes_logradouro'
      Required = True
      Size = 50
    end
  end
  object qyLkAcesso: TZQuery
    Connection = database
    SQL.Strings = (
      'select '
      'ace_codigo, ace_descricao'
      'from acesso'
      'order by ace_descricao')
    Params = <>
    Left = 32
    Top = 72
    object qyLkAcessoace_codigo: TIntegerField
      DisplayLabel = 'Cod. Acesso'
      FieldName = 'ace_codigo'
      Required = True
    end
    object qyLkAcessoace_descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'ace_descricao'
      Required = True
    end
  end
  object qyLkBancos: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'ban_descricao, ban_codigo'
      'from bancos'
      'order by ban_descricao')
    Params = <>
    Left = 128
    Top = 72
    object qyLkBancosban_descricao: TWideStringField
      DisplayLabel = 'Banco'
      FieldName = 'ban_descricao'
      Required = True
      Size = 50
    end
    object qyLkBancosban_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ban_codigo'
      Required = True
      DisplayFormat = '000'
    end
  end
  object qyLkCidades: TZQuery
    Connection = database
    SQL.Strings = (
      'select cid_municipio, cid_codigo, uf_sigla, cid_ceppadrao'
      'from cidades'
      'order by cid_municipio')
    Params = <>
    Left = 224
    Top = 72
    object qyLkCidadescid_municipio: TWideStringField
      DisplayLabel = 'Munic'#237'pio'
      FieldName = 'cid_municipio'
      Required = True
      Size = 50
    end
    object qyLkCidadescid_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'cid_codigo'
      Required = True
    end
    object qyLkCidadesuf_sigla: TWideStringField
      DisplayLabel = 'UF'
      FieldName = 'uf_sigla'
      Required = True
      Size = 2
    end
    object qyLkCidadescid_ceppadrao: TWideStringField
      DisplayLabel = 'CEP Padr'#227'o'
      FieldName = 'cid_ceppadrao'
      Size = 9
    end
  end
  object qyLkContas: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'con_descricao, con_codigo, ban_codigo'
      'from contas'
      'order by con_descricao')
    Params = <>
    Left = 408
    Top = 72
    object qyLkContascon_descricao: TWideStringField
      DisplayLabel = 'Conta'
      FieldName = 'con_descricao'
      Required = True
      Size = 30
    end
    object qyLkContascon_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'con_codigo'
      Required = True
    end
    object qyLkContasban_codigo: TIntegerField
      DisplayLabel = 'Cod. Banco'
      FieldName = 'ban_codigo'
      Required = True
      DisplayFormat = '000'
    end
  end
  object qyLkContaDeb: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'con_descricao, con_codigo, ban_codigo'
      'from contas'
      'order by con_descricao')
    Params = <>
    Left = 512
    Top = 72
    object qyLkContaDebcon_descricao: TWideStringField
      DisplayLabel = 'Conta'
      FieldName = 'con_descricao'
      Required = True
      Size = 30
    end
    object qyLkContaDebcon_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'con_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyLkContaDebban_codigo: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'ban_codigo'
      Required = True
    end
  end
  object qyLkContaCred: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'con_descricao, con_codigo, ban_codigo'
      'from contas'
      'order by con_descricao')
    Params = <>
    Left = 608
    Top = 72
    object qyLkContaCredcon_descricao: TWideStringField
      DisplayLabel = 'Conta'
      FieldName = 'con_descricao'
      Required = True
      Size = 30
    end
    object qyLkContaCredcon_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'con_codigo'
      Required = True
    end
    object qyLkContaCredban_codigo: TIntegerField
      DisplayLabel = 'Cod. Banco'
      FieldName = 'ban_codigo'
      Required = True
    end
  end
  object qyLkContaLanc: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'con_descricao, con_codigo, ban_codigo'
      'from contas'
      'order by con_descricao')
    Params = <>
    Left = 704
    Top = 72
    object qyLkContaLanccon_descricao: TWideStringField
      DisplayLabel = 'Conta'
      FieldName = 'con_descricao'
      Required = True
      Size = 30
    end
    object qyLkContaLanccon_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'con_codigo'
      Required = True
    end
    object qyLkContaLancban_codigo: TIntegerField
      DisplayLabel = 'Cod. Banco'
      FieldName = 'ban_codigo'
      Required = True
    end
  end
  object qyLkEmailsDest: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'emd_endereco, emd_codigo'
      'from emailsdest'
      'order by emd_endereco')
    Params = <>
    Left = 32
    Top = 136
    object qyLkEmailsDestemd_endereco: TWideStringField
      DisplayLabel = 'e-mail'
      FieldName = 'emd_endereco'
      Required = True
      Size = 50
    end
    object qyLkEmailsDestemd_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'emd_codigo'
      Required = True
      Visible = False
    end
  end
  object qyLkEntrega: TZQuery
    Connection = database
    SQL.Strings = (
      'select ent_descricao, ent_codigo'
      'from entrega'
      'order by ent_descricao')
    Params = <>
    Left = 128
    Top = 136
    object qyLkEntregaent_descricao: TWideStringField
      DisplayLabel = 'Entrega'
      FieldName = 'ent_descricao'
      Required = True
    end
    object qyLkEntregaent_codigo: TIntegerField
      DisplayLabel = 'Cod. Entrega'
      FieldName = 'ent_codigo'
      Required = True
    end
  end
  object qyLkTpEndereco: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'tpe_descricao, tpe_codigo'
      'from enderecostipo'
      'order by tpe_descricao')
    Params = <>
    Left = 224
    Top = 136
    object qyLkTpEnderecotpe_descricao: TWideStringField
      DisplayLabel = 'Tp. Endere'#231'o'
      FieldName = 'tpe_descricao'
      Required = True
    end
    object qyLkTpEnderecotpe_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'tpe_codigo'
      Required = True
    end
  end
  object qyLkEndEletroTipo: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'tpn_descricao, tpn_codigo'
      'from'
      'endeletrotipo'
      'order by tpn_descricao')
    Params = <>
    Left = 312
    Top = 136
    object qyLkEndEletroTipotpn_descricao: TWideStringField
      DisplayLabel = 'Tp. Endere'#231'o'
      FieldName = 'tpn_descricao'
    end
    object qyLkEndEletroTipotpn_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'tpn_codigo'
      Required = True
    end
  end
  object qyLkFornecedores: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'pes_nome, pes_nomefantasia, pes_codigo'
      'from pessoas'
      'where pes_fornecedor = '#39'S'#39
      'order by pes_nome')
    Params = <>
    Left = 416
    Top = 136
    object qyLkFornecedorespes_nome: TWideStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'pes_nome'
      Required = True
      Size = 60
    end
    object qyLkFornecedorespes_nomefantasia: TWideStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'pes_nomefantasia'
      Required = True
      Size = 50
    end
    object qyLkFornecedorespes_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pes_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
  end
  object qyLkFormPag: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'frp_descricao, frp_codigo'
      'from formpag'
      'where frp_ativo = '#39'S'#39
      'order by frp_descricao')
    Params = <>
    Left = 512
    Top = 136
    object qyLkFormPagfrp_descricao: TWideStringField
      DisplayLabel = 'Forma Pag.'
      FieldName = 'frp_descricao'
      Required = True
    end
    object qyLkFormPagfrp_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'frp_codigo'
      Required = True
    end
  end
  object qyLkFuncionarios: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'fun_nome, fun_codigo'
      'from funcionarios'
      'where fun_ativo = '#39'S'#39
      'order by fun_nome')
    Params = <>
    Left = 608
    Top = 136
    object qyLkFuncionariosfun_nome: TWideStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'fun_nome'
      Required = True
      Size = 50
    end
    object qyLkFuncionariosfun_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'fun_codigo'
      Required = True
    end
  end
  object qyLkFuncoes: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'fnc_descricao, fnc_codigo'
      'from funcoes'
      'order by fnc_descricao')
    Params = <>
    Left = 704
    Top = 136
    object qyLkFuncoesfnc_descricao: TWideStringField
      DisplayLabel = 'Fun'#231#245'es'
      FieldName = 'fnc_descricao'
      Required = True
    end
    object qyLkFuncoesfnc_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'fnc_codigo'
      Required = True
    end
  end
  object qyLkGrupos: TZQuery
    Connection = database
    SQL.Strings = (
      'select grp_descricao, grp_codigo from grupos'
      'order by grp_descricao')
    Params = <>
    Left = 32
    Top = 200
    object qyLkGruposgrp_descricao: TWideStringField
      DisplayLabel = 'Grupos'
      FieldName = 'grp_descricao'
      Required = True
      Size = 25
    end
    object qyLkGruposgrp_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'grp_codigo'
      Required = True
    end
  end
  object qyLkLocalizacao: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'loc_descricao, loc_codigo'
      'from localizacao'
      'order by loc_descricao')
    Params = <>
    Left = 200
    Top = 200
    object qyLkLocalizacaoloc_descricao: TWideStringField
      DisplayLabel = 'Localiza'#231#227'o'
      FieldName = 'loc_descricao'
      Required = True
    end
    object qyLkLocalizacaoloc_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'loc_codigo'
      Required = True
    end
  end
  object qyLkMarcas: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'mar_descricao, mar_codigo'
      'from marcas'
      'order by mar_descricao')
    Params = <>
    Left = 288
    Top = 200
    object qyLkMarcasmar_descricao: TWideStringField
      DisplayLabel = 'Marcas'
      FieldName = 'mar_descricao'
      Required = True
      Size = 25
    end
    object qyLkMarcasmar_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'mar_codigo'
      Required = True
      DisplayFormat = '000'
    end
  end
  object qyLkModDoc: TZQuery
    Connection = database
    SQL.Strings = (
      'select mdc_descricao, mdc_codigo'
      'from moddoc'
      'order by mdc_descricao')
    Params = <>
    Left = 448
    Top = 200
    object qyLkModDocmdc_descricao: TWideStringField
      DisplayLabel = 'Modo'
      FieldName = 'mdc_descricao'
      Required = True
      Size = 55
    end
    object qyLkModDocmdc_codigo: TWideStringField
      DisplayLabel = 'Cod.'
      FieldName = 'mdc_codigo'
      Required = True
      Size = 2
    end
  end
  object qyLkModFrete: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'mdf_descricao, mdf_codigo, mdf_fiscal'
      'from modfrete'
      'order by mdf_descricao')
    Params = <>
    Left = 536
    Top = 200
    object qyLkModFretemdf_descricao: TWideStringField
      DisplayLabel = 'Mod. Frete'
      FieldName = 'mdf_descricao'
      Required = True
    end
    object qyLkModFretemdf_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'mdf_codigo'
      Required = True
    end
    object qyLkModFretemdf_fiscal: TWideStringField
      DisplayLabel = 'Fiscal'
      FieldName = 'mdf_fiscal'
      Required = True
    end
  end
  object qyLkPais: TZQuery
    Connection = database
    SQL.Strings = (
      'select pai_pais, pai_codigo'
      'from pais'
      'order by pai_pais')
    Params = <>
    Left = 624
    Top = 200
    object qyLkPaispai_pais: TWideStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'pai_pais'
      Required = True
      Size = 50
    end
    object qyLkPaispai_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pai_codigo'
      Required = True
    end
  end
  object qyLkPessoas: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'pes_nome, pes_nomefantasia, pes_codigo'
      'from pessoas'
      'order by pes_nome')
    Params = <>
    Left = 704
    Top = 200
    object qyLkPessoaspes_nome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'pes_nome'
      Required = True
      Size = 60
    end
    object qyLkPessoaspes_nomefantasia: TWideStringField
      DisplayLabel = 'Nome fantasia'
      FieldName = 'pes_nomefantasia'
      Required = True
      Size = 50
    end
    object qyLkPessoaspes_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pes_codigo'
      Required = True
    end
  end
  object qyLkPlanoContas: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'plc_descricao, plc_codigo, plc_tipo'
      'from'
      'planocontas'
      'order by plc_descricao')
    Params = <>
    Left = 32
    Top = 272
    object qyLkPlanoContasplc_descricao: TWideStringField
      DisplayLabel = 'Plano de contas'
      FieldName = 'plc_descricao'
      Required = True
      Size = 30
    end
    object qyLkPlanoContasplc_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'plc_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyLkPlanoContasplc_tipo: TWideStringField
      DisplayLabel = 'Tp'
      FieldName = 'plc_tipo'
      Required = True
      Size = 1
    end
  end
  object qyLkPlanoContasEnt: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'plc_descricao, plc_codigo, plc_tipo'
      'from'
      'planocontas'
      'where plc_tipo = '#39'C'#39
      'order by plc_descricao')
    Params = <>
    Left = 120
    Top = 272
    object qyLkPlanoContasEntplc_descricao: TWideStringField
      DisplayLabel = 'Plano de Contas'
      FieldName = 'plc_descricao'
      Required = True
      Size = 30
    end
    object qyLkPlanoContasEntplc_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'plc_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyLkPlanoContasEntplc_tipo: TWideStringField
      DisplayLabel = 'Tp'
      FieldName = 'plc_tipo'
      Required = True
      Size = 1
    end
  end
  object qyLkPlanoContasSai: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'plc_descricao, plc_codigo, plc_tipo'
      'from'
      'planocontas'
      'where plc_tipo = '#39'D'#39
      'order by plc_descricao')
    Params = <>
    Left = 224
    Top = 272
    object qyLkPlanoContasSaiplc_descricao: TWideStringField
      DisplayLabel = 'Plano de Contas'
      FieldName = 'plc_descricao'
      Required = True
      Size = 30
    end
    object qyLkPlanoContasSaiplc_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'plc_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyLkPlanoContasSaiplc_tipo: TWideStringField
      DisplayLabel = 'Tp'
      FieldName = 'plc_tipo'
      Required = True
      Size = 1
    end
  end
  object qyLkPrazos: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'prz_codigo, prz_descricao, prz_parcelas, prz_juros'
      'from prazos'
      'order by prz_descricao')
    Params = <>
    Left = 424
    Top = 272
    object qyLkPrazosprz_descricao: TWideStringField
      DisplayLabel = 'Prazos'
      FieldName = 'prz_descricao'
      Required = True
      Size = 30
    end
    object qyLkPrazosprz_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'prz_codigo'
      Required = True
    end
    object qyLkPrazosprz_parcelas: TIntegerField
      DisplayLabel = 'Parcelas'
      FieldName = 'prz_parcelas'
      Required = True
    end
    object qyLkPrazosprz_juros: TFloatField
      DisplayLabel = 'Juros'
      FieldName = 'prz_juros'
      Required = True
      DisplayFormat = '##0.0'
    end
  end
  object qyLkPrazosFrp: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'p.prz_codigo, p.frp_codigo, f.frp_descricao'
      'from prazosfrp p, formpag f'
      'where p.frp_codigo = f.frp_codigo'
      'order by f.frp_descricao')
    Params = <>
    Left = 520
    Top = 272
    object qyLkPrazosFrpprz_codigo: TIntegerField
      FieldName = 'prz_codigo'
      Required = True
    end
    object qyLkPrazosFrpfrp_codigo: TIntegerField
      FieldName = 'frp_codigo'
      Required = True
    end
    object qyLkPrazosFrpfrp_descricao: TWideStringField
      FieldName = 'frp_descricao'
      Required = True
    end
  end
  object qyLkProdutos: TZQuery
    Connection = database
    SQL.Strings = (
      'select '
      'pro_descricao, pro_codigo, uni_codigo'
      'from'
      'produtos'
      'order by pro_descricao')
    Params = <>
    Left = 608
    Top = 272
    object qyLkProdutospro_descricao: TWideStringField
      DisplayLabel = 'Produtos / Servi'#231'os'
      DisplayWidth = 100
      FieldName = 'pro_descricao'
      Required = True
      Size = 100
    end
    object qyLkProdutospro_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'pro_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyLkProdutosuni_codigo: TWideStringField
      DisplayLabel = 'UN'
      DisplayWidth = 2
      FieldName = 'uni_codigo'
      Required = True
      Size = 2
    end
  end
  object qyLkServicos: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'pro_descricao, pro_codigo, uni_codigo'
      'from'
      'produtos'
      'where tip_codigo = 9'
      'order by pro_descricao')
    Params = <>
    Left = 336
    Top = 336
    object qyLkServicospro_descricao: TWideStringField
      DisplayLabel = 'Servi'#231'os'
      FieldName = 'pro_descricao'
      Required = True
      Size = 100
    end
    object qyLkServicospro_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pro_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyLkServicosuni_codigo: TWideStringField
      DisplayLabel = 'UN'
      FieldName = 'uni_codigo'
      Required = True
      Size = 2
    end
  end
  object qyLkRegime: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'reg_descricao, reg_codigo'
      'from regime'
      'order by reg_descricao')
    Params = <>
    Left = 224
    Top = 336
    object qyLkRegimereg_descricao: TWideStringField
      DisplayLabel = 'Regime'
      FieldName = 'reg_descricao'
      Required = True
      Size = 60
    end
    object qyLkRegimereg_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'reg_codigo'
      Required = True
    end
  end
  object qyLkSetor: TZQuery
    Connection = database
    SQL.Strings = (
      'select '
      'set_descricao, set_codigo'
      'from setor'
      'order by set_descricao')
    Params = <>
    Left = 416
    Top = 336
    object qyLkSetorset_descricao: TWideStringField
      DisplayLabel = 'Setores'
      FieldName = 'set_descricao'
      Required = True
    end
    object qyLkSetorset_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'set_codigo'
      Required = True
    end
  end
  object qyLkStatusMov: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'sta_descricao, sta_codigo'
      'from statusmov'
      'order by sta_descricao')
    Params = <>
    Left = 520
    Top = 336
    object qyLkStatusMovsta_descricao: TWideStringField
      DisplayLabel = 'Status'
      FieldName = 'sta_descricao'
      Required = True
    end
    object qyLkStatusMovsta_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'sta_codigo'
      Required = True
    end
  end
  object qyLkStatusOrc: TZQuery
    Connection = database
    SQL.Strings = (
      'select sto_descricao, sto_codigo '
      'from statusorc'
      'order by sto_descricao')
    Params = <>
    Left = 624
    Top = 336
    object qyLkStatusOrcsto_descricao: TWideStringField
      DisplayLabel = 'Status'
      FieldName = 'sto_descricao'
      Required = True
    end
    object qyLkStatusOrcsto_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'sto_codigo'
      Required = True
    end
  end
  object qyLkSubGrupos: TZQuery
    Connection = database
    SQL.Strings = (
      'select '
      'sgr_descricao, sgr_codigo, grp_codigo, sgr_mkpatac, sgr_mkpvar'
      'from'
      'subgrupos'
      'order by sgr_descricao')
    Params = <>
    Left = 712
    Top = 336
    object qyLkSubGrupossgr_descricao: TWideStringField
      DisplayLabel = 'Subgrupo'
      FieldName = 'sgr_descricao'
      Required = True
      Size = 25
    end
    object qyLkSubGrupossgr_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'sgr_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyLkSubGruposgrp_codigo: TIntegerField
      DisplayLabel = 'Cod. Grupo'
      FieldName = 'grp_codigo'
      Required = True
    end
    object qyLkSubGrupossgr_mkpatac: TFloatField
      DisplayLabel = 'Margem atac.'
      FieldName = 'sgr_mkpatac'
      Required = True
      DisplayFormat = '#00.0'
    end
    object qyLkSubGrupossgr_mkpvar: TFloatField
      DisplayLabel = 'Margem Var.'
      FieldName = 'sgr_mkpvar'
      Required = True
      DisplayFormat = '#00.0'
    end
  end
  object qyLkTipoItem: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'tip_descricao, tip_codigo'
      'from tipoitem'
      'order by tip_descricao')
    Params = <>
    Left = 32
    Top = 400
    object qyLkTipoItemtip_descricao: TWideStringField
      DisplayLabel = 'Tipo Item'
      FieldName = 'tip_descricao'
      Required = True
      Size = 30
    end
    object qyLkTipoItemtip_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'tip_codigo'
      Required = True
    end
  end
  object qyLkTpFone: TZQuery
    Connection = database
    SQL.Strings = (
      'select tpf_descricao, tpf_codigo, tpf_mascara'
      'from fonestipo'
      'order by tpf_descricao')
    Params = <>
    Left = 120
    Top = 400
    object qyLkTpFonetpf_descricao: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'tpf_descricao'
      Required = True
    end
    object qyLkTpFonetpf_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'tpf_codigo'
      Required = True
    end
    object qyLkTpFonetpf_mascara: TWideStringField
      DisplayLabel = 'M'#225'scara'
      FieldName = 'tpf_mascara'
      Required = True
    end
  end
  object qyLkTpLogradouro: TZQuery
    Connection = database
    SQL.Strings = (
      'select tpl_descricao, tpl_codigo'
      'from logradourostipo'
      'order by tpl_descricao')
    Params = <>
    Left = 216
    Top = 400
    object qyLkTpLogradourotpl_descricao: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'tpl_descricao'
      Required = True
    end
    object qyLkTpLogradourotpl_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'tpl_codigo'
      Required = True
    end
  end
  object qyLkTransportadoras: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'pes_nome, pes_nomefantasia, pes_codigo'
      'from pessoas'
      'where pes_transportadora = '#39'S'#39
      'order by pes_nome')
    Params = <>
    Left = 336
    Top = 400
    object qyLkTransportadoraspes_nome: TWideStringField
      DisplayLabel = 'Transportadora'
      FieldName = 'pes_nome'
      Required = True
      Size = 60
    end
    object qyLkTransportadoraspes_nomefantasia: TWideStringField
      DisplayLabel = 'Nome fantasia'
      FieldName = 'pes_nomefantasia'
      Required = True
      Size = 50
    end
    object qyLkTransportadoraspes_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pes_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
  end
  object qyLkUnidades: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'uni_descricao, uni_codigo'
      'from unidades'
      'order by uni_descricao')
    Params = <>
    Left = 432
    Top = 400
    object qyLkUnidadesuni_descricao: TWideStringField
      DisplayLabel = 'Unidades'
      FieldName = 'uni_descricao'
      Required = True
      Size = 15
    end
    object qyLkUnidadesuni_codigo: TWideStringField
      DisplayLabel = 'Cod.'
      FieldName = 'uni_codigo'
      Required = True
      Size = 2
    end
  end
  object qyLkUf: TZQuery
    Connection = database
    SQL.Strings = (
      'select uf_estado, uf_sigla, uf_codigo'
      'from uf'
      'order by uf_estado')
    Params = <>
    Left = 520
    Top = 400
    object qyLkUfuf_estado: TWideStringField
      DisplayLabel = 'Estado'
      FieldName = 'uf_estado'
      Required = True
      Size = 25
    end
    object qyLkUfuf_sigla: TWideStringField
      DisplayLabel = 'UF'
      FieldName = 'uf_sigla'
      Required = True
      Size = 2
    end
    object qyLkUfuf_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'uf_codigo'
      Required = True
    end
  end
  object qyLkUsuarios: TZQuery
    Connection = database
    SQL.Strings = (
      'select usu_nome, usu_codigo'
      'from usuarios'
      'where usu_codigo > 0'
      'order by usu_nome')
    Params = <>
    Left = 720
    Top = 400
    object qyLkUsuariosusu_nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'usu_nome'
      Required = True
    end
    object qyLkUsuariosusu_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'usu_codigo'
      Required = True
    end
  end
  object qyLkVendedores: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'fun_nome, fun_codigo'
      'from funcionarios'
      'where fun_ativo = '#39'S'#39
      'and fnc_codigo = 5'
      'order by fun_nome')
    Params = <>
    Left = 32
    Top = 456
    object qyLkVendedoresfun_nome: TWideStringField
      DisplayLabel = 'Vendedores'
      FieldName = 'fun_nome'
      Required = True
      Size = 50
    end
    object qyLkVendedoresfun_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'fun_codigo'
      Required = True
      DisplayFormat = '000'
    end
  end
  object qyLkPlanoContasTp: TZQuery
    Connection = database
    SQL.Strings = (
      'select plt_codigo, plt_descricao'
      'from planocontastp'
      'order by plt_codigo')
    Params = <>
    Left = 328
    Top = 272
    object qyLkPlanoContasTpplt_codigo: TWideStringField
      DisplayLabel = 'Abrev.'
      FieldName = 'plt_codigo'
      Required = True
      Size = 1
    end
    object qyLkPlanoContasTpplt_descricao: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'plt_descricao'
      Required = True
      Size = 10
    end
  end
  object qyLkIndPag: TZQuery
    Connection = database
    SQL.Strings = (
      'select inp_codigo, inp_descricao'
      'from indpag'
      'order by inp_codigo')
    Params = <>
    Left = 120
    Top = 200
    object qyLkIndPaginp_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'inp_codigo'
      Required = True
    end
    object qyLkIndPaginp_descricao: TWideStringField
      DisplayLabel = 'Indica'#231#227'o'
      FieldName = 'inp_descricao'
      Required = True
    end
  end
  object qyLkQuadras: TZQuery
    Connection = database
    SQL.Strings = (
      'select qda_descricao, qda_codigo from quadras'
      'where qda_codigo > 0'
      'order by qda_descricao')
    Params = <>
    Left = 32
    Top = 336
    object qyLkQuadrasqda_descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 20
      FieldName = 'qda_descricao'
      Required = True
    end
    object qyLkQuadrasqda_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'qda_codigo'
      Required = True
    end
  end
  object qyLkComandas: TZQuery
    Connection = database
    SQL.Strings = (
      'select'
      'cma_descricao, cma_codigo, cma_ativa'
      'from comandas'
      'where cma_ativa = 1'
      'order by cma_descricao')
    Params = <>
    Left = 312
    Top = 72
    object qyLkComandascma_descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'cma_descricao'
      Required = True
    end
    object qyLkComandascma_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'cma_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyLkComandascma_ativa: TIntegerField
      DisplayLabel = 'Ativa'
      FieldName = 'cma_ativa'
      Required = True
      Visible = False
    end
  end
  object qyLkMesas: TZQuery
    Connection = database
    SQL.Strings = (
      'select mes_descricao, mes_codigo, mes_ativa'
      'from mesas'
      'where mes_ativa = 1'
      'order by mes_descricao')
    Params = <>
    Left = 368
    Top = 200
    object qyLkMesasmes_descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'mes_descricao'
      Required = True
    end
    object qyLkMesasmes_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'mes_codigo'
      Required = True
      DisplayFormat = '000'
    end
    object qyLkMesasmes_ativa: TIntegerField
      DisplayLabel = 'Ativa'
      FieldName = 'mes_ativa'
      Required = True
      Visible = False
    end
  end
  object qyLkProdutosVenda: TZQuery
    Connection = database
    SQL.Strings = (
      'select '
      'pro_descricao, pro_codigo, uni_codigo'
      'from'
      'produtos'
      'where pro_status = '#39'A'#39
      'and tip_codigo = 0'
      'order by pro_descricao')
    Params = <>
    Left = 704
    Top = 272
    object qyLkProdutosVendapro_descricao: TWideStringField
      DisplayLabel = 'Produtos'
      FieldName = 'pro_descricao'
      Required = True
      Size = 100
    end
    object qyLkProdutosVendapro_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pro_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyLkProdutosVendauni_codigo: TWideStringField
      DisplayLabel = 'UN'
      FieldName = 'uni_codigo'
      Required = True
      Size = 2
    end
  end
end
