#enconding: utf-8
#language: pt
@Relatorio31
Funcionalidade: Analisar Relatórios Gestão Saúde - Análise de custo e Receita Emitida/Contábil - 31

"""
*********************************
* DOCUMENTAÇÃO DO CASO DE TESTE *
*********************************
Data de criação: 28/02/2017
Autor: Brito

PRÉ REQUISITOS
==============
Usuário com acesso na aplicação BI BOOK
Moeda = Real

MASSA DE DADOS
==============
As opções do filtro Demitidos e Aposentados seguem a seguinte regra:
	- DA_Todas = Opção Todas

As opções do filtro Filial Empresa segueme a seguinte regra:
	- FE_Todas = Opção Todas

As opções do filtro Empresa seguem a seguinte regra:
	- E_Todas E = Opção Todas

"""

Contexto: Acessar sistema BI Book
	Dado que estou conectado no sistema BI Book

#@cenario20
#Esquema do Cenário: Gerar relatório 31, demitidos e aposentados = TODOS e verificar os resultados apresentados para 3 últimas competências
	#Quando seleciono a opção Gestão Saúde
	#E seleciono a opção Análise de Custos e Receita Emitida Contábil
	#Então as opções Filtrar empresa, Limpar Filtro e Gerar Relatório são apresentadas
	#Quando seleciono a opção Gerar Relatório
	#Então os campos Demitidos e Aposentados, Filial Empresa, Data de Competência, Empresa e Moeda são apresentados
	#Quando seleciono a opção "<opcao_filtro_demitidos_e_aposentados>" no filtro Demitidos e Aposentados
	#Quando seleciono a opção "<opcao_filtro_filial_empresa>" no filtro Filial Empresa
	#Quando seleciono as opções ultima_competencia, penultima_competencia e antepenultima_competencia no filtro Data de Competência
	# ultima_competencia | penultima_competencia | antepenultima_competencia |
	# Janeiro 2018		 | Dezembro 2017		 | Novembro 2017			 |

#Exemplos:
	#| opcao_filtro_demitidos_e_aposentados | opcao_filtro_filial_empresa | opcao_filtro_empresa | opcao_filtro_moeda | relatorio										           | ultima_competencia |  penultima_competencia | antepenultima_competencia |
	#| DA_Todas 						       | FE_Todas			         | E_Todas              | REAL               | Gestão Saúde - Análise de Custos e Receita Emitida/Contábil |     201801	  		|   201712					|   201711                  |

@cenario1_relatorio31	 
Esquema do Cenário: Gerar relatório 31, demitidos e aposentados = TODOS e verificar os resultados apresentados para 3 últimas competências
	Quando seleciono a opção Gestão Saúde
	E seleciono a opção Análise de Custos e Receita Emitida Contábil no menu Gestão Saúde
	Então as opções Filtrar empresa, Limpar Filtro e Gerar Relatório são apresentadas
	Quando seleciono a opção Gerar Relatório
	Então os campos Demitidos e Aposentados, Filial Empresa, Data de Competência, Empresa e Moeda são apresentados
	Quando seleciono a opção "<opcao_filtro_demitidos_e_aposentados>" no filtro Demitidos e Aposentados
	Quando seleciono a opção "<opcao_filtro_filial_empresa>" no filtro Filial Empresa
	Quando seleciono <competencias_em_meses> últimas competências no campo Data de Competência
	Quando seleciono a opção "<opcao_filtro_empresa>" no filtro Empresa
	Quando seleciono a opção "<opcao_filtro_moeda>" no filtro Moeda Gestao Saude
	Quando clico no botão Exibir Relatório
	Então visualizo o relatório "<relatorio>"
	Então confiro os dados do relatório31 de demitidos e aposentados igual a TODOS com os dados do banco de dados para as competências "<ultima_competencia>", "<penultima_competencia>" e "<antepenultima_competencia>"
	
Exemplos:
	| opcao_filtro_demitidos_e_aposentados | opcao_filtro_filial_empresa | opcao_filtro_empresa | opcao_filtro_moeda | relatorio										           | ultima_competencia |  penultima_competencia | antepenultima_competencia | competencias_em_meses |
	| DA_Todas 						       | FE_Todas			         | E_Todas              | REAL               | Gestão Saúde - Análise de Custos e Receita Emitida/Contábil |     201802	  		|   201801				 |   201712                  | 3                     |

@cenario2_relatorio31
Esquema do Cenário: Gerar relatório 31, demitidos e aposentados = TODOS e verificar os resultados apresentados para competências de um ano
	Quando seleciono a opção Gestão Saúde
	E seleciono a opção Análise de Custos e Receita Emitida Contábil no menu Gestão Saúde
	Então as opções Filtrar empresa, Limpar Filtro e Gerar Relatório são apresentadas
	Quando seleciono a opção Gerar Relatório
	Então os campos Demitidos e Aposentados, Filial Empresa, Data de Competência, Empresa e Moeda são apresentados
	Quando seleciono a opção "<opcao_filtro_demitidos_e_aposentados>" no filtro Demitidos e Aposentados
	Quando seleciono a opção "<opcao_filtro_filial_empresa>" no filtro Filial Empresa
	Quando seleciono <competencias_em_meses> últimas competências no campo Data de Competência
	Quando seleciono a opção "<opcao_filtro_empresa>" no filtro Empresa
	Quando seleciono a opção "<opcao_filtro_moeda>" no filtro Moeda Gestao Saude
	Quando clico no botão Exibir Relatório
	Então visualizo o relatório "<relatorio>"
	Então confiro os dados do relatório31 de demitidos e aposentados igual a TODOS com os dados do banco de dados para as competências "<competencia1>", "<competencia2>", "<competencia3>", "<competencia4>", "<competencia5>", "<competencia6>", "<competencia7>", "<competencia8>", "<competencia9>", "<competencia10>", "<competencia11>", "<competencia12>" e "<competencia13>"

Exemplos:
	| opcao_filtro_demitidos_e_aposentados | opcao_filtro_filial_empresa | opcao_filtro_empresa | opcao_filtro_moeda | relatorio										           | competencia1 | competencia2 | competencia3 | competencia4 | competencia5 | competencia6 | competencia7| competencia8 | competencia9 | competencia10 | competencia11 | competencia12 | competencia13 | competencias_em_meses |
	| DA_Todas 						       | FE_Todas			         | E_Todas              | REAL               | Gestão Saúde - Análise de Custos e Receita Emitida/Contábil | 201702	      | 201703   	 | 201704   	| 201705       | 201706       | 201707       | 201708     | 201709       | 201710       | 201711        | 201712        | 201801        | 201802        | 13                    |

@cenario3_relatorio31	 
Esquema do Cenário: Gerar relatório 31, demitidos e aposentados = SIM e verificar os resultados apresentados para 3 últimas competências
	Quando seleciono a opção Gestão Saúde
	E seleciono a opção Análise de Custos e Receita Emitida Contábil no menu Gestão Saúde
	Então as opções Filtrar empresa, Limpar Filtro e Gerar Relatório são apresentadas
	Quando seleciono a opção Gerar Relatório
	Então os campos Demitidos e Aposentados, Filial Empresa, Data de Competência, Empresa e Moeda são apresentados
	Quando seleciono a opção "<opcao_filtro_demitidos_e_aposentados>" no filtro Demitidos e Aposentados
	Quando seleciono a opção "<opcao_filtro_filial_empresa>" no filtro Filial Empresa
	Quando seleciono <competencias_em_meses> últimas competências no campo Data de Competência
	Quando seleciono a opção "<opcao_filtro_empresa>" no filtro Empresa
	Quando seleciono a opção "<opcao_filtro_moeda>" no filtro Moeda Gestao Saude
	Quando clico no botão Exibir Relatório
	Então visualizo o relatório "<relatorio>"
	Então confiro os dados do relatório31 de demitidos e aposentados igual a SIM com os dados do banco de dados para as competências "<ultima_competencia>", "<penultima_competencia>" e "<antepenultima_competencia>"
	
Exemplos:
	| opcao_filtro_demitidos_e_aposentados | opcao_filtro_filial_empresa | opcao_filtro_empresa | opcao_filtro_moeda | relatorio										           | ultima_competencia | penultima_competencia | antepenultima_competencia | competencias_em_meses |
	| DA_Sim 						       | FE_Todas			         | E_Todas              | REAL               | Gestão Saúde - Análise de Custos e Receita Emitida/Contábil | 201802	  		    | 201801			    | 201712                    | 3                     |

@cenario4_relatorio31	 
Esquema do Cenário: Gerar relatório 31, demitidos e aposentados = TODOS, empresa 120624 e verificar os resultados apresentados para 3 últimas competências
	Quando seleciono a opção Gestão Saúde
	E seleciono a opção Análise de Custos e Receita Emitida Contábil no menu Gestão Saúde
	Então as opções Filtrar empresa, Limpar Filtro e Gerar Relatório são apresentadas
	Quando seleciono a opção Filtrar Empresa
	Então o campo Pesquisar do grid Filtrar Empresa é apresentado
	Quando pesquiso pela empresa "<empresa>"
	Então o sistema apresenta a empresa "<empresa>" no grid Filtrar Empresa
	Quando adiciono a empresa "<sigla_empresa>" no grid Filtrar Empresa
	Quando clico no botão Sair e Atualizar Relatório
	Então os campos Demitidos e Aposentados, Filial Empresa, Data de Competência, Empresa e Moeda são apresentados
	Quando seleciono a opção "<opcao_filtro_demitidos_e_aposentados>" no filtro Demitidos e Aposentados
	Quando seleciono <competencias_em_meses> últimas competências no campo Data de Competência    
	Quando seleciono a opção "<opcao_filtro_moeda>" no filtro Moeda Gestao Saude
	Quando clico no botão Exibir Relatório
	Então visualizo o relatório "<relatorio>"
	Então confiro os dados do relatório31 Filial Empresa demitidos e aposentados igual a TODOS com os dados do banco de dados para as competências "<ultima_competencia>", "<penultima_competencia>" e "<antepenultima_competencia>"
	
Exemplos:
	| opcao_filtro_demitidos_e_aposentados | opcao_filtro_filial_empresa | opcao_filtro_empresa | opcao_filtro_moeda | relatorio										           | ultima_competencia |  penultima_competencia | antepenultima_competencia | empresa | sigla_empresa |competencias_em_meses |
	| DA_Todas 						       | FE_Todas			         | E_Todas              | REAL               | Gestão Saúde - Análise de Custos e Receita Emitida/Contábil | 201802	  		    | 201801			     | 201712                    | 120624  | 120624 - BRF  |3                       |
#@cenario6	 
#Esquema do Cenário: Gerar relatório 31, demitidos e aposentados = TODOS, inserir coligadas da empresa 120624 e verificar os resultados apresentados para 3 últimas competências
	#Quando seleciono a opção Gestão Saúde
	#E seleciono a opção Análise de Custos e Receita Emitida Contábil
	#Então as opções Filtrar empresa, Limpar Filtro e Gerar Relatório são apresentadas
	#Quando seleciono a opção Filtrar Empresa
	#Então o campo Pesquisar do grid Filtrar Empresa é apresentado
	#Quando pesquiso pela empresa "<empresa>"
	#Então o sistema apresenta a empresa "<empresa>" no grid Filtrar Empresa
	#Quando seleciono coligadas da empresa "<sigla_empresa>" no grid Filtrar Empresa
	#Quando adiciono a empresa "<sigla_empresa>" no grid Filtrar Empresa
	#Quando clico no botão Sair e Atualizar Relatório
	#ntão os campos Demitidos e Aposentados, Filial Empresa, Data de Competência, Empresa e Moeda são apresentados
	#Quando seleciono a opção "<opcao_filtro_demitidos_e_aposentados>" no filtro Demitidos e Aposentados
	#Quando seleciono as opções ultima_competencia, penultima_competencia e antepenultima_competencia no filtro Data de Competência
	#| ultima_competencia | penultima_competencia | antepenultima_competencia |
	#| Janeiro 2018		 | Dezembro 2017		 | Novembro 2017			 |    
	#Quando seleciono a opção "<opcao_filtro_moeda>" no filtro Moeda
	#Quando clico no botão Exibir Relatório
	#Então visualizo o relatório "<relatorio>"
	#Quando seleciono todos os campos apresentados no relatório 31 para Filial Empresa
	#Então confiro os dados do relatório31 Filial Empresa demitidos e aposentados igual a TODOS com os dados do banco de dados para as competências "<ultima_competencia>", "<penultima_competencia>" e "<antepenultima_competencia>"
	
#Exemplos:
	#| opcao_filtro_demitidos_e_aposentados | opcao_filtro_filial_empresa | opcao_filtro_empresa | opcao_filtro_moeda | relatorio										           | ultima_competencia |  penultima_competencia | antepenultima_competencia |  empresa  | sigla_empresa |
	#| DA_Todas 						       | FE_Todas			         | E_Todas              | REAL               | Gestão Saúde - Análise de Custos e Receita Emitida/Contábil |     201801	  		|   201712					 |   201711                  |  120624   | 120624 - BRF  |


#@cenario5	 
#Esquema do Cenário: Gerar relatório 31 demitidos e aposentados = TODOS empresas 120624, 040190, 273771, 273783 e 756958 e verificar os resultados apresentados para 3 últimas competências
	#Quando seleciono a opção Gestão Saúde
	#E seleciono a opção Análise de Custos e Receita Emitida Contábil
	#Então as opções Filtrar empresa, Limpar Filtro e Gerar Relatório são apresentadas
	#Quando seleciono a opção Filtrar Empresa
	#Então o campo Pesquisar do grid Filtrar Empresa é apresentado
	#Quando pesquiso pela empresa "<empresa_1>"
	#Então o sistema apresenta a empresa "<empresa_1>" no grid Filtrar Empresa
	#Quando seleciono a  empresa "<sigla_empresa_1>" no grid Filtrar Empresa
	#Quando clico no botão Sair e Atualizar Relatório
	#Então os campos Demitidos e Aposentados, Filial Empresa, Data de Competência, Empresa e Moeda são apresentados
	#Quando aciono a opção Empresas Selecionadas
	#Então o campo Pesquisar do grid Filtrar Empresa é apresentado
	#Quando pesquiso pela empresa "<empresa_2>"
	#Então o sistema apresenta a empresa "<empresa_2>" no grid Filtrar Empresa
	#Quando seleciono a  empresa "<sigla_empresa_2>" no grid Filtrar Empresa
	#Quando clico no botão Sair e Atualizar Relatório
	#Então os campos Demitidos e Aposentados, Filial Empresa, Data de Competência, Empresa e Moeda são apresentados
	#Quando aciono a opção Empresas Selecionadas
	#Então o campo Pesquisar do grid Filtrar Empresa é apresentado
	#Quando pesquiso pela empresa "<empresa_3>"
	#Então o sistema apresenta a empresa "<empresa_3>" no grid Filtrar Empresa
	#Quando seleciono a  empresa "<sigla_empresa_3>" no grid Filtrar Empresa
	#Quando clico no botão Sair e Atualizar Relatório
	#Então os campos Demitidos e Aposentados, Filial Empresa, Data de Competência, Empresa e Moeda são apresentados
	#Quando aciono a opção Empresas Selecionadas
	#Então o campo Pesquisar do grid Filtrar Empresa é apresentado
	#Quando pesquiso pela empresa "<empresa_4>"
	#Então o sistema apresenta a empresa "<empresa_4>" no grid Filtrar Empresa
	#Quando seleciono a  empresa "<sigla_empresa_4>" no grid Filtrar Empresa
	#Quando clico no botão Sair e Atualizar Relatório
	#Então os campos Demitidos e Aposentados, Filial Empresa, Data de Competência, Empresa e Moeda são apresentados
	#Quando aciono a opção Empresas Selecionadas
	#Então o campo Pesquisar do grid Filtrar Empresa é apresentado
	#Quando pesquiso pela empresa "<empresa_5>"
	#Então o sistema apresenta a empresa "<empresa_5>" no grid Filtrar Empresa
	#Quando seleciono a  empresa "<sigla_empresa_5>" no grid Filtrar Empresa
	#Quando clico no botão Sair e Atualizar Relatório
	#Então os campos Demitidos e Aposentados, Filial Empresa, Data de Competência, Empresa e Moeda são apresentados
	#Quando seleciono a opção "<opcao_filtro_demitidos_e_aposentados>" no filtro Demitidos e Aposentados
	#Quando seleciono as opções ultima_competencia, penultima_competencia e antepenultima_competencia no filtro Data de Competência
	#| ultima_competencia | penultima_competencia | antepenultima_competencia |
	#| Janeiro 2018		 | Dezembro 2017		 | Novembro 2017			 |    
	#Quando seleciono a opção "<opcao_filtro_moeda>" no filtro Moeda
	#Quando clico no botão Exibir Relatório
	#Então visualizo o relatório "<relatorio>"
	#Quando seleciono todos os campos apresentados no relatório 31 para Filial Empresa
	#Então confiro os dados do relatório31 Filial Empresa demitidos e aposentados igual a TODOS com os dados do banco de dados para as competências "<ultima_competencia>", "<penultima_competencia>" e "<antepenultima_competencia>"
	
#Exemplos:
	#| opcao_filtro_demitidos_e_aposentados | opcao_filtro_filial_empresa | opcao_filtro_empresa | opcao_filtro_moeda | relatorio										           | ultima_competencia |  penultima_competencia | antepenultima_competencia | empresa_1 | sigla_empresa_1 | empresa_2 | sigla_empresa_2 | empresa_3 | sigla_empresa_3     | empresa_4 | sigla_empresa_4   | empresa_5 |sigla_empresa_5        |
	#| DA_Todas 						       | FE_Todas			         | E_Todas              | REAL               | Gestão Saúde - Análise de Custos e Receita Emitida/Contábil |     201801	  		|   201712					 |   201711                  | 120624    | 120624 - BRF    | 040190    | 040190 - ELEBAT | 273771    | 273771 - BRF - BFPP | 273783    | 273783 - CREDIBRF | 756958    |756958 - SHB COMERCIO  |

#@cenario7	 
#Esquema do Cenário: Gerar relatório 31, demitidos e aposentados = TODOS, inserir holding da empresa 120624 e verificar os resultados apresentados para 3 últimas competências
	#Quando seleciono a opção Gestão Saúde
	#E seleciono a opção Análise de Custos e Receita Emitida Contábil
	#ntão as opções Filtrar empresa, Limpar Filtro e Gerar Relatório são apresentadas
	#Quando seleciono a opção Filtrar Empresa
	#Então o campo Pesquisar do grid Filtrar Empresa é apresentado
	#Quando pesquiso pela empresa "<empresa>"
	#Então o sistema apresenta a empresa "<empresa>" no grid Filtrar Empresa
	#Quando seleciono holding da empresa "<sigla_empresa>" no grid Filtrar Empresa
	#Quando adiciono a empresa "<sigla_empresa>" no grid Filtrar Empresa
	#Quando clico no botão Sair e Atualizar Relatório
	#Então os campos Demitidos e Aposentados, Filial Empresa, Data de Competência, Empresa e Moeda são apresentados
	#Quando seleciono a opção "<opcao_filtro_demitidos_e_aposentados>" no filtro Demitidos e Aposentados
	#Quando seleciono as opções ultima_competencia, penultima_competencia e antepenultima_competencia no filtro Data de Competência
	#| ultima_competencia | penultima_competencia | antepenultima_competencia |
	#| Janeiro 2018		 | Dezembro 2017		 | Novembro 2017			 |    
	#Quando seleciono a opção "<opcao_filtro_moeda>" no filtro Moeda
	#Quando clico no botão Exibir Relatório
	#Então visualizo o relatório "<relatorio>"
	#Quando seleciono todos os campos apresentados no relatório 31 para Filial Empresa
	#Então confiro os dados do relatório31 Filial Empresa demitidos e aposentados igual a TODOS com os dados do banco de dados para as competências "<ultima_competencia>", "<penultima_competencia>" e "<antepenultima_competencia>"
	
#Exemplos:
	#| opcao_filtro_demitidos_e_aposentados | opcao_filtro_filial_empresa | opcao_filtro_empresa | opcao_filtro_moeda | relatorio										           | ultima_competencia |  penultima_competencia | antepenultima_competencia |  empresa  | sigla_empresa |
	#| DA_Todas 						       | FE_Todas			         | E_Todas              | REAL               | Gestão Saúde - Análise de Custos e Receita Emitida/Contábil |     201801	  		|   201712					 |   201711                  |  120624   | 120624 - BRF  |