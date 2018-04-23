#Caminho da common => /lib/common.rb
require "common"
require "test/unit"
require "test/unit/assertion-failed-error"
require "test/unit/assertions"
include Test::Unit::Assertions

class GestaoSaudeGerarRelatorio < Test::Unit::TestCase

	include PageObject
	include ConversorDeNumeros
	include TratarString

	table(:campo_demitidos_e_aposentados, :xpath => Locators::LOCATOR_FILTRO_DEMITIDOS_E_APOSENTADOS)
	table(:campo_filial_empresa, :xpath => Locators::LOCATOR_FILTRO_FILIAL_EMPRESA)
	table(:campo_data_de_competencia, :xpath => Locators::LOCATOR_FILTRO_DATA_DE_COMPETENCIA)
	table(:campo_empresa, :xpath => Locators::LOCATOR_FILTRO_EMPRESA)
	table(:campo_moeda, :xpath => Locators::LOCATOR_FILTRO_MOEDA)

	<<-DOC
	Mapa de navegação na tabela do relatório Gestão Saúde Análise de Custos e Receita Emitida/Contábil

		Array bidimenssional
		[1][1] -> Campo Data de Competência
		[2][1] -> Campo Antepenúltima competência
		[3][1] -> Campo Penúltima competência
		[4][1] -> Campo última competência
		[5][1] -> Campo Total

		[2][2] -> Receita da antepenúltima competência
	DOC
	def obter_dados_do_relatorio31
		begin
			table_array = Array.new
			table = @browser.table(:xpath => Locators::LOCATOR_TABELA_RELATORIO_31)
			table.trs.each do |row|
    			row_array = Array.new
    			row.cells.each do |cell|
        			row_array << cell.text
    			end
   	 				table_array << row_array
			end
		rescue Watir::Exception::UnknownObjectException 
			fail("Não foi possível obter os dados da tabela do relatório31!!!")
		end
		return table_array
	end

	#----------------------------Relatorio_31_01----------------------------#
	# Demitidos e Aposentados = Todas										#
	# Filial Empresa = Todas												#
	# Data Competência = Última competência mais 2 competências anteriores	#
	# Empresas = Todas 														#
	# Moeda = Real   														#
	# 																		#
	#-----------------------------------------------------------------------#
	def conferir_dados_do_relatorio31_01(competencia1, competencia2, competencia3)

		dados_relatorio = obter_dados_do_relatorio31

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
		imprimir_dados = banco.recuperar_dados_bd_bi_book_ultimas_tres_competencias_demitidos_aposentados_todos

		banco_receita_1 = imprimir_dados[0][0]["Receita"]
		banco_receita_1 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_receita_1)
		banco_receita_1 = converter_numero_banco_para_moeda_real(banco_receita_1)

		banco_receita_2 = imprimir_dados[0][1]["Receita"]
		banco_receita_2 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_receita_2)
		banco_receita_2 = converter_numero_banco_para_moeda_real(banco_receita_2)
		

		banco_receita_3 = imprimir_dados[0][2]["Receita"]
		banco_receita_3 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_receita_3)
		banco_receita_3 = converter_numero_banco_para_moeda_real(banco_receita_3)
		

		banco_custo_total_1 = imprimir_dados[0][0]["Custo Total"]
		banco_custo_total_1 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_total_1)
		banco_custo_total_1 = converter_numero_banco_para_moeda_real(banco_custo_total_1)

		banco_custo_total_2 = imprimir_dados[0][1]["Custo Total"]
		banco_custo_total_2 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_total_2)
		banco_custo_total_2 = converter_numero_banco_para_moeda_real(banco_custo_total_2)
		

		banco_custo_total_3 = imprimir_dados[0][2]["Custo Total"]
		banco_custo_total_3 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_total_3)
		banco_custo_total_3 = converter_numero_banco_para_moeda_real(banco_custo_total_3)
		

		banco_sinistralidade_1 = imprimir_dados[0][0]["Sinistralidade"]
		banco_sinistralidade_1 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_sinistralidade_1, 100)
		#banco_sinistralidade_1 = convertersinistralidade_banco(banco_sinistralidade_1)

		banco_sinistralidade_2 = imprimir_dados[0][1]["Sinistralidade"]
		banco_sinistralidade_2 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_sinistralidade_2, 100)
		#banco_sinistralidade_2 = convertersinistralidade_banco(banco_sinistralidade_2)

		banco_sinistralidade_3 = imprimir_dados[0][2]["Sinistralidade"]
		banco_sinistralidade_3 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_sinistralidade_3, 100)
		#banco_sinistralidade_3 = convertersinistralidade_banco(banco_sinistralidade_3)

		banco_qtde_benef_atendidos_1 = imprimir_dados[0][0]["Qtde Benef. Atendidos"]
		banco_qtde_benef_atendidos_1 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_benef_atendidos_1)

		banco_qtde_benef_atendidos_2 = imprimir_dados[0][1]["Qtde Benef. Atendidos"]
		banco_qtde_benef_atendidos_2 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_benef_atendidos_2)

		banco_qtde_benef_atendidos_3 = imprimir_dados[0][2]["Qtde Benef. Atendidos"]
		banco_qtde_benef_atendidos_3 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_benef_atendidos_3)

		banco_custo_per_capita_1 = imprimir_dados[0][0]["Custo per Capita"]
		banco_custo_per_capita_1 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_per_capita_1)
		banco_custo_per_capita_1 = converter_numero_banco_para_moeda_real(banco_custo_per_capita_1)

		banco_custo_per_capita_2 = imprimir_dados[0][1]["Custo per Capita"]
		banco_custo_per_capita_2 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_per_capita_2)
		banco_custo_per_capita_2 = converter_numero_banco_para_moeda_real(banco_custo_per_capita_2)

		banco_custo_per_capita_3 = imprimir_dados[0][2]["Custo per Capita"]
		banco_custo_per_capita_3 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_per_capita_3)
		banco_custo_per_capita_3 = converter_numero_banco_para_moeda_real(banco_custo_per_capita_3)

		banco_qtde_vidas_1 = imprimir_dados[0][0]["Qtde de Vidas"]
		banco_qtde_vidas_1 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_vidas_1)

		banco_qtde_vidas_2 = imprimir_dados[0][1]["Qtde de Vidas"]
		banco_qtde_vidas_2 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_vidas_2)

		banco_qtde_vidas_3 = imprimir_dados[0][2]["Qtde de Vidas"]
		banco_qtde_vidas_3 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_vidas_3)

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
		   relatorio_custo_per_capita_3 == banco_custo_per_capita_3 and

		   relatorio_qtde_vidas_1 == banco_qtde_vidas_1 and
		   relatorio_qtde_vidas_2 == banco_qtde_vidas_2 and
		   relatorio_qtde_vidas_3 == banco_qtde_vidas_3

		  	$world.puts "Caso de Teste passou!!!"
		else
			$world.puts "Query utilizada na consulta para as competências de #{competencia1}, #{competencia2} e #{competencia3}:\n\n\n #{FigNewton.query_relatorio31_cenario1}"
			fail($world.puts "Caso de Teste falhou!!!")
		end

		$world.puts "Query utilizada na consulta para as competências de #{competencia1}, #{competencia2} e #{competencia3}:\n\n\n #{FigNewton.query_relatorio31_cenario1}"

	end

	#----------------------------Relatorio_31_01b----------------------------#
	# Demitidos e Aposentados = Todas										 #
	# Filial Empresa = Todas												 #
	# Data Competência = Um ano de Competência 								 #
	# Empresas = Todas 														 #
	# Moeda = Real   														 #
	# 																		 #
	#------------------------------------------------------------------------#
	def conferir_dados_do_relatorio31_01b(competencia1, competencia2, competencia3, competencia4, competencia5, competencia6, competencia7, competencia8, competencia9, competencia10, competencia11,
	 competencia12, competencia13)

		dados_relatorio = obter_dados_do_relatorio31

		relatorio_receita_1 = dados_relatorio[2][2]
		relatorio_receita_2 = dados_relatorio[3][2]
		relatorio_receita_3 = dados_relatorio[4][2]
		relatorio_receita_4 = dados_relatorio[5][2]
		relatorio_receita_5 = dados_relatorio[6][2]
		relatorio_receita_6 = dados_relatorio[7][2]
		relatorio_receita_7 = dados_relatorio[8][2]
		relatorio_receita_8 = dados_relatorio[9][2]
		relatorio_receita_9 = dados_relatorio[10][2]
		relatorio_receita_10 = dados_relatorio[11][2]
		relatorio_receita_11 = dados_relatorio[12][2]
		relatorio_receita_12 = dados_relatorio[13][2]
		relatorio_receita_13 = dados_relatorio[14][2]

		relatorio_custo_total_1 = dados_relatorio[2][3]
		relatorio_custo_total_2 = dados_relatorio[3][3]
		relatorio_custo_total_3 = dados_relatorio[4][3]
		relatorio_custo_total_4 = dados_relatorio[5][3]
		relatorio_custo_total_5 = dados_relatorio[6][3]
		relatorio_custo_total_6 = dados_relatorio[7][3]
		relatorio_custo_total_7 = dados_relatorio[8][3]
		relatorio_custo_total_8 = dados_relatorio[9][3]
		relatorio_custo_total_9 = dados_relatorio[10][3]
		relatorio_custo_total_10 = dados_relatorio[11][3]
		relatorio_custo_total_11 = dados_relatorio[12][3]
		relatorio_custo_total_12 = dados_relatorio[13][3]
		relatorio_custo_total_13 = dados_relatorio[14][3]

		relatorio_sinistralidade_1 = dados_relatorio[2][4]
		relatorio_sinistralidade_2 = dados_relatorio[3][4] 
		relatorio_sinistralidade_3 = dados_relatorio[4][4]
		relatorio_sinistralidade_4 = dados_relatorio[5][4]
		relatorio_sinistralidade_5 = dados_relatorio[6][4]
		relatorio_sinistralidade_6 = dados_relatorio[7][4]
		relatorio_sinistralidade_7 = dados_relatorio[8][4]
		relatorio_sinistralidade_8 = dados_relatorio[9][4]
		relatorio_sinistralidade_9 = dados_relatorio[10][4]
		relatorio_sinistralidade_10 = dados_relatorio[11][4]
		relatorio_sinistralidade_11 = dados_relatorio[12][4]
		relatorio_sinistralidade_12 = dados_relatorio[13][4]
		relatorio_sinistralidade_13 = dados_relatorio[14][4]

		relatorio_qtde_benef_atendidos_1 = dados_relatorio[2][5]
		relatorio_qtde_benef_atendidos_2 = dados_relatorio[3][5]
		relatorio_qtde_benef_atendidos_3 = dados_relatorio[4][5]
		relatorio_qtde_benef_atendidos_4 = dados_relatorio[5][5]
		relatorio_qtde_benef_atendidos_5 = dados_relatorio[6][5]
		relatorio_qtde_benef_atendidos_6 = dados_relatorio[7][5]
		relatorio_qtde_benef_atendidos_7 = dados_relatorio[8][5]
		relatorio_qtde_benef_atendidos_8 = dados_relatorio[9][5]
		relatorio_qtde_benef_atendidos_9 = dados_relatorio[10][5]
		relatorio_qtde_benef_atendidos_10 = dados_relatorio[11][5]
		relatorio_qtde_benef_atendidos_11 = dados_relatorio[12][5]
		relatorio_qtde_benef_atendidos_12 = dados_relatorio[13][5]
		relatorio_qtde_benef_atendidos_13 = dados_relatorio[14][5]
		
		relatorio_custo_per_capita_1 = dados_relatorio[2][6]
		relatorio_custo_per_capita_2 = dados_relatorio[3][6]
		relatorio_custo_per_capita_3 = dados_relatorio[4][6]
		relatorio_custo_per_capita_4 = dados_relatorio[5][6]
		relatorio_custo_per_capita_5 = dados_relatorio[6][6]
		relatorio_custo_per_capita_6 = dados_relatorio[7][6]
		relatorio_custo_per_capita_7 = dados_relatorio[8][6]
		relatorio_custo_per_capita_8 = dados_relatorio[9][6]
		relatorio_custo_per_capita_9 = dados_relatorio[10][6]
		relatorio_custo_per_capita_10 = dados_relatorio[11][6]
		relatorio_custo_per_capita_11 = dados_relatorio[12][6]
		relatorio_custo_per_capita_12 = dados_relatorio[13][6]
		relatorio_custo_per_capita_13 = dados_relatorio[14][6]
		
		relatorio_qtde_vidas_1 = dados_relatorio[2][7]
		relatorio_qtde_vidas_2 = dados_relatorio[3][7]
		relatorio_qtde_vidas_3 = dados_relatorio[4][7]
		relatorio_qtde_vidas_4 = dados_relatorio[5][7]
		relatorio_qtde_vidas_5 = dados_relatorio[6][7]
		relatorio_qtde_vidas_6 = dados_relatorio[7][7]
		relatorio_qtde_vidas_7 = dados_relatorio[8][7]
		relatorio_qtde_vidas_8 = dados_relatorio[9][7]
		relatorio_qtde_vidas_9 = dados_relatorio[10][7]
		relatorio_qtde_vidas_10 = dados_relatorio[11][7]
		relatorio_qtde_vidas_11 = dados_relatorio[12][7]
		relatorio_qtde_vidas_12 = dados_relatorio[13][7]
		relatorio_qtde_vidas_13 = dados_relatorio[14][7]


		#puts relatorio_receita_1, relatorio_receita_2, relatorio_receita_3, relatorio_receita_4, relatorio_receita_5, relatorio_receita_6, relatorio_receita_7, relatorio_receita_8, relatorio_receita_9,
		#relatorio_receita_10, relatorio_receita_11, relatorio_receita_12, relatorio_receita_13

		#puts relatorio_custo_total_1, relatorio_custo_total_2, relatorio_custo_total_3, relatorio_custo_total_4, relatorio_custo_total_5, relatorio_custo_total_6, relatorio_custo_total_7,
		#relatorio_custo_total_8, relatorio_custo_total_9, relatorio_custo_total_10, relatorio_custo_total_11, relatorio_custo_total_12, relatorio_custo_total_13

		#puts relatorio_sinistralidade_1, relatorio_sinistralidade_2, relatorio_sinistralidade_3, relatorio_sinistralidade_4, relatorio_sinistralidade_5, relatorio_sinistralidade_6, relatorio_sinistralidade_7,
		#relatorio_sinistralidade_8, relatorio_sinistralidade_9, relatorio_sinistralidade_10, relatorio_sinistralidade_11, relatorio_sinistralidade_12, relatorio_sinistralidade_13

		#puts relatorio_qtde_benef_atendidos_1, relatorio_qtde_benef_atendidos_2, relatorio_qtde_benef_atendidos_3, relatorio_qtde_benef_atendidos_4, relatorio_qtde_benef_atendidos_5,
		#relatorio_qtde_benef_atendidos_6, relatorio_qtde_benef_atendidos_7, relatorio_qtde_benef_atendidos_8, relatorio_qtde_benef_atendidos_9, relatorio_qtde_benef_atendidos_10,
		#relatorio_qtde_benef_atendidos_11, relatorio_qtde_benef_atendidos_12, relatorio_qtde_benef_atendidos_13

		#puts relatorio_custo_per_capita_1, relatorio_custo_per_capita_2, relatorio_custo_per_capita_3, relatorio_custo_per_capita_4, relatorio_custo_per_capita_5, relatorio_custo_per_capita_6,
		#relatorio_custo_per_capita_7, relatorio_custo_per_capita_8, relatorio_custo_per_capita_9, relatorio_custo_per_capita_10, relatorio_custo_per_capita_11, relatorio_custo_per_capita_12,
		#relatorio_custo_per_capita_13

		#puts relatorio_qtde_vidas_1, relatorio_qtde_vidas_2, relatorio_qtde_vidas_3, relatorio_qtde_vidas_4, relatorio_qtde_vidas_5, relatorio_qtde_vidas_6, relatorio_qtde_vidas_7, relatorio_qtde_vidas_8,
		#relatorio_qtde_vidas_9, relatorio_qtde_vidas_10, relatorio_qtde_vidas_11, relatorio_qtde_vidas_12, relatorio_qtde_vidas_13


		banco = BancoDeDadosBIBook.new
		banco.competencias_de_um_ano(competencia1, competencia2, competencia3, competencia4, competencia5, competencia6, competencia7, competencia8, competencia9, competencia10, competencia11, competencia12,
						  competencia13)
		imprimir_dados = banco.recuperar_dados_bd_bi_book_competencias_de_um_ano_demitidos_aposentados_todos

		banco_receita_1 = imprimir_dados[0][0]["Receita"]
		banco_receita_1 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_receita_1)
		banco_receita_1 = converter_numero_banco_para_moeda_real(banco_receita_1)

		banco_receita_2 = imprimir_dados[0][1]["Receita"]
		banco_receita_2 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_receita_2)
		banco_receita_2 = converter_numero_banco_para_moeda_real(banco_receita_2)
		
		banco_receita_3 = imprimir_dados[0][2]["Receita"]
		banco_receita_3 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_receita_3)
		banco_receita_3 = converter_numero_banco_para_moeda_real(banco_receita_3)

		banco_receita_4 = imprimir_dados[0][3]["Receita"]
		banco_receita_4 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_receita_4)
		banco_receita_4 = converter_numero_banco_para_moeda_real(banco_receita_4)

		banco_receita_5 = imprimir_dados[0][4]["Receita"]
		banco_receita_5 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_receita_5)
		banco_receita_5 = converter_numero_banco_para_moeda_real(banco_receita_5)

		banco_receita_6 = imprimir_dados[0][5]["Receita"]
		banco_receita_6 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_receita_6)
		banco_receita_6 = converter_numero_banco_para_moeda_real(banco_receita_6)

		banco_receita_7 = imprimir_dados[0][6]["Receita"]
		banco_receita_7 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_receita_7)
		banco_receita_7 = converter_numero_banco_para_moeda_real(banco_receita_7)

		banco_receita_8 = imprimir_dados[0][7]["Receita"]
		banco_receita_8 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_receita_8)
		banco_receita_8 = converter_numero_banco_para_moeda_real(banco_receita_8)

		banco_receita_9 = imprimir_dados[0][8]["Receita"]
		banco_receita_9 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_receita_9)
		banco_receita_9 = converter_numero_banco_para_moeda_real(banco_receita_9)

		banco_receita_10 = imprimir_dados[0][9]["Receita"]
		banco_receita_10 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_receita_10)
		banco_receita_10 = converter_numero_banco_para_moeda_real(banco_receita_10)

		banco_receita_11 = imprimir_dados[0][10]["Receita"]
		banco_receita_11 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_receita_11)
		banco_receita_11 = converter_numero_banco_para_moeda_real(banco_receita_11)

		banco_receita_12 = imprimir_dados[0][11]["Receita"]
		banco_receita_12 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_receita_12)
		banco_receita_12 = converter_numero_banco_para_moeda_real(banco_receita_12)

		banco_receita_13 = imprimir_dados[0][12]["Receita"]
		banco_receita_13 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_receita_13)
		banco_receita_13 = converter_numero_banco_para_moeda_real(banco_receita_13)
		

		banco_custo_total_1 = imprimir_dados[0][0]["Custo Total"]
		banco_custo_total_1 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_total_1)
		banco_custo_total_1 = converter_numero_banco_para_moeda_real(banco_custo_total_1)

		banco_custo_total_2 = imprimir_dados[0][1]["Custo Total"]
		banco_custo_total_2 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_total_2)
		banco_custo_total_2 = converter_numero_banco_para_moeda_real(banco_custo_total_2)
		
		banco_custo_total_3 = imprimir_dados[0][2]["Custo Total"]
		banco_custo_total_3 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_total_3)
		banco_custo_total_3 = converter_numero_banco_para_moeda_real(banco_custo_total_3)

		banco_custo_total_4 = imprimir_dados[0][3]["Custo Total"]
		banco_custo_total_4 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_total_4)
		banco_custo_total_4 = converter_numero_banco_para_moeda_real(banco_custo_total_4)

		banco_custo_total_5 = imprimir_dados[0][4]["Custo Total"]
		banco_custo_total_5 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_total_5)
		banco_custo_total_5 = converter_numero_banco_para_moeda_real(banco_custo_total_5)

		banco_custo_total_6 = imprimir_dados[0][5]["Custo Total"]
		banco_custo_total_6 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_total_6)
		banco_custo_total_6 = converter_numero_banco_para_moeda_real(banco_custo_total_6)

		banco_custo_total_7 = imprimir_dados[0][6]["Custo Total"]
		banco_custo_total_7 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_total_7)
		banco_custo_total_7 = converter_numero_banco_para_moeda_real(banco_custo_total_7)

		banco_custo_total_8 = imprimir_dados[0][7]["Custo Total"]
		banco_custo_total_8 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_total_8)
		banco_custo_total_8 = converter_numero_banco_para_moeda_real(banco_custo_total_8)

		banco_custo_total_9 = imprimir_dados[0][8]["Custo Total"]
		banco_custo_total_9 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_total_9)
		banco_custo_total_9 = converter_numero_banco_para_moeda_real(banco_custo_total_9)

		banco_custo_total_10 = imprimir_dados[0][9]["Custo Total"]
		banco_custo_total_10 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_total_10)
		banco_custo_total_10 = converter_numero_banco_para_moeda_real(banco_custo_total_10)

		banco_custo_total_11 = imprimir_dados[0][10]["Custo Total"]
		banco_custo_total_11 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_total_11)
		banco_custo_total_11 = converter_numero_banco_para_moeda_real(banco_custo_total_11)

		banco_custo_total_12 = imprimir_dados[0][11]["Custo Total"]
		banco_custo_total_12 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_total_12)
		banco_custo_total_12 = converter_numero_banco_para_moeda_real(banco_custo_total_12)

		banco_custo_total_13 = imprimir_dados[0][12]["Custo Total"]
		banco_custo_total_13 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_total_13)
		banco_custo_total_13 = converter_numero_banco_para_moeda_real(banco_custo_total_13)
		
		banco_sinistralidade_1 = imprimir_dados[0][0]["Sinistralidade"]
		banco_sinistralidade_1 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_sinistralidade_1, 100)
		#banco_sinistralidade_1 = convertersinistralidade_banco(banco_sinistralidade_1)

		banco_sinistralidade_2 = imprimir_dados[0][1]["Sinistralidade"]
		banco_sinistralidade_2 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_sinistralidade_2, 100)
		#banco_sinistralidade_2 = convertersinistralidade_banco(banco_sinistralidade_2)

		banco_sinistralidade_3 = imprimir_dados[0][2]["Sinistralidade"]
		banco_sinistralidade_3 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_sinistralidade_3, 100)
		#banco_sinistralidade_3 = convertersinistralidade_banco(banco_sinistralidade_3)

		banco_sinistralidade_4 = imprimir_dados[0][3]["Sinistralidade"]
		banco_sinistralidade_4 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_sinistralidade_4, 100)
		#banco_sinistralidade_4 = convertersinistralidade_banco(banco_sinistralidade_4)

		banco_sinistralidade_5 = imprimir_dados[0][4]["Sinistralidade"]
		banco_sinistralidade_5 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_sinistralidade_5, 100)
		#banco_sinistralidade_5 = convertersinistralidade_banco(banco_sinistralidade_5)

		banco_sinistralidade_6 = imprimir_dados[0][5]["Sinistralidade"]
		banco_sinistralidade_6 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_sinistralidade_6, 100)
		#banco_sinistralidade_6 = convertersinistralidade_banco(banco_sinistralidade_6)

		banco_sinistralidade_7 = imprimir_dados[0][6]["Sinistralidade"]
		banco_sinistralidade_7 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_sinistralidade_7, 100)
		#banco_sinistralidade_7 = convertersinistralidade_banco(banco_sinistralidade_7)

		banco_sinistralidade_8 = imprimir_dados[0][7]["Sinistralidade"]
		banco_sinistralidade_8 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_sinistralidade_8, 100)
		#banco_sinistralidade_8 = convertersinistralidade_banco(banco_sinistralidade_8)

		banco_sinistralidade_9 = imprimir_dados[0][8]["Sinistralidade"]
		banco_sinistralidade_9 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_sinistralidade_9, 100)
		#banco_sinistralidade_9 = convertersinistralidade_banco(banco_sinistralidade_9)

		banco_sinistralidade_10 = imprimir_dados[0][9]["Sinistralidade"]
		banco_sinistralidade_10 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_sinistralidade_10, 100)
		#banco_sinistralidade_10 = convertersinistralidade_banco(banco_sinistralidade_10)

		banco_sinistralidade_11 = imprimir_dados[0][10]["Sinistralidade"]
		banco_sinistralidade_11 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_sinistralidade_11, 100)
		#banco_sinistralidade_11 = convertersinistralidade_banco(banco_sinistralidade_11)

		banco_sinistralidade_12 = imprimir_dados[0][11]["Sinistralidade"]
		banco_sinistralidade_12 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_sinistralidade_12, 100)
		#banco_sinistralidade_12 = convertersinistralidade_banco(banco_sinistralidade_12)

		banco_sinistralidade_13 = imprimir_dados[0][12]["Sinistralidade"]
		banco_sinistralidade_13 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_sinistralidade_13, 100)
		#banco_sinistralidade_13 = convertersinistralidade_banco(banco_sinistralidade_13)

		banco_qtde_benef_atendidos_1 = imprimir_dados[0][0]["Qtde Benef. Atendidos"]
		banco_qtde_benef_atendidos_1 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_benef_atendidos_1)

		banco_qtde_benef_atendidos_2 = imprimir_dados[0][1]["Qtde Benef. Atendidos"]
		banco_qtde_benef_atendidos_2 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_benef_atendidos_2)

		banco_qtde_benef_atendidos_3 = imprimir_dados[0][2]["Qtde Benef. Atendidos"]
		banco_qtde_benef_atendidos_3 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_benef_atendidos_3)

		banco_qtde_benef_atendidos_4 = imprimir_dados[0][3]["Qtde Benef. Atendidos"]
		banco_qtde_benef_atendidos_4 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_benef_atendidos_4)

		banco_qtde_benef_atendidos_5 = imprimir_dados[0][4]["Qtde Benef. Atendidos"]
		banco_qtde_benef_atendidos_5 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_benef_atendidos_5)

		banco_qtde_benef_atendidos_6 = imprimir_dados[0][5]["Qtde Benef. Atendidos"]
		banco_qtde_benef_atendidos_6 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_benef_atendidos_6)

		banco_qtde_benef_atendidos_7 = imprimir_dados[0][6]["Qtde Benef. Atendidos"]
		banco_qtde_benef_atendidos_7 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_benef_atendidos_7)

		banco_qtde_benef_atendidos_8 = imprimir_dados[0][7]["Qtde Benef. Atendidos"]
		banco_qtde_benef_atendidos_8 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_benef_atendidos_8)

		banco_qtde_benef_atendidos_9 = imprimir_dados[0][8]["Qtde Benef. Atendidos"]
		banco_qtde_benef_atendidos_9 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_benef_atendidos_9)

		banco_qtde_benef_atendidos_10 = imprimir_dados[0][9]["Qtde Benef. Atendidos"]
		banco_qtde_benef_atendidos_10 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_benef_atendidos_10)

		banco_qtde_benef_atendidos_11 = imprimir_dados[0][10]["Qtde Benef. Atendidos"]
		banco_qtde_benef_atendidos_11 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_benef_atendidos_11)

		banco_qtde_benef_atendidos_12 = imprimir_dados[0][11]["Qtde Benef. Atendidos"]
		banco_qtde_benef_atendidos_12 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_benef_atendidos_12)

		banco_qtde_benef_atendidos_13 = imprimir_dados[0][12]["Qtde Benef. Atendidos"]
		banco_qtde_benef_atendidos_13 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_benef_atendidos_13)


		banco_custo_per_capita_1 = imprimir_dados[0][0]["Custo per Capita"]
		banco_custo_per_capita_1 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_per_capita_1)
		banco_custo_per_capita_1 = converter_numero_banco_para_moeda_real(banco_custo_per_capita_1)

		banco_custo_per_capita_2 = imprimir_dados[0][1]["Custo per Capita"]
		banco_custo_per_capita_2 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_per_capita_2)
		banco_custo_per_capita_2 = converter_numero_banco_para_moeda_real(banco_custo_per_capita_2)

		banco_custo_per_capita_3 = imprimir_dados[0][2]["Custo per Capita"]
		banco_custo_per_capita_3 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_per_capita_3)
		banco_custo_per_capita_3 = converter_numero_banco_para_moeda_real(banco_custo_per_capita_3)

		banco_custo_per_capita_4 = imprimir_dados[0][3]["Custo per Capita"]
		banco_custo_per_capita_4 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_per_capita_4)
		banco_custo_per_capita_4 = converter_numero_banco_para_moeda_real(banco_custo_per_capita_4)

		banco_custo_per_capita_5 = imprimir_dados[0][4]["Custo per Capita"]
		banco_custo_per_capita_5 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_per_capita_5)
		banco_custo_per_capita_5 = converter_numero_banco_para_moeda_real(banco_custo_per_capita_5)

		banco_custo_per_capita_6 = imprimir_dados[0][5]["Custo per Capita"]
		banco_custo_per_capita_6 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_per_capita_6)
		banco_custo_per_capita_6 = converter_numero_banco_para_moeda_real(banco_custo_per_capita_6)

		banco_custo_per_capita_7 = imprimir_dados[0][6]["Custo per Capita"]
		banco_custo_per_capita_7 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_per_capita_7)
		banco_custo_per_capita_7 = converter_numero_banco_para_moeda_real(banco_custo_per_capita_7)

		banco_custo_per_capita_8 = imprimir_dados[0][7]["Custo per Capita"]
		banco_custo_per_capita_8 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_per_capita_8)
		banco_custo_per_capita_8 = converter_numero_banco_para_moeda_real(banco_custo_per_capita_8)

		banco_custo_per_capita_9 = imprimir_dados[0][8]["Custo per Capita"]
		banco_custo_per_capita_9 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_per_capita_9)
		banco_custo_per_capita_9 = converter_numero_banco_para_moeda_real(banco_custo_per_capita_9)

		banco_custo_per_capita_10 = imprimir_dados[0][9]["Custo per Capita"]
		banco_custo_per_capita_10 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_per_capita_10)
		banco_custo_per_capita_10 = converter_numero_banco_para_moeda_real(banco_custo_per_capita_10)

		banco_custo_per_capita_11 = imprimir_dados[0][10]["Custo per Capita"]
		banco_custo_per_capita_11 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_per_capita_11)
		banco_custo_per_capita_11 = converter_numero_banco_para_moeda_real(banco_custo_per_capita_11)

		banco_custo_per_capita_12 = imprimir_dados[0][11]["Custo per Capita"]
		banco_custo_per_capita_12 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_per_capita_12)
		banco_custo_per_capita_12 = converter_numero_banco_para_moeda_real(banco_custo_per_capita_12)

		banco_custo_per_capita_13 = imprimir_dados[0][12]["Custo per Capita"]
		banco_custo_per_capita_13 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_per_capita_13)
		banco_custo_per_capita_13 = converter_numero_banco_para_moeda_real(banco_custo_per_capita_13)

		banco_qtde_vidas_1 = imprimir_dados[0][0]["Qtde de Vidas"]
		banco_qtde_vidas_1 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_vidas_1)

		banco_qtde_vidas_2 = imprimir_dados[0][1]["Qtde de Vidas"]
		banco_qtde_vidas_2 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_vidas_2)

		banco_qtde_vidas_3 = imprimir_dados[0][2]["Qtde de Vidas"]
		banco_qtde_vidas_3 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_vidas_3)

		banco_qtde_vidas_4 = imprimir_dados[0][3]["Qtde de Vidas"]
		banco_qtde_vidas_4 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_vidas_4)

		banco_qtde_vidas_5 = imprimir_dados[0][4]["Qtde de Vidas"]
		banco_qtde_vidas_5 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_vidas_5)

		banco_qtde_vidas_6 = imprimir_dados[0][5]["Qtde de Vidas"]
		banco_qtde_vidas_6 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_vidas_6)

		banco_qtde_vidas_7 = imprimir_dados[0][6]["Qtde de Vidas"]
		banco_qtde_vidas_7 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_vidas_7)

		banco_qtde_vidas_8 = imprimir_dados[0][7]["Qtde de Vidas"]
		banco_qtde_vidas_8 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_vidas_8)

		banco_qtde_vidas_9 = imprimir_dados[0][8]["Qtde de Vidas"]
		banco_qtde_vidas_9 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_vidas_9)

		banco_qtde_vidas_10 = imprimir_dados[0][9]["Qtde de Vidas"]
		banco_qtde_vidas_10 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_vidas_10)

		banco_qtde_vidas_11 = imprimir_dados[0][10]["Qtde de Vidas"]
		banco_qtde_vidas_11 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_vidas_11)

		banco_qtde_vidas_12 = imprimir_dados[0][11]["Qtde de Vidas"]
		banco_qtde_vidas_12 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_vidas_12)

		banco_qtde_vidas_13 = imprimir_dados[0][12]["Qtde de Vidas"]
		banco_qtde_vidas_13 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_vidas_13)

		#puts banco_receita_1,banco_receita_2, banco_receita_3, banco_receita_4, banco_receita_5, banco_receita_6, banco_receita_7, banco_receita_8, banco_receita_9, banco_receita_10, banco_receita_11,
		#banco_receita_12, banco_receita_13

		#puts banco_custo_total_1, banco_custo_total_2, banco_custo_total_3, banco_custo_total_4, banco_custo_total_5, banco_custo_total_6, banco_custo_total_7, banco_custo_total_8, banco_custo_total_9,
		#banco_custo_total_10, banco_custo_total_11, banco_custo_total_12, banco_custo_total_13

		#puts banco_sinistralidade_1, banco_sinistralidade_2, banco_sinistralidade_3, banco_sinistralidade_4, banco_sinistralidade_5, banco_sinistralidade_6, banco_sinistralidade_7, banco_sinistralidade_8,
		#banco_sinistralidade_9, banco_sinistralidade_10, banco_sinistralidade_11, banco_sinistralidade_12, banco_sinistralidade_13


		#puts banco_qtde_benef_atendidos_1, banco_qtde_benef_atendidos_2, banco_qtde_benef_atendidos_3, banco_qtde_benef_atendidos_4, banco_qtde_benef_atendidos_5, banco_qtde_benef_atendidos_6,
		#banco_qtde_benef_atendidos_7, banco_qtde_benef_atendidos_8, banco_qtde_benef_atendidos_9, banco_qtde_benef_atendidos_10, banco_qtde_benef_atendidos_11, banco_qtde_benef_atendidos_12,
		#banco_qtde_benef_atendidos_13

		#puts banco_custo_per_capita_1, banco_custo_per_capita_2, banco_custo_per_capita_3, banco_custo_per_capita_4, banco_custo_per_capita_5, banco_custo_per_capita_6, banco_custo_per_capita_7,
		#banco_custo_per_capita_8, banco_custo_per_capita_9, banco_custo_per_capita_10, banco_custo_per_capita_11, banco_custo_per_capita_12, banco_custo_per_capita_13

		#puts banco_qtde_vidas_1, banco_qtde_vidas_2, banco_qtde_vidas_3, banco_qtde_vidas_4, banco_qtde_vidas_5, banco_qtde_vidas_6, banco_qtde_vidas_7, banco_qtde_vidas_8, banco_qtde_vidas_9,
		#banco_qtde_vidas_10, banco_qtde_vidas_11, banco_qtde_vidas_12, banco_qtde_vidas_13

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
			assert_equal(relatorio_receita_4, banco_receita_4)
			$world.puts "Receita no valor de #{relatorio_receita_4} apresentada no relatório é igual a receita no valor de #{banco_receita_4} 
			apresentada no banco de dados, referente a competência de #{competencia4}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Receita no valor de #{relatorio_receita_4} apresentada no relatório não é igual a receita no valor de #{banco_receita_4} 
			apresentada no banco de dados, referente a competência de #{competencia4}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_receita_5, banco_receita_5)
			$world.puts "Receita no valor de #{relatorio_receita_5} apresentada no relatório é igual a receita no valor de #{banco_receita_5} 
			apresentada no banco de dados, referente a competência de #{competencia5}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Receita no valor de #{relatorio_receita_5} apresentada no relatório não é igual a receita no valor de #{banco_receita_5} 
			apresentada no banco de dados, referente a competência de #{competencia5}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_receita_6, banco_receita_6)
			$world.puts "Receita no valor de #{relatorio_receita_6} apresentada no relatório é igual a receita no valor de #{banco_receita_6} 
			apresentada no banco de dados, referente a competência de #{competencia6}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Receita no valor de #{relatorio_receita_6} apresentada no relatório não é igual a receita no valor de #{banco_receita_6} 
			apresentada no banco de dados, referente a competência de #{competencia6}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_receita_7, banco_receita_7)
			$world.puts "Receita no valor de #{relatorio_receita_7} apresentada no relatório é igual a receita no valor de #{banco_receita_7} 
			apresentada no banco de dados, referente a competência de #{competencia7}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Receita no valor de #{relatorio_receita_7} apresentada no relatório não é igual a receita no valor de #{banco_receita_7} 
			apresentada no banco de dados, referente a competência de #{competencia7}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_receita_8, banco_receita_8)
			$world.puts "Receita no valor de #{relatorio_receita_8} apresentada no relatório é igual a receita no valor de #{banco_receita_8} 
			apresentada no banco de dados, referente a competência de #{competencia8}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Receita no valor de #{relatorio_receita_8} apresentada no relatório não é igual a receita no valor de #{banco_receita_8} 
			apresentada no banco de dados, referente a competência de #{competencia8}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_receita_9, banco_receita_9)
			$world.puts "Receita no valor de #{relatorio_receita_9} apresentada no relatório é igual a receita no valor de #{banco_receita_9} 
			apresentada no banco de dados, referente a competência de #{competencia9}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Receita no valor de #{relatorio_receita_9} apresentada no relatório não é igual a receita no valor de #{banco_receita_9} 
			apresentada no banco de dados, referente a competência de #{competencia9}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_receita_10, banco_receita_10)
			$world.puts "Receita no valor de #{relatorio_receita_10} apresentada no relatório é igual a receita no valor de #{banco_receita_10} 
			apresentada no banco de dados, referente a competência de #{competencia10}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Receita no valor de #{relatorio_receita_10} apresentada no relatório não é igual a receita no valor de #{banco_receita_10} 
			apresentada no banco de dados, referente a competência de #{competencia10}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_receita_11, banco_receita_11)
			$world.puts "Receita no valor de #{relatorio_receita_11} apresentada no relatório é igual a receita no valor de #{banco_receita_11} 
			apresentada no banco de dados, referente a competência de #{competencia11}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Receita no valor de #{relatorio_receita_11} apresentada no relatório não é igual a receita no valor de #{banco_receita_11} 
			apresentada no banco de dados, referente a competência de #{competencia11}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_receita_12, banco_receita_12)
			$world.puts "Receita no valor de #{relatorio_receita_12} apresentada no relatório é igual a receita no valor de #{banco_receita_12} 
			apresentada no banco de dados, referente a competência de #{competencia12}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Receita no valor de #{relatorio_receita_12} apresentada no relatório não é igual a receita no valor de #{banco_receita_12} 
			apresentada no banco de dados, referente a competência de #{competencia12}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_receita_13, banco_receita_13)
			$world.puts "Receita no valor de #{relatorio_receita_13} apresentada no relatório é igual a receita no valor de #{banco_receita_13} 
			apresentada no banco de dados, referente a competência de #{competencia13}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Receita no valor de #{relatorio_receita_13} apresentada no relatório não é igual a receita no valor de #{banco_receita_13} 
			apresentada no banco de dados, referente a competência de #{competencia13}!!!: #{mensagem_de_erro.message}"
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
			assert_equal(relatorio_custo_total_4, banco_custo_total_4)
			$world.puts "Custo Total no valor de #{relatorio_custo_total_4} apresentado no relatório é igual ao Custo Total no valor de #{banco_custo_total_4} 
			apresentado no banco de dados, referente a competência de #{competencia4}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Total no valor de #{relatorio_custo_total_4} apresentado no relatório não é igual ao Custo Total no valor de #{banco_custo_total_4} 
			apresentado no banco de dados, referente a competência de #{competencia4}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_total_5, banco_custo_total_5)
			$world.puts "Custo Total no valor de #{relatorio_custo_total_5} apresentado no relatório é igual ao Custo Total no valor de #{banco_custo_total_5} 
			apresentado no banco de dados, referente a competência de #{competencia5}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Total no valor de #{relatorio_custo_total_5} apresentado no relatório não é igual ao Custo Total no valor de #{banco_custo_total_5} 
			apresentado no banco de dados, referente a competência de #{competencia5}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_total_6, banco_custo_total_6)
			$world.puts "Custo Total no valor de #{relatorio_custo_total_6} apresentado no relatório é igual ao Custo Total no valor de #{banco_custo_total_6} 
			apresentado no banco de dados, referente a competência de #{competencia6}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Total no valor de #{relatorio_custo_total_6} apresentado no relatório não é igual ao Custo Total no valor de #{banco_custo_total_6} 
			apresentado no banco de dados, referente a competência de #{competencia6}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_total_7, banco_custo_total_7)
			$world.puts "Custo Total no valor de #{relatorio_custo_total_7} apresentado no relatório é igual ao Custo Total no valor de #{banco_custo_total_7} 
			apresentado no banco de dados, referente a competência de #{competencia7}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Total no valor de #{relatorio_custo_total_7} apresentado no relatório não é igual ao Custo Total no valor de #{banco_custo_total_7} 
			apresentado no banco de dados, referente a competência de #{competencia7}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_total_8, banco_custo_total_8)
			$world.puts "Custo Total no valor de #{relatorio_custo_total_8} apresentado no relatório é igual ao Custo Total no valor de #{banco_custo_total_8} 
			apresentado no banco de dados, referente a competência de #{competencia8}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Total no valor de #{relatorio_custo_total_8} apresentado no relatório não é igual ao Custo Total no valor de #{banco_custo_total_8} 
			apresentado no banco de dados, referente a competência de #{competencia8}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_total_9, banco_custo_total_9)
			$world.puts "Custo Total no valor de #{relatorio_custo_total_9} apresentado no relatório é igual ao Custo Total no valor de #{banco_custo_total_9} 
			apresentado no banco de dados, referente a competência de #{competencia9}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Total no valor de #{relatorio_custo_total_9} apresentado no relatório não é igual ao Custo Total no valor de #{banco_custo_total_9} 
			apresentado no banco de dados, referente a competência de #{competencia9}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_total_10, banco_custo_total_10)
			$world.puts "Custo Total no valor de #{relatorio_custo_total_10} apresentado no relatório é igual ao Custo Total no valor de #{banco_custo_total_10} 
			apresentado no banco de dados, referente a competência de #{competencia10}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Total no valor de #{relatorio_custo_total_10} apresentado no relatório não é igual ao Custo Total no valor de #{banco_custo_total_10} 
			apresentado no banco de dados, referente a competência de #{competencia10}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_total_11, banco_custo_total_11)
			$world.puts "Custo Total no valor de #{relatorio_custo_total_11} apresentado no relatório é igual ao Custo Total no valor de #{banco_custo_total_11} 
			apresentado no banco de dados, referente a competência de #{competencia11}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Total no valor de #{relatorio_custo_total_11} apresentado no relatório não é igual ao Custo Total no valor de #{banco_custo_total_11} 
			apresentado no banco de dados, referente a competência de #{competencia11}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_total_12, banco_custo_total_12)
			$world.puts "Custo Total no valor de #{relatorio_custo_total_12} apresentado no relatório é igual ao Custo Total no valor de #{banco_custo_total_12} 
			apresentado no banco de dados, referente a competência de #{competencia12}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Total no valor de #{relatorio_custo_total_12} apresentado no relatório não é igual ao Custo Total no valor de #{banco_custo_total_12} 
			apresentado no banco de dados, referente a competência de #{competencia12}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_total_13, banco_custo_total_13)
			$world.puts "Custo Total no valor de #{relatorio_custo_total_13} apresentado no relatório é igual ao Custo Total no valor de #{banco_custo_total_13} 
			apresentado no banco de dados, referente a competência de #{competencia13}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Total no valor de #{relatorio_custo_total_13} apresentado no relatório não é igual ao Custo Total no valor de #{banco_custo_total_13} 
			apresentado no banco de dados, referente a competência de #{competencia13}!!!: #{mensagem_de_erro.message}"
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
			assert_equal(relatorio_sinistralidade_4, banco_sinistralidade_4)
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_4} apresentada no relatório é igual a Sinistralidade de #{banco_sinistralidade_4} 
			apresentada no banco de dados, referente a competência de #{competencia4}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_4} apresentada no relatório não é igual a Sinistralidade de #{banco_sinistralidade_4} 
			apresentada no banco de dados, referente a competência de #{competencia4}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_sinistralidade_5, banco_sinistralidade_5)
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_5} apresentada no relatório é igual a Sinistralidade de #{banco_sinistralidade_5} 
			apresentada no banco de dados, referente a competência de #{competencia5}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_5} apresentada no relatório não é igual a Sinistralidade de #{banco_sinistralidade_5} 
			apresentada no banco de dados, referente a competência de #{competencia5}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_sinistralidade_6, banco_sinistralidade_6)
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_6} apresentada no relatório é igual a Sinistralidade de #{banco_sinistralidade_6} 
			apresentada no banco de dados, referente a competência de #{competencia6}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_6} apresentada no relatório não é igual a Sinistralidade de #{banco_sinistralidade_6} 
			apresentada no banco de dados, referente a competência de #{competencia6}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_sinistralidade_7, banco_sinistralidade_7)
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_7} apresentada no relatório é igual a Sinistralidade de #{banco_sinistralidade_7} 
			apresentada no banco de dados, referente a competência de #{competencia7}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_7} apresentada no relatório não é igual a Sinistralidade de #{banco_sinistralidade_7} 
			apresentada no banco de dados, referente a competência de #{competencia7}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_sinistralidade_8, banco_sinistralidade_8)
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_8} apresentada no relatório é igual a Sinistralidade de #{banco_sinistralidade_8} 
			apresentada no banco de dados, referente a competência de #{competencia8}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_8} apresentada no relatório não é igual a Sinistralidade de #{banco_sinistralidade_8} 
			apresentada no banco de dados, referente a competência de #{competencia8}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_sinistralidade_9, banco_sinistralidade_9)
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_9} apresentada no relatório é igual a Sinistralidade de #{banco_sinistralidade_9} 
			apresentada no banco de dados, referente a competência de #{competencia9}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_9} apresentada no relatório não é igual a Sinistralidade de #{banco_sinistralidade_9} 
			apresentada no banco de dados, referente a competência de #{competencia9}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_sinistralidade_10, banco_sinistralidade_10)
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_10} apresentada no relatório é igual a Sinistralidade de #{banco_sinistralidade_10} 
			apresentada no banco de dados, referente a competência de #{competencia10}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_10} apresentada no relatório não é igual a Sinistralidade de #{banco_sinistralidade_10} 
			apresentada no banco de dados, referente a competência de #{competencia10}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_sinistralidade_11, banco_sinistralidade_11)
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_11} apresentada no relatório é igual a Sinistralidade de #{banco_sinistralidade_11} 
			apresentada no banco de dados, referente a competência de #{competencia11}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_11} apresentada no relatório não é igual a Sinistralidade de #{banco_sinistralidade_11} 
			apresentada no banco de dados, referente a competência de #{competencia11}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_sinistralidade_12, banco_sinistralidade_12)
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_12} apresentada no relatório é igual a Sinistralidade de #{banco_sinistralidade_12} 
			apresentada no banco de dados, referente a competência de #{competencia12}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_12} apresentada no relatório não é igual a Sinistralidade de #{banco_sinistralidade_12} 
			apresentada no banco de dados, referente a competência de #{competencia12}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_sinistralidade_13, banco_sinistralidade_13)
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_13} apresentada no relatório é igual a Sinistralidade de #{banco_sinistralidade_13} 
			apresentada no banco de dados, referente a competência de #{competencia13}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Sinistralidade de #{relatorio_sinistralidade_13} apresentada no relatório não é igual a Sinistralidade de #{banco_sinistralidade_13} 
			apresentada no banco de dados, referente a competência de #{competencia13}!!!: #{mensagem_de_erro.message}"
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
			assert_equal(relatorio_qtde_benef_atendidos_4, banco_qtde_benef_atendidos_4)
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_4} apresentada no relatório é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_4} 
			apresentada no banco de dados, referente a competência de #{competencia4}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_4} apresentada no relatório não é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_4} 
			apresentada no banco de dados, referente a competência de #{competencia4}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_benef_atendidos_5, banco_qtde_benef_atendidos_5)
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_5} apresentada no relatório é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_5} 
			apresentada no banco de dados, referente a competência de #{competencia5}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_5} apresentada no relatório não é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_5} 
			apresentada no banco de dados, referente a competência de #{competencia5}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_benef_atendidos_6, banco_qtde_benef_atendidos_6)
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_6} apresentada no relatório é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_6} 
			apresentada no banco de dados, referente a competência de #{competencia6}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_6} apresentada no relatório não é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_6} 
			apresentada no banco de dados, referente a competência de #{competencia6}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_benef_atendidos_7, banco_qtde_benef_atendidos_7)
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_7} apresentada no relatório é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_7} 
			apresentada no banco de dados, referente a competência de #{competencia7}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_7} apresentada no relatório não é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_7} 
			apresentada no banco de dados, referente a competência de #{competencia7}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_benef_atendidos_8, banco_qtde_benef_atendidos_8)
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_8} apresentada no relatório é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_8} 
			apresentada no banco de dados, referente a competência de #{competencia8}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_8} apresentada no relatório não é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_8} 
			apresentada no banco de dados, referente a competência de #{competencia8}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_benef_atendidos_9, banco_qtde_benef_atendidos_9)
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_9} apresentada no relatório é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_9} 
			apresentada no banco de dados, referente a competência de #{competencia9}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_9} apresentada no relatório não é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_9} 
			apresentada no banco de dados, referente a competência de #{competencia9}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_benef_atendidos_10, banco_qtde_benef_atendidos_10)
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_10} apresentada no relatório é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_10} 
			apresentada no banco de dados, referente a competência de #{competencia10}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_10} apresentada no relatório não é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_10} 
			apresentada no banco de dados, referente a competência de #{competencia10}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_benef_atendidos_11, banco_qtde_benef_atendidos_11)
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_11} apresentada no relatório é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_11} 
			apresentada no banco de dados, referente a competência de #{competencia11}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_11} apresentada no relatório não é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_11} 
			apresentada no banco de dados, referente a competência de #{competencia11}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_benef_atendidos_12, banco_qtde_benef_atendidos_12)
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_12} apresentada no relatório é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_12} 
			apresentada no banco de dados, referente a competência de #{competencia12}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_12} apresentada no relatório não é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_12} 
			apresentada no banco de dados, referente a competência de #{competencia12}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_benef_atendidos_13, banco_qtde_benef_atendidos_13)
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_13} apresentada no relatório é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_13} 
			apresentada no banco de dados, referente a competência de #{competencia13}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de beneficiários atendidos #{relatorio_qtde_benef_atendidos_13} apresentada no relatório não é igual a Qtde de beneficiários atendidos #{banco_qtde_benef_atendidos_13} 
			apresentada no banco de dados, referente a competência de #{competencia13}!!!: #{mensagem_de_erro.message}"
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
			assert_equal(relatorio_custo_per_capita_4, banco_custo_per_capita_4)
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_4} apresentado no relatório é igual ao Custo per capita no valor de #{banco_custo_per_capita_4} 
			apresentado no banco de dados, referente a competência de #{competencia4}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_4} apresentado no relatório não é igual ao Custo per capita no valor de #{banco_custo_per_capita_4} 
			apresentado no banco de dados, referente a competência de #{competencia4}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_per_capita_5, banco_custo_per_capita_5)
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_5} apresentado no relatório é igual ao Custo per capita no valor de #{banco_custo_per_capita_5} 
			apresentado no banco de dados, referente a competência de #{competencia5}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_5} apresentado no relatório não é igual ao Custo per capita no valor de #{banco_custo_per_capita_5} 
			apresentado no banco de dados, referente a competência de #{competencia5}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_per_capita_6, banco_custo_per_capita_6)
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_6} apresentado no relatório é igual ao Custo per capita no valor de #{banco_custo_per_capita_6} 
			apresentado no banco de dados, referente a competência de #{competencia6}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_6} apresentado no relatório não é igual ao Custo per capita no valor de #{banco_custo_per_capita_6} 
			apresentado no banco de dados, referente a competência de #{competencia6}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_per_capita_7, banco_custo_per_capita_7)
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_7} apresentado no relatório é igual ao Custo per capita no valor de #{banco_custo_per_capita_7} 
			apresentado no banco de dados, referente a competência de #{competencia7}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_7} apresentado no relatório não é igual ao Custo per capita no valor de #{banco_custo_per_capita_7} 
			apresentado no banco de dados, referente a competência de #{competencia7}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_per_capita_8, banco_custo_per_capita_8)
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_8} apresentado no relatório é igual ao Custo per capita no valor de #{banco_custo_per_capita_8} 
			apresentado no banco de dados, referente a competência de #{competencia8}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_8} apresentado no relatório não é igual ao Custo per capita no valor de #{banco_custo_per_capita_8} 
			apresentado no banco de dados, referente a competência de #{competencia8}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_per_capita_9, banco_custo_per_capita_9)
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_9} apresentado no relatório é igual ao Custo per capita no valor de #{banco_custo_per_capita_9} 
			apresentado no banco de dados, referente a competência de #{competencia9}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_9} apresentado no relatório não é igual ao Custo per capita no valor de #{banco_custo_per_capita_9} 
			apresentado no banco de dados, referente a competência de #{competencia9}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_per_capita_10, banco_custo_per_capita_10)
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_10} apresentado no relatório é igual ao Custo per capita no valor de #{banco_custo_per_capita_10} 
			apresentado no banco de dados, referente a competência de #{competencia10}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_10} apresentado no relatório não é igual ao Custo per capita no valor de #{banco_custo_per_capita_10} 
			apresentado no banco de dados, referente a competência de #{competencia10}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_per_capita_11, banco_custo_per_capita_11)
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_11} apresentado no relatório é igual ao Custo per capita no valor de #{banco_custo_per_capita_11} 
			apresentado no banco de dados, referente a competência de #{competencia11}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_11} apresentado no relatório não é igual ao Custo per capita no valor de #{banco_custo_per_capita_11} 
			apresentado no banco de dados, referente a competência de #{competencia11}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_per_capita_12, banco_custo_per_capita_12)
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_12} apresentado no relatório é igual ao Custo per capita no valor de #{banco_custo_per_capita_12} 
			apresentado no banco de dados, referente a competência de #{competencia12}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_12} apresentado no relatório não é igual ao Custo per capita no valor de #{banco_custo_per_capita_12} 
			apresentado no banco de dados, referente a competência de #{competencia12}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_per_capita_13, banco_custo_per_capita_13)
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_13} apresentado no relatório é igual ao Custo per capita no valor de #{banco_custo_per_capita_13} 
			apresentado no banco de dados, referente a competência de #{competencia13}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo per capita no valor de #{relatorio_custo_per_capita_13} apresentado no relatório não é igual ao Custo per capita no valor de #{banco_custo_per_capita_13} 
			apresentado no banco de dados, referente a competência de #{competencia13}!!!: #{mensagem_de_erro.message}"
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

		begin
			assert_equal(relatorio_qtde_vidas_4, banco_qtde_vidas_4)
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_4} apresentada no relatório é igual a Qtde de vidas #{banco_qtde_vidas_4} 
			apresentada no banco de dados, referente a competência de #{competencia4}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_4} apresentada no relatório não é igual a Qtde de vidas #{banco_qtde_vidas_4} 
			apresentada no banco de dados, referente a competência de #{competencia4}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_vidas_5, banco_qtde_vidas_5)
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_5} apresentada no relatório é igual a Qtde de vidas #{banco_qtde_vidas_5} 
			apresentada no banco de dados, referente a competência de #{competencia5}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_5} apresentada no relatório não é igual a Qtde de vidas #{banco_qtde_vidas_5} 
			apresentada no banco de dados, referente a competência de #{competencia5}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_vidas_6, banco_qtde_vidas_6)
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_6} apresentada no relatório é igual a Qtde de vidas #{banco_qtde_vidas_6} 
			apresentada no banco de dados, referente a competência de #{competencia6}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_6} apresentada no relatório não é igual a Qtde de vidas #{banco_qtde_vidas_6} 
			apresentada no banco de dados, referente a competência de #{competencia6}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_vidas_7, banco_qtde_vidas_7)
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_7} apresentada no relatório é igual a Qtde de vidas #{banco_qtde_vidas_7} 
			apresentada no banco de dados, referente a competência de #{competencia7}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_7} apresentada no relatório não é igual a Qtde de vidas #{banco_qtde_vidas_7} 
			apresentada no banco de dados, referente a competência de #{competencia7}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_vidas_8, banco_qtde_vidas_8)
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_8} apresentada no relatório é igual a Qtde de vidas #{banco_qtde_vidas_8} 
			apresentada no banco de dados, referente a competência de #{competencia8}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_8} apresentada no relatório não é igual a Qtde de vidas #{banco_qtde_vidas_8} 
			apresentada no banco de dados, referente a competência de #{competencia8}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_vidas_9, banco_qtde_vidas_9)
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_9} apresentada no relatório é igual a Qtde de vidas #{banco_qtde_vidas_9} 
			apresentada no banco de dados, referente a competência de #{competencia9}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_9} apresentada no relatório não é igual a Qtde de vidas #{banco_qtde_vidas_9} 
			apresentada no banco de dados, referente a competência de #{competencia9}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_vidas_10, banco_qtde_vidas_10)
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_10} apresentada no relatório é igual a Qtde de vidas #{banco_qtde_vidas_10} 
			apresentada no banco de dados, referente a competência de #{competencia10}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_10} apresentada no relatório não é igual a Qtde de vidas #{banco_qtde_vidas_10} 
			apresentada no banco de dados, referente a competência de #{competencia10}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_vidas_11, banco_qtde_vidas_11)
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_11} apresentada no relatório é igual a Qtde de vidas #{banco_qtde_vidas_11} 
			apresentada no banco de dados, referente a competência de #{competencia11}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_11} apresentada no relatório não é igual a Qtde de vidas #{banco_qtde_vidas_11} 
			apresentada no banco de dados, referente a competência de #{competencia11}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_vidas_12, banco_qtde_vidas_12)
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_12} apresentada no relatório é igual a Qtde de vidas #{banco_qtde_vidas_12} 
			apresentada no banco de dados, referente a competência de #{competencia12}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_12} apresentada no relatório não é igual a Qtde de vidas #{banco_qtde_vidas_12} 
			apresentada no banco de dados, referente a competência de #{competencia12}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_vidas_13, banco_qtde_vidas_13)
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_13} apresentada no relatório é igual a Qtde de vidas #{banco_qtde_vidas_13} 
			apresentada no banco de dados, referente a competência de #{competencia13}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de vidas #{relatorio_qtde_vidas_13} apresentada no relatório não é igual a Qtde de vidas #{banco_qtde_vidas_13} 
			apresentada no banco de dados, referente a competência de #{competencia13}!!!: #{mensagem_de_erro.message}"
		end

		if relatorio_receita_1 == banco_receita_1 and
		   relatorio_receita_2 == banco_receita_2 and
		   relatorio_receita_3 == banco_receita_3 and
		   relatorio_receita_4 == banco_receita_4 and
		   relatorio_receita_5 == banco_receita_5 and
		   relatorio_receita_6 == banco_receita_6 and
		   relatorio_receita_7 == banco_receita_7 and
		   relatorio_receita_8 == banco_receita_8 and
		   relatorio_receita_9 == banco_receita_9 and
		   relatorio_receita_10 == banco_receita_10 and
		   relatorio_receita_11 == banco_receita_11 and
		   relatorio_receita_12 == banco_receita_12 and
		   relatorio_receita_13 == banco_receita_13 and

		   relatorio_custo_total_1 == banco_custo_total_1 and
		   relatorio_custo_total_2 == banco_custo_total_2 and
		   relatorio_custo_total_3 == banco_custo_total_3 and
		   relatorio_custo_total_4 == banco_custo_total_4 and
		   relatorio_custo_total_5 == banco_custo_total_5 and
		   relatorio_custo_total_6 == banco_custo_total_6 and
		   relatorio_custo_total_7 == banco_custo_total_7 and
		   relatorio_custo_total_8 == banco_custo_total_8 and
		   relatorio_custo_total_9 == banco_custo_total_9 and
		   relatorio_custo_total_10 == banco_custo_total_10 and
		   relatorio_custo_total_11 == banco_custo_total_11 and
		   relatorio_custo_total_12 == banco_custo_total_12 and
		   relatorio_custo_total_13 == banco_custo_total_13 and

		   relatorio_sinistralidade_1 == banco_sinistralidade_1 and
		   relatorio_sinistralidade_2 == banco_sinistralidade_2 and
		   relatorio_sinistralidade_3 == banco_sinistralidade_3 and
		   relatorio_sinistralidade_4 == banco_sinistralidade_4 and
		   relatorio_sinistralidade_5 == banco_sinistralidade_5 and
		   relatorio_sinistralidade_6 == banco_sinistralidade_6 and
		   relatorio_sinistralidade_7 == banco_sinistralidade_7 and
		   relatorio_sinistralidade_8 == banco_sinistralidade_8 and
		   relatorio_sinistralidade_9 == banco_sinistralidade_9 and
		   relatorio_sinistralidade_10 == banco_sinistralidade_10 and
		   relatorio_sinistralidade_11 == banco_sinistralidade_11 and
		   relatorio_sinistralidade_12 == banco_sinistralidade_12 and
		   relatorio_sinistralidade_13 == banco_sinistralidade_13 and

		   relatorio_qtde_benef_atendidos_1 == banco_qtde_benef_atendidos_1 and
		   relatorio_qtde_benef_atendidos_2 == banco_qtde_benef_atendidos_2 and
		   relatorio_qtde_benef_atendidos_3 == banco_qtde_benef_atendidos_3 and
		   relatorio_qtde_benef_atendidos_4 == banco_qtde_benef_atendidos_4 and
		   relatorio_qtde_benef_atendidos_5 == banco_qtde_benef_atendidos_5 and
		   relatorio_qtde_benef_atendidos_6 == banco_qtde_benef_atendidos_6 and
		   relatorio_qtde_benef_atendidos_7 == banco_qtde_benef_atendidos_7 and
		   relatorio_qtde_benef_atendidos_8 == banco_qtde_benef_atendidos_8 and
		   relatorio_qtde_benef_atendidos_9 == banco_qtde_benef_atendidos_9 and
		   relatorio_qtde_benef_atendidos_10 == banco_qtde_benef_atendidos_10 and
		   relatorio_qtde_benef_atendidos_11 == banco_qtde_benef_atendidos_11 and
		   relatorio_qtde_benef_atendidos_12 == banco_qtde_benef_atendidos_12 and
		   relatorio_qtde_benef_atendidos_13 == banco_qtde_benef_atendidos_13 and

		   relatorio_custo_per_capita_1 == banco_custo_per_capita_1 and
		   relatorio_custo_per_capita_2 == banco_custo_per_capita_2 and
		   relatorio_custo_per_capita_3 == banco_custo_per_capita_3 and
		   relatorio_custo_per_capita_4 == banco_custo_per_capita_4 and
		   relatorio_custo_per_capita_5 == banco_custo_per_capita_5 and
		   relatorio_custo_per_capita_6 == banco_custo_per_capita_6 and
		   relatorio_custo_per_capita_7 == banco_custo_per_capita_7 and
		   relatorio_custo_per_capita_8 == banco_custo_per_capita_8 and
		   relatorio_custo_per_capita_9 == banco_custo_per_capita_9 and
		   relatorio_custo_per_capita_10 == banco_custo_per_capita_10 and
		   relatorio_custo_per_capita_11 == banco_custo_per_capita_11 and
		   relatorio_custo_per_capita_12 == banco_custo_per_capita_12 and
		   relatorio_custo_per_capita_13 == banco_custo_per_capita_13 and

		   relatorio_qtde_vidas_1 == banco_qtde_vidas_1 and
		   relatorio_qtde_vidas_2 == banco_qtde_vidas_2 and
		   relatorio_qtde_vidas_3 == banco_qtde_vidas_3 and
		   relatorio_qtde_vidas_4 == banco_qtde_vidas_4 and
		   relatorio_qtde_vidas_5 == banco_qtde_vidas_5 and
		   relatorio_qtde_vidas_6 == banco_qtde_vidas_6 and
		   relatorio_qtde_vidas_7 == banco_qtde_vidas_7 and
		   relatorio_qtde_vidas_8 == banco_qtde_vidas_8 and
		   relatorio_qtde_vidas_9 == banco_qtde_vidas_9 and
		   relatorio_qtde_vidas_10 == banco_qtde_vidas_10 and
		   relatorio_qtde_vidas_11 == banco_qtde_vidas_11 and
		   relatorio_qtde_vidas_12 == banco_qtde_vidas_12 and
		   relatorio_qtde_vidas_13 == banco_qtde_vidas_13

		  	$world.puts "Caso de Teste passou!!!"
		else
			$world.puts "Query utilizada na consulta para as competências de #{competencia1}, #{competencia2}, #{competencia3}, #{competencia4}, #{competencia5},
			#{competencia6}, #{competencia7}, #{competencia8}, #{competencia9}, #{competencia10}, #{competencia11}, #{competencia12}, #{competencia13}:\n\n\n #{FigNewton.query_relatorio31_cenario1b}"
			fail($world.puts "Caso de Teste falhou!!!")
		end

		$world.puts "Query utilizada na consulta para as competências de #{competencia1}, #{competencia2}, #{competencia3}, #{competencia4}, #{competencia5},
		#{competencia6}, #{competencia7}, #{competencia8}, #{competencia9}, #{competencia10}, #{competencia11}, #{competencia12}, #{competencia13}:\n\n\n #{FigNewton.query_relatorio31_cenario1b}"

	end



	#----------------------------Relatorio_31_02----------------------------#
	# Demitidos e Aposentados = Sim  										#
	# Filial Empresa = Todas												#
	# Data Competência = Última competência mais 2 competências anteriores	#
	# Empresas = Todas 														#
	# Moeda = Real   														#
	# 																		#
	#-----------------------------------------------------------------------#
	def conferir_dados_do_relatorio31_02(competencia1, competencia2, competencia3)

		dados_relatorio = obter_dados_do_relatorio31

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
		imprimir_dados = banco.recuperar_dados_bd_bi_book_ultimas_tres_competencias_demitidos_aposentados_sim

		banco_receita_1 = imprimir_dados[0][0]["Receita"]
		banco_receita_1 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_receita_1)
		banco_receita_1 = converter_numero_banco_para_moeda_real(banco_receita_1)

		banco_receita_2 = imprimir_dados[0][1]["Receita"]
		banco_receita_2 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_receita_2)
		banco_receita_2 = converter_numero_banco_para_moeda_real(banco_receita_2)
		

		banco_receita_3 = imprimir_dados[0][2]["Receita"]
		banco_receita_3 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_receita_3)
		banco_receita_3 = converter_numero_banco_para_moeda_real(banco_receita_3)
		

		banco_custo_total_1 = imprimir_dados[0][0]["Custo Total"]
		banco_custo_total_1 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_total_1)
		banco_custo_total_1 = converter_numero_banco_para_moeda_real(banco_custo_total_1)

		banco_custo_total_2 = imprimir_dados[0][1]["Custo Total"]
		banco_custo_total_2 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_total_2)
		banco_custo_total_2 = converter_numero_banco_para_moeda_real(banco_custo_total_2)
		

		banco_custo_total_3 = imprimir_dados[0][2]["Custo Total"]
		banco_custo_total_3 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_total_3)
		banco_custo_total_3 = converter_numero_banco_para_moeda_real(banco_custo_total_3)
		

		banco_sinistralidade_1 = imprimir_dados[0][0]["Sinistralidade"]
		banco_sinistralidade_1 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_sinistralidade_1, 100)
		#banco_sinistralidade_1 = convertersinistralidade_banco(banco_sinistralidade_1)

		banco_sinistralidade_2 = imprimir_dados[0][1]["Sinistralidade"]
		banco_sinistralidade_2 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_sinistralidade_2, 100)
		#banco_sinistralidade_2 = convertersinistralidade_banco(banco_sinistralidade_2)

		banco_sinistralidade_3 = imprimir_dados[0][2]["Sinistralidade"]
		banco_sinistralidade_3 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_sinistralidade_3, 100)
		#banco_sinistralidade_3 = convertersinistralidade_banco(banco_sinistralidade_3)

		banco_qtde_benef_atendidos_1 = imprimir_dados[0][0]["Qtde Benef. Atendidos"]
		banco_qtde_benef_atendidos_1 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_benef_atendidos_1)

		banco_qtde_benef_atendidos_2 = imprimir_dados[0][1]["Qtde Benef. Atendidos"]
		banco_qtde_benef_atendidos_2 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_benef_atendidos_2)

		banco_qtde_benef_atendidos_3 = imprimir_dados[0][2]["Qtde Benef. Atendidos"]
		banco_qtde_benef_atendidos_3 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_benef_atendidos_3)

		banco_custo_per_capita_1 = imprimir_dados[0][0]["Custo per Capita"]
		banco_custo_per_capita_1 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_per_capita_1)
		banco_custo_per_capita_1 = converter_numero_banco_para_moeda_real(banco_custo_per_capita_1)

		banco_custo_per_capita_2 = imprimir_dados[0][1]["Custo per Capita"]
		banco_custo_per_capita_2 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_per_capita_2)
		banco_custo_per_capita_2 = converter_numero_banco_para_moeda_real(banco_custo_per_capita_2)

		banco_custo_per_capita_3 = imprimir_dados[0][2]["Custo per Capita"]
		banco_custo_per_capita_3 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_per_capita_3)
		banco_custo_per_capita_3 = converter_numero_banco_para_moeda_real(banco_custo_per_capita_3)

		banco_qtde_vidas_1 = imprimir_dados[0][0]["Qtde de Vidas"]
		banco_qtde_vidas_1 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_vidas_1)

		banco_qtde_vidas_2 = imprimir_dados[0][1]["Qtde de Vidas"]
		banco_qtde_vidas_2 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_vidas_2)

		banco_qtde_vidas_3 = imprimir_dados[0][2]["Qtde de Vidas"]
		banco_qtde_vidas_3 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_vidas_3)

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
		   relatorio_custo_per_capita_3 == banco_custo_per_capita_3 and

		   relatorio_qtde_vidas_1 == banco_qtde_vidas_1 and
		   relatorio_qtde_vidas_2 == banco_qtde_vidas_2 and
		   relatorio_qtde_vidas_3 == banco_qtde_vidas_3

		  	$world.puts "Caso de Teste passou!!!"
		else
			$world.puts "Query utilizada na consulta para as competências de #{competencia1}, #{competencia2} e #{competencia3}:\n\n\n #{FigNewton.query_relatorio31_cenario2}"
			fail($world.puts "Caso de Teste falhou!!!")
		end

		$world.puts "Query utilizada na consulta para as competências de #{competencia1}, #{competencia2} e #{competencia3}:\n\n\n #{FigNewton.query_relatorio31_cenario2}"

	end

	#def converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(numero)
		#return (numero).to_f.round(2)
	#end

	#def converter_numero_notacao_cientifica_banco_para_porcentagem(numero)
		#return (numero).to_f
	#end

	#def convertersinistralidade_banco(numero)
		#return ConversorDeNumeros.number_to_percentage(numero * 100, precision: 2, separator: ',') 
	#end

	#def converterbeneficiarios_e_vidas_tela(numero)
		#return (numero).scan(/\d+/).join().to_i
	#end

	#def converter_numero_banco_para_moeda_real(number)
  		#return ConversorDeNumeros.number_to_currency(number, :unit => "R$ ", :separator => ",", :delimiter => ".", precision: 2)
	#end

	#def converter_numero_banco_para_casas_decimais_com_delimitador(numero)
		#return ConversorDeNumeros.number_to_delimited(numero, delimiter: ".")
	#end
end



