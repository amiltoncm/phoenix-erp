program Phoenix;

uses
  Vcl.Forms,
  uVarGlobal in '..\var\uVarGlobal.pas',
  uConstants in '..\var\uConstants.pas',
  uPrincipal in '..\view\estrutura\uPrincipal.pas' {frmPrincipal},
  uFuncoesSistema in '..\funcoes\uFuncoesSistema.pas',
  uTmpForm in '..\templates\uTmpForm.pas' {frmTmpForm},
  uTmpFormMDI in '..\templates\uTmpFormMDI.pas' {frmTmpFormMDI},
  uTmpFormNormal in '..\templates\uTmpFormNormal.pas' {frmTmpFormNormal},
  uTmpFormNormalMov in '..\templates\uTmpFormNormalMov.pas' {frmTmpFormNormalMov},
  uTmpCadastro in '..\templates\uTmpCadastro.pas' {frmTmpCadastro},
  uTmpConsultaNormal in '..\templates\uTmpConsultaNormal.pas' {frmTmpConsultaNormal},
  uTmpProcura in '..\templates\uTmpProcura.pas' {frmTmpProcura},
  uErConexao in '..\view\mensagens\uErConexao.pas' {frmErConexao},
  uCfgBase in '..\view\uteis\uCfgBase.pas' {frmCfgBase},
  dataTestSGDB in '..\dados\dataTestSGDB.pas' {dmTestSGDB: TDataModule},
  dataTmpConexao in '..\dados\dataTmpConexao.pas' {dmTmpConexao: TDataModule},
  dataCadastros in '..\dados\dataCadastros.pas' {dmCadastros: TDataModule},
  dataConfig in '..\dados\dataConfig.pas' {dmConfig: TDataModule},
  dataConsultas in '..\dados\dataConsultas.pas' {dmConsultas: TDataModule},
  dataLookups in '..\dados\dataLookups.pas' {dmLookups: TDataModule},
  uSenha in '..\view\estrutura\uSenha.pas' {frmSenha},
  uSobre in '..\view\mensagens\uSobre.pas' {frmSobre},
  uFuncoesSeguranca in '..\funcoes\uFuncoesSeguranca.pas',
  uFuncoesMail in '..\funcoes\uFuncoesMail.pas',
  uFuncoesLogs in '..\funcoes\uFuncoesLogs.pas',
  uClassConexao in '..\classes\uClassConexao.pas',
  uFuncoesString in '..\funcoes\uFuncoesString.pas',
  uTecladoVirtual in '..\view\uteis\uTecladoVirtual.pas' {frmTecladoVirtual},
  uFuncoesDB in '..\funcoes\uFuncoesDB.pas',
  uSql in '..\view\uteis\uSql.pas' {frmSQL},
  uFuncoesMsg in '..\funcoes\uFuncoesMsg.pas',
  uCadUsuarios in '..\view\cadastros\uCadUsuarios.pas' {frmCadUsuarios},
  uDaoSistema in '..\dao\uDaoSistema.pas',
  uProcUsuarios in '..\view\procuras\uProcUsuarios.pas' {frmProcUsuarios},
  uClassSistema in '..\classes\uClassSistema.pas',
  uDaoUsuarios in '..\dao\uDaoUsuarios.pas',
  uDaoBancos in '..\dao\uDaoBancos.pas',
  uCadBancos in '..\view\cadastros\uCadBancos.pas' {frmCadBancos},
  uProcBancos in '..\view\procuras\uProcBancos.pas' {frmProcBancos},
  uCadCidades in '..\view\cadastros\uCadCidades.pas' {frmCadCidades},
  uProcCidades in '..\view\procuras\uProcCidades.pas' {frmProcCidades},
  uDaoCidades in '..\dao\uDaoCidades.pas',
  uDaoLookups in '..\dao\uDaoLookups.pas',
  uDaoContas in '..\dao\uDaoContas.pas',
  uCadContas in '..\view\cadastros\uCadContas.pas' {frmCadContas},
  uProcContas in '..\view\procuras\uProcContas.pas' {frmProcContas},
  uConfig in '..\view\uteis\uConfig.pas' {frmConfig},
  uDaoConfig in '..\dao\uDaoConfig.pas',
  uClassConfig in '..\classes\uClassConfig.pas',
  uDaoEmpresa in '..\dao\uDaoEmpresa.pas',
  uEmpresa in '..\view\uteis\uEmpresa.pas' {frmEmpresa},
  dataPessoas in '..\dados\dataPessoas.pas' {dmPessoas: TDataModule},
  uCadPessoas in '..\view\cadastros\uCadPessoas.pas' {frmCadPessoas},
  uDaoPessoas in '..\dao\uDaoPessoas.pas',
  uProcPessoas in '..\view\procuras\uProcPessoas.pas' {frmProcPessoas},
  uTmpSenhaMaster in '..\templates\uTmpSenhaMaster.pas' {frmTmpSenhaMaster},
  uSenhaCfgBase in '..\view\mensagens\uSenhaCfgBase.pas' {frmSenhaCfgBase},
  uSenhaConfig in '..\view\mensagens\uSenhaConfig.pas' {frmSenhaConfig},
  uDaoEnderecos in '..\dao\uDaoEnderecos.pas',
  uFuncoesValidacao in '..\funcoes\uFuncoesValidacao.pas',
  uFuncoesFormatacao in '..\funcoes\uFuncoesFormatacao.pas',
  uDaoFones in '..\dao\uDaoFones.pas',
  uDaoEndEletro in '..\dao\uDaoEndEletro.pas',
  uDaoPlanocontas in '..\dao\uDaoPlanocontas.pas',
  uCadPlanocontas in '..\view\cadastros\uCadPlanocontas.pas' {frmCadPlanocontas},
  uProcPlanocontas in '..\view\procuras\uProcPlanocontas.pas' {frmProcPlanocontas},
  uDaoPessoasobs in '..\dao\uDaoPessoasobs.pas',
  dataDiversos in '..\dados\dataDiversos.pas' {dmDiversos: TDataModule},
  uDaoPais in '..\dao\uDaoPais.pas',
  uCadPais in '..\view\cadastros\uCadPais.pas' {frmCadPais},
  uProcPais in '..\view\procuras\uProcPais.pas' {frmProcPais},
  uCadSetor in '..\view\cadastros\uCadSetor.pas' {frmCadSetor},
  uDaoSetor in '..\dao\uDaoSetor.pas',
  uProcSetor in '..\view\procuras\uProcSetor.pas' {frmProcSetor},
  uDaoUf in '..\dao\uDaoUf.pas',
  uCadUf in '..\view\cadastros\uCadUf.pas' {frmCadUf},
  uProcUf in '..\view\procuras\uProcUf.pas' {frmProcUf},
  uDaoLogradourostipo in '..\dao\uDaoLogradourostipo.pas',
  uCadLogradourostipo in '..\view\cadastros\uCadLogradourostipo.pas' {frmCadLogradourostipo},
  uProcLogradourostipo in '..\view\procuras\uProcLogradourostipo.pas' {frmProcLogradourostipo},
  uCadEndeletrotipo in '..\view\cadastros\uCadEndeletrotipo.pas' {frmCadEndeletrotipo},
  uDaoEndeletrotipo in '..\dao\uDaoEndeletrotipo.pas',
  uProcEndeletrotipo in '..\view\procuras\uProcEndeletrotipo.pas' {frmProcEndeletrotipo},
  uDaoEnderecostipo in '..\dao\uDaoEnderecostipo.pas',
  uCadEnderecostipo in '..\view\cadastros\uCadEnderecostipo.pas' {frmCadEnderecostipo},
  uProcEnderecostipo in '..\view\procuras\uProcEnderecostipo.pas' {frmProcEnderecostipo},
  uDaoFonestipo in '..\dao\uDaoFonestipo.pas',
  uCadFonestipo in '..\view\cadastros\uCadFonestipo.pas' {frmCadFonestipo},
  uProcFonestipo in '..\view\procuras\uProcFonestipo.pas' {frmProcFonestipo},
  uFuncoesRegistro in '..\funcoes\uFuncoesRegistro.pas',
  uBuscaCEP in '..\view\uteis\uBuscaCEP.pas' {frmBuscaCEP},
  uConsultaCEP in '..\funcoes\uConsultaCEP.pas',
  uClassCep in '..\classes\uClassCep.pas',
  uFuncoesWeb in '..\funcoes\uFuncoesWeb.pas',
  uImpXMLPag in '..\view\movimentacoes\uImpXMLPag.pas' {frmImpXMLPag},
  dataFinanceiro in '..\dados\dataFinanceiro.pas' {dmFinanceiro: TDataModule},
  uDaoPagar in '..\dao\uDaoPagar.pas',
  uClassPagar in '..\classes\uClassPagar.pas',
  uCadPessoaMov in '..\view\cadastros\uCadPessoaMov.pas' {frmCadPessoaMov},
  uClassPessoas in '..\classes\uClassPessoas.pas',
  uFuncoesDatas in '..\funcoes\uFuncoesDatas.pas',
  uConfDuplicatas in '..\view\movimentacoes\uConfDuplicatas.pas' {frmConfDuplicatas},
  uAltDuplicataTmp in '..\view\movimentacoes\uAltDuplicataTmp.pas' {frmAltDuplicataTmp},
  uConsPagarGer in '..\view\consultas\uConsPagarGer.pas' {frmConsPagarGer},
  uDetPagar in '..\view\consultas\uDetPagar.pas' {frmDetPagar},
  uDaoConsPagar in '..\dao\uDaoConsPagar.pas',
  uConsPagar in '..\view\consultas\uConsPagar.pas' {frmConsPagar},
  uDaoCaixa in '..\dao\uDaoCaixa.pas',
  uClassCaixa in '..\classes\uClassCaixa.pas',
  uConfBxPagar in '..\view\movimentacoes\uConfBxPagar.pas' {frmConfBxPagar},
  uDaoConsultas in '..\dao\uDaoConsultas.pas',
  uLancPagMan in '..\view\movimentacoes\uLancPagMan.pas' {frmLancPagMan},
  dataTemp in '..\dados\dataTemp.pas' {dmTemp: TDataModule},
  uAltDuplicata in '..\view\movimentacoes\uAltDuplicata.pas' {frmAltDuplicata},
  uSaiCaixa in '..\view\movimentacoes\uSaiCaixa.pas' {frmSaiCaixa},
  uEntCaixa in '..\view\movimentacoes\uEntCaixa.pas' {frmEntCaixa},
  uTransfContas in '..\view\movimentacoes\uTransfContas.pas' {frmTransfContas},
  uConsCaixa in '..\view\consultas\uConsCaixa.pas' {frmConsCaixa},
  uConfigIni in '..\view\uteis\uConfigIni.pas' {frmConfigIni},
  uTmpRelFormNormal in '..\templates\uTmpRelFormNormal.pas' {frmTmpRelFormNormal},
  uRelCaixa in '..\view\relatorios\uRelCaixa.pas' {frmRelCaixa},
  uRelCaixaAg in '..\view\relatorios\uRelCaixaAg.pas' {frmRelCaixaAg},
  uRelCaixaDet in '..\view\relatorios\uRelCaixaDet.pas' {frmRelCaixaDet},
  uRelSaldoContas in '..\view\relatorios\uRelSaldoContas.pas' {frmRelSaldoContas},
  uRelPagar in '..\view\relatorios\uRelPagar.pas' {frmRelPagar},
  uSenhaEstacao in '..\view\mensagens\uSenhaEstacao.pas' {frmSenhaEstacao},
  uCfgMail in '..\view\uteis\uCfgMail.pas' {frmCfgMail},
  uDaoUsuMails in '..\dao\uDaoUsuMails.pas',
  uClassSendmail in '..\classes\uClassSendmail.pas',
  uCadGrupos in '..\view\cadastros\uCadGrupos.pas' {frmCadGrupos},
  uDaoGrupos in '..\dao\uDaoGrupos.pas',
  uProcGrupos in '..\view\procuras\uProcGrupos.pas' {frmProcGrupos},
  uDaoSubGrupos in '..\dao\uDaoSubGrupos.pas',
  uDaoUnidades in '..\dao\uDaoUnidades.pas',
  uCadUnidades in '..\view\cadastros\uCadUnidades.pas' {frmCadUnidades},
  uProcUnidades in '..\view\procuras\uProcUnidades.pas' {frmProcUnidades},
  uDaoMarcas in '..\dao\uDaoMarcas.pas',
  uCadMarcas in '..\view\cadastros\uCadMarcas.pas' {frmCadMarcas},
  uProcMarcas in '..\view\procuras\uProcMarcas.pas' {frmProcMarcas},
  uDaoLocalizacao in '..\dao\uDaoLocalizacao.pas',
  uProcLocalizacao in '..\view\procuras\uProcLocalizacao.pas' {frmProcLocalizacao},
  uCadLocalizacao in '..\view\cadastros\uCadLocalizacao.pas' {frmCadLocalizacao},
  uDaoProdutos in '..\dao\uDaoProdutos.pas',
  uCadProdutos in '..\view\cadastros\uCadProdutos.pas' {frmCadProdutos},
  uProcProdutos in '..\view\procuras\uProcProdutos.pas' {frmProcProdutos},
  uClassProdutos in '..\classes\uClassProdutos.pas',
  uDaoPrazos in '..\dao\uDaoPrazos.pas',
  uCadPrazos in '..\view\cadastros\uCadPrazos.pas' {frmCadPrazos},
  uProcPrazos in '..\view\procuras\uProcPrazos.pas' {frmProcPrazos},
  uCadFormpag in '..\view\cadastros\uCadFormpag.pas' {frmCadFormpag},
  uDaoFormpag in '..\dao\uDaoFormpag.pas',
  uProcFormpag in '..\view\procuras\uProcFormpag.pas' {frmProcFormpag},
  uDaoFuncoes in '..\dao\uDaoFuncoes.pas',
  uProcFuncoes in '..\view\procuras\uProcFuncoes.pas' {frmProcFuncoes},
  uCadFuncoes in '..\view\cadastros\uCadFuncoes.pas' {frmCadFuncoes},
  uDaoFuncionarios in '..\dao\uDaoFuncionarios.pas',
  uCadFuncionarios in '..\view\cadastros\uCadFuncionarios.pas' {frmCadFuncionarios},
  uProcFuncionarios in '..\view\procuras\uProcFuncionarios.pas' {frmProcFuncionarios},
  uClassCfgmail in '..\classes\uClassCfgmail.pas',
  uDaoOrcamentos in '..\dao\uDaoOrcamentos.pas',
  dataOrcamentos in '..\dados\dataOrcamentos.pas' {dmOrcamentos: TDataModule},
  uOrcamento in '..\view\movimentacoes\uOrcamento.pas' {frmOrcamento},
  uProcClientes in '..\view\procuras\uProcClientes.pas' {frmProcClientes},
  uDaoOrcItens in '..\dao\uDaoOrcItens.pas',
  uEstacoes in '..\view\uteis\uEstacoes.pas' {frmEstacoes},
  uConsOrcamentos in '..\view\consultas\uConsOrcamentos.pas' {frmConsOrcamentos},
  uDetOrcItens in '..\view\consultas\uDetOrcItens.pas' {frmDetOrcItens},
  uRelOrcamento in '..\view\relatorios\uRelOrcamento.pas' {frmRelOrcamento},
  uEnvMailOrc in '..\view\uteis\uEnvMailOrc.pas' {frmEnvMailOrc},
  uDaoEmailsdest in '..\dao\uDaoEmailsdest.pas',
  uClassEmailsdest in '..\classes\uClassEmailsdest.pas',
  uDetalhesOrc in '..\view\consultas\uDetalhesOrc.pas' {frmDetalhesOrc},
  uSenhaDetProd in '..\view\mensagens\uSenhaDetProd.pas' {frmSenhaDetProd},
  uSenhaDetOrc in '..\view\mensagens\uSenhaDetOrc.pas' {frmSenhaDetOrc},
  uDescOrc in '..\view\movimentacoes\uDescOrc.pas' {frmDescOrc},
  uSenhaDescOrcTot in '..\view\mensagens\uSenhaDescOrcTot.pas' {frmSenhaDescOrcTot},
  uSenhaMgMin in '..\view\mensagens\uSenhaMgMin.pas' {frmSenhaMgMin},
  uSenhaDescItem in '..\view\mensagens\uSenhaDescItem.pas' {frmSenhaDescItem},
  uSenhaMgOrc in '..\view\mensagens\uSenhaMgOrc.pas' {frmSenhaMgOrc},
  uDaoPrevendas in '..\dao\uDaoPrevendas.pas',
  uClassPrevendas in '..\classes\uClassPrevendas.pas',
  uPrevenda in '..\view\movimentacoes\uPrevenda.pas' {frmPrevenda},
  uClassPessoasend in '..\classes\uClassPessoasend.pas',
  uDaoPrevItens in '..\dao\uDaoPrevItens.pas',
  uSenhaMgPrev in '..\view\mensagens\uSenhaMgPrev.pas' {frmSenhaMgPrev},
  uSenhaDescItemPv in '..\view\mensagens\uSenhaDescItemPv.pas' {frmSenhaDescItemPv},
  uConsPreVendas in '..\view\consultas\uConsPreVendas.pas' {frmConsPreVendas},
  uRelPreVenda in '..\view\relatorios\uRelPreVenda.pas' {frmRelPreVenda},
  uClassPrevitens in '..\classes\uClassPrevitens.pas',
  uDetPVItens in '..\view\consultas\uDetPVItens.pas' {frmDetPVItens},
  uSenhaDetProdPV in '..\view\mensagens\uSenhaDetProdPV.pas' {frmSenhaDetProdPV},
  uDetalhesPV in '..\view\consultas\uDetalhesPV.pas' {frmDetalhesPV},
  uSenhaDetPrev in '..\view\mensagens\uSenhaDetPrev.pas' {frmSenhaDetPrev},
  uDescPrev in '..\view\movimentacoes\uDescPrev.pas' {frmDescPrev},
  uCondicoesPV in '..\view\movimentacoes\uCondicoesPV.pas' {frmCondicoesPV},
  uCadEnderecosAd in '..\view\cadastros\uCadEnderecosAd.pas' {frmCadEnderecosAd},
  uDaoPrevendent in '..\dao\uDaoPrevendent.pas',
  uClassPrevendent in '..\classes\uClassPrevendent.pas',
  uClassEnderecoent in '..\classes\uClassEnderecoent.pas',
  dataEstoque in '..\dados\dataEstoque.pas' {dmEstoque: TDataModule},
  uDaoProdutosEst in '..\dao\uDaoProdutosEst.pas',
  uClassProdutosest in '..\classes\uClassProdutosest.pas',
  uDaoProdutosMov in '..\dao\uDaoProdutosMov.pas',
  uClassProdutosmov in '..\classes\uClassProdutosmov.pas',
  uDaoPrevRes in '..\dao\uDaoPrevRes.pas',
  uClassPrevres in '..\classes\uClassPrevres.pas',
  uConsProdutos in '..\view\consultas\uConsProdutos.pas' {frmConsProdutos},
  uDaoProdutosFor in '..\dao\uDaoProdutosFor.pas',
  uClassProdutosFor in '..\classes\uClassProdutosFor.pas',
  uVincProdFor in '..\view\movimentacoes\uVincProdFor.pas' {frmVincProdFor},
  uSenhaCfgMail in '..\view\mensagens\uSenhaCfgMail.pas' {frmSenhaCfgMail},
  uClassUsumails in '..\classes\uClassUsumails.pas',
  uImpItensFor in '..\view\movimentacoes\uImpItensFor.pas' {frmImpItensFor},
  uCadProdutosImp in '..\view\cadastros\uCadProdutosImp.pas' {frmCadProdutosImp},
  uDaoPessoasFinanc in '..\dao\uDaoPessoasFinanc.pas',
  uBackupPG in '..\view\uteis\uBackupPG.pas' {frmBackupPG},
  uClassAgenda in '..\classes\uClassAgenda.pas',
  uDaoPrazosFrp in '..\dao\uDaoPrazosFrp.pas',
  uLancCheque in '..\view\movimentacoes\uLancCheque.pas' {frmLancCheque},
  uDaoCheques in '..\dao\uDaoCheques.pas',
  uClassCheques in '..\classes\uClassCheques.pas',
  uCadBancoMov in '..\view\cadastros\uCadBancoMov.pas' {frmCadBancoMov},
  uClassBancos in '..\classes\uClassBancos.pas',
  uPrazos in '..\view\movimentacoes\uPrazos.pas' {frmPrazos},
  uSenhaZeraJuros in '..\view\mensagens\uSenhaZeraJuros.pas' {frmSenhaZeraJuros},
  uClassReceber in '..\classes\uClassReceber.pas',
  uDaoReceber in '..\dao\uDaoReceber.pas',
  uCartoesPV in '..\view\movimentacoes\uCartoesPV.pas' {frmCartoesPV},
  uSenhaLibPagPV in '..\view\mensagens\uSenhaLibPagPV.pas' {frmSenhaLibPagPV},
  uSenhaReimpPV in '..\view\mensagens\uSenhaReimpPV.pas' {frmSenhaReimpPV},
  uRelPreVendaEfet in '..\view\relatorios\uRelPreVendaEfet.pas' {frmRelPreVendaEfet},
  uEntradaManual in '..\view\movimentacoes\uEntradaManual.pas' {frmEntradaManual},
  uDetProdMov in '..\view\consultas\uDetProdMov.pas' {frmDetProdMov},
  uSenhaDelPV in '..\view\mensagens\uSenhaDelPV.pas' {frmSenhaDelPV},
  uDaoProdutosComp in '..\dao\uDaoProdutosComp.pas',
  uDaoProdutosSim in '..\dao\uDaoProdutosSim.pas',
  uDaoProdutosObs in '..\dao\uDaoProdutosObs.pas',
  uClassProdutossim in '..\classes\uClassProdutossim.pas',
  uClassProdutoscomp in '..\classes\uClassProdutoscomp.pas',
  uConsReceber in '..\view\consultas\uConsReceber.pas' {frmConsReceber},
  uAltParcela in '..\view\movimentacoes\uAltParcela.pas' {frmAltParcela},
  uConfBxReceber in '..\view\movimentacoes\uConfBxReceber.pas' {frmConfBxReceber},
  uConsReceberGer in '..\view\consultas\uConsReceberGer.pas' {frmConsReceberGer},
  uDetReceber in '..\view\consultas\uDetReceber.pas' {frmDetReceber},
  uConsCartoes in '..\view\consultas\uConsCartoes.pas' {frmConsCartoes},
  uConsEstMin in '..\view\consultas\uConsEstMin.pas' {frmConsEstMin},
  uVerItensReserv in '..\view\consultas\uVerItensReserv.pas' {frmVerItensReserv},
  uConsEstNeg in '..\view\consultas\uConsEstNeg.pas' {frmConsEstNeg},
  uConsChequesGer in '..\view\consultas\uConsChequesGer.pas' {frmConsChequesGer},
  uRelComissoes in '..\view\relatorios\uRelComissoes.pas' {frmRelComissoes},
  uConsCheques in '..\view\consultas\uConsCheques.pas' {frmConsCheques},
  uDetCheques in '..\view\consultas\uDetCheques.pas' {frmDetCheques},
  uAltCheque in '..\view\movimentacoes\uAltCheque.pas' {frmAltCheque},
  uBxCheque in '..\view\movimentacoes\uBxCheque.pas' {frmBxCheque},
  uConsPreVendasGer in '..\view\consultas\uConsPreVendasGer.pas' {frmConsPreVendasGer},
  uDetalhesConsPV in '..\view\consultas\uDetalhesConsPV.pas' {frmDetalhesConsPV},
  uConsItensPV in '..\view\consultas\uConsItensPV.pas' {frmConsItensPV},
  uDaoCotacao in '..\dao\uDaoCotacao.pas',
  dataCompras in '..\dados\dataCompras.pas' {dmCompras: TDataModule},
  uCotacao in '..\view\movimentacoes\uCotacao.pas' {frmCotacao},
  uDaoCotItens in '..\dao\uDaoCotItens.pas',
  uDaoOrdCompra in '..\dao\uDaoOrdCompra.pas',
  uDaoOrdItens in '..\dao\uDaoOrdItens.pas',
  uProcFornecedores in '..\view\procuras\uProcFornecedores.pas' {frmProcFornecedores},
  uSplash in '..\view\estrutura\uSplash.pas' {frmSplash},
  uAgenda in '..\view\movimentacoes\uAgenda.pas' {frmAgenda},
  uDaoAgenda in '..\dao\uDaoAgenda.pas',
  uDaoQuadras in '..\dao\uDaoQuadras.pas',
  uCadQuadras in '..\view\cadastros\uCadQuadras.pas' {frmCadQuadras},
  uProcQuadras in '..\view\procuras\uProcQuadras.pas' {frmProcQuadras},
  uAgendamento in '..\view\movimentacoes\uAgendamento.pas' {frmAgendamento},
  uDaoAgeItens in '..\dao\uDaoAgeItens.pas',
  dataGestao in '..\dados\dataGestao.pas' {dmGestao: TDataModule},
  uAgendaObs in '..\view\movimentacoes\uAgendaObs.pas' {frmAgendaObs},
  uOrdCompra in '..\view\movimentacoes\uOrdCompra.pas' {frmOrdCompra},
  uSelProdutoVenda in '..\view\movimentacoes\uSelProdutoVenda.pas' {frmSelProdutoVenda},
  uClassOrcitens in '..\classes\uClassOrcitens.pas',
  uCadComandas in '..\view\cadastros\uCadComandas.pas' {frmCadComandas},
  uDaoComandas in '..\dao\uDaoComandas.pas',
  uProcComandas in '..\view\procuras\uProcComandas.pas' {frmProcComandas},
  uCadMesas in '..\view\cadastros\uCadMesas.pas' {frmCadMesas},
  uDaoMesas in '..\dao\uDaoMesas.pas',
  uProcMesas in '..\view\procuras\uProcMesas.pas' {frmProcMesas},
  uComandas in '..\view\movimentacoes\uComandas.pas' {frmComandas},
  uNewComanda in '..\view\movimentacoes\uNewComanda.pas' {frmNewComanda},
  uDaoComandasItens in '..\dao\uDaoComandasItens.pas',
  uClassComandasitens in '..\classes\uClassComandasitens.pas',
  uDaoComandasAtend in '..\dao\uDaoComandasAtend.pas',
  uClassComandasatend in '..\classes\uClassComandasatend.pas',
  uNewComandaItem in '..\view\movimentacoes\uNewComandaItem.pas' {frmNewComandaItem},
  uSenhaDelItemCom in '..\view\mensagens\uSenhaDelItemCom.pas' {frmSenhaDelItemCom},
  uDaoProdComanda in '..\dao\uDaoProdComanda.pas',
  uUserApp in '..\view\cadastros\uUserApp.pas' {frmUserApp},
  uConsAgenda in '..\view\consultas\uConsAgenda.pas' {frmConsAgenda},
  uReplicar in '..\view\movimentacoes\uReplicar.pas' {frmReplicar},
  uFuncoesVersao in '..\funcoes\uFuncoesVersao.pas',
  uDaoUpdate in '..\dao\uDaoUpdate.pas',
  uHorarios in '..\view\uteis\uHorarios.pas' {frmHorarios},
  uDaoHorarios in '..\dao\uDaoHorarios.pas',
  uDaoUsuariosMod in '..\dao\uDaoUsuariosMod.pas',
  uUsuariosMod in '..\view\cadastros\uUsuariosMod.pas' {frmUsuariosMod};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Phoenix';
  frmSplash := TfrmSplash.Create(Application);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmUsuariosMod, frmUsuariosMod);
  frmSplash.Show;
  frmSplash.update;
  Application.CreateForm(TfrmTmpForm, frmTmpForm);
  Application.CreateForm(TfrmTmpFormNormal, frmTmpFormNormal);
  Application.CreateForm(TfrmTmpFormNormalMov, frmTmpFormNormalMov);
  Application.CreateForm(TfrmTmpConsultaNormal, frmTmpConsultaNormal);
  Application.CreateForm(TfrmTmpProcura, frmTmpProcura);
  Application.CreateForm(TfrmErConexao, frmErConexao);
  Application.CreateForm(TfrmCfgBase, frmCfgBase);
  Application.CreateForm(TdmTestSGDB, dmTestSGDB);
  Application.CreateForm(TdmTmpConexao, dmTmpConexao);
  Application.CreateForm(TdmCadastros, dmCadastros);
  Application.CreateForm(TdmConfig, dmConfig);
  Application.CreateForm(TdmConsultas, dmConsultas);
  Application.CreateForm(TdmLookups, dmLookups);
  Application.CreateForm(TdmPessoas, dmPessoas);
  Application.CreateForm(TdmDiversos, dmDiversos);
  Application.CreateForm(TdmOrcamentos, dmOrcamentos);
  Application.CreateForm(TdmTemp, dmTemp);
  Application.CreateForm(TdmFinanceiro, dmFinanceiro);
  Application.CreateForm(TdmEstoque, dmEstoque);
  Application.CreateForm(TfrmSenha, frmSenha);
  Application.CreateForm(TfrmProcContas, frmProcContas);
  Application.CreateForm(TfrmSobre, frmSobre);
  Application.CreateForm(TfrmTecladoVirtual, frmTecladoVirtual);
  Application.CreateForm(TfrmSQL, frmSQL);
  Application.CreateForm(TfrmProcUsuarios, frmProcUsuarios);
  Application.CreateForm(TfrmProcBancos, frmProcBancos);
  Application.CreateForm(TfrmProcCidades, frmProcCidades);
  Application.CreateForm(TfrmConfig, frmConfig);
  Application.CreateForm(TfrmEmpresa, frmEmpresa);
  Application.CreateForm(TfrmProcPessoas, frmProcPessoas);
  Application.CreateForm(TfrmTmpSenhaMaster, frmTmpSenhaMaster);
  Application.CreateForm(TfrmSenhaCfgBase, frmSenhaCfgBase);
  Application.CreateForm(TfrmSenhaConfig, frmSenhaConfig);
  Application.CreateForm(TfrmProcPlanocontas, frmProcPlanocontas);
  Application.CreateForm(TfrmProcPais, frmProcPais);
  Application.CreateForm(TfrmProcSetor, frmProcSetor);
  Application.CreateForm(TfrmProcUf, frmProcUf);
  Application.CreateForm(TfrmProcLogradourostipo, frmProcLogradourostipo);
  Application.CreateForm(TfrmProcEndeletrotipo, frmProcEndeletrotipo);
  Application.CreateForm(TfrmProcEnderecostipo, frmProcEnderecostipo);
  Application.CreateForm(TfrmProcFonestipo, frmProcFonestipo);
  Application.CreateForm(TfrmBuscaCEP, frmBuscaCEP);
  Application.CreateForm(TfrmImpXMLPag, frmImpXMLPag);
  Application.CreateForm(TfrmCadPessoaMov, frmCadPessoaMov);
  Application.CreateForm(TfrmConfDuplicatas, frmConfDuplicatas);
  Application.CreateForm(TfrmAltDuplicataTmp, frmAltDuplicataTmp);
  Application.CreateForm(TfrmDetPagar, frmDetPagar);
  Application.CreateForm(TfrmConfBxPagar, frmConfBxPagar);
  Application.CreateForm(TfrmLancPagMan, frmLancPagMan);
  Application.CreateForm(TfrmAltDuplicata, frmAltDuplicata);
  Application.CreateForm(TfrmSaiCaixa, frmSaiCaixa);
  Application.CreateForm(TfrmEntCaixa, frmEntCaixa);
  Application.CreateForm(TfrmTransfContas, frmTransfContas);
  Application.CreateForm(TfrmConsCaixa, frmConsCaixa);
  Application.CreateForm(TfrmConfigIni, frmConfigIni);
  Application.CreateForm(TfrmTmpRelFormNormal, frmTmpRelFormNormal);
  Application.CreateForm(TfrmRelCaixa, frmRelCaixa);
  Application.CreateForm(TfrmRelCaixaAg, frmRelCaixaAg);
  Application.CreateForm(TfrmRelCaixaDet, frmRelCaixaDet);
  Application.CreateForm(TfrmRelSaldoContas, frmRelSaldoContas);
  Application.CreateForm(TfrmRelPagar, frmRelPagar);
  Application.CreateForm(TfrmSenhaEstacao, frmSenhaEstacao);
  Application.CreateForm(TfrmCfgMail, frmCfgMail);
  Application.CreateForm(TfrmProcGrupos, frmProcGrupos);
  Application.CreateForm(TfrmProcUnidades, frmProcUnidades);
  Application.CreateForm(TfrmProcMarcas, frmProcMarcas);
  Application.CreateForm(TfrmProcLocalizacao, frmProcLocalizacao);
  Application.CreateForm(TfrmProcProdutos, frmProcProdutos);
  Application.CreateForm(TfrmProcPrazos, frmProcPrazos);
  Application.CreateForm(TfrmProcFormpag, frmProcFormpag);
  Application.CreateForm(TfrmProcFuncoes, frmProcFuncoes);
  Application.CreateForm(TfrmProcFuncoes, frmProcFuncoes);
  Application.CreateForm(TfrmProcFuncoes, frmProcFuncoes);
  Application.CreateForm(TfrmProcFuncionarios, frmProcFuncionarios);
  Application.CreateForm(TfrmProcClientes, frmProcClientes);
  Application.CreateForm(TfrmEstacoes, frmEstacoes);
  Application.CreateForm(TfrmConsOrcamentos, frmConsOrcamentos);
  Application.CreateForm(TfrmDetOrcItens, frmDetOrcItens);
  Application.CreateForm(TfrmRelOrcamento, frmRelOrcamento);
  Application.CreateForm(TfrmEnvMailOrc, frmEnvMailOrc);
  Application.CreateForm(TfrmDetalhesOrc, frmDetalhesOrc);
  Application.CreateForm(TfrmSenhaDetProd, frmSenhaDetProd);
  Application.CreateForm(TfrmSenhaDetOrc, frmSenhaDetOrc);
  Application.CreateForm(TfrmDescOrc, frmDescOrc);
  Application.CreateForm(TfrmSenhaDescOrcTot, frmSenhaDescOrcTot);
  Application.CreateForm(TfrmSenhaMgMin, frmSenhaMgMin);
  Application.CreateForm(TfrmSenhaDescItem, frmSenhaDescItem);
  Application.CreateForm(TfrmSenhaMgOrc, frmSenhaMgOrc);
  Application.CreateForm(TfrmSenhaMgPrev, frmSenhaMgPrev);
  Application.CreateForm(TfrmSenhaDescItemPv, frmSenhaDescItemPv);
  Application.CreateForm(TfrmConsPreVendas, frmConsPreVendas);
  Application.CreateForm(TfrmRelPreVenda, frmRelPreVenda);
  Application.CreateForm(TfrmDetPVItens, frmDetPVItens);
  Application.CreateForm(TfrmSenhaDetProdPV, frmSenhaDetProdPV);
  Application.CreateForm(TfrmDetalhesPV, frmDetalhesPV);
  Application.CreateForm(TfrmSenhaDetPrev, frmSenhaDetPrev);
  Application.CreateForm(TfrmDescPrev, frmDescPrev);
  Application.CreateForm(TfrmCondicoesPV, frmCondicoesPV);
  Application.CreateForm(TfrmCadEnderecosAd, frmCadEnderecosAd);
  Application.CreateForm(TfrmConsProdutos, frmConsProdutos);
  Application.CreateForm(TfrmVincProdFor, frmVincProdFor);
  Application.CreateForm(TfrmSenhaCfgMail, frmSenhaCfgMail);
  Application.CreateForm(TfrmImpItensFor, frmImpItensFor);
  Application.CreateForm(TfrmCadProdutosImp, frmCadProdutosImp);
  Application.CreateForm(TfrmBackupPG, frmBackupPG);
  Application.CreateForm(TfrmLancCheque, frmLancCheque);
  Application.CreateForm(TfrmCadBancoMov, frmCadBancoMov);
  Application.CreateForm(TfrmPrazos, frmPrazos);
  Application.CreateForm(TfrmSenhaZeraJuros, frmSenhaZeraJuros);
  Application.CreateForm(TfrmCartoesPV, frmCartoesPV);
  Application.CreateForm(TfrmSenhaLibPagPV, frmSenhaLibPagPV);
  Application.CreateForm(TfrmSenhaReimpPV, frmSenhaReimpPV);
  Application.CreateForm(TfrmRelPreVendaEfet, frmRelPreVendaEfet);
  Application.CreateForm(TfrmEntradaManual, frmEntradaManual);
  Application.CreateForm(TfrmDetProdMov, frmDetProdMov);
  Application.CreateForm(TfrmSenhaDelPV, frmSenhaDelPV);
  Application.CreateForm(TfrmAltParcela, frmAltParcela);
  Application.CreateForm(TfrmConfBxReceber, frmConfBxReceber);
  Application.CreateForm(TfrmDetReceber, frmDetReceber);
  Application.CreateForm(TfrmConsCartoes, frmConsCartoes);
  Application.CreateForm(TfrmConsEstMin, frmConsEstMin);
  Application.CreateForm(TfrmVerItensReserv, frmVerItensReserv);
  Application.CreateForm(TfrmConsEstNeg, frmConsEstNeg);
  Application.CreateForm(TfrmRelComissoes, frmRelComissoes);
  Application.CreateForm(TfrmDetCheques, frmDetCheques);
  Application.CreateForm(TfrmAltCheque, frmAltCheque);
  Application.CreateForm(TfrmBxCheque, frmBxCheque);
  Application.CreateForm(TfrmDetalhesConsPV, frmDetalhesConsPV);
  Application.CreateForm(TfrmConsItensPV, frmConsItensPV);
  Application.CreateForm(TdmCompras, dmCompras);
  Application.CreateForm(TfrmProcFornecedores, frmProcFornecedores);
  Application.CreateForm(TfrmProcQuadras, frmProcQuadras);
  Application.CreateForm(TfrmAgendamento, frmAgendamento);
  Application.CreateForm(TdmGestao, dmGestao);
  Application.CreateForm(TfrmAgendaObs, frmAgendaObs);
  Application.CreateForm(TfrmSelProdutoVenda, frmSelProdutoVenda);
  Application.CreateForm(TfrmProcComandas, frmProcComandas);
  Application.CreateForm(TfrmProcMesas, frmProcMesas);
  Application.CreateForm(TfrmNewComanda, frmNewComanda);
  Application.CreateForm(TfrmNewComandaItem, frmNewComandaItem);
  Application.CreateForm(TfrmSenhaDelItemCom, frmSenhaDelItemCom);
  Application.CreateForm(TfrmUserApp, frmUserApp);
  Application.CreateForm(TfrmConsAgenda, frmConsAgenda);
  Application.CreateForm(TfrmReplicar, frmReplicar);
  Application.CreateForm(TfrmHorarios, frmHorarios);
  frmSplash.hide;
  frmSplash.free;
  Application.Run;
end.
