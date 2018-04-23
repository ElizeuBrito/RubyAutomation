#Caminho da common => /lib/common.rb
require "common"
require "test/unit"
require "test/unit/assertion-failed-error"
require "test/unit/assertions"
include Test::Unit::Assertions

class GestaoDentalGerarRelatorio < Test::Unit::TestCase

	include PageObject
	include ConversorDeNumeros
	include TratarString

	#table(:campo_demitidos_e_aposentados, :xpath => Locators::LOCATOR_FILTRO_DEMITIDOS_E_APOSENTADOS)
	#table(:campo_filial_empresa, :xpath => Locators::LOCATOR_FILTRO_FILIAL_EMPRESA)
	#table(:campo_data_de_competencia, :xpath => Locators::LOCATOR_FILTRO_DATA_DE_COMPETENCIA)
	#table(:campo_empresa, :xpath => Locators::LOCATOR_FILTRO_EMPRESA)
	#table(:campo_moeda, :xpath => Locators::LOCATOR_FILTRO_MOEDA)

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
	def obter_dados_do_relatorio36
		begin
			table_array = Array.new
			table = @browser.table(:xpath => Locators::LOCATOR_TABELA_RELATORIO_36)
			table.trs.each do |row|
    			row_array = Array.new
    			row.cells.each do |cell|
        			row_array << cell.text
    			end
   	 				table_array << row_array
			end
		rescue Watir::Exception::UnknownObjectException 
			fail("Não foi possível obter os dados da tabela do relatório36!!!")
		end
		return table_array
	end

	#----------------------------Relatorio_36_03----------------------------------#
	# Demitidos e Aposentados = Todos 										      #
	# Filial Empresa = 948206/000, 948206/001, 948206/002, 948206/003, 948206/004 #
	# Data Competência = Última competência mais 2 competências anteriores	      #
	# Empresas = 948206 														  #
	# Moeda = Real   														      #
	# Produtos = Todos														      #
	#-----------------------------------------------------------------------------#
	def conferir_dados_do_relatorio36_03(competencia1, competencia2, competencia3)

		dados_relatorio = obter_dados_do_relatorio36

		relatorio_receita_1 = dados_relatorio[2][2]	
		relatorio_receita_2 = dados_relatorio[3][2]		
		relatorio_receita_3 = dados_relatorio[4][2]

		relatorio_custo_odontologico_1 = dados_relatorio[2][3]	
		relatorio_custo_odontologico_2 = dados_relatorio[3][3]
		relatorio_custo_odontologico_3 = dados_relatorio[4][3]
	
		relatorio_sinistralidade_1 = dados_relatorio[2][4]	
		relatorio_sinistralidade_2 = dados_relatorio[3][4]
		relatorio_sinistralidade_3 = dados_relatorio[4][4]

		relatorio_qtde_de_usuarios_1 = dados_relatorio[2][5]	
		relatorio_qtde_de_usuarios_2 = dados_relatorio[3][5]	
		relatorio_qtde_de_usuarios_3 = dados_relatorio[4][5]
		
		relatorio_custo_per_capita_1 = dados_relatorio[2][6]	
		relatorio_custo_per_capita_2 = dados_relatorio[3][6]
		relatorio_custo_per_capita_3	= dados_relatorio[4][6]
		
		relatorio_qtde_vidas_1 = dados_relatorio[2][7]	
		relatorio_qtde_vidas_2 = dados_relatorio[3][7]
		relatorio_qtde_vidas_3 = dados_relatorio[4][7]


		#puts relatorio_receita_1, relatorio_receita_2, relatorio_receita_3
		#puts relatorio_custo_odontologico_1, relatorio_custo_odontologico_2, relatorio_custo_odontologico_3
		#puts relatorio_sinistralidade_1, relatorio_sinistralidade_2, relatorio_sinistralidade_3
		#puts relatorio_qtde_de_usuarios_1, relatorio_qtde_de_usuarios_2, relatorio_qtde_de_usuarios_3
		#puts relatorio_custo_per_capita_1, relatorio_custo_per_capita_2, relatorio_custo_per_capita_3
		#puts relatorio_qtde_vidas_1, relatorio_qtde_vidas_2, relatorio_qtde_vidas_3

		banco = BancoDeDadosBIBook.new
		banco.tres_ultimas_competencias(competencia1, competencia2, competencia3)
		imprimir_dados = banco.recuperar_dados_bd_bi_book_relatorio_36_03

		banco_receita_1 = imprimir_dados[0][0]["Receita"]
		banco_receita_1 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_receita_1)
		banco_receita_1 = converter_numero_banco_para_moeda_real(banco_receita_1)

		banco_receita_2 = imprimir_dados[0][1]["Receita"]
		banco_receita_2 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_receita_2)
		banco_receita_2 = converter_numero_banco_para_moeda_real(banco_receita_2)
		

		banco_receita_3 = imprimir_dados[0][2]["Receita"]
		banco_receita_3 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_receita_3)
		banco_receita_3 = converter_numero_banco_para_moeda_real(banco_receita_3)
		

		banco_custo_odontologico_1 = imprimir_dados[0][0]["Custo Odontológico"]
		banco_custo_odontologico_1 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_odontologico_1)
		banco_custo_odontologico_1 = converter_numero_banco_para_moeda_real(banco_custo_odontologico_1)

		banco_custo_odontologico_2 = imprimir_dados[0][1]["Custo Odontológico"]
		banco_custo_odontologico_2 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_odontologico_2)
		banco_custo_odontologico_2 = converter_numero_banco_para_moeda_real(banco_custo_odontologico_2)
		

		banco_custo_odontologico_3 = imprimir_dados[0][2]["Custo Odontológico"]
		banco_custo_odontologico_3 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_odontologico_3)
		banco_custo_odontologico_3 = converter_numero_banco_para_moeda_real(banco_custo_odontologico_3)
		

		banco_sinistralidade_1 = imprimir_dados[0][0]["Sinistralidade"]
		banco_sinistralidade_1 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_sinistralidade_1, 100)
		#banco_sinistralidade_1 = convertersinistralidade_banco(banco_sinistralidade_1)

		banco_sinistralidade_2 = imprimir_dados[0][1]["Sinistralidade"]
		banco_sinistralidade_2 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_sinistralidade_2, 100)
		#banco_sinistralidade_2 = convertersinistralidade_banco(banco_sinistralidade_2)

		banco_sinistralidade_3 = imprimir_dados[0][2]["Sinistralidade"]
		banco_sinistralidade_3 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_sinistralidade_3, 100)
		#banco_sinistralidade_3 = convertersinistralidade_banco(banco_sinistralidade_3)

		banco_qtde_de_usuarios_1 = imprimir_dados[0][0]["Qtde usuários"]
		banco_qtde_de_usuarios_1 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_de_usuarios_1)

		banco_qtde_de_usuarios_2 = imprimir_dados[0][1]["Qtde usuários"]
		banco_qtde_de_usuarios_2 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_de_usuarios_2)

		banco_qtde_de_usuarios_3 = imprimir_dados[0][2]["Qtde usuários"]
		banco_qtde_de_usuarios_3 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_de_usuarios_3)

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
		#puts banco_custo_odontologico_1, banco_custo_odontologico_2, banco_custo_odontologico_3
		#puts banco_sinistralidade_1, banco_sinistralidade_2, banco_sinistralidade_3
		#puts banco_qtde_de_usuarios_1, banco_qtde_de_usuarios_2, banco_qtde_de_usuarios_3
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
			assert_equal(relatorio_custo_odontologico_1, banco_custo_odontologico_1)
			$world.puts "Custo Odontológico no valor de #{relatorio_custo_odontologico_1} apresentado no relatório é igual ao Custo Odontológico no valor de #{banco_custo_odontologico_1} 
			apresentado no banco de dados, referente a competência de #{competencia1}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Odontológico no valor de #{relatorio_custo_odontologico_1} apresentado no relatório não é igual ao Custo Odontológico no valor de #{banco_custo_odontologico_1} 
			apresentado no banco de dados, referente a competência de #{competencia1}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_odontologico_2, banco_custo_odontologico_2)
			$world.puts "Custo Odontológico no valor de #{relatorio_custo_odontologico_2} apresentado no relatório é igual ao Custo Odontológico no valor de #{banco_custo_odontologico_2} 
			apresentado no banco de dados, referente a competência de #{competencia2}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Odontológico no valor de #{relatorio_custo_odontologico_2} apresentado no relatório não é igual ao Custo Odontológico no valor de #{banco_custo_odontologico_2} 
			apresentado no banco de dados, referente a competência de #{competencia2}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_odontologico_3, banco_custo_odontologico_3)
			$world.puts "Custo Odontológico no valor de #{relatorio_custo_odontologico_3} apresentado no relatório é igual ao Custo Odontológico no valor de #{banco_custo_odontologico_3} 
			apresentado no banco de dados, referente a competência de #{competencia3}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Odontológico no valor de #{relatorio_custo_odontologico_3} apresentado no relatório não é igual ao Custo Odontológico no valor de #{banco_custo_odontologico_3} 
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
			assert_equal(relatorio_qtde_de_usuarios_1, banco_qtde_de_usuarios_1)
			$world.puts "Qtde de usuários #{relatorio_qtde_de_usuarios_1} apresentada no relatório é igual a Qtde de usuários #{banco_qtde_de_usuarios_1} 
			apresentada no banco de dados, referente a competência de #{competencia1}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de usuários #{relatorio_qtde_de_usuarios_1} apresentada no relatório não é igual a Qtde de usuários #{banco_qtde_de_usuarios_1} 
			apresentada no banco de dados, referente a competência de #{competencia1}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_de_usuarios_2, banco_qtde_de_usuarios_2)
			$world.puts "Qtde de usuários #{relatorio_qtde_de_usuarios_2} apresentada no relatório é igual a Qtde de usuários #{banco_qtde_de_usuarios_2} 
			apresentada no banco de dados, referente a competência de #{competencia2}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de usuários #{relatorio_qtde_de_usuarios_2} apresentada no relatório não é igual a Qtde de usuários #{banco_qtde_de_usuarios_2} 
			apresentada no banco de dados, referente a competência de #{competencia2}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_de_usuarios_3, banco_qtde_de_usuarios_3)
			$world.puts "Qtde de usuários atendidos #{relatorio_qtde_de_usuarios_3} apresentada no relatório é igual a Qtde de usuários #{banco_qtde_de_usuarios_3} 
			apresentada no banco de dados, referente a competência de #{competencia3}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de usuários #{relatorio_qtde_de_usuarios_3} apresentada no relatório não é igual a Qtde de usuários #{banco_qtde_de_usuarios_3} 
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
		   relatorio_custo_odontologico_1 == banco_custo_odontologico_1 and
		   relatorio_custo_odontologico_2 == banco_custo_odontologico_2 and
		   relatorio_custo_odontologico_3 == banco_custo_odontologico_3 and
		   relatorio_sinistralidade_1 == banco_sinistralidade_1 and
		   relatorio_sinistralidade_2 == banco_sinistralidade_2 and
		   relatorio_sinistralidade_3 == banco_sinistralidade_3 and
		   relatorio_qtde_de_usuarios_1 == banco_qtde_de_usuarios_1 and
		   relatorio_qtde_de_usuarios_2 == banco_qtde_de_usuarios_2 and
		   relatorio_qtde_de_usuarios_3 == banco_qtde_de_usuarios_3 and
		   relatorio_custo_per_capita_1 == banco_custo_per_capita_1 and
		   relatorio_custo_per_capita_2 == banco_custo_per_capita_2 and
		   relatorio_custo_per_capita_3 == banco_custo_per_capita_3 and
		   relatorio_qtde_vidas_1 == banco_qtde_vidas_1 and
		   relatorio_qtde_vidas_2 == banco_qtde_vidas_2 and
		   relatorio_qtde_vidas_3 == banco_qtde_vidas_3

		  	$world.puts "Caso de Teste passou!!!"
		else
			$world.puts "Query utilizada na consulta para as competências de #{competencia1}, #{competencia2} e #{competencia3}:\n\n\n #{FigNewton.query_relatorio36_cenario3}"
			fail($world.puts "Caso de Teste falhou!!!")
		end

		$world.puts "Query utilizada na consulta para as competências de #{competencia1}, #{competencia2} e #{competencia3}:\n\n\n #{FigNewton.query_relatorio36_cenario3}"

	end

	#----------------------------Relatorio_36_04----------------------------------------------#
	# Inserir Coligadas = Selecionar empresa 948206                                           #
	# Demitidos e Aposentados = Todos 										                  #
	# Filial Empresa = 446315/000, 948206/000, 948206/001, 948206/002, 948206/003, 948206/004 #
	# Data Competência = Última competência mais 2 competências anteriores	                  #
	# Empresas = 446315, 948206 												              #
	# Moeda = Real   														                  #
	# Produtos = Todos														                  #
	#-----------------------------------------------------------------------------------------#
	def conferir_dados_do_relatorio36_04(competencia1, competencia2, competencia3)

		dados_relatorio = obter_dados_do_relatorio36

		relatorio_receita_1 = dados_relatorio[2][2]	
		relatorio_receita_2 = dados_relatorio[3][2]		
		relatorio_receita_3 = dados_relatorio[4][2]

		relatorio_custo_odontologico_1 = dados_relatorio[2][3]	
		relatorio_custo_odontologico_2 = dados_relatorio[3][3]
		relatorio_custo_odontologico_3 = dados_relatorio[4][3]
	
		relatorio_sinistralidade_1 = dados_relatorio[2][4]	
		relatorio_sinistralidade_2 = dados_relatorio[3][4]
		relatorio_sinistralidade_3 = dados_relatorio[4][4]

		relatorio_qtde_de_usuarios_1 = dados_relatorio[2][5]	
		relatorio_qtde_de_usuarios_2 = dados_relatorio[3][5]	
		relatorio_qtde_de_usuarios_3 = dados_relatorio[4][5]
		
		relatorio_custo_per_capita_1 = dados_relatorio[2][6]	
		relatorio_custo_per_capita_2 = dados_relatorio[3][6]
		relatorio_custo_per_capita_3	= dados_relatorio[4][6]
		
		relatorio_qtde_vidas_1 = dados_relatorio[2][7]	
		relatorio_qtde_vidas_2 = dados_relatorio[3][7]
		relatorio_qtde_vidas_3 = dados_relatorio[4][7]


		#puts relatorio_receita_1, relatorio_receita_2, relatorio_receita_3
		#puts relatorio_custo_odontologico_1, relatorio_custo_odontologico_2, relatorio_custo_odontologico_3
		#puts relatorio_sinistralidade_1, relatorio_sinistralidade_2, relatorio_sinistralidade_3
		#puts relatorio_qtde_de_usuarios_1, relatorio_qtde_de_usuarios_2, relatorio_qtde_de_usuarios_3
		#puts relatorio_custo_per_capita_1, relatorio_custo_per_capita_2, relatorio_custo_per_capita_3
		#puts relatorio_qtde_vidas_1, relatorio_qtde_vidas_2, relatorio_qtde_vidas_3

		banco = BancoDeDadosBIBook.new
		banco.tres_ultimas_competencias(competencia1, competencia2, competencia3)
		imprimir_dados = banco.recuperar_dados_bd_bi_book_relatorio_36_04

		banco_receita_1 = imprimir_dados[0][0]["Receita"]
		banco_receita_1 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_receita_1)
		banco_receita_1 = converter_numero_banco_para_moeda_real(banco_receita_1)

		banco_receita_2 = imprimir_dados[0][1]["Receita"]
		banco_receita_2 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_receita_2)
		banco_receita_2 = converter_numero_banco_para_moeda_real(banco_receita_2)
		

		banco_receita_3 = imprimir_dados[0][2]["Receita"]
		banco_receita_3 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_receita_3)
		banco_receita_3 = converter_numero_banco_para_moeda_real(banco_receita_3)
		

		banco_custo_odontologico_1 = imprimir_dados[0][0]["Custo Odontológico"]
		banco_custo_odontologico_1 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_odontologico_1)
		banco_custo_odontologico_1 = converter_numero_banco_para_moeda_real(banco_custo_odontologico_1)

		banco_custo_odontologico_2 = imprimir_dados[0][1]["Custo Odontológico"]
		banco_custo_odontologico_2 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_odontologico_2)
		banco_custo_odontologico_2 = converter_numero_banco_para_moeda_real(banco_custo_odontologico_2)
		

		banco_custo_odontologico_3 = imprimir_dados[0][2]["Custo Odontológico"]
		banco_custo_odontologico_3 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_odontologico_3)
		banco_custo_odontologico_3 = converter_numero_banco_para_moeda_real(banco_custo_odontologico_3)
		

		banco_sinistralidade_1 = imprimir_dados[0][0]["Sinistralidade"]
		banco_sinistralidade_1 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_sinistralidade_1, 100)
		#banco_sinistralidade_1 = convertersinistralidade_banco(banco_sinistralidade_1)

		banco_sinistralidade_2 = imprimir_dados[0][1]["Sinistralidade"]
		banco_sinistralidade_2 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_sinistralidade_2, 100)
		#banco_sinistralidade_2 = convertersinistralidade_banco(banco_sinistralidade_2)

		banco_sinistralidade_3 = imprimir_dados[0][2]["Sinistralidade"]
		banco_sinistralidade_3 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_sinistralidade_3, 100)
		#banco_sinistralidade_3 = convertersinistralidade_banco(banco_sinistralidade_3)

		banco_qtde_de_usuarios_1 = imprimir_dados[0][0]["Qtde usuários"]
		banco_qtde_de_usuarios_1 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_de_usuarios_1)

		banco_qtde_de_usuarios_2 = imprimir_dados[0][1]["Qtde usuários"]
		banco_qtde_de_usuarios_2 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_de_usuarios_2)

		banco_qtde_de_usuarios_3 = imprimir_dados[0][2]["Qtde usuários"]
		banco_qtde_de_usuarios_3 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_de_usuarios_3)

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
		#puts banco_custo_odontologico_1, banco_custo_odontologico_2, banco_custo_odontologico_3
		#puts banco_sinistralidade_1, banco_sinistralidade_2, banco_sinistralidade_3
		#puts banco_qtde_de_usuarios_1, banco_qtde_de_usuarios_2, banco_qtde_de_usuarios_3
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
			assert_equal(relatorio_custo_odontologico_1, banco_custo_odontologico_1)
			$world.puts "Custo Odontológico no valor de #{relatorio_custo_odontologico_1} apresentado no relatório é igual ao Custo Odontológico no valor de #{banco_custo_odontologico_1} 
			apresentado no banco de dados, referente a competência de #{competencia1}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Odontológico no valor de #{relatorio_custo_odontologico_1} apresentado no relatório não é igual ao Custo Odontológico no valor de #{banco_custo_odontologico_1} 
			apresentado no banco de dados, referente a competência de #{competencia1}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_odontologico_2, banco_custo_odontologico_2)
			$world.puts "Custo Odontológico no valor de #{relatorio_custo_odontologico_2} apresentado no relatório é igual ao Custo Odontológico no valor de #{banco_custo_odontologico_2} 
			apresentado no banco de dados, referente a competência de #{competencia2}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Odontológico no valor de #{relatorio_custo_odontologico_2} apresentado no relatório não é igual ao Custo Odontológico no valor de #{banco_custo_odontologico_2} 
			apresentado no banco de dados, referente a competência de #{competencia2}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_custo_odontologico_3, banco_custo_odontologico_3)
			$world.puts "Custo Odontológico no valor de #{relatorio_custo_odontologico_3} apresentado no relatório é igual ao Custo Odontológico no valor de #{banco_custo_odontologico_3} 
			apresentado no banco de dados, referente a competência de #{competencia3}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Odontológico no valor de #{relatorio_custo_odontologico_3} apresentado no relatório não é igual ao Custo Odontológico no valor de #{banco_custo_odontologico_3} 
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
			assert_equal(relatorio_qtde_de_usuarios_1, banco_qtde_de_usuarios_1)
			$world.puts "Qtde de usuários #{relatorio_qtde_de_usuarios_1} apresentada no relatório é igual a Qtde de usuários #{banco_qtde_de_usuarios_1} 
			apresentada no banco de dados, referente a competência de #{competencia1}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de usuários #{relatorio_qtde_de_usuarios_1} apresentada no relatório não é igual a Qtde de usuários #{banco_qtde_de_usuarios_1} 
			apresentada no banco de dados, referente a competência de #{competencia1}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_de_usuarios_2, banco_qtde_de_usuarios_2)
			$world.puts "Qtde de usuários #{relatorio_qtde_de_usuarios_2} apresentada no relatório é igual a Qtde de usuários #{banco_qtde_de_usuarios_2} 
			apresentada no banco de dados, referente a competência de #{competencia2}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de usuários #{relatorio_qtde_de_usuarios_2} apresentada no relatório não é igual a Qtde de usuários #{banco_qtde_de_usuarios_2} 
			apresentada no banco de dados, referente a competência de #{competencia2}!!!: #{mensagem_de_erro.message}"
		end

		begin
			assert_equal(relatorio_qtde_de_usuarios_3, banco_qtde_de_usuarios_3)
			$world.puts "Qtde de usuários atendidos #{relatorio_qtde_de_usuarios_3} apresentada no relatório é igual a Qtde de usuários #{banco_qtde_de_usuarios_3} 
			apresentada no banco de dados, referente a competência de #{competencia3}!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Qtde de usuários #{relatorio_qtde_de_usuarios_3} apresentada no relatório não é igual a Qtde de usuários #{banco_qtde_de_usuarios_3} 
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
		   relatorio_custo_odontologico_1 == banco_custo_odontologico_1 and
		   relatorio_custo_odontologico_2 == banco_custo_odontologico_2 and
		   relatorio_custo_odontologico_3 == banco_custo_odontologico_3 and
		   relatorio_sinistralidade_1 == banco_sinistralidade_1 and
		   relatorio_sinistralidade_2 == banco_sinistralidade_2 and
		   relatorio_sinistralidade_3 == banco_sinistralidade_3 and
		   relatorio_qtde_de_usuarios_1 == banco_qtde_de_usuarios_1 and
		   relatorio_qtde_de_usuarios_2 == banco_qtde_de_usuarios_2 and
		   relatorio_qtde_de_usuarios_3 == banco_qtde_de_usuarios_3 and
		   relatorio_custo_per_capita_1 == banco_custo_per_capita_1 and
		   relatorio_custo_per_capita_2 == banco_custo_per_capita_2 and
		   relatorio_custo_per_capita_3 == banco_custo_per_capita_3 and
		   relatorio_qtde_vidas_1 == banco_qtde_vidas_1 and
		   relatorio_qtde_vidas_2 == banco_qtde_vidas_2 and
		   relatorio_qtde_vidas_3 == banco_qtde_vidas_3

		  	$world.puts "Caso de Teste passou!!!"
		else
			$world.puts "Query utilizada na consulta para as competências de #{competencia1}, #{competencia2} e #{competencia3}:\n\n\n #{FigNewton.query_relatorio36_cenario4}"
			fail($world.puts "Caso de Teste falhou!!!")
		end

		$world.puts "Query utilizada na consulta para as competências de #{competencia1}, #{competencia2} e #{competencia3}:\n\n\n #{FigNewton.query_relatorio36_cenario4}"

	end
end



