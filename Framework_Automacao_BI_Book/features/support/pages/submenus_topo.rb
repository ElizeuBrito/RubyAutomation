#Caminho da common => /lib/common.rb
require 'common'

class SubmenusTopo

	include PageObject

	link(:selecionar_opcao_filtrar_empresa, :text => Locators::LOCATOR_LINK_FILTRAR_EMPRESA)
	link(:selecionar_opcao_limpar_filtro, :text => Locators::LOCATOR_LINK_LIMPAR_FILTRO)
	link(:selecionar_opcao_gerar_relatorio, :text => Locators::LOCATOR_LINK_GERAR_RELATORIO)

	def botao_filtrar_empresa_visivel?
		begin
			wait_until do
				self.selecionar_opcao_filtrar_empresa_element.visible?
			end
		rescue Watir::Exception::UnknownObjectException
			fail("Erro ao selecionar o link Filtrar Empresa!!!")
		end
	end

	def botao_limpar_filtro_visivel?
		begin
			wait_until do
				self.selecionar_opcao_filtrar_empresa_element.visible?
			end
		rescue Watir::Exception::UnknownObjectException
			fail("Erro ao selecionar o link Limpar Filtro!!!")
		end
	end

	def botao_gerar_relatorio_visivel?
		begin
			wait_until do
				self.selecionar_opcao_filtrar_empresa_element.visible?
			end
		rescue Watir::Exception::UnknownObjectException
			fail("Erro ao selecionar o link Gerar Relatório!!!")
		end
	end

end