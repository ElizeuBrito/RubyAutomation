#Caminho da common => /lib/common.rb
require 'common'

class OpcoesMenuDICOPSaude

	include PageObject

	link(:analise_de_custos_e_receita_emitida_contabil, :text => 'Análise de Custos e Receita Emitida/Contábil')
	link(:analise_de_custo_total_e_receita_contabil, :text => 'Análise de Custo Total e Receita Contábil')
	link(:analise_de_custo_total_detalhado_e_receita_contabil, :text => 'Análise de Custo Total Detalhado e Receita Contábil')
	link(:analise_de_custos_e_receita_paga, :text => 'Análise de Custos e Receita Paga')
	link(:analise_de_custo_total_e_receita_paga, :text => 'Análise de Custo Total e Receita Paga')
	link(:analise_de_custo_total_detalhado_e_receita_paga, :text => 'Análise de Custo Total Detalhado e Receita Paga')
	link(:analise_de_custos_e_receita_paga_rh, :text => 'Análise de Custos e Receita Paga - RH')
	link(:analise_de_custos_e_receita_emitida_contábil_por_sexo_e_produto, :text => 'Análise de Custos e Receita Emitida/Contábil por Sexo e Produto')
	link(:analise_de_custos_e_receita_paga_por_sexo_e_produto, :text => 'Análise de Custos e Receita Paga por Sexo e Produto')
	link(:analise_de_custo_e_receita_emitida_contábil_por_porte, :text => 'Análise de Custo e Receita Emitida/Contábil por Porte')
	link(:analise_de_custos_e_receita_paga_por_porte, :text => 'Análise de Custos e Receita Paga por Porte')
	link(:analise_de_custos_por_especialidade_beneficiarios_menu_dicop_saude, :xpath => Locators::LOCATOR_OPCAO_ANALISE_DE_CUSTOS_POR_ESPECIALIDADE_BENEFICIARIOS_MENU_DICOP_SAUDE)
	link(:analise_de_custos_por_especialidade, :text => 'Análise de Custos por Especialidade')
	link(:analise_de_custos_por_tipo_de_evento_e_origem_de_cobrança, :text => 'Análise de Custos por Tipo de Evento e Origem de Cobrança')
	link(:maiores_prestadores_por_quantidade_de_eventos, :text => 'Maiores Prestadores por Quantidade de Eventos')
	link(:maiores_prestadores_por_valor, :text => 'Maiores Prestadores por Valor')
	link(:maiores_custos_por_item_medico, :text => 'Maiores Custos por Item Médico')
	link(:indicadores_de_eventos, :text => 'Indicadores de Eventos')
	link(:maiores_usuarios_por_valor_procedimentos, :text => 'Maiores Usuários por Valor - Procedimentos')
	link(:maiores_usuarios_por_quantidade_procedimentos, :text => 'Maiores Usuários por Quantidade - Procedimentos')
	link(:utilizacao_por_origem_da_cobrança, :text => 'Utilização por Origem da Cobrança')
	link(:utilizacao_por_produto, :text => 'Utilização por Produto')
	link(:patologias_clinicas_e_cirurgicas_beneficiario, :text => 'Patologias Clínicas e Cirúrgicas - Beneficiário')
	link(:patologias_clinicas_e_cirurgicas_por_data_solicitacao, :text => 'Patologias Clínicas e Cirúrgicas por Data Solicitação')
	link(:patologias_clinicas_e_cirurgicas_previsão_de_custo, :text => 'Patologias Clínicas e Cirúrgicas - Previsão de Custo')
	link(:patologias_clinicas_e_cirurgicas_previsao_de_custo_empresas_nao_migradas, :text => 'Patologias Clínicas e Cirúrgicas - Previsão de Custo - Empresas não Migradas')
	link(:populacao_por_tipo_de_beneficiario_e_faixa_etaria, :text => 'População por Tipo de Beneficiário e Faixa Etária')
	link(:beneficiarios_ativos, :text => 'Beneficiários Ativos')
	link(:programa_viva_e_vivamil_novo, :text => 'Programa Viva e VivAmil (novo)')
	link(:dashboard_por_empresa, :text => 'Dashboard por Empresa')
	link(:base_de_beneficiarios_ativos_e_excluidos, :text => 'Base de Beneficiários Ativos e Excluídos')
	link(:base_de_beneficiarios_ativos_e_excluidos_interno, :text => 'Base de Beneficiários Ativos e Excluídos Interno')

	def selecionar_analise_de_custos_por_especialidade_beneficiarios_menu_dicop_saude
		begin
			self.analise_de_custos_por_especialidade_beneficiarios_menu_dicop_saude
		rescue Watir::Exception::UnknownObjectException
			fail("Erro ao selecionar a opção Análise de Custos por Especialidade - Beneficiários!!!")
		end
	end

end