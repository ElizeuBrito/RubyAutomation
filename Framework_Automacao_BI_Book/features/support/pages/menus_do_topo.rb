#Caminho da common => /lib/common.rb
require 'common'

class MenusTopo

	include PageObject

	def selecionar_menu_gestao_saude
		begin
			@browser.td(:id => Locators::LOCATOR_MENU_GESTAO_SAUDE).hover
		rescue Watir::Exception::UnknownObjectException
			fail("Erro ao selecionar o menu Gestão Saúde!!!")
		end
	end

	def selecionar_menu_gestao_dental
		begin
			@browser.td(:id => Locators::LOCATOR_MENU_GESTAO_DENTAL).hover
		rescue Watir::Exception::UnknownObjectException
			fail("Erro ao selecionar o menu Gestão Dental!!!")
		end
	end

	def selecionar_menu_dicop_saude
		begin
			@browser.td(:id => Locators::LOCATOR_MENU_DICOP_SAUDE).hover
		rescue Watir::Exception::UnknownObjectException
			fail("Erro ao selecionar o menu DICOP Saúde!!!")
		end
	end

	def selecionar_menu_dicop_dental
		self.dicop_dental_element.hover
	end

	def selecionar_menu_amil_planos_gestao
		begin
			@browser.td(:id => Locators::LOCATOR_MENU_AMIL_PLANOS_GESTAO).hover
		rescue Watir::Exception::UnknownObjectException
			fail("Erro ao selecionar o menu Amil Planos - Gestão!!!")
		end
	end

	def selecionar_menu_amil_planos_dicop
		self.amil_planos_dicop_element.hover
	end

	def selecionar_menu_gerenciais
		self.gerenciais_element.hover
	end

	def selecionar_menu_inteligencia_corp
		self.inteligencia_corp_element.hover
	end

	def selecionar_menu_estaticos_saude
		self.estaticos_saude_element.hover
	end

	def selecionar_menu_administrativo
		self.administrativo_element.hover
	end

end