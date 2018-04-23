require 'active_support/all'

module Variaveis

	FILIAIS_EMPRESA_PRICE_RELATORIO192_DICOP_SAUDE = "000509/000 - PRICE; 000509/001 - PRICEWATERHOUSECOOPERS C. DE E. S/C LTDA; 000509/002 - PRICE; 000509/003 - PRICE; 000509/005 - PRICE; 000509/006 - LOESER/PORTELA; 000509/007 - LOESER/PORTELA; 000509/008 - PRICE; 000509/009 - LOESER/PORTELA; 000509/010 - PRICE; 000509/011 - PRICE; 000509/012 - PRICE; 000509/013 - LOESER E PORTELA - ADVOGADOS; 000509/014 - LOESER/PORTELA; 000509/015 - LOESER E PORTELA- ADVOGADOS"

end

module Locators

<<-DOC
Módulo que armazena todos os locators do sistema BI Book
Todas as classes acessam este módulo
DOC

	<<-DOC
	Elementos dos menus do topo da página inicial
	DOC
	LOCATOR_MENU_GESTAO_SAUDE = "ctl00_mMenun0" unless const_defined?(:LOCATOR_MENU_GESTAO_SAUDE)
	LOCATOR_MENU_GESTAO_DENTAL = "ctl00_mMenun1" unless const_defined?(:LOCATOR_MENU_GESTAO_DENTAL)
	LOCATOR_MENU_DICOP_SAUDE = "ctl00_mMenun2" unless const_defined?(:LOCATOR_MENU_DICOP_SAUDE)
	LOCATOR_MENU_DICOP_DENTAL = "ctl00_mMenun3" unless const_defined?(:LOCATOR_MENU_DICOP_DENTAL)
	LOCATOR_MENU_AMIL_PLANOS_GESTAO = "ctl00_mMenun4" unless const_defined?(:LOCATOR_MENU_AMIL_PLANOS_GESTAO)
	LOCATOR_MENU_AMIL_PLANOS_DICOP = "ctl00_mMenun5" unless const_defined?(:LOCATOR_MENU_AMIL_PLANOS_DICOP)
	LOCATOR_MENU_GERENCIAIS = "ctl00_mMenun6" unless const_defined?(:LOCATOR_MENU_GERENCIAIS)
	LOCATOR_MENU_INTELIGENCIA_CORP = "ctl00_mMenun7" unless const_defined?(:LOCATOR_MENU_INTELIGENCIA_CORP)
	LOCATOR_MENU_ESTATISTICOS_SAUDE = "ctl00_mMenun8" unless const_defined?(:LOCATOR_MENU_ESTATISTICOS_SAUDE)
	LOCATOR_MENU_ADMINISTRATIVO = "ctl00_mMenun9" unless const_defined?(:LOCATOR_MENU_ADMINISTRATIVO)

	<<-DOC
	Elementos dos links Filtrar Empresa, Limpar Filtro e Gerar Relatório
	DOC
	LOCATOR_LINK_FILTRAR_EMPRESA = "Filtrar empresa" unless const_defined?(:LOCATOR_LINK_FILTRAR_EMPRESA)
	LOCATOR_LINK_LIMPAR_FILTRO = "Limpar Filtro" unless const_defined?(:LOCATOR_LINK_LIMPAR_FILTRO)
	LOCATOR_LINK_GERAR_RELATORIO = "Gerar Relatório" unless const_defined?(:LOCATOR_LINK_GERAR_RELATORIO)

	<<-DOC
	Elementos das opções do Menu Gestão Saúde
	DOC
	LOCATOR_OPCAO_SOLICITACAO_DE_CONTA_CORRENTE = "Solicitação de Conta Corrente" unless const_defined?(:LOCATOR_OPCAO_SOLICITACAO_DE_CONTA_CORRENTE)
	LOCATOR_OPCAO_SOLICITACAO_DE_CONTA_CORRENTE_EXTERNO = "Solicitação de Conta Corrente Externo" unless const_defined?(:LOCATOR_OPCAO_SOLICITACAO_DE_CONTA_CORRENTE_EXTERNO)
	LOCATOR_OPCAO_ANALISE_DE_CUSTOS_E_RECEITA_EMITIDA_CONTABIL = "Análise de Custos e Receita Emitida/Contábil" unless const_defined?(:LOCATOR_OPCAO_ANALISE_DE_CUSTOS_E_RECEITA_EMITIDA_CONTABIL)

	<<-DOC
	Elementos das opções do Menu Gestão Dental
	DOC
	LOCATOR_OPCAO_ANALISE_DE_CUSTOS_E_RECEITA_EMITIDA_CONTABIL_MENU_GESTAO_DENTAL = "//div[@id='ctl00_mMenun1Items']//a[text()='Análise de Custos e Receita Emitida/Contábil']" unless const_defined?(:LOCATOR_OPCAO_ANALISE_DE_CUSTOS_E_RECEITA_EMITIDA_CONTABIL_MENU_GESTAO_DENTAL)

	<<-DOC
	Elementos das opções do Menu DICOP Saúde
	DOC
	LOCATOR_OPCAO_ANALISE_DE_CUSTOS_POR_ESPECIALIDADE_BENEFICIARIOS_MENU_DICOP_SAUDE = "//div[@id='ctl00_mMenun2Items']//a[text()='Análise de Custos por Especialidade - Beneficiários']" unless const_defined?(:LOCATOR_OPCAO_ANALISE_DE_CUSTOS_POR_ESPECIALIDADE_BENEFICIARIOS_MENU_DICOP_SAUDE)

	<<-DOC
	Elementos das opções do Menu Amil Planos Gestao
	DOC
	LOCATOR_OPCAO_ANALISE_DE_RECEITA_COMPETENCIA_MENU_AMIL_PLANOS_GESTAO = "//div[@id='ctl00_mMenun4Items']//a[text()='Análise de Receita - Competência']" unless const_defined?(:LOCATOR_OPCAO_ANALISE_DE_RECEITA_COMPETENCIA_MENU_AMIL_PLANOS_GESTAO)


	<<-DOC
	Elementos da sessão Gerar Relatório
	DOC
	LOCATOR_FILTRO_DEMITIDOS_E_APOSENTADOS = "//table[@id='ctl00_ContentPlaceHolder1_rvBase_fixedTable']//following::span[text()='Demitidos e Aposentados']" unless const_defined?(:LOCATOR_FILTRO_DEMITIDOS_E_APOSENTADOS)
	LOCATOR_FILTRO_FILIAL_EMPRESA = "//table[@id='ctl00_ContentPlaceHolder1_rvBase_fixedTable']//following::span[text()='Filial Empresa']" unless const_defined?(:LOCATOR_FILTRO_FILIAL_EMPRESA)
	LOCATOR_FILTRO_DATA_DE_COMPETENCIA = "//table[@id='ctl00_ContentPlaceHolder1_rvBase_fixedTable']//following::span[text()='Data de Competência']" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA)
	LOCATOR_FILTRO_EMPRESA = "//table[@id='ctl00_ContentPlaceHolder1_rvBase_fixedTable']//following::span[text()='Empresa']" unless const_defined?(:LOCATOR_FILTRO_EMPRESA)
	LOCATOR_FILTRO_MOEDA = "//table[@id='ctl00_ContentPlaceHolder1_rvBase_fixedTable']//following::span[text()='Moeda']" unless const_defined?(:LOCATOR_FILTRO_MOEDA)
	LOCATOR_FILTRO_PRODUTO = "//table[@id='ctl00_ContentPlaceHolder1_rvBase_fixedTable']//following::span[text()='Produto']" unless const_defined?(:LOCATOR_FILTRO_PRODUTO)
	LOCATOR_FILTRO_FILIAL_AMIL = "//table[@id='ctl00_ContentPlaceHolder1_rvBase_fixedTable']//following::span[text()='Filial Amil']" unless const_defined?(:LOCATOR_FILTRO_FILIAL_AMIL)
	LOCATOR_FILTRO_TIPO_DE_EVENTO = "//table[@id='ctl00_ContentPlaceHolder1_rvBase_fixedTable']//following::span[text()='Tipo de Evento']" unless const_defined?(:LOCATOR_FILTRO_TIPO_DE_EVENTO)
	LOCATOR_FILTRO_CELULA = "//table[@id='ctl00_ContentPlaceHolder1_rvBase_fixedTable']//following::span[text()='Célula']" unless const_defined?(:LOCATOR_FILTRO_CELULA)
	LOCATOR_FILTRO_OPERADORA = "//table[@id='ctl00_ContentPlaceHolder1_rvBase_fixedTable']//following::span[text()='Operadora']" unless const_defined?(:LOCATOR_FILTRO_OPERADORA)
	LOCATOR_FILTRO_PL = "//table[@id='ctl00_ContentPlaceHolder1_rvBase_fixedTable']//following::span[text()='P&L']" unless const_defined?(:LOCATOR_FILTRO_PL)


		#Elementos exclusivos do filtro Demitidos e Aposentados 
		LOCATOR_FILTRO_DEMITIDOS_E_APOSENTADOS_CHECKBOX_SELECIONAR_TUDO = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl03_divDropDown_ctl00" unless const_defined?(:LOCATOR_FILTRO_DEMITIDOS_E_APOSENTADOS_CHECKBOX_SELECIONAR_TUDO)
		LOCATOR_FILTRO_DEMITIDOS_E_APOSENTADOS_CHECKBOX_TODAS = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl03_divDropDown_ctl01" unless const_defined?(:LOCATOR_FILTRO_DEMITIDOS_E_APOSENTADOS_CHECKBOX_TODAS)
		LOCATOR_FILTRO_DEMITIDOS_E_APOSENTADOS_CHECKBOX_NAO = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl03_divDropDown_ctl02" unless const_defined?(:LOCATOR_FILTRO_DEMITIDOS_E_APOSENTADOS_CHECKBOX_NAO)
		LOCATOR_FILTRO_DEMITIDOS_E_APOSENTADOS_CHECKBOX_NAO_IDENTIFICADO = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl03_divDropDown_ctl03" unless const_defined?(:LOCATOR_FILTRO_DEMITIDOS_E_APOSENTADOS_CHECKBOX_NAO_IDENTIFICADO)
		LOCATOR_FILTRO_DEMITIDOS_E_APOSENTADOS_CHECKBOX_SIM = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl03_divDropDown_ctl04" unless const_defined?(:LOCATOR_FILTRO_DEMITIDOS_E_APOSENTADOS_CHECKBOX_SIM)
		LOCATOR_FILTRO_DEMITIDOS_E_APOSENTADOS_SETA = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl03_ddDropDownButton" unless const_defined?(:LOCATOR_FILTRO_DEMITIDOS_E_APOSENTADOS_SETA)

		#Elementos exclusivos do filtro Filial Empresa
		LOCATOR_FILTRO_FILIAL_EMPRESA_CHECKBOX_TODAS = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl07_divDropDown_ctl01" unless const_defined?(:LOCATOR_FILTRO_FILIAL_EMPRESA_CHECKBOX_TODAS)
		LOCATOR_FILTRO_FILIAL_EMPRESA_SETA = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl07_ddDropDownButton" unless const_defined?(:LOCATOR_FILTRO_FILIAL_EMPRESA_SETA)

		#Elementos exclusivos do filtro Produto
		LOCATOR_FILTRO_PRODUTO_CHECKBOX_TODAS = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl13_divDropDown_ctl01" unless const_defined?(:LOCATOR_FILTRO_PRODUTO_CHECKBOX_TODAS)
		LOCATOR_FILTRO_PRODUTO_SETA = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl13_ddDropDownButton" unless const_defined?(:LOCATOR_FILTRO_PRODUTO_SETA)

		##Elementos exclusivos do filtro Filial Empresa Data de Competência
		<<-DOC
		index_0 = Selecionar Tudo
		index_156 = Novembro 2017
		index_157 = Dezembro 2017
		index_158 = Janeiro 2018
		DOC
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_0 = "ctl00$ContentPlaceHolder1$rvBase$ctl04$ctl11$divDropDown$ctl00" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_0)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_145 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl11_divDropDown_ctl45" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_145)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_146 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl11_divDropDown_ctl46" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_146)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_147 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl11_divDropDown_ctl47" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_147)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_148 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl11_divDropDown_ctl48" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_148)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_149 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl11_divDropDown_ctl49" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_149)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_150 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl11_divDropDown_ctl50" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_150)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_151 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl11_divDropDown_ctl51" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_151)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_152 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl11_divDropDown_ctl52" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_152)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_153 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl11_divDropDown_ctl53" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_153)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_154 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl11_divDropDown_ctl54" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_154)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_155 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl11_divDropDown_ctl55" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_155)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_156 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl11_divDropDown_ctl56" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_156)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_157 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl11_divDropDown_ctl57" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_157)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_158 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl11_divDropDown_ctl58" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_158)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_159 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl11_divDropDown_ctl59" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_159)


		<<-DOC
		Filtros Data de Competência Gestão Dental
		DOC
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_GESTAO_DENTAL_CHECKBOX_INDEX_0 = "ctl00$ContentPlaceHolder1$rvBase$ctl04$ctl11$divDropDown$ctl00" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_0)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_GESTAO_DENTAL_CHECKBOX_INDEX_145 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl45" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_145)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_GESTAO_DENTAL_CHECKBOX_INDEX_146 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl46" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_146)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_GESTAO_DENTAL_CHECKBOX_INDEX_147 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl47" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_147)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_GESTAO_DENTAL_CHECKBOX_INDEX_148 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl48" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_148)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_GESTAO_DENTAL_CHECKBOX_INDEX_149 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl49" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_149)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_GESTAO_DENTAL_CHECKBOX_INDEX_150 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl50" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_150)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_GESTAO_DENTAL_CHECKBOX_INDEX_151 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl51" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_151)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_GESTAO_DENTAL_CHECKBOX_INDEX_152 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl52" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_152)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_GESTAO_DENTAL_CHECKBOX_INDEX_153 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl53" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_153)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_GESTAO_DENTAL_CHECKBOX_INDEX_154 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl54" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_154)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_GESTAO_DENTAL_CHECKBOX_INDEX_155 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl55" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_155)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_GESTAO_DENTAL_CHECKBOX_INDEX_156 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl56" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_156)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_GESTAO_DENTAL_CHECKBOX_INDEX_157 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl57" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_157)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_GESTAO_DENTAL_CHECKBOX_INDEX_158 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl58" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_158)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_GESTAO_DENTAL_CHECKBOX_INDEX_159 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl59" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_159)

		<<-DOC
		Filtros Data de Competência DICOP Saúde
		DOC
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_0 = "ctl00$ContentPlaceHolder1$rvBase$ctl04$ctl11$divDropDown$ctl00" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_0)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_145 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl45" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_145)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_146 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl46" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_146)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_147 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl47" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_147)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_148 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl48" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_148)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_149 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl49" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_149)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_150 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl50" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_150)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_151 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl51" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_151)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_152 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl52" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_152)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_153 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl53" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_153)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_154 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl54" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_154)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_155 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl55" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_155)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_156 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl56" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_156)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_157 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl57" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_157)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_158 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl58" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_158)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_159 = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl59" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_DICOP_SAUDE_CHECKBOX_INDEX_159)

		#Elemento lista do campo Data de Competência Gestão Saúde
		LOCATOR_CAMPO_DATA_DE_COMPETENCIA_LISTA_GESTAO_SAUDE = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl11_divDropDown" unless const_defined?(:LOCATOR_CAMPO_DATA_DE_COMPETENCIA_LISTA_GESTAO_SAUDE)
		#Elemento lista do campo Data de Competência Gestão Dental
		LOCATOR_CAMPO_DATA_DE_COMPETENCIA_LISTA_GESTAO_DENTAL = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown" unless const_defined?(:LOCATOR_CAMPO_DATA_DE_COMPETENCIA_LISTA_GESTAO_DENTAL)
		#Elemento lista do campo Data de Competência DICOP Saúde
		LOCATOR_CAMPO_DATA_DE_COMPETENCIA_LISTA_DICOP_SAUDE = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl17_divDropDown" unless const_defined?(:LOCATOR_CAMPO_DATA_DE_COMPETENCIA_LISTA_DICOP_SAUDE)


		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_SETA_GESTAO_SAUDE = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl11_ddDropDownButton" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_SETA_GESTAO_SAUDE)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_SETA_GESTAO_DENTAL = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_ddDropDownButton" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_SETA_GESTAO_DENTAL)
		LOCATOR_FILTRO_DATA_DE_COMPETENCIA_SETA_DICOP_SAUDE = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl17_ddDropDownButton" unless const_defined?(:LOCATOR_FILTRO_DATA_DE_COMPETENCIA_SETA_DICOP_SAUDE)

		#Elementos exclusivos do filtro Filial Amil
		LOCATOR_FILTRO_FILIAL_AMIL_RELATORIO192_SETA = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl07_ddDropDownButton" unless const_defined?(:LOCATOR_FILTRO_FILIAL_AMIL_RELATORIO192_SETA)
		LOCATOR_FILTRO_FILIAL_AMIL_RELATORIO192_CHECKBOX_TODAS = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl07_divDropDown_ctl01" unless const_defined?(:LOCATOR_FILTRO_FILIAL_AMIL_RELATORIO192_CHECKBOX_TODAS)


		#Elementos exclusivos do filtro Empresa
		LOCATOR_FILTRO_EMPRESA_SETA = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl05_ddDropDownButton" unless const_defined?(:LOCATOR_FILTRO_EMPRESA_SETA)
		LOCATOR_FILTRO_EMPRESA_CHECKBOX_TODAS = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl05_divDropDown_ctl01" unless const_defined?(:LOCATOR_FILTRO_EMPRESA_CHECKBOX_TODAS)
		
		#Elementos exclusivos do filtro Empresa relatório 192
		LOCATOR_FILTRO_EMPRESA_RELATORIO192_SETA = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl11_ddDropDownButton" unless const_defined?(:LOCATOR_FILTRO_EMPRESA_RELATORIO192_SETA)
		LOCATOR_FILTRO_EMPRESA_RELATORIO192_CHECKBOX_TODAS = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl11_divDropDown_ctl01" unless const_defined?(:LOCATOR_FILTRO_EMPRESA_RELATORIO192_CHECKBOX_TODAS)
		
		#Elementos exclusivos do filtro Moeda
		#Filtro Moeda Gestão Saúde
		LOCATOR_FILTRO_MOEDA_GESTAO_SAUDE_LISTBOX = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_ddValue" unless const_defined?(:LOCATOR_FILTRO_MOEDA_GESTAO_SAUDE_LISTBOX)
		#Filtro Moeda Gestão Dental
		LOCATOR_FILTRO_MOEDA_GESTAO_DENTAL_LISTBOX = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl11_ddValue" unless const_defined?(:LOCATOR_FILTRO_MOEDA_GESTAO_DENTAL_LISTBOX)
		#Filtro Moeda DICOP Saúde
		LOCATOR_FILTRO_MOEDA_DICOP_SAUDE_LISTBOX = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl15_ddValue" unless const_defined?(:LOCATOR_FILTRO_MOEDA_DICOP_SAUDE_LISTBOX)

		#Elementos exclusívos do filtro Tipo de Evendo Relatório 192
		LOCATOR_FILTRO_TIPO_DE_EVENTO_DICOP_SAUDE_LISTBOX = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl19_ddValue" unless const_defined?(:LOCATOR_FILTRO_TIPO_DE_EVENTO_DICOP_SAUDE_LISTBOX)

		#Elementos exclusívos do filtro Célula Relatório 192
		LOCATOR_FILTRO_CELULA_RELATORIO192_SETA = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl05_ddDropDownButton" unless const_defined?(:LOCATOR_FILTRO_CELULA_RELATORIO192_SETA)
		LOCATOR_FILTRO_CELULA_RELATORIO192_CHECKBOX_TODAS = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl05_divDropDown_ctl01" unless const_defined?(:LOCATOR_FILTRO_CELULA_RELATORIO192_CHECKBOX_TODAS)

		#Elementos exclusívos do filtro Operadora Relatório 192
		LOCATOR_FILTRO_OPERADORA_RELATORIO192_SETA = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_ddDropDownButton" unless const_defined?(:LOCATOR_FILTRO_OPERADORA_RELATORIO192_SETA)
		LOCATOR_FILTRO_OPERADORA_RELATORIO192_CHECKBOX_TODAS = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl09_divDropDown_ctl01" unless const_defined?(:LOCATOR_FILTRO_OPERADORA_RELATORIO192_CHECKBOX_TODAS)

		#Elementos exclusívos do filtro Filial Empresa Relatório 192
		LOCATOR_FILTRO_FILIAL_EMPRESA_RELATORIO192_SETA = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl13_ddDropDownButton" unless const_defined?(:LOCATOR_FILTRO_FILIAL_EMPRESA_RELATORIO192_SETA)
		LOCATOR_FILTRO_FILIAL_EMPRESA_RELATORIO192_CHECKBOX_TODAS = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl13_divDropDown_ctl01" unless const_defined?(:LOCATOR_FILTRO_FILIAL_EMPRESA_RELATORIO192_CHECKBOX_TODAS)

		#Elementos exclusívos do filtro Filial Empresa Relatório 192
		LOCATOR_FILTRO_PL_RELATORIO192_SETA = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl21_ddDropDownButton" unless const_defined?(:LOCATOR_FILTRO_PL_RELATORIO192_SETA)
		LOCATOR_FILTRO_PL_RELATORIO192_CHECKBOX_TODAS = "ctl00_ContentPlaceHolder1_rvBase_ctl04_ctl21_divDropDown_ctl01" unless const_defined?(:LOCATOR_FILTRO_PL_RELATORIO192_CHECKBOX_TODAS)

		#Locator que retorna as empresas filiadas do relatório 192 DICOP Saúde
		LOCATOR_RETORNAR_EMPRESAS_FILIADAS_RELATORIO192_DICOP_SAUDE = ".//span[contains(concat(' ', normalize-space(@class), ' '), '39')]" unless const_defined?(:LOCATOR_RETORNAR_EMPRESAS_FILIADAS_RELATORIO192_DICOP_SAUDE)				

	<<-DOC
	Elemento do nome do relatório Gestão Saúde - Análise de Custos e Receita Emitida/Contábil
	DOC
	LOCATOR_NOME_DO_RELATORIO_31 = "//td[@class='A2c28424388814c8b8cfddc62c259b24f15l']//following::div[text()='Gestão Saúde - Análise de Custos e Receita Emitida/Contábil']" unless const_defined?(:LOCATOR_NOME_DO_RELATORIO_31)

	<<-DOC
	Elemento do botão Exibir Relatório
	DOC
	LOCATOR_BOTAO_EXIBIR_RELATORIO = "ctl00$ContentPlaceHolder1$rvBase$ctl04$ctl00" unless const_defined?(:LOCATOR_BOTAO_EXIBIR_RELATORIO)

	<<-DOC
	Elemento do ícone de carregamento da tela
	DOC
	LOCATOR_ICONE_CARREGANDO = "ctl00_ContentPlaceHolder1_rvBase_AsyncWait_Wait" unless const_defined?(:LOCATOR_ICONE_CARREGANDO)

	<<-DOC
	Elemento da tabela do relatório Gestão Saúde - Análise de Custos e Receita Emitida/Contábil	
	DOC
	LOCATOR_TABELA_RELATORIO_31 = ".//table[contains(concat(' ', normalize-space(@class), ' '), '171')]" unless const_defined?(:LOCATOR_TABELA_RELATORIO_31)
	<<-DOC
	Elemento da tabela do relatório Gestão Dental - Análise de Custos e Receita Emitida/Contábil	
	DOC
	LOCATOR_TABELA_RELATORIO_36 = ".//table[contains(concat(' ', normalize-space(@class), ' '), '231')]" unless const_defined?(:LOCATOR_TABELA_RELATORIO_36)
	<<-DOC
	Elemento da tabela do relatório DICOP Saúde - Análise de Custos por Especialidade - Beneficiários	
	DOC
	LOCATOR_TABELA_RELATORIO_192_1 = ".//table[contains(concat(' ', normalize-space(@class), ' '), '222')]" unless const_defined?(:LOCATOR_TABELA_RELATORIO_192_1)
	<<-DOC
	Elemento da tabela do relatório Detalhamento - Análise de Custos por Especialidade - Beneficiário	
	DOC
	LOCATOR_TABELA_DETALHAMENTO_RELATORIO_192_2 = ".//table[contains(concat(' ', normalize-space(@class), ' '), '146')]" unless const_defined?(:LOCATOR_TABELA_DETALHAMENTO_RELATORIO_192_2)


	<<-DOC
	Elementos da sessão Filtrar Empresa
	DOC
	LOCATOR_GRID_CAMPO_PESQUISA = "texto_titulo" unless const_defined?(:LOCATOR_GRID_CAMPO_PESQUISA)
	LOCATOR_GRID_FILTRAR_EMPRESA = "gridPesquisa" unless const_defined?(:LOCATOR_GRID_FILTRAR_EMPRESA)
	LOCATOR_GRID_FILTRAR_EMPRESA_BOTAO_ADICIONAR_EMPRESA = "Adicionar" unless const_defined?(:LOCATOR_GRID_FILTRAR_EMPRESA_BOTAO_ADICIONAR_EMPRESA)
	LOCATOR_GRID_FILTRAR_EMPRESA_CAMPO_PESQUISA = "ctl00_ContentPlaceHolder1_txtPesquisaEmpresa" unless const_defined?(:LOCATOR_GRID_FILTRAR_EMPRESA_CAMPO_PESQUISA)
	LOCATOR_GRID_FILTRAR_EMPRESA_LUPA = "ctl00_ContentPlaceHolder1_btnPesquisaEmpresa" unless const_defined?(:LOCATOR_GRID_FILTRAR_EMPRESA_LUPA)
	#LOCATOR_GRID_FILTRAR_EMPRESA_VERIFICAR_EMPRESA_NO_GRID = ".//*[@class='gridPesquisa']//td[contains(text(),'120624')]" unless const_defined?(:LOCATOR_GRID_FILTRAR_EMPRESA_VERIFICAR_EMPRESA_NO_GRID)
	LOCATOR_GRID_FILTRAR_EMPRESA_BOTAO_SAIR_E_ATUALIZAR_RELATORIO = "ctl00_ContentPlaceHolder1_btnAtualizarRelatorio" unless const_defined?(:LOCATOR_GRID_FILTRAR_EMPRESA_BOTAO_SAIR_E_ATUALIZAR_RELATORIO)
	LOCATOR_FILTRAR_EMPRESA_EMPRESAS_SELECIONADAS = "ctl00_ContentPlaceHolder1_lbEscolherEmpresa" unless const_defined?(:LOCATOR_FILTRAR_EMPRESA_EMPRESAS_SELECIONADAS)

	def verificar_empresa_selecionada_no_grid_filial_empresa(empresa)
    	return locator_grid_filtrar_empresa_verificar_empresa_no_grid = ".//*[@class='gridPesquisa']//td[contains(text(),'#{empresa}')]"
  	end

  	def verificar_empresa_holding_no_grid_filial_empresa(empresa)
  		return locator_grid_filtrar_empresa_holding_empresa_no_grid = "//*[normalize-space()='#{empresa}']/preceding-sibling::td/span[@title='Holding']"
  	end

  	def verificar_empresa_coligadas_no_grid_filial_empresa(empresa)
  		return locator_grid_filtrar_empresa_coligadas_empresa_no_grid = "//*[normalize-space()='#{empresa}']/preceding-sibling::td/span[@title='Coligadas']"
  	end

  	def verificar_empresa_matriz_apresentada_relatorio192_dicop_saude(empresa)
  		return locator_empresa_matriz_apresentada = ".//div[contains(concat(' ', normalize-space(@class), ' '), '36')]//span[text()='#{empresa}']"
  	end

  	def verificar_especialidade_apresentada_relatorio192_2_dicop_saude(especialidade)
  		return locator_especialidade_apresentada = ".//div[contains(concat(' ', normalize-space(@class), ' '), '52')]//span[text()='Especialidade: ']//following::span[contains(text(),'#{especialidade}')]"
  	end

  	def verificar_beneficiario_apresentado_relatorio192_3_dicop_saude(beneficiario)
  		return locator_beneficiario_apresentado = ".//div[contains(concat(' ', normalize-space(@class), ' '), '56')]//span[text()='Beneficiário: ']//following::span[contains(text(),'#{beneficiario}')]"
  	end
end

module ConversorDeNumeros
 	extend ActiveSupport::NumberHelper

  	#----------------------FUNÇÕES-PARA-CONVERSÃO-DE-NÚMEROS----------------------------#
  	# Autor: Brito                                                                      #
  	# Data: 16/04/2018                                                                  #
  	#-----------------------------------------------------------------------------------#

  	#Função que converte um número em notação ciêntífica para float e arredonda as últimas duas casas decimais
  	def converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(numero)
   		return (numero).to_f.round(2)
  	end

  	#Função que prepara o número para ser convertido para porcentagem
  	def converter_numnero_banco_para_float_com_duas_casas_decimais(numero)
    	return (numero).to_f
  	end

  	#Função que converte um número em notação ciêntífica para porcentagem com duas casas decimais
  	def converter_numero_notacao_cientifica_banco_para_porcentagem(numero, porcentagem)
    	auxiliar = (numero).to_f
    	return ConversorDeNumeros.number_to_percentage(auxiliar * porcentagem, precision: 2, separator: ',') 
  	end

  	#Função que converte um número inteiro para porcentagem com duas casas decimais
  	def converter_numero_banco_para_porcentagem(numero)
    	return ConversorDeNumeros.number_to_percentage(numero * 1, precision: 2, separator: ',') 
  	end

  	#Função que converte um número para moeda BR REAL
  	def converter_numero_banco_para_moeda_real(number)
    	return ConversorDeNumeros.number_to_currency(number, :unit => "R$ ", :separator => ",", :delimiter => ".", precision: 2)
  	end

  	#Função que deliimita um número em casas decimais, separados por ponto
  	def converter_numero_banco_para_casas_decimais_com_delimitador(numero)
    	return ConversorDeNumeros.number_to_delimited(numero, delimiter: ".")
  	end
end

module TratarString
	def remover_espacos_string_provinda_web(palavra)
		return (palavra).rstrip
	end

	def remover_espacos_string_provinda_banco(palavra)
		return (palavra).gsub("\u00A0", "")
	end
end