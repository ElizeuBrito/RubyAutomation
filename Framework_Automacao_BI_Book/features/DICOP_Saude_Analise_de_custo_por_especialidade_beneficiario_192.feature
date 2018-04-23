#enconding: utf-8
#language: pt
@Relatorio192
Funcionalidade: Analisar Relatórios DICOP Saúde - Análise de Custos por Especialidade - Beneficiários - 192

"""
*********************************
* DOCUMENTAÇÃO DO CASO DE TESTE *
*********************************
Data de criação: 09/04/2018
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
	
@cenario1_relatorio192	 
Esquema do Cenário: Gerar relatório 192 para a Empresa 000509 e verificar os resultados apresentados para 3 últimas competências

	Quando seleciono a opção DICOP Saúde
	E seleciono a opção Análise de Custos por Especialidade Beneficiários no menu DICOP Saúde

	#Step comum entre todos os casos de testes, está localizado no caso de teste do relatório31
	Então as opções Filtrar empresa, Limpar Filtro e Gerar Relatório são apresentadas

	#Step comum entre todos os casos de testes, está localizado no caso de teste do relatório31
	Quando seleciono a opção Filtrar Empresa

	#Step comum entre todos os casos de testes, está localizado no caso de teste do relatório31
	Então o campo Pesquisar do grid Filtrar Empresa é apresentado

	#Step comum entre todos os casos de testes, está localizado no caso de teste do relatório31
	Quando pesquiso pela empresa "<empresa>"

	#Step comum entre todos os casos de testes, está localizado no caso de teste do relatório31
	Então o sistema apresenta a empresa "<empresa>" no grid Filtrar Empresa

	#Step comum entre todos os casos de testes, está localizado no caso de teste do relatório31
	Quando adiciono a empresa "<sigla_empresa>" no grid Filtrar Empresa

	#Step comum entre todos os casos de testes, está localizado no caso de teste do relatório31
	Quando clico no botão Sair e Atualizar Relatório

	Então os campos Demitidos e Aposentados, Filial Amil, Empresa, Moeda, Tipo de Evento, Célula, Operadora, Filial Empresa, Data de Competência e P&L são apresentados

	#Step comum entre todos os casos de testes, está localizado no caso de teste do relatório31
	Quando seleciono a opção "<opcao_filtro_demitidos_e_aposentados>" no filtro Demitidos e Aposentados

	Quando seleciono a opção "<opcao_filtro_filial_amil>" no filtro Filial Amil DICOP Saúde
	Quando seleciono a opção "<opcao_filtro_empresa>" no filtro Empresa DICOP Saúde
	Quando seleciono a opção "<opcao_filtro_moeda>" no filtro Moeda DICOP Saúde
	Quando seleciono a opção "<opcao_filtro_tipo_de_evento>" no filtro Tipo de Evento DICOP Saúde
	Quando seleciono a opção "<opcao_filtro_celula>" no filtro Célula DICOP Saúde
	Quando seleciono a opção "<opcao_filtro_operadora>" no filtro Operadora DICOP Saúde
	Quando seleciono a opção "<opcao_filtro_filial_empresa>" no filtro Filial Empresa DICOP Saúde
	Quando seleciono <competencias_em_meses> últimas competências no campo Data de Competência DICOP Saúde
	Quando seleciono a opção "<opcao_filtro_pl>" no filtro PL Dicop Saúde

	#Step comum entre todos os casos de testes, está localizado no caso de teste do relatório31
	Quando clico no botão Exibir Relatório

	#Step comum entre todos os casos de testes, está localizado no caso de teste do relatório31
	Então visualizo o relatório "<relatorio>"

	Então as filiais da empresa "<sigla_empresa>" são apresentadas com sucesso	
	Então confiro os dados de Especialidades do relatório192 com os dados do banco de dados para as competências "<ultima_competencia>", "<penultima_competencia>" e "<antepenultima_competencia>"
	Quando seleciono a especialidade "<especialidade>" na tabela de Especialidades
	Então visualizo o detalhamento do relatório "<detalhamento_relatorio>"
	Então visualizo a especialidade "<especialidade_selecionada>" selecionada no detalhamento do relatório
	Então confiro os dados do Detalhamento da Especialidade do relatório192 com os dados do banco de dados para as competências "<ultima_competencia>", "<penultima_competencia>" e "<antepenultima_competencia>"
	Quando seleciono o beneficiário "<beneficiario>" na tabela de Beneficiários
	Então visualizo o relatório "<relatorio_beneficiario>" de detalhes do prestador por beneficiário
	Então visualizo o nome "<beneficiario>" do beneficiário
	

	
Exemplos:
	| opcao_filtro_demitidos_e_aposentados | opcao_filtro_filial_amil  | opcao_filtro_filial_empresa     | opcao_filtro_empresa   | opcao_filtro_moeda | opcao_filtro_tipo_de_evento | opcao_filtro_celula | opcao_filtro_operadora | competencias_em_meses| opcao_filtro_pl | empresa | sigla_empresa  | relatorio                                                         | ultima_competencia | penultima_competencia | antepenultima_competencia | especialidade  | detalhamento_relatorio											  | especialidade_selecionada | beneficiario   | relatorio_beneficiario                                         |
	| DA_Todas 						       | FA_Todas_192              | FE_Todas_192			         | E_Todas_192            | REAL               | CONSULTA                    | CE_todas_192        | op_todas_192           | 3	   			       | pl_todas_192    | 000509  | 000509 - PRICE | DICOP Saúde - Análise de Custos por Especialidade - Beneficiários | 201802			 | 201801				 | 201712					 | Clínica Médica | Detalhamento - Análise de Custos por Especialidade - Beneficiário | Clínica Médica            | GIOVANNA DEL PRETE | Detalhamento - Análise de Custos por Especialidade - Prestador |
