object dmTemp: TdmTemp
  OldCreateOrder = False
  Height = 397
  Width = 587
  object mdPagar: TJvMemoryData
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'Vencimento'
        DataType = ftDate
      end
      item
        Name = 'Emissao'
        DataType = ftDate
      end
      item
        Name = 'Numero'
        DataType = ftInteger
      end
      item
        Name = 'Parcela'
        DataType = ftInteger
      end
      item
        Name = 'Duplicata'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'PesCodigo'
        DataType = ftInteger
      end
      item
        Name = 'Valor'
        DataType = ftFloat
      end
      item
        Name = 'Pago'
        DataType = ftFloat
      end
      item
        Name = 'Acrescimo'
        DataType = ftFloat
      end
      item
        Name = 'Desconto'
        DataType = ftFloat
      end
      item
        Name = 'Saldo'
        DataType = ftFloat
      end
      item
        Name = 'ChaveNFE'
        DataType = ftString
        Size = 44
      end
      item
        Name = 'StaCodigo'
        DataType = ftInteger
      end>
    KeyFieldNames = 'PAG_VENCIMENTO'
    Left = 32
    Top = 32
    object mdPagarCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      Visible = False
    end
    object mdPagarVencimento: TDateField
      FieldName = 'Vencimento'
      EditMask = '!99/99/0000;1;_'
    end
    object mdPagarEmissao: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'Emissao'
      EditMask = '!99/99/0000;1;_'
    end
    object mdPagarNumero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'Numero'
    end
    object mdPagarSerie: TIntegerField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'Serie'
      DisplayFormat = '00'
    end
    object mdPagarModelo: TStringField
      FieldName = 'Modelo'
      Size = 2
    end
    object mdPagarParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object mdPagarDuplicata: TStringField
      FieldName = 'Duplicata'
      Size = 15
    end
    object mdPagarPesCodigo: TIntegerField
      FieldName = 'PesCodigo'
      Visible = False
    end
    object mdPagarValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#,###,###,##0.00'
    end
    object mdPagarPago: TFloatField
      FieldName = 'Pago'
      DisplayFormat = '#,###,###,##0.00'
    end
    object mdPagarAcrescimo: TFloatField
      FieldName = 'Acrescimo'
      DisplayFormat = '#,###,###,##0.00'
    end
    object mdPagarDesconto: TFloatField
      FieldName = 'Desconto'
      DisplayFormat = '#,###,###,##0.00'
    end
    object mdPagarSaldo: TFloatField
      FieldName = 'Saldo'
      DisplayFormat = '#,###,###,##0.00'
    end
    object mdPagarChaveNFE: TStringField
      DisplayLabel = 'Chave NFE'
      FieldName = 'ChaveNFE'
      Size = 44
    end
    object mdPagarStaCodigo: TIntegerField
      FieldName = 'StaCodigo'
      Visible = False
    end
    object mdPagarNome: TStringField
      DisplayWidth = 50
      FieldName = 'Nome'
      Visible = False
      Size = 50
    end
  end
  object mdServico: TJvMemoryData
    FieldDefs = <>
    Left = 136
    Top = 32
    object mdServicopro_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'pro_codigo'
      DisplayFormat = '000,000'
    end
    object mdServicopro_descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 100
      FieldName = 'pro_descricao'
      Size = 100
    end
    object mdServicouni_codigo: TStringField
      DisplayLabel = 'Un.'
      DisplayWidth = 2
      FieldName = 'uni_codigo'
      Size = 2
    end
  end
  object mdReceber: TJvMemoryData
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'Vencimento'
        DataType = ftDate
      end
      item
        Name = 'Numero'
        DataType = ftInteger
      end
      item
        Name = 'Serie'
        DataType = ftInteger
      end
      item
        Name = 'Mod'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Parcela'
        DataType = ftInteger
      end
      item
        Name = 'Valor'
        DataType = ftFloat
      end
      item
        Name = 'Pago'
        DataType = ftFloat
      end
      item
        Name = 'Acrescimo'
        DataType = ftFloat
      end
      item
        Name = 'Desconto'
        DataType = ftFloat
      end
      item
        Name = 'Saldo'
        DataType = ftFloat
      end
      item
        Name = 'Emissao'
        DataType = ftDate
      end
      item
        Name = 'Duplicata'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'PesCodigo'
        DataType = ftInteger
      end
      item
        Name = 'CodStatus'
        DataType = ftInteger
      end>
    KeyFieldNames = 'Codigo'
    Left = 32
    Top = 121
    object mdReceberVencimento: TDateField
      DisplayWidth = 10
      FieldName = 'Vencimento'
      DisplayFormat = 'dd/MM/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object mdReceberCodigo: TIntegerField
      DisplayWidth = 10
      FieldName = 'Codigo'
    end
    object mdReceberNumero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      DisplayWidth = 10
      FieldName = 'Numero'
      DisplayFormat = '000,000'
    end
    object mdReceberSerie: TIntegerField
      DisplayLabel = 'S'#233'rie'
      DisplayWidth = 6
      FieldName = 'Serie'
      DisplayFormat = '00'
    end
    object mdReceberMod: TStringField
      DisplayWidth = 2
      FieldName = 'Mod'
      Size = 2
    end
    object mdReceberParcela: TIntegerField
      DisplayWidth = 6
      FieldName = 'Parcela'
      DisplayFormat = '00'
    end
    object mdReceberValor: TFloatField
      DisplayWidth = 10
      FieldName = 'Valor'
      DisplayFormat = '#,###,###,##0.00'
    end
    object mdReceberPago: TFloatField
      DisplayWidth = 10
      FieldName = 'Pago'
      DisplayFormat = '#,###,###,##0.00'
    end
    object mdReceberAcrescimo: TFloatField
      DisplayLabel = 'Acr'#233'scimo'
      DisplayWidth = 10
      FieldName = 'Acrescimo'
      DisplayFormat = '#,###,###,##0.00'
    end
    object mdReceberDesconto: TFloatField
      DisplayWidth = 10
      FieldName = 'Desconto'
      DisplayFormat = '#,###,###,##0.00'
    end
    object mdReceberSaldo: TFloatField
      DisplayWidth = 10
      FieldName = 'Saldo'
      DisplayFormat = '#,###,###,##0.00'
    end
    object mdReceberEmissao: TDateField
      DisplayLabel = 'Emiss'#227'o'
      DisplayWidth = 10
      FieldName = 'Emissao'
      Visible = False
      DisplayFormat = 'dd/MM/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object mdReceberDuplicata: TStringField
      DisplayWidth = 12
      FieldName = 'Duplicata'
      Visible = False
      Size = 12
    end
    object mdReceberPesCodigo: TIntegerField
      DisplayWidth = 10
      FieldName = 'PesCodigo'
      Visible = False
    end
    object mdReceberCodForma: TIntegerField
      DisplayLabel = 'Cod. Forma'
      FieldName = 'CodForma'
      Visible = False
    end
    object mdReceberCodStatus: TIntegerField
      DisplayWidth = 10
      FieldName = 'CodStatus'
      Visible = False
    end
  end
  object mdCartoes: TJvMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'Lancamento'
        DataType = ftInteger
      end
      item
        Name = 'Data'
        DataType = ftDate
      end
      item
        Name = 'CodConta'
        DataType = ftInteger
      end
      item
        Name = 'Conta'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Valor'
        DataType = ftFloat
      end>
    Left = 136
    Top = 120
    object mdCartoesLancamento: TIntegerField
      DisplayLabel = 'Lan'#231'amento'
      FieldName = 'Lancamento'
      DisplayFormat = '000'
    end
    object mdCartoesData: TDateField
      DisplayWidth = 10
      FieldName = 'Data'
      DisplayFormat = 'dd/MM/yyyy'
      EditMask = '!90:00:0000>LL;1;_'
    end
    object mdCartoesCodConta: TIntegerField
      DisplayLabel = 'C'#243'd.'
      DisplayWidth = 10
      FieldName = 'CodConta'
      DisplayFormat = '000'
    end
    object mdCartoesConta: TStringField
      DisplayWidth = 30
      FieldName = 'Conta'
      Size = 30
    end
    object mdCartoesValor: TFloatField
      DisplayWidth = 10
      FieldName = 'Valor'
      DisplayFormat = '#,###,###,##0.00'
    end
  end
  object mdEntManual: TJvMemoryData
    FieldDefs = <>
    Left = 32
    Top = 200
    object mdEntManualLancamento: TIntegerField
      DisplayLabel = 'Lan'#231'amento'
      FieldName = 'Lancamento'
      DisplayFormat = '000'
    end
    object mdEntManualCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      DisplayFormat = '000,000'
    end
    object mdEntManualDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'Descricao'
      Size = 100
    end
    object mdEntManualQuantidade: TFloatField
      FieldName = 'Quantidade'
      DisplayFormat = '#,###,###,##0.00'
    end
    object mdEntManualValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#,###,###,##0.000'
    end
  end
  object mdAgendaTemp: TJvMemoryData
    FieldDefs = <>
    Left = 248
    Top = 32
    object mdAgendaTempDataAg: TDateField
      FieldName = 'DataAg'
    end
    object mdAgendaTempHoraAg: TTimeField
      FieldName = 'HoraAg'
      DisplayFormat = 'hh:mm'
      EditMask = 'hh:mm;1;_'
    end
  end
end
