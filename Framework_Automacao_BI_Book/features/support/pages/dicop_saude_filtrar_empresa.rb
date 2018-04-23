#Caminho da common => /lib/common.rb
require "common"
require "test/unit"
require "test/unit/assertion-failed-error"
require "test/unit/assertions"
include Test::Unit::Assertions

class DicopSaudeFiltrarEmpresa < Test::Unit::TestCase

	include PageObject
	include ConversorDeNumeros
	include TratarString


	<<-DOC
	Mapa de navegação na tabela do relatório Dicop Saúde Análise de Custos por Especialidade - Beneficiários

		Array bidimenssional
		[3][1] -> Campo Especialidade
		[3][2] -> Campo Qtde
		[3][3] -> Campo Qtde porcentagem
		[3][4] -> Campo Custo Médico
		[3][5] -> Campo Custos porcentagem

		[4][1] = Primeiro valor do campo Especialidade
			[5][1] = Segundo valor do campo Especialidade
				[6][1] = Terceiro valor do campo Especialidade
					[7][1] = Quarto valor do campo Especialidade

		[4][2] = Primeiro valor do campo Qtde
			[5][2] = Segundo valor do campo Qtde
				[6][2] = Terceiro valor do campo Qtde
					[7][2] = Quarto valor do campo Qtde

						....
	DOC
	def obter_dados_de_especialidades_relatorio192_1
		begin
			table_array = Array.new
			table = @browser.table(:xpath => Locators::LOCATOR_TABELA_RELATORIO_192_1)
			table.trs.each do |row|
    			row_array = Array.new
    			row.cells.each do |cell|
        			row_array << cell.text
    			end
   	 				table_array << row_array
			end
		rescue Watir::Exception::UnknownObjectException 
			fail("Não foi possível obter os dados da tabela de Especialidades do relatório192!!!")
		end
		return table_array
	end

	<<-DOC
	Mapa de navegação na tabela de Detalhamento de Especialidades do relatório Detalhamento - Análise de Custos por Especialidade - Beneficiário

		Array bidimenssional
		[3][1] -> Campo Beneficiário
		[3][2] -> Campo Tipo Beneficiário
		[3][3] -> Campo Qtde
		[3][4] -> Campo Qtde porcentagem
		[3][5] -> Campo Custo Médico
		[3][6] -> Campo Custos porcentagem

		[4][1] = Primeiro valor do campo Beneficiário
			[5][1] = Segundo valor do campo Beneficiário
				[6][1] = Terceiro valor do campo Beneficiário
					[7][1] = Quarto valor do campo Beneficiário

		[4][2] = Primeiro valor do campo Tipo Beneficiário
			[5][2] = Segundo valor do campo Tipo Beneficiário
				[6][2] = Terceiro valor do campo Tipo Beneficiário
					[7][2] = Quarto valor do campo Tipo Beneficiário

						....
	DOC
	def obter_dados_detalhamento_especialidade_relatorio192_2
		begin
			table_array = Array.new
			table = @browser.table(:xpath => Locators::LOCATOR_TABELA_DETALHAMENTO_RELATORIO_192_2)
			table.trs.each do |row|
    			row_array = Array.new
    			row.cells.each do |cell|
        			row_array << cell.text
    			end
   	 				table_array << row_array
			end
		rescue Watir::Exception::UnknownObjectException 
			fail("Não foi possível obter os dados da tabela de Detalhamento de Especialidade do relatório192!!!")
		end
		return table_array
	end
	#----------------------------Relatorio_192_1-----------------------------------------------------------------------------------------------------------#
	# Demitidos e Aposentados = Todas																													   #
	# Filial Amil = Todas                                                                                                                                  #  
	# Empresa: 000509 - PRICE                                                                                                                              #
	# Moeda = Real                        																												   #
	# Tipo de Evento = CONSULTA                                                                               											   #
	# Célula = Todas																																	   #
	# Operadora = Todas 										                                                                                           #  
	# Filial Empresa = 000509/000, 000509/001, 000509/002, 000509/003, 000509/004, 000509/005, 000509/006, 000509/007, 000509/008, 000509/009, 000509/010, #
	# 000509/000, 000509/011, 000509/012, 000509/013, 000509/014, 000509/015                                                                               #
	# Data Competência = Última competência mais 2 competências anteriores	                															   #  
	# P&L = Todas   														                  															   #
	#------------------------------------------------------------------------------------------------------------------------------------------------------#

	def conferir_dados_de_especialidades_relatorio192_01(competencia1, competencia2, competencia3)

		dados_relatorio = obter_dados_de_especialidades_relatorio192_1

		relatorio_especialidade_1 = dados_relatorio[4][1]
		relatorio_especialidade_1 = remover_espacos_string_provinda_web(relatorio_especialidade_1)
		relatorio_especialidade_2 = dados_relatorio[5][1]
		relatorio_especialidade_2 = remover_espacos_string_provinda_web(relatorio_especialidade_2)
		relatorio_especialidade_3 = dados_relatorio[6][1]
		relatorio_especialidade_3 = remover_espacos_string_provinda_web(relatorio_especialidade_3)
		relatorio_especialidade_4 = dados_relatorio[7][1]
		relatorio_especialidade_4 = remover_espacos_string_provinda_web(relatorio_especialidade_4)

		relatorio_qtde_1 = dados_relatorio[4][2] 
		relatorio_qtde_2 = dados_relatorio[5][2]
		relatorio_qtde_3 = dados_relatorio[6][2]
		relatorio_qtde_4 = dados_relatorio[7][2]

		relatorio_qtde_porcentagem_1 = dados_relatorio[4][3]
		relatorio_qtde_porcentagem_2 = dados_relatorio[5][3]
		relatorio_qtde_porcentagem_3 = dados_relatorio[6][3]
		relatorio_qtde_porcentagem_4 = dados_relatorio[7][3] 

		relatorio_custo_medico_1 = dados_relatorio[4][4]
		relatorio_custo_medico_2 = dados_relatorio[5][4]
		relatorio_custo_medico_3 = dados_relatorio[6][4]
		relatorio_custo_medico_4 = dados_relatorio[7][4]

		relatorio_custos_porcentagem_1 = dados_relatorio[4][5]
		relatorio_custos_porcentagem_2 = dados_relatorio[5][5]
		relatorio_custos_porcentagem_3 = dados_relatorio[6][5]
		relatorio_custos_porcentagem_4 = dados_relatorio[7][5]

		banco = BancoDeDadosBIBook.new
		banco.tres_ultimas_competencias(competencia1, competencia2, competencia3)
		imprimir_dados = banco.recuperar_dados_bd_bi_book_especialidades_relatorio_192

		banco_especialidade_1 = imprimir_dados[0][0]["Especialidade"]
		banco_especialidade_1 = remover_espacos_string_provinda_banco(banco_especialidade_1)
		banco_especialidade_2 = imprimir_dados[0][1]["Especialidade"]
		banco_especialidade_2 = remover_espacos_string_provinda_banco(banco_especialidade_2)
		banco_especialidade_3 = imprimir_dados[0][2]["Especialidade"]
		banco_especialidade_3 = remover_espacos_string_provinda_banco(banco_especialidade_3)
		banco_especialidade_4 = imprimir_dados[0][3]["Especialidade"]
		banco_especialidade_4 = remover_espacos_string_provinda_banco(banco_especialidade_4)

		banco_qtde_1 = imprimir_dados[0][0]["Qtde"]
		banco_qtde_1 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_1)
		banco_qtde_2 = imprimir_dados[0][1]["Qtde"]
		banco_qtde_2 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_2)
		banco_qtde_3 = imprimir_dados[0][2]["Qtde"]
		banco_qtde_3 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_3)
		banco_qtde_4 = imprimir_dados[0][3]["Qtde"]
		banco_qtde_4 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_4)

		banco_qtde_porcentagem_1 = imprimir_dados[0][0]["QTD_PERC"]
		banco_qtde_porcentagem_1 = converter_numero_banco_para_porcentagem(banco_qtde_porcentagem_1)
		banco_qtde_porcentagem_2 = imprimir_dados[0][1]["QTD_PERC"]
		banco_qtde_porcentagem_2 = converter_numero_banco_para_porcentagem(banco_qtde_porcentagem_2)
		banco_qtde_porcentagem_3 = imprimir_dados[0][2]["QTD_PERC"]
		banco_qtde_porcentagem_3 = converter_numero_banco_para_porcentagem(banco_qtde_porcentagem_3)
		banco_qtde_porcentagem_4 = imprimir_dados[0][3]["QTD_PERC"]
		banco_qtde_porcentagem_4 = converter_numero_banco_para_porcentagem(banco_qtde_porcentagem_4)

		banco_custo_medico_1 = imprimir_dados[0][0]["Custo_Medico"]
		banco_custo_medico_1 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_medico_1)
		banco_custo_medico_1 = converter_numero_banco_para_moeda_real(banco_custo_medico_1)
		banco_custo_medico_2 = imprimir_dados[0][1]["Custo_Medico"]
		banco_custo_medico_2 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_medico_2)
		banco_custo_medico_2 = converter_numero_banco_para_moeda_real(banco_custo_medico_2)
		banco_custo_medico_3 = imprimir_dados[0][2]["Custo_Medico"]
		banco_custo_medico_3 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_medico_3)
		banco_custo_medico_3 = converter_numero_banco_para_moeda_real(banco_custo_medico_3)
		banco_custo_medico_4 = imprimir_dados[0][3]["Custo_Medico"]
		banco_custo_medico_4 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_medico_4)
		banco_custo_medico_4 = converter_numero_banco_para_moeda_real(banco_custo_medico_4)

		banco_custos_porcentagem_1 = imprimir_dados[0][0]["CUSTO_PERC"]
		banco_custos_porcentagem_1 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_custos_porcentagem_1, 1)
		banco_custos_porcentagem_2 = imprimir_dados[0][1]["CUSTO_PERC"]
		banco_custos_porcentagem_2 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_custos_porcentagem_2, 1)
		banco_custos_porcentagem_3 = imprimir_dados[0][2]["CUSTO_PERC"]
		banco_custos_porcentagem_3 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_custos_porcentagem_3, 1)
		banco_custos_porcentagem_4 = imprimir_dados[0][3]["CUSTO_PERC"]
		banco_custos_porcentagem_4 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_custos_porcentagem_4, 1)

		#puts banco_qtde_1, banco_qtde_2, banco_qtde_3, banco_qtde_4
		#puts banco_qtde_porcentagem_1, banco_qtde_porcentagem_2, banco_qtde_porcentagem_3, banco_qtde_porcentagem_4
		#puts banco_custo_medico_1, banco_custo_medico_2, banco_custo_medico_3, banco_custo_medico_4
		#puts banco_custos_porcentagem_1, banco_custos_porcentagem_2, banco_custos_porcentagem_3, banco_custos_porcentagem_4

		#Validando as especialidades
		begin
			assert_equal(relatorio_especialidade_1, banco_especialidade_1)
			$world.puts "Especialidade #{relatorio_especialidade_1} apresentada no relatório é igual a especialidade #{banco_especialidade_1} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Especialidade #{relatorio_especialidade_1} apresentada no relatório não é igual a especialidade #{banco_especialidade_1} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_especialidade_2, banco_especialidade_2)
			$world.puts "Especialidade #{relatorio_especialidade_2} apresentada no relatório é igual a especialidade #{banco_especialidade_2} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Especialidade #{relatorio_especialidade_2} apresentada no relatório não é igual a especialidade #{banco_especialidade_2} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_especialidade_3, banco_especialidade_3)
			$world.puts "Especialidade #{relatorio_especialidade_3} apresentada no relatório é igual a especialidade #{banco_especialidade_3} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Especialidade #{relatorio_especialidade_3} apresentada no relatório não é igual a especialidade #{banco_especialidade_3} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_especialidade_4, banco_especialidade_4)
			$world.puts "Especialidade #{relatorio_especialidade_4} apresentada no relatório é igual a especialidade #{banco_especialidade_4} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Especialidade #{relatorio_especialidade_4} apresentada no relatório não é igual a especialidade #{banco_especialidade_4} 
			apresentada no banco de dados!!!"
		end

		#Validando as quantidades de atendimentos
		begin
			assert_equal(relatorio_qtde_1, banco_qtde_1)
			$world.puts "Quantidade #{relatorio_qtde_1} de atendimentos apresentada no relatório é igual a quantidade de atendimentos #{banco_qtde_1} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Quantidade #{relatorio_qtde_1} de atendimentos apresentada no relatório não é igual a quantidade de atendimentos #{banco_qtde_1} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_qtde_2, banco_qtde_2)
			$world.puts "Quantidade #{relatorio_qtde_2} de atendimentos apresentada no relatório é igual a quantidade de atendimentos #{banco_qtde_2} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Quantidade #{relatorio_qtde_2} de atendimentos apresentada no relatório não é igual a quantidade de atendimentos #{banco_qtde_2} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_qtde_3, banco_qtde_3)
			$world.puts "Quantidade #{relatorio_qtde_3} de atendimentos apresentada no relatório é igual a quantidade de atendimentos #{banco_qtde_3} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Quantidade #{relatorio_qtde_3} de atendimentos apresentada no relatório não é igual a quantidade de atendimentos #{banco_qtde_3} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_qtde_4, banco_qtde_4)
			$world.puts "Quantidade #{relatorio_qtde_4} de atendimentos apresentada no relatório é igual a quantidade de atendimentos #{banco_qtde_4} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Quantidade #{relatorio_qtde_4} de atendimentos apresentada no relatório não é igual a quantidade de atendimentos #{banco_qtde_4} 
			apresentada no banco de dados!!!"
		end

		#Validando a porcentagem das quantidades de atendimentos
		begin
			assert_equal(relatorio_qtde_porcentagem_1, banco_qtde_porcentagem_1)
			$world.puts "Porcentagem de quantidade em atendimentos de #{relatorio_qtde_porcentagem_1} apresentada no relatório é igual a porcetagem de quantidade em atendimentos de #{banco_qtde_porcentagem_1} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Porcentagem de quantidade em atendimentos de #{relatorio_qtde_porcentagem_1} apresentada no relatório não é igual a porcetagem de quantidade em atendimentos de #{banco_qtde_porcentagem_1} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_qtde_porcentagem_2, banco_qtde_porcentagem_2)
			$world.puts "Porcentagem de quantidade em atendimentos de #{relatorio_qtde_porcentagem_2} apresentada no relatório é igual a porcetagem de quantidade em atendimentos de #{banco_qtde_porcentagem_2} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Porcentagem de quantidade em atendimentos de #{relatorio_qtde_porcentagem_2} apresentada no relatório não é igual a porcetagem de quantidade em atendimentos de #{banco_qtde_porcentagem_2} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_qtde_porcentagem_3, banco_qtde_porcentagem_3)
			$world.puts "Porcentagem de quantidade em atendimentos de #{relatorio_qtde_porcentagem_3} apresentada no relatório é igual a porcetagem de quantidade em atendimentos de #{banco_qtde_porcentagem_3} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Porcentagem de quantidade em atendimentos de #{relatorio_qtde_porcentagem_3} apresentada no relatório não é igual a porcetagem de quantidade em atendimentos de #{banco_qtde_porcentagem_3} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_qtde_porcentagem_4, banco_qtde_porcentagem_4)
			$world.puts "Porcentagem de quantidade em atendimentos de #{relatorio_qtde_porcentagem_4} apresentada no relatório é igual a porcetagem de quantidade em atendimentos de #{banco_qtde_porcentagem_4} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Porcentagem de quantidade em atendimentos de #{relatorio_qtde_porcentagem_4} apresentada no relatório não é igual a porcetagem de quantidade em atendimentos de #{banco_qtde_porcentagem_4} 
			apresentada no banco de dados!!!"
		end

		#Validando o Custo Médico por especialidade
		begin
			assert_equal(relatorio_custo_medico_1, banco_custo_medico_1)
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_1} apresentado no relatório é igual ao Custo Médico por Especialidade de #{banco_custo_medico_1} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_1} apresentado no relatório não é igual ao Custo Médico por Especialidade de #{banco_custo_medico_1} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custo_medico_2, banco_custo_medico_2)
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_2} apresentado no relatório é igual ao Custo Médico por Especialidade de #{banco_custo_medico_2} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_2} apresentado no relatório não é igual ao Custo Médico por Especialidade de #{banco_custo_medico_2} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custo_medico_3, banco_custo_medico_3)
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_3} apresentado no relatório é igual ao Custo Médico por Especialidade de #{banco_custo_medico_3} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_3} apresentado no relatório não é igual ao Custo Médico por Especialidade de #{banco_custo_medico_3} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custo_medico_4, banco_custo_medico_4)
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_4} apresentado no relatório é igual ao Custo Médico por Especialidade de #{banco_custo_medico_4} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_4} apresentado no relatório não é igual ao Custo Médico por Especialidade de #{banco_custo_medico_4} 
			apresentado no banco de dados!!!"
		end

		#Validando a porcentagem dos custos por especialidade
		begin
			assert_equal(relatorio_custos_porcentagem_1, banco_custos_porcentagem_1)
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_1} apresentada no relatório é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_1} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_1} apresentada no relatório não é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_1} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custos_porcentagem_2, banco_custos_porcentagem_2)
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_2} apresentada no relatório é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_2} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_2} apresentada no relatório não é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_2} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custos_porcentagem_3, banco_custos_porcentagem_3)
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_3} apresentada no relatório é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_3} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_3} apresentada no relatório não é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_3} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custos_porcentagem_4, banco_custos_porcentagem_4)
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_4} apresentada no relatório é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_4} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_4} apresentada no relatório não é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_4} 
			apresentada no banco de dados!!!"
		end

		#Validando o batimento de todos os campos
		if relatorio_especialidade_1 == banco_especialidade_1 and
			relatorio_especialidade_2 == banco_especialidade_2 and
			relatorio_especialidade_3 == banco_especialidade_3 and
			relatorio_especialidade_4 == banco_especialidade_4 and
			relatorio_qtde_1 == banco_qtde_1 and
			relatorio_qtde_2 == banco_qtde_2 and
			relatorio_qtde_3 == banco_qtde_3 and
			relatorio_qtde_4 == banco_qtde_4 and
			relatorio_qtde_porcentagem_1 == banco_qtde_porcentagem_1 and
			relatorio_qtde_porcentagem_2 == banco_qtde_porcentagem_2 and
			relatorio_qtde_porcentagem_3 == banco_qtde_porcentagem_3 and
			relatorio_qtde_porcentagem_4 == banco_qtde_porcentagem_4 and
			relatorio_custo_medico_1 == banco_custo_medico_1 and
			relatorio_custo_medico_2 == banco_custo_medico_2 and
			relatorio_custo_medico_3 == banco_custo_medico_3 and
			relatorio_custo_medico_4 == banco_custo_medico_4 and
			relatorio_custos_porcentagem_1 == banco_custos_porcentagem_1 and
			relatorio_custos_porcentagem_2 == banco_custos_porcentagem_2 and
			relatorio_custos_porcentagem_3 == banco_custos_porcentagem_3 and
			relatorio_custos_porcentagem_4 == banco_custos_porcentagem_4

		  	$world.puts "Caso de Teste referente a validação do primeiro relatório192 do DICOP Saúde passou!!!"
		else
			$world.puts "Query utilizada na consulta para as competências de #{competencia1}, #{competencia2}, #{competencia3}:\n\n\n #{FigNewton.query_relatorio192_1_cenario1}"
			fail($world.puts "Caso de Teste falhou!!!")
		end

		$world.puts "Query utilizada na consulta para as competências de #{competencia1}, #{competencia2}, #{competencia3}:\n\n\n #{FigNewton.query_relatorio192_1_cenario1}"

	end

	def conferir_detalhamento_de_especialidade_relatorio192_02(competencia1, competencia2, competencia3)

		dados_relatorio = obter_dados_detalhamento_especialidade_relatorio192_2

		relatorio_beneficiario_1 = dados_relatorio[4][1]
		relatorio_beneficiario_1 = remover_espacos_string_provinda_web(relatorio_beneficiario_1)

		relatorio_beneficiario_2 = dados_relatorio[5][1]
		relatorio_beneficiario_2 = remover_espacos_string_provinda_web(relatorio_beneficiario_2)

		relatorio_beneficiario_3 = dados_relatorio[6][1]
		relatorio_beneficiario_3 = remover_espacos_string_provinda_web(relatorio_beneficiario_3)

		relatorio_beneficiario_4 = dados_relatorio[7][1]
		relatorio_beneficiario_4 = remover_espacos_string_provinda_web(relatorio_beneficiario_4)

		relatorio_beneficiario_5 = dados_relatorio[8][1]
		relatorio_beneficiario_5 = remover_espacos_string_provinda_web(relatorio_beneficiario_5)

		relatorio_beneficiario_6 = dados_relatorio[9][1]
		relatorio_beneficiario_6 = remover_espacos_string_provinda_web(relatorio_beneficiario_6)

		relatorio_beneficiario_7 = dados_relatorio[10][1]
		relatorio_beneficiario_7 = remover_espacos_string_provinda_web(relatorio_beneficiario_7)

		relatorio_beneficiario_8 = dados_relatorio[11][1]
		relatorio_beneficiario_8 = remover_espacos_string_provinda_web(relatorio_beneficiario_8)

		relatorio_beneficiario_9 = dados_relatorio[12][1]
		relatorio_beneficiario_9 = remover_espacos_string_provinda_web(relatorio_beneficiario_9)

		relatorio_beneficiario_10 = dados_relatorio[13][1]
		relatorio_beneficiario_10 = remover_espacos_string_provinda_web(relatorio_beneficiario_10)

		relatorio_beneficiario_11 = dados_relatorio[14][1]
		relatorio_beneficiario_11 = remover_espacos_string_provinda_web(relatorio_beneficiario_11)

		relatorio_beneficiario_12 = dados_relatorio[15][1]
		relatorio_beneficiario_12 = remover_espacos_string_provinda_web(relatorio_beneficiario_12)


 
		relatorio_tipo_beneficiario_1 = dados_relatorio[4][2]
		relatorio_tipo_beneficiario_1 = remover_espacos_string_provinda_web(relatorio_tipo_beneficiario_1)

		relatorio_tipo_beneficiario_2 = dados_relatorio[5][2]
		relatorio_tipo_beneficiario_2 = remover_espacos_string_provinda_web(relatorio_tipo_beneficiario_2)

		relatorio_tipo_beneficiario_3 = dados_relatorio[6][2]
		relatorio_tipo_beneficiario_3 = remover_espacos_string_provinda_web(relatorio_tipo_beneficiario_3)

		relatorio_tipo_beneficiario_4 = dados_relatorio[7][2]
		relatorio_tipo_beneficiario_4 = remover_espacos_string_provinda_web(relatorio_tipo_beneficiario_4)

		relatorio_tipo_beneficiario_5 = dados_relatorio[8][2]
		relatorio_tipo_beneficiario_5 = remover_espacos_string_provinda_web(relatorio_tipo_beneficiario_5)

		relatorio_tipo_beneficiario_6 = dados_relatorio[9][2]
		relatorio_tipo_beneficiario_6 = remover_espacos_string_provinda_web(relatorio_tipo_beneficiario_6)

		relatorio_tipo_beneficiario_7 = dados_relatorio[10][2]
		relatorio_tipo_beneficiario_7 = remover_espacos_string_provinda_web(relatorio_tipo_beneficiario_7)

		relatorio_tipo_beneficiario_8 = dados_relatorio[11][2]
		relatorio_tipo_beneficiario_8 = remover_espacos_string_provinda_web(relatorio_tipo_beneficiario_8)

		relatorio_tipo_beneficiario_9 = dados_relatorio[12][2]
		relatorio_tipo_beneficiario_9 = remover_espacos_string_provinda_web(relatorio_tipo_beneficiario_9)

		relatorio_tipo_beneficiario_10 = dados_relatorio[13][2]
		relatorio_tipo_beneficiario_10 = remover_espacos_string_provinda_web(relatorio_tipo_beneficiario_10)

		relatorio_tipo_beneficiario_11 = dados_relatorio[14][2]
		relatorio_tipo_beneficiario_11 = remover_espacos_string_provinda_web(relatorio_tipo_beneficiario_11)

		relatorio_tipo_beneficiario_12 = dados_relatorio[15][2]
		relatorio_tipo_beneficiario_12 = remover_espacos_string_provinda_web(relatorio_tipo_beneficiario_12)



		relatorio_qtde_1 = dados_relatorio[4][3]
		relatorio_qtde_2 = dados_relatorio[5][3]
		relatorio_qtde_3 = dados_relatorio[6][3]
		relatorio_qtde_4 = dados_relatorio[7][3]
		relatorio_qtde_5 = dados_relatorio[8][3]
		relatorio_qtde_6 = dados_relatorio[9][3]
		relatorio_qtde_7 = dados_relatorio[10][3]
		relatorio_qtde_8 = dados_relatorio[11][3]
		relatorio_qtde_9 = dados_relatorio[12][3]
		relatorio_qtde_10 = dados_relatorio[13][3]
		relatorio_qtde_11 = dados_relatorio[14][3]
		relatorio_qtde_12 = dados_relatorio[15][3]


		#BUG
		#relatorio_qtde_porcentagem_1 = dados_relatorio[4][4]
		#relatorio_qtde_porcentagem_2 = dados_relatorio[5][4]
		#relatorio_qtde_porcentagem_3 = dados_relatorio[6][4]
		#relatorio_qtde_porcentagem_4 = dados_relatorio[7][4]
		#relatorio_qtde_porcentagem_5 = dados_relatorio[8][4]
		#elatorio_qtde_porcentagem_6 = dados_relatorio[9][4]
		#relatorio_qtde_porcentagem_7 = dados_relatorio[10][4]
		#relatorio_qtde_porcentagem_8 = dados_relatorio[11][4]
		#relatorio_qtde_porcentagem_9 = dados_relatorio[12][4]
		#relatorio_qtde_porcentagem_10 = dados_relatorio[13][4]
		#relatorio_qtde_porcentagem_11 = dados_relatorio[14][4]
		#relatorio_qtde_porcentagem_12 = dados_relatorio[15][4]



		relatorio_custo_medico_1 = dados_relatorio[4][5]
		relatorio_custo_medico_2 = dados_relatorio[5][5]
		relatorio_custo_medico_3 = dados_relatorio[6][5]
		relatorio_custo_medico_4 = dados_relatorio[7][5]
		relatorio_custo_medico_5 = dados_relatorio[8][5]
		relatorio_custo_medico_6 = dados_relatorio[9][5]
		relatorio_custo_medico_7 = dados_relatorio[10][5]
		relatorio_custo_medico_8 = dados_relatorio[11][5]
		relatorio_custo_medico_9 = dados_relatorio[12][5]
		relatorio_custo_medico_10 = dados_relatorio[13][5]
		relatorio_custo_medico_11 = dados_relatorio[14][5]
		relatorio_custo_medico_12 = dados_relatorio[15][5]



		relatorio_custos_porcentagem_1 = dados_relatorio[4][6]
		relatorio_custos_porcentagem_2 = dados_relatorio[5][6]
		relatorio_custos_porcentagem_3 = dados_relatorio[6][6]
		relatorio_custos_porcentagem_4 = dados_relatorio[7][6]
		relatorio_custos_porcentagem_5 = dados_relatorio[8][6]
		relatorio_custos_porcentagem_6 = dados_relatorio[9][6]
		relatorio_custos_porcentagem_7 = dados_relatorio[10][6]
		relatorio_custos_porcentagem_8 = dados_relatorio[11][6]
		relatorio_custos_porcentagem_9 = dados_relatorio[12][6]
		relatorio_custos_porcentagem_10 = dados_relatorio[13][6]  
		relatorio_custos_porcentagem_11 = dados_relatorio[14][6]
		relatorio_custos_porcentagem_12 = dados_relatorio[15][6]

		#puts relatorio_beneficiario_1 
		#puts relatorio_tipo_beneficiario_1
		#puts relatorio_qtde_1
		#puts relatorio_qtde_porcentagem_1
		#puts relatorio_custo_medico_1
		#puts relatorio_custos_porcentagem_1

		banco = BancoDeDadosBIBook.new
		banco.tres_ultimas_competencias(competencia1, competencia2, competencia3)
		imprimir_dados = banco.recuperar_dados_bd_bi_book_detalhamento_especialidade_relatorio_192

		banco_beneficiario_1 = imprimir_dados[0][0]["Beneficiario"]
		banco_beneficiario_1 = remover_espacos_string_provinda_banco(banco_beneficiario_1)
		
		banco_beneficiario_2 = imprimir_dados[0][1]["Beneficiario"]
		banco_beneficiario_2 = remover_espacos_string_provinda_banco(banco_beneficiario_2)

		banco_beneficiario_3 = imprimir_dados[0][2]["Beneficiario"]
		banco_beneficiario_3 = remover_espacos_string_provinda_banco(banco_beneficiario_3)

		banco_beneficiario_4 = imprimir_dados[0][3]["Beneficiario"]
		banco_beneficiario_4 = remover_espacos_string_provinda_banco(banco_beneficiario_4)

		banco_beneficiario_5 = imprimir_dados[0][4]["Beneficiario"]
		banco_beneficiario_5 = remover_espacos_string_provinda_banco(banco_beneficiario_5)

		banco_beneficiario_6 = imprimir_dados[0][5]["Beneficiario"]
		banco_beneficiario_6 = remover_espacos_string_provinda_banco(banco_beneficiario_6)

		banco_beneficiario_7 = imprimir_dados[0][6]["Beneficiario"]
		banco_beneficiario_7 = remover_espacos_string_provinda_banco(banco_beneficiario_7)

		banco_beneficiario_8 = imprimir_dados[0][7]["Beneficiario"]
		banco_beneficiario_8 = remover_espacos_string_provinda_banco(banco_beneficiario_8)

		banco_beneficiario_9 = imprimir_dados[0][8]["Beneficiario"]
		banco_beneficiario_9 = remover_espacos_string_provinda_banco(banco_beneficiario_9)

		banco_beneficiario_10 = imprimir_dados[0][9]["Beneficiario"]
		banco_beneficiario_10 = remover_espacos_string_provinda_banco(banco_beneficiario_10)

		banco_beneficiario_11 = imprimir_dados[0][10]["Beneficiario"]
		banco_beneficiario_11 = remover_espacos_string_provinda_banco(banco_beneficiario_11)

		banco_beneficiario_12 = imprimir_dados[0][11]["Beneficiario"]
		banco_beneficiario_12 = remover_espacos_string_provinda_banco(banco_beneficiario_12)



		banco_tipo_beneficiario_1 = imprimir_dados[0][0]["Tipo_Beneficiario"]
		banco_tipo_beneficiario_1 = remover_espacos_string_provinda_banco(banco_tipo_beneficiario_1)

		banco_tipo_beneficiario_2 = imprimir_dados[0][1]["Tipo_Beneficiario"]
		banco_tipo_beneficiario_2 = remover_espacos_string_provinda_banco(banco_tipo_beneficiario_2)

		banco_tipo_beneficiario_3 = imprimir_dados[0][2]["Tipo_Beneficiario"]
		banco_tipo_beneficiario_3 = remover_espacos_string_provinda_banco(banco_tipo_beneficiario_3)

		banco_tipo_beneficiario_4 = imprimir_dados[0][3]["Tipo_Beneficiario"]
		banco_tipo_beneficiario_4 = remover_espacos_string_provinda_banco(banco_tipo_beneficiario_4)

		banco_tipo_beneficiario_5 = imprimir_dados[0][4]["Tipo_Beneficiario"]
		banco_tipo_beneficiario_5 = remover_espacos_string_provinda_banco(banco_tipo_beneficiario_5)

		banco_tipo_beneficiario_6 = imprimir_dados[0][5]["Tipo_Beneficiario"]
		banco_tipo_beneficiario_6 = remover_espacos_string_provinda_banco(banco_tipo_beneficiario_6)

		banco_tipo_beneficiario_7 = imprimir_dados[0][6]["Tipo_Beneficiario"]
		banco_tipo_beneficiario_7 = remover_espacos_string_provinda_banco(banco_tipo_beneficiario_7)

		banco_tipo_beneficiario_8 = imprimir_dados[0][7]["Tipo_Beneficiario"]
		banco_tipo_beneficiario_8 = remover_espacos_string_provinda_banco(banco_tipo_beneficiario_8)

		banco_tipo_beneficiario_9 = imprimir_dados[0][8]["Tipo_Beneficiario"]
		banco_tipo_beneficiario_9 = remover_espacos_string_provinda_banco(banco_tipo_beneficiario_9)

		banco_tipo_beneficiario_10 = imprimir_dados[0][9]["Tipo_Beneficiario"]
		banco_tipo_beneficiario_10 = remover_espacos_string_provinda_banco(banco_tipo_beneficiario_10)

		banco_tipo_beneficiario_11 = imprimir_dados[0][10]["Tipo_Beneficiario"]
		banco_tipo_beneficiario_11 = remover_espacos_string_provinda_banco(banco_tipo_beneficiario_11)

		banco_tipo_beneficiario_12 = imprimir_dados[0][11]["Tipo_Beneficiario"]
		banco_tipo_beneficiario_12 = remover_espacos_string_provinda_banco(banco_tipo_beneficiario_12)



		banco_qtde_1 = imprimir_dados[0][0]["Qtde"]
		banco_qtde_1 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_1)

		banco_qtde_2 = imprimir_dados[0][1]["Qtde"]
		banco_qtde_2 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_2)

		banco_qtde_3 = imprimir_dados[0][2]["Qtde"]
		banco_qtde_3 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_3)

		banco_qtde_4 = imprimir_dados[0][3]["Qtde"]
		banco_qtde_4 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_4)

		banco_qtde_5 = imprimir_dados[0][4]["Qtde"]
		banco_qtde_5 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_5)

		banco_qtde_6 = imprimir_dados[0][5]["Qtde"]
		banco_qtde_6 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_6)

		banco_qtde_7 = imprimir_dados[0][6]["Qtde"]
		banco_qtde_7 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_7)

		banco_qtde_8 = imprimir_dados[0][7]["Qtde"]
		banco_qtde_8 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_8)

		banco_qtde_9 = imprimir_dados[0][8]["Qtde"]
		banco_qtde_9 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_9)

		banco_qtde_10 = imprimir_dados[0][9]["Qtde"]
		banco_qtde_10 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_10)

		banco_qtde_11 = imprimir_dados[0][10]["Qtde"]
		banco_qtde_11 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_11)

		banco_qtde_12 = imprimir_dados[0][11]["Qtde"]
		banco_qtde_12 = converter_numero_banco_para_casas_decimais_com_delimitador(banco_qtde_12)


		#BUG
		#banco_qtde_porcentagem_1 = imprimir_dados[0][0]["QTD_PERC"]
		#banco_qtde_porcentagem_1 = converter_numero_banco_para_porcentagem(banco_qtde_porcentagem_1)

		#banco_qtde_porcentagem_2 = imprimir_dados[0][0]["QTD_PERC"]
		#banco_qtde_porcentagem_2 = converter_numero_banco_para_porcentagem(banco_qtde_porcentagem_2)

		#banco_qtde_porcentagem_3 = imprimir_dados[0][0]["QTD_PERC"]
		#banco_qtde_porcentagem_3 = converter_numero_banco_para_porcentagem(banco_qtde_porcentagem_3)

		#banco_qtde_porcentagem_4 = imprimir_dados[0][0]["QTD_PERC"]
		#banco_qtde_porcentagem_4 = converter_numero_banco_para_porcentagem(banco_qtde_porcentagem_4)

		#banco_qtde_porcentagem_5 = imprimir_dados[0][0]["QTD_PERC"]
		#banco_qtde_porcentagem_5 = converter_numero_banco_para_porcentagem(banco_qtde_porcentagem_5)

		#banco_qtde_porcentagem_6 = imprimir_dados[0][0]["QTD_PERC"]
		#banco_qtde_porcentagem_6 = converter_numero_banco_para_porcentagem(banco_qtde_porcentagem_6)

		#banco_qtde_porcentagem_7 = imprimir_dados[0][0]["QTD_PERC"]
		#banco_qtde_porcentagem_7 = converter_numero_banco_para_porcentagem(banco_qtde_porcentagem_7)

		#banco_qtde_porcentagem_8 = imprimir_dados[0][0]["QTD_PERC"]
		#banco_qtde_porcentagem_8 = converter_numero_banco_para_porcentagem(banco_qtde_porcentagem_8)

		#banco_qtde_porcentagem_9 = imprimir_dados[0][0]["QTD_PERC"]
		#banco_qtde_porcentagem_9 = converter_numero_banco_para_porcentagem(banco_qtde_porcentagem_9)

		#banco_qtde_porcentagem_10 = imprimir_dados[0][0]["QTD_PERC"]
		#banco_qtde_porcentagem_10 = converter_numero_banco_para_porcentagem(banco_qtde_porcentagem_10)

		#banco_qtde_porcentagem_11 = imprimir_dados[0][0]["QTD_PERC"]
		#banco_qtde_porcentagem_11 = converter_numero_banco_para_porcentagem(banco_qtde_porcentagem_11)

		#banco_qtde_porcentagem_12 = imprimir_dados[0][0]["QTD_PERC"]
		#banco_qtde_porcentagem_12 = converter_numero_banco_para_porcentagem(banco_qtde_porcentagem_12)



		banco_custo_medico_1 = imprimir_dados[0][0]["Custo_Medico"]
		banco_custo_medico_1 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_medico_1)
		banco_custo_medico_1 = converter_numero_banco_para_moeda_real(banco_custo_medico_1)

		banco_custo_medico_2 = imprimir_dados[0][1]["Custo_Medico"]
		banco_custo_medico_2 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_medico_2)
		banco_custo_medico_2 = converter_numero_banco_para_moeda_real(banco_custo_medico_2)

		banco_custo_medico_3 = imprimir_dados[0][2]["Custo_Medico"]
		banco_custo_medico_3 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_medico_3)
		banco_custo_medico_3 = converter_numero_banco_para_moeda_real(banco_custo_medico_3)

		banco_custo_medico_4 = imprimir_dados[0][3]["Custo_Medico"]
		banco_custo_medico_4 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_medico_4)
		banco_custo_medico_4 = converter_numero_banco_para_moeda_real(banco_custo_medico_4)

		banco_custo_medico_5 = imprimir_dados[0][4]["Custo_Medico"]
		banco_custo_medico_5 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_medico_5)
		banco_custo_medico_5 = converter_numero_banco_para_moeda_real(banco_custo_medico_5)

		banco_custo_medico_6 = imprimir_dados[0][5]["Custo_Medico"]
		banco_custo_medico_6 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_medico_6)
		banco_custo_medico_6 = converter_numero_banco_para_moeda_real(banco_custo_medico_6)

		banco_custo_medico_7 = imprimir_dados[0][6]["Custo_Medico"]
		banco_custo_medico_7 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_medico_7)
		banco_custo_medico_7 = converter_numero_banco_para_moeda_real(banco_custo_medico_7)

		banco_custo_medico_8 = imprimir_dados[0][7]["Custo_Medico"]
		banco_custo_medico_8 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_medico_8)
		banco_custo_medico_8 = converter_numero_banco_para_moeda_real(banco_custo_medico_8)

		banco_custo_medico_9 = imprimir_dados[0][8]["Custo_Medico"]
		banco_custo_medico_9 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_medico_9)
		banco_custo_medico_9 = converter_numero_banco_para_moeda_real(banco_custo_medico_9)

		banco_custo_medico_10 = imprimir_dados[0][9]["Custo_Medico"]
		banco_custo_medico_10 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_medico_10)
		banco_custo_medico_10 = converter_numero_banco_para_moeda_real(banco_custo_medico_10)

		banco_custo_medico_11 = imprimir_dados[0][10]["Custo_Medico"]
		banco_custo_medico_11 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_medico_11)
		banco_custo_medico_11 = converter_numero_banco_para_moeda_real(banco_custo_medico_11)

		banco_custo_medico_12 = imprimir_dados[0][11]["Custo_Medico"]
		banco_custo_medico_12 = converter_numero_banco_para_float_arredonda_ultimas_duas_casas_decimais(banco_custo_medico_12)
		banco_custo_medico_12 = converter_numero_banco_para_moeda_real(banco_custo_medico_12)



		banco_custos_porcentagem_1 = imprimir_dados[0][0]["CUSTO_PERC"]
		banco_custos_porcentagem_1 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_custos_porcentagem_1, 1)

		banco_custos_porcentagem_2 = imprimir_dados[0][1]["CUSTO_PERC"]
		banco_custos_porcentagem_2 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_custos_porcentagem_2, 1)

		banco_custos_porcentagem_3 = imprimir_dados[0][2]["CUSTO_PERC"]
		banco_custos_porcentagem_3 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_custos_porcentagem_3, 1)

		banco_custos_porcentagem_4 = imprimir_dados[0][3]["CUSTO_PERC"]
		banco_custos_porcentagem_4 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_custos_porcentagem_4, 1)

		banco_custos_porcentagem_5 = imprimir_dados[0][4]["CUSTO_PERC"]
		banco_custos_porcentagem_5 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_custos_porcentagem_5, 1)

		banco_custos_porcentagem_6 = imprimir_dados[0][5]["CUSTO_PERC"]
		banco_custos_porcentagem_6 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_custos_porcentagem_6, 1)

		banco_custos_porcentagem_7 = imprimir_dados[0][6]["CUSTO_PERC"]
		banco_custos_porcentagem_7 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_custos_porcentagem_7, 1)

		banco_custos_porcentagem_8 = imprimir_dados[0][7]["CUSTO_PERC"]
		banco_custos_porcentagem_8 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_custos_porcentagem_8, 1)

		banco_custos_porcentagem_9 = imprimir_dados[0][8]["CUSTO_PERC"]
		banco_custos_porcentagem_9 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_custos_porcentagem_9, 1)

		banco_custos_porcentagem_10 = imprimir_dados[0][9]["CUSTO_PERC"]
		banco_custos_porcentagem_10 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_custos_porcentagem_10, 1)

		banco_custos_porcentagem_11 = imprimir_dados[0][10]["CUSTO_PERC"]
		banco_custos_porcentagem_11 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_custos_porcentagem_11, 1)

		banco_custos_porcentagem_12 = imprimir_dados[0][11]["CUSTO_PERC"]
		banco_custos_porcentagem_12 = converter_numero_notacao_cientifica_banco_para_porcentagem(banco_custos_porcentagem_12, 1)


		#Validando os Beneficiários
		begin
			assert_equal(relatorio_beneficiario_1, banco_beneficiario_1)
			$world.puts "Beneficiário #{relatorio_beneficiario_1} apresentado no relatório é igual ao beneficiário #{banco_beneficiario_1} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Beneficiário #{relatorio_beneficiario_1} apresentado no relatório não é igual ao beneficiário #{banco_beneficiario_1} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_beneficiario_2, banco_beneficiario_2)
			$world.puts "Beneficiário #{relatorio_beneficiario_2} apresentado no relatório é igual ao beneficiário #{banco_beneficiario_2} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Beneficiário #{relatorio_beneficiario_2} apresentado no relatório não é igual ao beneficiário #{banco_beneficiario_2} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_beneficiario_3, banco_beneficiario_3)
			$world.puts "Beneficiário #{relatorio_beneficiario_3} apresentado no relatório é igual ao beneficiário #{banco_beneficiario_3} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Beneficiário #{relatorio_beneficiario_3} apresentado no relatório não é igual ao beneficiário #{banco_beneficiario_3} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_beneficiario_4, banco_beneficiario_4)
			$world.puts "Beneficiário #{relatorio_beneficiario_4} apresentado no relatório é igual ao beneficiário #{banco_beneficiario_4} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Beneficiário #{relatorio_beneficiario_4} apresentado no relatório não é igual ao beneficiário #{banco_beneficiario_4} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_beneficiario_5, banco_beneficiario_5)
			$world.puts "Beneficiário #{relatorio_beneficiario_5} apresentado no relatório é igual ao beneficiário #{banco_beneficiario_5} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Beneficiário #{relatorio_beneficiario_5} apresentado no relatório não é igual ao beneficiário #{banco_beneficiario_5} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_beneficiario_6, banco_beneficiario_6)
			$world.puts "Beneficiário #{relatorio_beneficiario_6} apresentado no relatório é igual ao beneficiário #{banco_beneficiario_6} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Beneficiário #{relatorio_beneficiario_6} apresentado no relatório não é igual ao beneficiário #{banco_beneficiario_6} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_beneficiario_7, banco_beneficiario_7)
			$world.puts "Beneficiário #{relatorio_beneficiario_7} apresentado no relatório é igual ao beneficiário #{banco_beneficiario_7} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Beneficiário #{relatorio_beneficiario_7} apresentado no relatório não é igual ao beneficiário #{banco_beneficiario_7} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_beneficiario_8, banco_beneficiario_8)
			$world.puts "Beneficiário #{relatorio_beneficiario_8} apresentado no relatório é igual ao beneficiário #{banco_beneficiario_8} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Beneficiário #{relatorio_beneficiario_8} apresentado no relatório não é igual ao beneficiário #{banco_beneficiario_8} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_beneficiario_9, banco_beneficiario_9)
			$world.puts "Beneficiário #{relatorio_beneficiario_9} apresentado no relatório é igual ao beneficiário #{banco_beneficiario_9} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Beneficiário #{relatorio_beneficiario_9} apresentado no relatório não é igual ao beneficiário #{banco_beneficiario_9} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_beneficiario_10, banco_beneficiario_10)
			$world.puts "Beneficiário #{relatorio_beneficiario_10} apresentado no relatório é igual ao beneficiário #{banco_beneficiario_10} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Beneficiário #{relatorio_beneficiario_10} apresentado no relatório não é igual ao beneficiário #{banco_beneficiario_10} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_beneficiario_11, banco_beneficiario_11)
			$world.puts "Beneficiário #{relatorio_beneficiario_11} apresentado no relatório é igual ao beneficiário #{banco_beneficiario_11} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Beneficiário #{relatorio_beneficiario_11} apresentado no relatório não é igual ao beneficiário #{banco_beneficiario_11} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_beneficiario_12, banco_beneficiario_12)
			$world.puts "Beneficiário #{relatorio_beneficiario_12} apresentado no relatório é igual ao beneficiário #{banco_beneficiario_12} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Beneficiário #{relatorio_beneficiario_12} apresentado no relatório não é igual ao beneficiário #{banco_beneficiario_12} 
			apresentado no banco de dados!!!"
		end


		#Validando os Tipos de Beneficiários
		begin
			assert_equal(relatorio_tipo_beneficiario_1, banco_tipo_beneficiario_1)
			$world.puts "Tipo de beneficiário #{relatorio_tipo_beneficiario_1} apresentado no relatório é igual ao tipo de beneficiário #{banco_tipo_beneficiario_1} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Tipo de beneficiário #{relatorio_tipo_beneficiario_1} apresentado no relatório não é igual ao tipo de beneficiário #{banco_tipo_beneficiario_1} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_tipo_beneficiario_2, banco_tipo_beneficiario_2)
			$world.puts "Tipo de beneficiário #{relatorio_tipo_beneficiario_2} apresentado no relatório é igual ao tipo de beneficiário #{banco_tipo_beneficiario_2} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Tipo de beneficiário #{relatorio_tipo_beneficiario_2} apresentado no relatório não é igual ao tipo de beneficiário #{banco_tipo_beneficiario_2} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_tipo_beneficiario_3, banco_tipo_beneficiario_3)
			$world.puts "Tipo de beneficiário #{relatorio_tipo_beneficiario_3} apresentado no relatório é igual ao tipo de beneficiário #{banco_tipo_beneficiario_3} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Tipo de beneficiário #{relatorio_tipo_beneficiario_3} apresentado no relatório não é igual ao tipo de beneficiário #{banco_tipo_beneficiario_3} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_tipo_beneficiario_4, banco_tipo_beneficiario_4)
			$world.puts "Tipo de beneficiário #{relatorio_tipo_beneficiario_4} apresentado no relatório é igual ao tipo de beneficiário #{banco_tipo_beneficiario_4} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Tipo de beneficiário #{relatorio_tipo_beneficiario_4} apresentado no relatório não é igual ao tipo de beneficiário #{banco_tipo_beneficiario_4} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_tipo_beneficiario_5, banco_tipo_beneficiario_5)
			$world.puts "Tipo de beneficiário #{relatorio_tipo_beneficiario_5} apresentado no relatório é igual ao tipo de beneficiário #{banco_tipo_beneficiario_5} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Tipo de beneficiário #{relatorio_tipo_beneficiario_5} apresentado no relatório não é igual ao tipo de beneficiário #{banco_tipo_beneficiario_5} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_tipo_beneficiario_6, banco_tipo_beneficiario_6)
			$world.puts "Tipo de beneficiário #{relatorio_tipo_beneficiario_6} apresentado no relatório é igual ao tipo de beneficiário #{banco_tipo_beneficiario_6} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Tipo de beneficiário #{relatorio_tipo_beneficiario_6} apresentado no relatório não é igual ao tipo de beneficiário #{banco_tipo_beneficiario_6} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_tipo_beneficiario_7, banco_tipo_beneficiario_7)
			$world.puts "Tipo de beneficiário #{relatorio_tipo_beneficiario_7} apresentado no relatório é igual ao tipo de beneficiário #{banco_tipo_beneficiario_7} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Tipo de beneficiário #{relatorio_tipo_beneficiario_7} apresentado no relatório não é igual ao tipo de beneficiário #{banco_tipo_beneficiario_7} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_tipo_beneficiario_8, banco_tipo_beneficiario_8)
			$world.puts "Tipo de beneficiário #{relatorio_tipo_beneficiario_8} apresentado no relatório é igual ao tipo de beneficiário #{banco_tipo_beneficiario_8} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Tipo de beneficiário #{relatorio_tipo_beneficiario_8} apresentado no relatório não é igual ao tipo de beneficiário #{banco_tipo_beneficiario_8} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_tipo_beneficiario_9, banco_tipo_beneficiario_9)
			$world.puts "Tipo de beneficiário #{relatorio_tipo_beneficiario_9} apresentado no relatório é igual ao tipo de beneficiário #{banco_tipo_beneficiario_9} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Tipo de beneficiário #{relatorio_tipo_beneficiario_9} apresentado no relatório não é igual ao tipo de beneficiário #{banco_tipo_beneficiario_9} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_tipo_beneficiario_10, banco_tipo_beneficiario_10)
			$world.puts "Tipo de beneficiário #{relatorio_tipo_beneficiario_10} apresentado no relatório é igual ao tipo de beneficiário #{banco_tipo_beneficiario_10} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Tipo de beneficiário #{relatorio_tipo_beneficiario_10} apresentado no relatório não é igual ao tipo de beneficiário #{banco_tipo_beneficiario_10} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_tipo_beneficiario_11, banco_tipo_beneficiario_11)
			$world.puts "Tipo de beneficiário #{relatorio_tipo_beneficiario_11} apresentado no relatório é igual ao tipo de beneficiário #{banco_tipo_beneficiario_11} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Tipo de beneficiário #{relatorio_tipo_beneficiario_11} apresentado no relatório não é igual ao tipo de beneficiário #{banco_tipo_beneficiario_11} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_tipo_beneficiario_12, banco_tipo_beneficiario_12)
			$world.puts "Tipo de beneficiário #{relatorio_tipo_beneficiario_12} apresentado no relatório é igual ao tipo de beneficiário #{banco_tipo_beneficiario_12} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Tipo de beneficiário #{relatorio_tipo_beneficiario_12} apresentado no relatório não é igual ao tipo de beneficiário #{banco_tipo_beneficiario_12} 
			apresentado no banco de dados!!!"
		end


		#Validando as quantidades de atendimentos
		begin
			assert_equal(relatorio_qtde_1, banco_qtde_1)
			$world.puts "Quantidade #{relatorio_qtde_1} de atendimentos apresentada no relatório é igual a quantidade de atendimentos #{banco_qtde_1} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Quantidade #{relatorio_qtde_1} de atendimentos apresentada no relatório não é igual a quantidade de atendimentos #{banco_qtde_1} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_qtde_2, banco_qtde_2)
			$world.puts "Quantidade #{relatorio_qtde_2} de atendimentos apresentada no relatório é igual a quantidade de atendimentos #{banco_qtde_2} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Quantidade #{relatorio_qtde_2} de atendimentos apresentada no relatório não é igual a quantidade de atendimentos #{banco_qtde_2} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_qtde_3, banco_qtde_3)
			$world.puts "Quantidade #{relatorio_qtde_3} de atendimentos apresentada no relatório é igual a quantidade de atendimentos #{banco_qtde_3} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Quantidade #{relatorio_qtde_3} de atendimentos apresentada no relatório não é igual a quantidade de atendimentos #{banco_qtde_3} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_qtde_4, banco_qtde_4)
			$world.puts "Quantidade #{relatorio_qtde_4} de atendimentos apresentada no relatório é igual a quantidade de atendimentos #{banco_qtde_4} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Quantidade #{relatorio_qtde_4} de atendimentos apresentada no relatório não é igual a quantidade de atendimentos #{banco_qtde_4} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_qtde_5, banco_qtde_5)
			$world.puts "Quantidade #{relatorio_qtde_5} de atendimentos apresentada no relatório é igual a quantidade de atendimentos #{banco_qtde_5} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Quantidade #{relatorio_qtde_5} de atendimentos apresentada no relatório não é igual a quantidade de atendimentos #{banco_qtde_5} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_qtde_6, banco_qtde_6)
			$world.puts "Quantidade #{relatorio_qtde_6} de atendimentos apresentada no relatório é igual a quantidade de atendimentos #{banco_qtde_6} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Quantidade #{relatorio_qtde_6} de atendimentos apresentada no relatório não é igual a quantidade de atendimentos #{banco_qtde_6} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_qtde_7, banco_qtde_7)
			$world.puts "Quantidade #{relatorio_qtde_7} de atendimentos apresentada no relatório é igual a quantidade de atendimentos #{banco_qtde_7} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Quantidade #{relatorio_qtde_7} de atendimentos apresentada no relatório não é igual a quantidade de atendimentos #{banco_qtde_7} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_qtde_8, banco_qtde_8)
			$world.puts "Quantidade #{relatorio_qtde_8} de atendimentos apresentada no relatório é igual a quantidade de atendimentos #{banco_qtde_8} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Quantidade #{relatorio_qtde_8} de atendimentos apresentada no relatório não é igual a quantidade de atendimentos #{banco_qtde_8} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_qtde_9, banco_qtde_9)
			$world.puts "Quantidade #{relatorio_qtde_9} de atendimentos apresentada no relatório é igual a quantidade de atendimentos #{banco_qtde_9} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Quantidade #{relatorio_qtde_9} de atendimentos apresentada no relatório não é igual a quantidade de atendimentos #{banco_qtde_9} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_qtde_10, banco_qtde_10)
			$world.puts "Quantidade #{relatorio_qtde_10} de atendimentos apresentada no relatório é igual a quantidade de atendimentos #{banco_qtde_10} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Quantidade #{relatorio_qtde_10} de atendimentos apresentada no relatório não é igual a quantidade de atendimentos #{banco_qtde_10} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_qtde_11, banco_qtde_11)
			$world.puts "Quantidade #{relatorio_qtde_11} de atendimentos apresentada no relatório é igual a quantidade de atendimentos #{banco_qtde_11} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Quantidade #{relatorio_qtde_11} de atendimentos apresentada no relatório não é igual a quantidade de atendimentos #{banco_qtde_11} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_qtde_12, banco_qtde_12)
			$world.puts "Quantidade #{relatorio_qtde_12} de atendimentos apresentada no relatório é igual a quantidade de atendimentos #{banco_qtde_12} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Quantidade #{relatorio_qtde_12} de atendimentos apresentada no relatório não é igual a quantidade de atendimentos #{banco_qtde_12} 
			apresentada no banco de dados!!!"
		end


		#Validando o Custo Médico por especialidade
		begin
			assert_equal(relatorio_custo_medico_1, banco_custo_medico_1)
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_1} apresentado no relatório é igual ao Custo Médico por Especialidade de #{banco_custo_medico_1} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_1} apresentado no relatório não é igual ao Custo Médico por Especialidade de #{banco_custo_medico_1} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custo_medico_2, banco_custo_medico_2)
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_2} apresentado no relatório é igual ao Custo Médico por Especialidade de #{banco_custo_medico_2} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_2} apresentado no relatório não é igual ao Custo Médico por Especialidade de #{banco_custo_medico_2} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custo_medico_3, banco_custo_medico_3)
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_3} apresentado no relatório é igual ao Custo Médico por Especialidade de #{banco_custo_medico_3} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_3} apresentado no relatório não é igual ao Custo Médico por Especialidade de #{banco_custo_medico_3} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custo_medico_4, banco_custo_medico_4)
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_4} apresentado no relatório é igual ao Custo Médico por Especialidade de #{banco_custo_medico_4} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_4} apresentado no relatório não é igual ao Custo Médico por Especialidade de #{banco_custo_medico_4} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custo_medico_5, banco_custo_medico_5)
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_5} apresentado no relatório é igual ao Custo Médico por Especialidade de #{banco_custo_medico_5} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_5} apresentado no relatório não é igual ao Custo Médico por Especialidade de #{banco_custo_medico_5} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custo_medico_6, banco_custo_medico_6)
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_6} apresentado no relatório é igual ao Custo Médico por Especialidade de #{banco_custo_medico_6} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_6} apresentado no relatório não é igual ao Custo Médico por Especialidade de #{banco_custo_medico_6} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custo_medico_7, banco_custo_medico_7)
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_7} apresentado no relatório é igual ao Custo Médico por Especialidade de #{banco_custo_medico_7} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_7} apresentado no relatório não é igual ao Custo Médico por Especialidade de #{banco_custo_medico_7} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custo_medico_8, banco_custo_medico_8)
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_8} apresentado no relatório é igual ao Custo Médico por Especialidade de #{banco_custo_medico_8} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_8} apresentado no relatório não é igual ao Custo Médico por Especialidade de #{banco_custo_medico_8} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custo_medico_9, banco_custo_medico_9)
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_9} apresentado no relatório é igual ao Custo Médico por Especialidade de #{banco_custo_medico_9} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_9} apresentado no relatório não é igual ao Custo Médico por Especialidade de #{banco_custo_medico_9} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custo_medico_10, banco_custo_medico_10)
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_10} apresentado no relatório é igual ao Custo Médico por Especialidade de #{banco_custo_medico_10} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_10} apresentado no relatório não é igual ao Custo Médico por Especialidade de #{banco_custo_medico_10} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custo_medico_11, banco_custo_medico_11)
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_11} apresentado no relatório é igual ao Custo Médico por Especialidade de #{banco_custo_medico_11} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_11} apresentado no relatório não é igual ao Custo Médico por Especialidade de #{banco_custo_medico_11} 
			apresentado no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custo_medico_12, banco_custo_medico_12)
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_12} apresentado no relatório é igual ao Custo Médico por Especialidade de #{banco_custo_medico_12} 
			apresentado no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Custo Médico por Especialidade de #{relatorio_custo_medico_12} apresentado no relatório não é igual ao Custo Médico por Especialidade de #{banco_custo_medico_12} 
			apresentado no banco de dados!!!"
		end


		#Validando a porcentagem dos custos por especialidade
		begin
			assert_equal(relatorio_custos_porcentagem_1, banco_custos_porcentagem_1)
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_1} apresentada no relatório é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_1} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_1} apresentada no relatório não é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_1} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custos_porcentagem_2, banco_custos_porcentagem_2)
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_2} apresentada no relatório é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_2} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_2} apresentada no relatório não é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_2} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custos_porcentagem_3, banco_custos_porcentagem_3)
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_3} apresentada no relatório é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_3} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_3} apresentada no relatório não é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_3} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custos_porcentagem_4, banco_custos_porcentagem_4)
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_4} apresentada no relatório é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_4} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_4} apresentada no relatório não é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_4} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custos_porcentagem_5, banco_custos_porcentagem_5)
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_5} apresentada no relatório é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_5} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_5} apresentada no relatório não é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_5} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custos_porcentagem_6, banco_custos_porcentagem_6)
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_6} apresentada no relatório é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_6} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_6} apresentada no relatório não é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_6} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custos_porcentagem_7, banco_custos_porcentagem_7)
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_7} apresentada no relatório é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_7} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_7} apresentada no relatório não é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_7} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custos_porcentagem_8, banco_custos_porcentagem_8)
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_8} apresentada no relatório é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_8} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_8} apresentada no relatório não é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_8} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custos_porcentagem_9, banco_custos_porcentagem_9)
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_9} apresentada no relatório é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_9} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_9} apresentada no relatório não é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_9} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custos_porcentagem_10, banco_custos_porcentagem_10)
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_10} apresentada no relatório é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_10} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_10} apresentada no relatório não é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_10} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custos_porcentagem_11, banco_custos_porcentagem_11)
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_11} apresentada no relatório é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_11} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_11} apresentada no relatório não é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_11} 
			apresentada no banco de dados!!!"
		end
		begin
			assert_equal(relatorio_custos_porcentagem_12, banco_custos_porcentagem_12)
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_12} apresentada no relatório é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_12} 
			apresentada no banco de dados!!!"
		rescue Test::Unit::AssertionFailedError => mensagem_de_erro
			$world.puts "Porcentagem de Custos por Especialidade de #{relatorio_custos_porcentagem_12} apresentada no relatório não é igual a porcentagem de Custos por Especialidade de #{banco_custos_porcentagem_12} 
			apresentada no banco de dados!!!"
		end

		#Validando o batimento de todos os campos
		if relatorio_beneficiario_1 == banco_beneficiario_1 and
			relatorio_beneficiario_2 == banco_beneficiario_2 and
			relatorio_beneficiario_3 == banco_beneficiario_3 and
			relatorio_beneficiario_4 == banco_beneficiario_4 and
			relatorio_beneficiario_5 == banco_beneficiario_5 and
			relatorio_beneficiario_6 == banco_beneficiario_6 and
			relatorio_beneficiario_7 == banco_beneficiario_7 and
			relatorio_beneficiario_8 == banco_beneficiario_8 and
			relatorio_beneficiario_9 == banco_beneficiario_9 and
			relatorio_beneficiario_10 == banco_beneficiario_10 and
			relatorio_beneficiario_11 == banco_beneficiario_11 and
			relatorio_beneficiario_12 == banco_beneficiario_12 and

			relatorio_tipo_beneficiario_1 == banco_tipo_beneficiario_1
			relatorio_tipo_beneficiario_2 == banco_tipo_beneficiario_2
			relatorio_tipo_beneficiario_3 == banco_tipo_beneficiario_3
			relatorio_tipo_beneficiario_4 == banco_tipo_beneficiario_4
			relatorio_tipo_beneficiario_5 == banco_tipo_beneficiario_5
			relatorio_tipo_beneficiario_6 == banco_tipo_beneficiario_6
			relatorio_tipo_beneficiario_7 == banco_tipo_beneficiario_7
			relatorio_tipo_beneficiario_8 == banco_tipo_beneficiario_8
			relatorio_tipo_beneficiario_9 == banco_tipo_beneficiario_9
			relatorio_tipo_beneficiario_10 == banco_tipo_beneficiario_10
			relatorio_tipo_beneficiario_11 == banco_tipo_beneficiario_11
			relatorio_tipo_beneficiario_12 == banco_tipo_beneficiario_12

			relatorio_qtde_1 == banco_qtde_1 and
			relatorio_qtde_2 == banco_qtde_2 and
			relatorio_qtde_3 == banco_qtde_3 and
			relatorio_qtde_4 == banco_qtde_4 and
			relatorio_qtde_5 == banco_qtde_5 and
			relatorio_qtde_6 == banco_qtde_6 and
			relatorio_qtde_7 == banco_qtde_7 and
			relatorio_qtde_8 == banco_qtde_8 and
			relatorio_qtde_9 == banco_qtde_9 and
			relatorio_qtde_10 == banco_qtde_10 and
			relatorio_qtde_11 == banco_qtde_11 and
			relatorio_qtde_12 == banco_qtde_12 and

			#BUG	
			#relatorio_qtde_porcentagem_1 == banco_qtde_porcentagem_1 and
			#relatorio_qtde_porcentagem_2 == banco_qtde_porcentagem_2 and
			#relatorio_qtde_porcentagem_3 == banco_qtde_porcentagem_3 and
			#relatorio_qtde_porcentagem_4 == banco_qtde_porcentagem_4 and

			relatorio_custo_medico_1 == banco_custo_medico_1 and
			relatorio_custo_medico_2 == banco_custo_medico_2 and
			relatorio_custo_medico_3 == banco_custo_medico_3 and
			relatorio_custo_medico_4 == banco_custo_medico_4 and
			relatorio_custo_medico_5 == banco_custo_medico_5 and
			relatorio_custo_medico_6 == banco_custo_medico_6 and
			relatorio_custo_medico_7 == banco_custo_medico_7 and
			relatorio_custo_medico_8 == banco_custo_medico_8 and
			relatorio_custo_medico_9 == banco_custo_medico_9 and
			relatorio_custo_medico_10 == banco_custo_medico_10 and
			relatorio_custo_medico_11 == banco_custo_medico_11 and
			relatorio_custo_medico_12 == banco_custo_medico_12 and


			relatorio_custos_porcentagem_1 == banco_custos_porcentagem_1 and
			relatorio_custos_porcentagem_2 == banco_custos_porcentagem_2 and
			relatorio_custos_porcentagem_3 == banco_custos_porcentagem_3 and
			relatorio_custos_porcentagem_4 == banco_custos_porcentagem_4 and
			relatorio_custos_porcentagem_5 == banco_custos_porcentagem_5 and
			relatorio_custos_porcentagem_6 == banco_custos_porcentagem_6 and
			relatorio_custos_porcentagem_7 == banco_custos_porcentagem_7 and
			relatorio_custos_porcentagem_8 == banco_custos_porcentagem_8 and
			relatorio_custos_porcentagem_9 == banco_custos_porcentagem_9 and
			relatorio_custos_porcentagem_10 == banco_custos_porcentagem_10 and
			relatorio_custos_porcentagem_11 == banco_custos_porcentagem_11 and
			relatorio_custos_porcentagem_12 == banco_custos_porcentagem_12

		  	$world.puts "Caso de Teste referente a validação do segundo relatório192 do DICOP Saúde passou!!!"
		else
			$world.puts "Query utilizada na consulta para as competências de #{competencia1}, #{competencia2}, #{competencia3}:\n\n\n #{FigNewton.query_relatorio192_2_cenario1}"
			fail($world.puts "Caso de Teste falhou!!!")
		end

		$world.puts "Query utilizada na consulta para as competências de #{competencia1}, #{competencia2}, #{competencia3}:\n\n\n #{FigNewton.query_relatorio192_2_cenario1}"

	end
end
