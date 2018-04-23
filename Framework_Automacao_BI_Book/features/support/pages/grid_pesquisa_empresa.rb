#Caminho da common => /lib/common.rb
require 'common'

class GridPesquisaEmpresa

	include PageObject

	div(:grid_pesquisa_empresa, :id => 'ctl00_ContentPlaceHolder1_mpeEmpresa_foregroundElement')
	table(:empresas_no_grid_pesquisa_empresa, :class => 'gridPesquisa')
	button(:botao_lupa_grid_pesquisa_empresa, :id => 'ctl00_ContentPlaceHolder1_btnPesquisaEmpresa')
	button(:botao_adicionar_grid_pesquisa_empresa, :value => 'Adicionar')
	text_field(:campo_de_texto_pesquisa, :id => 'ctl00_ContentPlaceHolder1_txtPesquisaEmpresa')


	def grid_pesquisa_empresa_visivel?
		begin
			wait_until do
				self.grid_pesquisa_empresa_element.visible?
			end
		rescue Watir::Exception::UnknownObjectException
			puts "Grid pesquisa empresa não foi exibido"
		end
	end

	def empresa_apresentada_no_grid?(empresa_filtrada)
		begin
			table(:empresa_filtrada_no_grid_pesquisa_empresa, :xpath => '//table[@class=""]')
		rescue Watir::Exception::UnknownObjectException
			puts "Erro..."
		end
	end

	def preencher_campo_pesquisa(empresa)
		begin
			self.campo_de_texto_pesquisa= empresa
			botao_lupa_grid_pesquisa_empresa
		rescue Watir::Exception::UnknownObjectException
			puts "Não foi possível clicar no botão Lupa"
		end
	end

	def selecionar_empresa_no_grid(empresa)
		begin
			id = empresas_no_grid_pesquisa_empresa_elements.find_index { |table| table.text == empresa }
			botao_adicionar_grid_pesquisa_empresa_elements[id].click
		rescue Watir::Exception::UnknownObjectException
			puts "Não foi possível clicar no Adicionar a empresa filtrada"
		end
	end

end