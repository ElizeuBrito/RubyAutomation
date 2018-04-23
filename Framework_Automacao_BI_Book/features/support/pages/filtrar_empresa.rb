#Caminho da common => /lib/common.rb
require "common"
require "test/unit"
require "test/unit/assertion-failed-error"
require "test/unit/assertions"
include Test::Unit::Assertions

class FiltrarEmpresa < Test::Unit::TestCase

	include PageObject
	include Locators

	text_field(:preencher_campo_pesquisa_empresa, :id => Locators::LOCATOR_GRID_FILTRAR_EMPRESA_CAMPO_PESQUISA)
	button(:acionar_lupa, :id => Locators::LOCATOR_GRID_FILTRAR_EMPRESA_LUPA)
	button(:acionar_botao_sair_e_atualizar_relatorio, :id => Locators::LOCATOR_GRID_FILTRAR_EMPRESA_BOTAO_SAIR_E_ATUALIZAR_RELATORIO)
	button(:acionar_botao_adicionar, :value => Locators::LOCATOR_GRID_FILTRAR_EMPRESA_BOTAO_ADICIONAR_EMPRESA)
	link(:acionar_empresas_selecionadas, :id => Locators::LOCATOR_FILTRAR_EMPRESA_EMPRESAS_SELECIONADAS)

	def campos_filtrar_empresa_visiveis?
		begin
			wait_until do
				@browser.span(:class => Locators::LOCATOR_GRID_CAMPO_PESQUISA).visible?
			end
		rescue Watir::Exception::UnknownObjectException 
			fail("Campo Pesquisa do Grid Filtrar Empresa não foi exibido!!!")
		end
	end

	def pesquisar_empresa(empresa)
		begin
			self.preencher_campo_pesquisa_empresa=(empresa)
			#@browser.text_field(:id => Locators::LOCATOR_GRID_FILTRAR_EMPRESA_CAMPO_PESQUISA).set(empresa)
			self.acionar_lupa
		rescue Watir::Exception::UnknownObjectException 
			fail("Não foi possível pesquisar a empresa #{empresa} no grid Filtrar Empresa!!!")
		end
	end

	def verficar_empresa_apresentada_no_grid_fltrar_empresa(empresa)
		begin
			wait_until do
				locator_empresas_selecionadas = verificar_empresa_selecionada_no_grid_filial_empresa(empresa)
				@browser.element(:xpath => locator_empresas_selecionadas).wait_until_present
			end
		rescue Watir::Exception::UnknownObjectException 
			fail("Empresa #{empresa} não foi apresentada no grid Filtrar Empresa!!!")
		end
	end

  def selecionar_empresa_no_grid_filtrar_empresa(empresa)
  	begin
    	table = @browser.table(:class => [Locators::LOCATOR_GRID_FILTRAR_EMPRESA])
  		textRow = table.td(:text => empresa).parent
  		if textRow.input(:value => Locators::LOCATOR_GRID_FILTRAR_EMPRESA_BOTAO_ADICIONAR_EMPRESA).exists?
    		textRow.input(:value => Locators::LOCATOR_GRID_FILTRAR_EMPRESA_BOTAO_ADICIONAR_EMPRESA).click
  		end
  	rescue Watir::Exception::UnknownObjectException 
  		fail("Não foi possível selecionar a empresa #{empresa} no grid Filtrar Empresa!!!")
  	end
  end

  def inserir_coligadas_empresa_no_grid_filtrar_empresa(empresa)
  	begin
  		locator_coligadas_empresa = verificar_empresa_coligadas_no_grid_filial_empresa(empresa)
    	table = @browser.table(:class => [Locators::LOCATOR_GRID_FILTRAR_EMPRESA])
  		textRow = table.td(:text => empresa).parent
  		if textRow.input(:value => Locators::LOCATOR_GRID_FILTRAR_EMPRESA_BOTAO_ADICIONAR_EMPRESA).exists?
  			@browser.element(:xpath => locator_coligadas_empresa).click
    		textRow.input(:value => Locators::LOCATOR_GRID_FILTRAR_EMPRESA_BOTAO_ADICIONAR_EMPRESA).click
  		end
  	rescue Watir::Exception::UnknownObjectException 
  		fail("Não foi possível inserir holding para a empresa #{empresa} no grid Filtrar Empresa!!!")
  	end
  end

  def inserir_holding_empresa_no_grid_filtrar_empresa(empresa)
  	begin
  		locator_holding_empresa = verificar_empresa_holding_no_grid_filial_empresa(empresa)
    	table = @browser.table(:class => [Locators::LOCATOR_GRID_FILTRAR_EMPRESA])
  		textRow = table.td(:text => empresa).parent
  		if textRow.input(:value => Locators::LOCATOR_GRID_FILTRAR_EMPRESA_BOTAO_ADICIONAR_EMPRESA).exists?
  			@browser.element(:xpath => locator_holding_empresa).click
    		textRow.input(:value => Locators::LOCATOR_GRID_FILTRAR_EMPRESA_BOTAO_ADICIONAR_EMPRESA).click
  		end
  	rescue Watir::Exception::UnknownObjectException 
  		fail("Não foi possível inserir holding para a empresa #{empresa} no grid Filtrar Empresa!!!")
  	end
  end


  def acionar_botao_sair_e_atualizar_relatorio
  	begin
 	 	@browser.input(:id => Locators::LOCATOR_GRID_FILTRAR_EMPRESA_BOTAO_SAIR_E_ATUALIZAR_RELATORIO).click	
  	rescue Watir::Exception::UnknownObjectException 
  		fail("Não foi possível acionar o botão Sair e Atualizar Relatório!!!")
  	end
  end

  def obter_dados_do_relatorio31_filial_empresa
		begin
			table_array = Array.new
			table = @browser.table(:xpath => Locators::LOCATOR_TABELA_RELATORIO_31)
			table.rows.each do |row|
    			row_array = Array.new
    			row.cells.each do |cell|
        			row_array << cell.text
    			end
   	 				table_array << row_array
			end
		rescue Watir::Exception::UnknownObjectException 
			fail("Não foi possível obter os dados da tabela do relatório31 para filial empresa!!!")
		end
		return table_array
	end

	def acionar_opcao_empresas_selecionadas
		begin
			self.acionar_empresas_selecionadas
		rescue Watir::Exception::UnknownObjectException
			fail("Não foi possível selecionar a opção Empresas Selecionadas!!!")
		end
	end

	def conferir_dados_do_relatorio31_filial_empresa_demitidos_aposentados_TODOS_com_banco_de_dados_para_ultimas_tres_competencias(competencia1, competencia2, competencia3)

		dados_relatorio = obter_dados_do_relatorio31_filial_empresa

		relatorio_receita_1 = dados_relatorio[2][2]	
		relatorio_receita_2 = dados_relatorio[3][2]		
		relatorio_receita_3 = dados_relatorio[4][2]

		relatorio_custo_total_1 = dados_relatorio[2][3]	
		relatorio_custo_total_2 = dados_relatorio[3][3]
		relatorio_custo_total_3 = dados_relatorio[4][3]
	
		relatorio_sinistralidade_1 = dados_relatorio[2][4]	
		relatorio_sinistralidade_2 = dados_relatorio[3][4]
		relatorio_sinistralidade_3 = dados_relatorio[4][4]

		relatorio_qtde_benef_atendidos_1 = dados_relatorio[2][5]	
		relatorio_qtde_benef_atendidos_2 = dados_relatorio[3][5]	
		relatorio_qtde_benef_atendidos_3 = dados_relatorio[4][5]
		
		relatorio_custo_per_capita_1 = dados_relatorio[2][6]	
		relatorio_custo_per_capita_2 = dados_relatorio[3][6]
		relatorio_custo_per_capita_3	= dados_relatorio[4][6]
		
		relatorio_qtde_vidas_1 = dados_relatorio[2][7]	
		relatorio_qtde_vidas_2 = dados_relatorio[3][7]
		relatorio_qtde_vidas_3 = dados_relatorio[4][7]


		#puts relatorio_receita_1, relatorio_receita_2, relatorio_receita_3
		#puts relatorio_custo_total_1, relatorio_custo_total_2, relatorio_custo_total_3
		#puts relatorio_sinistralidade_1, relatorio_sinistralidade_2, relatorio_sinistralidade_3
		#puts relatorio_qtde_benef_atendidos_1, relatorio_qtde_benef_atendidos_2, relatorio_qtde_benef_atendidos_3
		#puts relatorio_custo_per_capita_1, relatorio_custo_per_capita_2, relatorio_custo_per_capita_3
		#puts relatorio_qtde_vidas_1, relatorio_qtde_vidas_2, relatorio_qtde_vidas_3

		banco = BancoDeDadosBIBook.new
		banco.tres_ultimas_competencias(competencia1, competencia2, competencia3)
		imprimir_dados = banco.recuperar_dados_bd_bi_book_ultimas_tres_competencias_demitidos_aposentados_todos_filial_empresa

		banco_receita_1 = imprimir_dados[0][0]["Receita"]
		banco_receita_1 = convertenumeroparafloat_banco(banco_receita_1)
		banco_receita_1 = converter_numero_para_moeda_real(banco_receita_1)

		banco_receita_2 = imprimir_dados[0][1]["Receita"]
		banco_receita_2 = convertenumeroparafloat_banco(banco_receita_2)
		banco_receita_2 = converter_numero_para_moeda_real(banco_receita_2)
		

		banco_receita_3 = imprimir_dados[0][2]["Receita"]
		banco_receita_3 = convertenumeroparafloat_banco(banco_receita_3)
		banco_receita_3 = converter_numero_para_moeda_real(banco_receita_3)
		

		banco_custo_total_1 = imprimir_dados[0][0]["Custo Total"]
		banco_custo_total_1 = convertenumeroparafloat_banco(banco_custo_total_1)
		banco_custo_total_1 = converter_numero_para_moeda_real(banco_custo_total_1)

		banco_custo_total_2 = imprimir_dados[0][1]["Custo Total"]
		banco_custo_total_2 = convertenumeroparafloat_banco(banco_custo_total_2)
		banco_custo_total_2 = converter_numero_para_moeda_real(banco_custo_total_2)
		

		banco_custo_total_3 = imprimir_dados[0][2]["Custo Total"]
		banco_custo_total_3 = convertenumeroparafloat_banco(banco_custo_total_3)
		banco_custo_total_3 = converter_numero_para_moeda_real(banco_custo_total_3)
		

		banco_sinistralidade_1 = imprimir_dados[0][0]["Sinistralidade"]
		banco_sinistralidade_1 = convertersinistralidadeparafloat_banco(banco_sinistralidade_1)
		banco_sinistralidade_1 = convertersinistralidade_banco(banco_sinistralidade_1)

		banco_sinistralidade_2 = imprimir_dados[0][1]["Sinistralidade"]
		banco_sinistralidade_2 = convertersinistralidadeparafloat_banco(banco_sinistralidade_2)
		banco_sinistralidade_2 = convertersinistralidade_banco(banco_sinistralidade_2)

		banco_sinistralidade_3 = imprimir_dados[0][2]["Sinistralidade"]
		banco_sinistralidade_3 = convertersinistralidadeparafloat_banco(banco_sinistralidade_3)
		banco_sinistralidade_3 = convertersinistralidade_banco(banco_sinistralidade_3)

		banco_qtde_benef_atendidos_1 = imprimir_dados[0][0]["Qtde Benef. Atendidos"]
		banco_qtde_benef_atendidos_1 = converter_beneficiarios_e_vidas(banco_qtde_benef_atendidos_1)

		banco_qtde_benef_atendidos_2 = imprimir_dados[0][1]["Qtde Benef. Atendidos"]
		banco_qtde_benef_atendidos_2 = converter_beneficiarios_e_vidas(banco_qtde_benef_atendidos_2)

		banco_qtde_benef_atendidos_3 = imprimir_dados[0][2]["Qtde Benef. Atendidos"]
		banco_qtde_benef_atendidos_3 = converter_beneficiarios_e_vidas(banco_qtde_benef_atendidos_3)

		banco_custo_per_capita_1 = imprimir_dados[0][0]["Custo per Capita"]
		banco_custo_per_capita_1 = convertenumeroparafloat_banco(banco_custo_per_capita_1)
		banco_custo_per_capita_1 = converter_numero_para_moeda_real(banco_custo_per_capita_1)

		banco_custo_per_capita_2 = imprimir_dados[0][1]["Custo per Capita"]
		banco_custo_per_capita_2 = convertenumeroparafloat_banco(banco_custo_per_capita_2)
		banco_custo_per_capita_2 = converter_numero_para_moeda_real(banco_custo_per_capita_2)

		banco_custo_per_capita_3 = imprimir_dados[0][2]["Custo per Capita"]
		banco_custo_per_capita_3 = convertenumeroparafloat_banco(banco_custo_per_capita_3)
		banco_custo_per_capita_3 = converter_numero_para_moeda_real(banco_custo_per_capita_3)

		banco_qtde_vidas_1 = imprimir_dados[0][0]["Qtde de Vidas"]
		banco_qtde_vidas_1 = converter_beneficiarios_e_vidas(banco_qtde_vidas_1)

		banco_qtde_vidas_2 = imprimir_dados[0][1]["Qtde de Vidas"]
		banco_qtde_vidas_2 = converter_beneficiarios_e_vidas(banco_qtde_vidas_2)

		banco_qtde_vidas_3 = imprimir_dados[0][2]["Qtde de Vidas"]
		banco_qtde_vidas_3 = converter_beneficiarios_e_vidas(banco_qtde_vidas_3)

		#puts banco_receita_1,banco_receita_2, banco_receita_3
		#puts banco_custo_total_1, banco_custo_total_2, banco_custo_total_3
		#puts banco_sinistralidade_1, banco_sinistralidade_2, banco_sinistralidade_3
		#puts banco_qtde_benef_atendidos_1, banco_qtde_benef_atendidos_2, banco_qtde_benef_atendidos_3
		#puts banco_custo_per_capita_1, banco_custo_per_capita_2, banco_custo_per_capita_3
		#puts banco_qtde_vidas_1, banco_qtde_vidas_2, banco_qtde_vidas_3

		begin
			assert_equal(relatorio_receita_1, banco_receita_1)
			$world.puts "Receita no valor de #{relatorio_receita_1} apresentada no relatório é igual a receita no valor de #{banco_receita_1} 
			apresentada no banco de dados, referente a competência de #{competencia1}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Receita no valor de #{relatorio_receita_1} apresentada no relatório não é igual a receita no valor de #{banco_receita_1} 
			apresentada no banco de dados, referente a competência de #{competencia1}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_receita_2, banco_receita_2)
			$world.puts "Receita no valor de #{relatorio_receita_2} apresentada no relatório é igual a receita no valor de #{banco_receita_2} 
			apresentada no banco de dados, referente a competência de #{competencia2}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Receita no valor de #{relatorio_receita_2} apresentada no relatório não é igual a receita no valor de #{banco_receita_2} 
			apresentada no banco de dados, referente a competência de #{competencia2}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_receita_3, banco_receita_3)
			$world.puts "Receita no valor de #{relatorio_receita_3} apresentada no relatório é igual a receita no valor de #{banco_receita_3} 
			apresentada no banco de dados, referente a competência de #{competencia3}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Receita no valor de #{relatorio_receita_3} apresentada no relatório não é igual a receita no valor de #{banco_receita_3} 
			apresentada no banco de dados, referente a competência de #{competencia3}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_total_1, banco_custo_total_1)
			$world.puts "Custo Total no valor de #{relatorio_custo_total_1} apresentado no relatório é igual ao Custo Total no valor de #{banco_custo_total_1} 
			apresentado no banco de dados, referente a competência de #{competencia1}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Total no valor de #{relatorio_custo_total_1} apresentado no relatório não é igual ao Custo Total no valor de #{banco_custo_total_1} 
			apresentado no banco de dados, referente a competência de #{competencia1}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_total_2, banco_custo_total_2)
			$world.puts "Custo Total no valor de #{relatorio_custo_total_2} apresentado no relatório é igual ao Custo Total no valor de #{banco_custo_total_2} 
			apresentado no banco de dados, referente a competência de #{competencia2}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Total no valor de #{relatorio_custo_total_2} apresentado no relatório não é igual ao Custo Total no valor de #{banco_custo_total_2} 
			apresentado no banco de dados, referente a competência de #{competencia2}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_total_3, banco_custo_total_3)
			$world.puts "Custo Total no valor de #{relatorio_custo_total_3} apresentado no relatório é igual ao Custo Total no valor de #{banco_custo_total_3} 
			apresentado no banco de dados, referente a competência de #{competencia3}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Total no valor de #{relatorio_custo_total_3} apresentado no relatório não é igual ao Custo Total no valor de #{banco_custo_total_3} 
			apresentado no banco de dados, referente a competência de #{competencia3}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_sinistralidade_1, banco_sinistralidade_1)
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_1} apresentada no relatório é igual a Sinistralidade de #{banco_sinistralidade_1} 
			apresentada no banco de dados, referente a competência de #{competencia1}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_1} apresentada no relatório não é igual a Sinistralidade de #{banco_sinistralidade_1} 
			apresentada no banco de dados, referente a competência de #{competencia1}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_sinistralidade_2, banco_sinistralidade_2)
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_2} apresentada no relatório é igual a Sinistralidade de #{banco_sinistralidade_2} 
			apresentada no banco de dados, referente a competência de #{competencia2}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_2} apresentada no relatório não é igual a Sinistralidade de #{banco_sinistralidade_2} 
			apresentada no banco de dados, referente a competência de #{competencia2}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_sinistralidade_3, banco_sinistralidade_3)
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_3} apresentada no relatório é igual a Sinistralidade de #{banco_sinistralidade_3} 
			apresentada no banco de dados, referente a competência de #{competencia3}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_3} apresentada no relatório não é igual a Sinistralidade de #{banco_sinistralidade_3} 
			apresentada no banco de dados, referente a competência de #{competencia3}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_benef_atendidos_1, banco_qtde_benef_atendidos_1)
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_1} apresentada no relatório é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_1} 
			apresentada no banco de dados, referente a competência de #{competencia1}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_1} apresentada no relatório não é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_1} 
			apresentada no banco de dados, referente a competência de #{competencia1}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_benef_atendidos_2, banco_qtde_benef_atendidos_2)
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_2} apresentada no relatório é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_2} 
			apresentada no banco de dados, referente a competência de #{competencia2}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_2} apresentada no relatório não é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_2} 
			apresentada no banco de dados, referente a competência de #{competencia2}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_benef_atendidos_3, banco_qtde_benef_atendidos_3)
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_3} apresentada no relatório é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_3} 
			apresentada no banco de dados, referente a competência de #{competencia3}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_3} apresentada no relatório não é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_3} 
			apresentada no banco de dados, referente a competência de #{competencia3}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_per_capita_1, banco_custo_per_capita_1)
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_1} apresentado no relatório é igual ao Custo per capita no valor de #{banco_custo_per_capita_1} 
			apresentado no banco de dados, referente a competência de #{competencia1}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_1} apresentado no relatório não é igual ao Custo per capita no valor de #{banco_custo_per_capita_1} 
			apresentado no banco de dados, referente a competência de #{competencia1}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_per_capita_2, banco_custo_per_capita_2)
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_2} apresentado no relatório é igual ao Custo per capita no valor de #{banco_custo_per_capita_2} 
			apresentado no banco de dados, referente a competência de #{competencia2}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_2} apresentado no relatório não é igual ao Custo per capita no valor de #{banco_custo_per_capita_2} 
			apresentado no banco de dados, referente a competência de #{competencia2}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_per_capita_3, banco_custo_per_capita_3)
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_3} apresentado no relatório é igual ao Custo per capita no valor de #{banco_custo_per_capita_3} 
			apresentado no banco de dados, referente a competência de #{competencia3}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_3} apresentado no relatório não é igual ao Custo per capita no valor de #{banco_custo_per_capita_3} 
			apresentado no banco de dados, referente a competência de #{competencia3}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_vidas_1, banco_qtde_vidas_1)
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_1} apresentada no relatório é igual a Qtde de vidas #{banco_qtde_vidas_1} 
			apresentada no banco de dados, referente a competência de #{competencia1}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_1} apresentada no relatório não é igual a Qtde de vidas #{banco_qtde_vidas_1} 
			apresentada no banco de dados, referente a competência de #{competencia1}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_vidas_2, banco_qtde_vidas_2)
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_2} apresentada no relatório é igual a Qtde de vidas #{banco_qtde_vidas_2} 
			apresentada no banco de dados, referente a competência de #{competencia2}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_2} apresentada no relatório não é igual a Qtde de vidas #{banco_qtde_vidas_2} 
			apresentada no banco de dados, referente a competência de #{competencia2}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_vidas_3, banco_qtde_vidas_3)
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_3} apresentada no relatório é igual a Qtde de vidas #{banco_qtde_vidas_3} 
			apresentada no banco de dados, referente a competência de #{competencia3}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_3} apresentada no relatório não é igual a Qtde de vidas #{banco_qtde_vidas_3} 
			apresentada no banco de dados, referente a competência de #{competencia3}!!!: #{mensagem_de_erro.message}"
		end

		if relatorio_receita_1 == banco_receita_1 and
		   relatorio_receita_2 == banco_receita_2 and
		   relatorio_receita_3 == banco_receita_3 and
		   relatorio_custo_total_1 == banco_custo_total_1 and
		   relatorio_custo_total_2 == banco_custo_total_2 and
		   relatorio_custo_total_3 == banco_custo_total_3 and
		   relatorio_sinistralidade_1 == banco_sinistralidade_1 and
		   relatorio_sinistralidade_2 == banco_sinistralidade_2 and
		   relatorio_sinistralidade_3 == banco_sinistralidade_3 and
		   relatorio_qtde_benef_atendidos_1 == banco_qtde_benef_atendidos_1 and
		   relatorio_qtde_benef_atendidos_2 == banco_qtde_benef_atendidos_2 and
		   relatorio_qtde_benef_atendidos_3 == banco_qtde_benef_atendidos_3 and
		   relatorio_custo_per_capita_1 == banco_custo_per_capita_1 and
		   relatorio_custo_per_capita_2 == banco_custo_per_capita_2 and
		   relatorio_custo_per_capita_3 == relatorio_custo_per_capita_3 and
		   relatorio_qtde_vidas_1 == banco_qtde_vidas_1 and
		   relatorio_qtde_vidas_2 == banco_qtde_vidas_2 and
		   relatorio_qtde_vidas_3 == banco_qtde_vidas_3

		  	$world.puts "Caso de Teste passou!!!"
		else
			$world.puts "Query utilizada na consulta para as competências de #{competencia1}, #{competencia2} e #{competencia3}:\n\n\n #{FigNewton.query_cenario1}"
			fail($world.puts "Caso de Teste falhou!!!")
		end

		$world.puts "Query utilizada na consulta para as competências de #{competencia1}, #{competencia2} e #{competencia3}:\n\n\n #{FigNewton.query_cenario4}"
	
	end

	def convertenumeroparafloat_banco(numero)
		return (numero).to_f.round(2)
	end

	def convertersinistralidadeparafloat_banco(numero)
		return (numero).to_f
	end

	def convertersinistralidade_banco(numero)
		return ConversorDeNumeros.number_to_percentage(numero * 100, precision: 2, separator: ',') 
	end

	def converterbeneficiarios_e_vidas_tela(numero)
		return (numero).scan(/\d+/).join().to_i
	end

	def converter_numero_para_moeda_real(number)
  		return ConversorDeNumeros.number_to_currency(number, :unit => "R$ ", :separator => ",", :delimiter => ".", precision: 2)
	end

	def converter_beneficiarios_e_vidas(numero)
		return ConversorDeNumeros.number_to_delimited(numero, delimiter: ".")
	end

 end