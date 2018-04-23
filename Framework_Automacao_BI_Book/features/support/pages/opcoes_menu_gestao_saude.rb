#Caminho da common => /lib/common.rb
require 'common'

class OpcoesMenuGestaoSaude

	include PageObject

	link(:solicitacao_de_conta_corrente, :text => Locators::LOCATOR_OPCAO_SOLICITACAO_DE_CONTA_CORRENTE)
	link(:solicitacao_de_conta_corrente_externo, :text => Locators::LOCATOR_OPCAO_SOLICITACAO_DE_CONTA_CORRENTE_EXTERNO)
	link(:analise_de_custos_e_receita_emitida_contabil, :text => Locators::LOCATOR_OPCAO_ANALISE_DE_CUSTOS_E_RECEITA_EMITIDA_CONTABIL)
	link(:analise_de_custo_total_e_receita_contabil_empresa, :text => 'Análise de Custo Total e Receita Contábil (Empresa)')
	link(:analise_de_custo_total_detalhado_e_receita_contabil, :text => 'Análise de Custo Total Detalhado e Receita Contábil')
	link(:analise_de_custos_e_receita_paga, :text => 'Análise de Custos e Receita Paga')
	link(:analise_de_custos_e_receita_paga_empresa, :text => 'Análise de Custo Total e Receita Paga (Empresa)')
	link(:analise_de_custo_total_detalhado_e_receita_paga, :text => 'Análise de Custo Total Detalhado e Receita Paga')
	link(:analise_de_custos_e_receita_emitida_contabil_por_empresa, :text => 'Análise de Custos e Receita Emitida/Contábil por Empresa')
	link(:analise_de_custos_por_especialidade_beneficiario, :text => 'Análise de Custos por Especialidade - Beneficiários')
	link(:analise_de_custos_por_especialidade, :text => 'Análise de Custos por Especialidade')
	link(:analise_de_custos_e_receita_emitida_contabil_por_sexo_e_produto, :text => 'Análise de Custos e Receita Emitida/Contábil por Sexo e Produto')
	link(:analise_de_custos_por_tipo_de_evento_e_origem_de_cobranca, :text => 'Análise de Custos por Tipo de Evento e Origem de Cobrança')
	link(:maiores_prestadores_por_quantidade_de_eventos, :text => 'Maiores Prestadores por Quantidade de Eventos')
	link(:maiores_prestadores_por_valor, :text => 'Maiores Prestadores por Valor')
	link(:maiores_custos_por_item_medico, :text => 'Maiores Custos por Item Médico')
	link(:indicadores_de_eventos, :text => 'Indicadores de Eventos')
	link(:maiores_usuarios_por_valor_procedimentos, :text => 'Maiores Usuários por Valor - Procedimentos')
	link(:maiores_usuarios_por_quantidade_procedimentos, :text => 'Maiores Usuários por Quantidade - Procedimentos')
	link(:maiores_usuarios_por_quantidade, :text => 'Maiores Usuários por Quantidade')
	link(:utilizacao_por_produto, :text => 'Utilização por Produto')
	link(:patologias_clinicas_e_cirurgicas_beneficiario, :text => 'Patologias Clínicas e Cirúrgicas - Beneficiário')
	link(:patologias_clinicas_e_cirurgicas_por_data_solicitacao, :text => 'Patologias Clínicas e Cirúrgicas por Data Solicitação')
	link(:internacoes_home_care, :text => 'Internações HOME CARE')
	link(:patologias_clinicas_e_cirurgicas, :text => 'Patologias Clínicas e Cirúrgicas')
	link(:beneficiarios_acompanhados_por_programa_amil, :text => 'Beneficiários Acompanhados por Programa Amil')
	link(:beneficiarios_ativos, :text => 'Beneficiários Ativos')
	link(:beneficiarios_ativos_por_faixa_etaria, :text => 'Beneficiários Ativos por Faixa Etária')
	link(:consulta_de_beneficiarios, :text => 'Consulta de Beneficiários')
	link(:reembolso_por_data_pagamento, :text => 'Reembolso por Data Pagamento')
	link(:reembolso_por_data_solicitacao, :text => 'Reembolso por Data Solicitação')
	link(:programa_viva_e_vivamil_novo, :text => 'Programa Viva e VivAmil (novo)')
	link(:extrato_receita_emitida_contabil, :text => 'Extrato Receita Emitida/Contábil')
	link(:extrato_receita_paga, :text => 'Extrato Receita Paga')
	link(:solicitacao_de_conta_corrente_interno, :text => 'Solicitação de Conta Corrente Interno')
	link(:base_de_beneficiarios_ativos_e_excluidos, :text => 'Base de Beneficiários Ativos e Excluídos')
	link(:solicitacao_de_conta_corrente_one_health_externo, :text => 'Solicitação de Conta Corrente ONE Health Externo')
	link(:base_de_beneficiarios_ativos_e_excluidos_interno, :text => 'Base de Beneficiários Ativos e Excluídos Interno')
	link(:comissao_por_grupo_de_performace, :text => 'Comissão por Grupo de Performance')

	def selecionar_analise_de_custos_e_receita_emitida_contabil_menu_gestao_saude
		begin
			self.analise_de_custos_e_receita_emitida_contabil
		rescue Watir::Exception::UnknownObjectException
			fail("Erro ao selecionar a opção Análise de Custos e Receita Emitida/Contábil!!!")
		end
	end

end