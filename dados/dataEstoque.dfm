inherited dmEstoque: TdmEstoque
  OldCreateOrder = True
  object qyProdutosEst: TZQuery
    Connection = database
    UpdateObject = updProdutosEst
    BeforePost = qyProdutosEstBeforePost
    AfterPost = qyProdutosEstAfterPost
    BeforeDelete = qyProdutosEstBeforeDelete
    AfterDelete = qyProdutosEstAfterDelete
    OnPostError = qyProdutosEstPostError
    SQL.Strings = (
      'SELECT'
      'PRO_CODIGO, EST_FISICO, EST_RESERVAS, EST_DISPONIVEL'
      'FROM PRODUTOSEST'
      'ORDER BY PRO_CODIGO')
    Params = <>
    Left = 40
    Top = 96
    object qyProdutosEstpro_codigo: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'pro_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyProdutosEstest_fisico: TFloatField
      DisplayLabel = 'Est. F'#237'sico'
      FieldName = 'est_fisico'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
    object qyProdutosEstest_reservas: TFloatField
      DisplayLabel = 'Reservas'
      FieldName = 'est_reservas'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
    object qyProdutosEstest_disponivel: TFloatField
      DisplayLabel = 'Est. Dispon'#237'vel'
      FieldName = 'est_disponivel'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
  end
  object updProdutosEst: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM PRODUTOSEST'
      'WHERE'
      '  PRODUTOSEST.pro_codigo = :OLD_pro_codigo')
    InsertSQL.Strings = (
      'INSERT INTO PRODUTOSEST'
      '  (pro_codigo, est_fisico, est_reservas, est_disponivel)'
      'VALUES'
      '  (:pro_codigo, :est_fisico, :est_reservas, :est_disponivel)')
    ModifySQL.Strings = (
      'UPDATE PRODUTOSEST SET'
      '  pro_codigo = :pro_codigo,'
      '  est_fisico = :est_fisico,'
      '  est_reservas = :est_reservas,'
      '  est_disponivel = :est_disponivel'
      'WHERE'
      '  PRODUTOSEST.pro_codigo = :OLD_pro_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 120
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pro_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'est_fisico'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'est_reservas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'est_disponivel'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_pro_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyProdutosFor: TZQuery
    Connection = database
    UpdateObject = updProdutosFor
    BeforePost = qyProdutosForBeforePost
    AfterPost = qyProdutosForAfterPost
    BeforeDelete = qyProdutosForBeforeDelete
    AfterDelete = qyProdutosForAfterDelete
    OnPostError = qyProdutosForPostError
    SQL.Strings = (
      'select'
      
        'p.pro_codigo, e.pro_descricao, p.pes_codigo, f.pes_nome, p.prf_r' +
        'eferencia,'
      'p.pro_codbarras, p.prf_unidadecp, p.prf_unidadevd'
      'from produtosfor p, pessoas f, produtos e'
      'where p.pro_codigo = e.pro_codigo'
      'and p.pes_codigo = f.pes_codigo')
    Params = <>
    Left = 248
    Top = 96
    object qyProdutosForpro_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pro_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyProdutosForpro_descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'pro_descricao'
      Required = True
      Size = 100
    end
    object qyProdutosForpes_codigo: TIntegerField
      DisplayLabel = 'Cod. Fornecedor'
      FieldName = 'pes_codigo'
      Required = True
      Visible = False
    end
    object qyProdutosForpes_nome: TWideStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'pes_nome'
      Required = True
      Size = 60
    end
    object qyProdutosForprf_referencia: TWideStringField
      DisplayLabel = 'Refer'#234'ncia'
      FieldName = 'prf_referencia'
      Required = True
    end
    object qyProdutosForpro_codbarras: TWideStringField
      DisplayLabel = 'Cod. Barras'
      FieldName = 'pro_codbarras'
      Size = 13
    end
    object qyProdutosForprf_unidadecp: TFloatField
      DisplayLabel = 'Un. Compra'
      FieldName = 'prf_unidadecp'
      Required = True
    end
    object qyProdutosForprf_unidadevd: TFloatField
      DisplayLabel = 'Un. Venda'
      FieldName = 'prf_unidadevd'
      Required = True
    end
  end
  object updProdutosFor: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM produtosfor'
      'WHERE'
      '  produtosfor.pro_codigo = :OLD_pro_codigo AND'
      '  produtosfor.pes_codigo = :OLD_pes_codigo')
    InsertSQL.Strings = (
      'INSERT INTO produtosfor'
      
        '  (pro_codigo, pes_codigo, prf_referencia, pro_codbarras, prf_un' +
        'idadecp, '
      '   prf_unidadevd)'
      'VALUES'
      
        '  (:pro_codigo, :pes_codigo, :prf_referencia, :pro_codbarras, :p' +
        'rf_unidadecp, '
      '   :prf_unidadevd)')
    ModifySQL.Strings = (
      'UPDATE produtosfor SET'
      '  pro_codigo = :pro_codigo,'
      '  pes_codigo = :pes_codigo,'
      '  prf_referencia = :prf_referencia,'
      '  pro_codbarras = :pro_codbarras,'
      '  prf_unidadecp = :prf_unidadecp,'
      '  prf_unidadevd = :prf_unidadevd'
      'WHERE'
      '  produtosfor.pro_codigo = :OLD_pro_codigo AND'
      '  produtosfor.pes_codigo = :OLD_pes_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 328
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pro_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prf_referencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_codbarras'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prf_unidadecp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prf_unidadevd'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_pro_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_pes_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyProdutosMov: TZQuery
    Connection = database
    UpdateObject = updProdutosMov
    AfterInsert = qyProdutosMovAfterInsert
    BeforePost = qyProdutosMovBeforePost
    AfterPost = qyProdutosMovAfterPost
    BeforeDelete = qyProdutosMovBeforeDelete
    AfterDelete = qyProdutosMovAfterDelete
    OnPostError = qyProdutosMovPostError
    SQL.Strings = (
      'select'
      
        'prm_codigo, pro_codigo, prm_data, prm_quantidade, pes_codigo, pr' +
        'm_tipo, prm_nota,'
      'prm_serie, prm_modelo, prm_valor'
      'from produtosmov'
      'order by prm_codigo')
    Params = <>
    Left = 40
    Top = 168
    object qyProdutosMovprm_codigo: TIntegerField
      DisplayLabel = 'Cod. Mov.'
      FieldName = 'prm_codigo'
      Required = True
      Visible = False
    end
    object qyProdutosMovpro_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pro_codigo'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyProdutosMovprm_data: TDateField
      DisplayLabel = 'Data'
      FieldName = 'prm_data'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qyProdutosMovprm_quantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'prm_quantidade'
      Required = True
      DisplayFormat = '#,###,###,##0.000'
    end
    object qyProdutosMovpes_codigo: TIntegerField
      DisplayLabel = 'Cod. Pessoa'
      FieldName = 'pes_codigo'
      Required = True
    end
    object qyProdutosMovprm_tipo: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'prm_tipo'
      Required = True
      Size = 3
    end
    object qyProdutosMovprm_nota: TIntegerField
      DisplayLabel = 'Nota'
      FieldName = 'prm_nota'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyProdutosMovprm_serie: TIntegerField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'prm_serie'
      Required = True
      DisplayFormat = '00'
    end
    object qyProdutosMovprm_modelo: TIntegerField
      DisplayLabel = 'Modelo'
      FieldName = 'prm_modelo'
      Required = True
      DisplayFormat = '00'
    end
    object qyProdutosMovprm_valor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'prm_valor'
      Required = True
      DisplayFormat = '#,###,###,##0.00'
    end
  end
  object updProdutosMov: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM produtosmov'
      'WHERE'
      '  produtosmov.prm_codigo = :OLD_prm_codigo')
    InsertSQL.Strings = (
      'INSERT INTO produtosmov'
      
        '  (prm_codigo, pro_codigo, prm_data, prm_quantidade, pes_codigo,' +
        ' prm_tipo, '
      '   prm_nota, prm_serie, prm_modelo, prm_valor)'
      'VALUES'
      
        '  (:prm_codigo, :pro_codigo, :prm_data, :prm_quantidade, :pes_co' +
        'digo, :prm_tipo, '
      '   :prm_nota, :prm_serie, :prm_modelo, :prm_valor)')
    ModifySQL.Strings = (
      'UPDATE produtosmov SET'
      '  prm_codigo = :prm_codigo,'
      '  pro_codigo = :pro_codigo,'
      '  prm_data = :prm_data,'
      '  prm_quantidade = :prm_quantidade,'
      '  pes_codigo = :pes_codigo,'
      '  prm_tipo = :prm_tipo,'
      '  prm_nota = :prm_nota,'
      '  prm_serie = :prm_serie,'
      '  prm_modelo = :prm_modelo,'
      '  prm_valor = :prm_valor'
      'WHERE'
      '  produtosmov.prm_codigo = :OLD_prm_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 120
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'prm_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prm_data'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prm_quantidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pes_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prm_tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prm_nota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prm_serie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prm_modelo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'prm_valor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_prm_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyProdutosComp: TZQuery
    Connection = database
    UpdateObject = updProdutosComp
    BeforePost = qyProdutosCompBeforePost
    AfterPost = qyProdutosCompAfterPost
    BeforeDelete = qyProdutosCompBeforeDelete
    AfterDelete = qyProdutosCompAfterDelete
    OnPostError = qyProdutosCompPostError
    SQL.Strings = (
      'select'
      
        'c.pro_codcomp, c.pro_codigo, p.pro_descricao, p.uni_codigo, p.pr' +
        'o_vlratac,'
      'p.pro_vlrvar'
      'from produtoscomp c, produtos p'
      'where c.pro_codigo = p.pro_codigo')
    Params = <>
    Left = 248
    Top = 168
    object qyProdutosComppro_codcomp: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pro_codcomp'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyProdutosComppro_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pro_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyProdutosComppro_descricao: TWideStringField
      DisplayLabel = 'Produto Complementar'
      FieldName = 'pro_descricao'
      Required = True
      Size = 100
    end
    object qyProdutosCompuni_codigo: TWideStringField
      DisplayLabel = 'Un.'
      FieldName = 'uni_codigo'
      Required = True
      Size = 2
    end
    object qyProdutosComppro_vlratac: TFloatField
      DisplayLabel = 'Vlr. Atac.'
      FieldName = 'pro_vlratac'
      Required = True
      DisplayFormat = '#,###,###,##0.0000'
    end
    object qyProdutosComppro_vlrvar: TFloatField
      DisplayLabel = 'Vlr. Varejo'
      FieldName = 'pro_vlrvar'
      Required = True
      DisplayFormat = '#,###,###,##0.0000'
    end
  end
  object updProdutosComp: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM produtoscomp'
      'WHERE'
      '  produtoscomp.pro_codigo = :OLD_pro_codigo AND'
      '  produtoscomp.pro_codcomp = :OLD_pro_codcomp')
    InsertSQL.Strings = (
      'INSERT INTO produtoscomp'
      '  (pro_codigo, pro_codcomp)'
      'VALUES'
      '  (:pro_codigo, :pro_codcomp)')
    ModifySQL.Strings = (
      'UPDATE produtoscomp SET'
      '  pro_codigo = :pro_codigo,'
      '  pro_codcomp = :pro_codcomp'
      'WHERE'
      '  produtoscomp.pro_codigo = :OLD_pro_codigo AND'
      '  produtoscomp.pro_codcomp = :OLD_pro_codcomp')
    UseSequenceFieldForRefreshSQL = False
    Left = 336
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pro_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_codcomp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_pro_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_pro_codcomp'
        ParamType = ptUnknown
      end>
  end
  object qyProdutosObs: TZQuery
    Connection = database
    UpdateObject = updProdutosObs
    BeforePost = qyProdutosObsBeforePost
    AfterPost = qyProdutosObsAfterPost
    BeforeDelete = qyProdutosObsBeforeDelete
    AfterDelete = qyProdutosObsAfterDelete
    OnPostError = qyProdutosObsPostError
    SQL.Strings = (
      'select pro_codigo, pro_obs from produtosobs')
    Params = <>
    Left = 40
    Top = 240
    object qyProdutosObspro_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pro_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyProdutosObspro_obs: TWideStringField
      DisplayLabel = 'Obs'
      FieldName = 'pro_obs'
      Size = 1000
    end
  end
  object updProdutosObs: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM produtosobs'
      'WHERE'
      '  produtosobs.pro_codigo = :OLD_pro_codigo')
    InsertSQL.Strings = (
      'INSERT INTO produtosobs'
      '  (pro_codigo, pro_obs)'
      'VALUES'
      '  (:pro_codigo, :pro_obs)')
    ModifySQL.Strings = (
      'UPDATE produtosobs SET'
      '  pro_codigo = :pro_codigo,'
      '  pro_obs = :pro_obs'
      'WHERE'
      '  produtosobs.pro_codigo = :OLD_pro_codigo')
    UseSequenceFieldForRefreshSQL = False
    Left = 120
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pro_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_obs'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_pro_codigo'
        ParamType = ptUnknown
      end>
  end
  object qyProdutosSim: TZQuery
    Connection = database
    UpdateObject = updProdutosSim
    BeforePost = qyProdutosSimBeforePost
    AfterPost = qyProdutosSimAfterPost
    BeforeDelete = qyProdutosSimBeforeDelete
    AfterDelete = qyProdutosSimAfterDelete
    OnPostError = qyProdutosSimPostError
    SQL.Strings = (
      'select'
      's.pro_codsim, s.pro_codigo, p.pro_descricao, p.uni_codigo,'
      'p.pro_vlratac, p.pro_vlrvar'
      'from produtossim s, produtos p'
      'where s.pro_codigo = p.pro_codigo')
    Params = <>
    Left = 248
    Top = 240
    object qyProdutosSimpro_codsim: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pro_codsim'
      Required = True
      DisplayFormat = '000,000'
    end
    object qyProdutosSimpro_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'pro_codigo'
      Required = True
      Visible = False
      DisplayFormat = '000,000'
    end
    object qyProdutosSimpro_descricao: TWideStringField
      DisplayLabel = 'Produto Similar'
      FieldName = 'pro_descricao'
      Required = True
      Size = 100
    end
    object qyProdutosSimuni_codigo: TWideStringField
      DisplayLabel = 'Un.'
      FieldName = 'uni_codigo'
      Required = True
      Size = 2
    end
    object qyProdutosSimpro_vlratac: TFloatField
      DisplayLabel = 'Vlr. Atac.'
      FieldName = 'pro_vlratac'
      Required = True
      DisplayFormat = '#,###,###,##0.0000'
    end
    object qyProdutosSimpro_vlrvar: TFloatField
      DisplayLabel = 'Vlr. Varejo'
      FieldName = 'pro_vlrvar'
      Required = True
      DisplayFormat = '#,###,###,##0.0000'
    end
  end
  object updProdutosSim: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM produtossim'
      'WHERE'
      '  produtossim.pro_codigo = :OLD_pro_codigo AND'
      '  produtossim.pro_codsim = :OLD_pro_codsim')
    InsertSQL.Strings = (
      'INSERT INTO produtossim'
      '  (pro_codigo, pro_codsim)'
      'VALUES'
      '  (:pro_codigo, :pro_codsim)')
    ModifySQL.Strings = (
      'UPDATE produtossim SET'
      '  pro_codigo = :pro_codigo,'
      '  pro_codsim = :pro_codsim'
      'WHERE'
      '  produtossim.pro_codigo = :OLD_pro_codigo AND'
      '  produtossim.pro_codsim = :OLD_pro_codsim')
    UseSequenceFieldForRefreshSQL = False
    Left = 336
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pro_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pro_codsim'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_pro_codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_pro_codsim'
        ParamType = ptUnknown
      end>
  end
end
