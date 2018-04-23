#Caminho da common => /lib/common.rb
require 'common'

class OpcoesMenuGestaoDental

	include PageObject

	link(:analise_de_custos_e_receita_emitida_contabil_menu_gestao_dental, :xpath => Locators::LOCATOR_OPCAO_ANALISE_DE_CUSTOS_E_RECEITA_EMITIDA_CONTABIL_MENU_GESTAO_DENTAL)
	link(:selecionar_analise_de_custos_e_receita_emitida_contabil_por_empresa, :text => 'Análise de Custos e Receita Emitida/Contábil por Empresa')
	link(:selecionar_analise_de_custos_e_receita_emitida_contabil_por_produto, :text => 'Análise de Custos e Receita Emitida/Contábil por Produto')
	link(:selecionar_analise_de_custos_por_especialidade_menu_gestao_dental, :text => 'Análise de Custos por Especialidade')
	link(:selecionar_beneficiarios_ativos, :text => 'Beneficiários Ativos')
	link(:selecionar_consulta_de_beneficiarios, :text => 'Consulta de Beneficiários')
	link(:selecionar_maiores_usuarios_por_quantidade, :text => 'Maiores Usuários por Quantidade')
	link(:selecionar_maiores_usuarios_por_valor, :text => 'Maiores Usuários por Valor')
	link(:selecionar_utilizacao_por_grupo_de_especialidades, :text => 'Utilização por Grupo de Especialidades')
	link(:selecionar_utilizacao_por_origem_da_cobranca, :text => 'Utilização por Origem da Cobrança')
	link(:selecionar_utilizacao_por_produto, :text => 'Utilização por Produto')

	def selecionar_analise_de_custos_e_receita_emitida_contabil_menu_gestao_dental
		begin
			self.analise_de_custos_e_receita_emitida_contabil_menu_gestao_dental
		rescue Watir::Exception::UnknownObjectException
			fail("Erro ao selecionar a opção Análise de Custos e Receita Emitida/Contábil!!!")
		end
	end
	
end