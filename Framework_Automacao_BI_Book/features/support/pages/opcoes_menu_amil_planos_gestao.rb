#Caminho da common => /lib/common.rb
require 'common'

class OpcoesMenuAmilPlanosGestao

	include PageObject

	link(:analise_de_receita_competencia_menu_amil_planos_gestao, :xpath => Locators::LOCATOR_OPCAO_ANALISE_DE_RECEITA_COMPETENCIA_MENU_AMIL_PLANOS_GESTAO)
	
	def selecionar_analise_de_receita_competencia_menu_amil_planos_gestao
		begin
			self.analise_de_receita_competencia_menu_amil_planos_gestao
		rescue Watir::Exception::UnknownObjectException
			fail("Erro ao selecionar a opção Análise de Receita - Competência!!!")
		end
	end

end