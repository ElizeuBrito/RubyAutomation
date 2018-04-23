#enconding: utf-8
#language: pt
@Relatorio36
Funcionalidade: Analisar Relatórios Gestão Dental - Análise de custo e Receita Emitida/Contábil - 36

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
@cenario1_relatorio36	 
Esquema do Cenário: Gerar relatório 36, Demitidos Aposentados = Todas, Filial Empresa = Todas, Moeda = Real, Empresa = Todas, Produtos = Todos e verificar os resultados apresentados para 3 últimas competências
	Quando seleciono a opção Gestão Dental
	E seleciono a opção Análise de Custos e Receita Emitida Contábil no menu Gestão Dental
	Então as opções Filtrar empresa, Limpar Filtro e Gerar Relatório são apresentadas
	Quando seleciono a opção Gerar Relatório
	Então os campos Demitidos e Aposentados, Filial Empresa, Moeda, Empresa, Data de Competência e Produto são apresentados
	Quando seleciono a opção "<opcao_filtro_demitidos_e_aposentados>" no filtro Demitidos e Aposentados
	Quando seleciono a opção "<opcao_filtro_filial_empresa>" no filtro Filial Empresa
	Quando seleciono a opção "<opcao_filtro_moeda>" no filtro Moeda Gestao Dental
	Quando seleciono a opção "<opcao_filtro_empresa>" no filtro Empresa
	Quando seleciono <competencias_em_meses> da última competência mais duas competências anteriores
	Quando seleciono a opção "<opcao_filtro_produto>" no filtro Produto
	Quando clico no botão Exibir Relatório
	Então visualizo o relatório "<relatorio>"
	Então confiro os dados do relatório36_01 com os dados do banco de dados para as competências "<competencia1>", "<competencia2>" e "<competencia3>"
	
Exemplos:
	| opcao_filtro_demitidos_e_aposentados | opcao_filtro_filial_empresa | opcao_filtro_empresa | opcao_filtro_moeda | relatorio										            | opcao_filtro_produto | competencias_em_meses | competencia1 | competencia2 | competencia3 |
	| DA_Todas 						       | FE_Todas			         | E_Todas              | REAL               | Gestão Dental - Análise de Custos e Receita Emitida/Contábil | PR_Todas             | 3				       | 201712	      | 201801	     | 201802    	|



@cenario2_relatorio36	 
Esquema do Cenário: Gerar relatório 36, Demitidos Aposentados = Sim, Filial Empresa = Todas, Moeda = Real, Empresa = Todas, Produtos = Todos e verificar os resultados apresentados para 3 últimas competências
	Quando seleciono a opção Gestão Dental
	E seleciono a opção Análise de Custos e Receita Emitida Contábil no menu Gestão Dental
	Então as opções Filtrar empresa, Limpar Filtro e Gerar Relatório são apresentadas
	Quando seleciono a opção Gerar Relatório
	Então os campos Demitidos e Aposentados, Filial Empresa, Moeda, Empresa, Data de Competência e Produto são apresentados
	Quando seleciono a opção "<opcao_filtro_demitidos_e_aposentados>" no filtro Demitidos e Aposentados
	Quando seleciono a opção "<opcao_filtro_filial_empresa>" no filtro Filial Empresa
	Quando seleciono a opção "<opcao_filtro_moeda>" no filtro Moeda Gestao Dental
	Quando seleciono a opção "<opcao_filtro_empresa>" no filtro Empresa
	Quando seleciono <competencias_em_meses> da última competência mais duas competências anteriores
	Quando seleciono a opção "<opcao_filtro_produto>" no filtro Produto
	Quando clico no botão Exibir Relatório
	Então visualizo o relatório "<relatorio>"
	Então confiro os dados do relatório36_02 com os dados do banco de dados para as competências "<competencia1>", "<competencia2>" e "<competencia3>"
	
Exemplos:
	| opcao_filtro_demitidos_e_aposentados | opcao_filtro_filial_empresa | opcao_filtro_empresa | opcao_filtro_moeda | relatorio										            | opcao_filtro_produto | competencias_em_meses | competencia1 | competencia2 | competencia3 |
	| DA_Sim 						       | FE_Todas			         | E_Todas              | REAL               | Gestão Dental - Análise de Custos e Receita Emitida/Contábil | PR_Todas             | 3 				       | 201712	      | 201801	     | 201802    	|


@cenario3_relatorio36	 
Esquema do Cenário: Gerar relatório 36, Demitidos Aposentados = Todas, Empresa = 948206, Moeda = REAL, Produto = Todos e verificar os resultados apresentados para 3 últimas competências
	Quando seleciono a opção Gestão Dental
	E seleciono a opção Análise de Custos e Receita Emitida Contábil no menu Gestão Dental
	Então as opções Filtrar empresa, Limpar Filtro e Gerar Relatório são apresentadas
	Quando seleciono a opção Filtrar Empresa
	Então o campo Pesquisar do grid Filtrar Empresa é apresentado
	Quando pesquiso pela empresa "<empresa>"
	Então o sistema apresenta a empresa "<empresa>" no grid Filtrar Empresa
	Quando adiciono a empresa "<sigla_empresa>" no grid Filtrar Empresa
	Quando clico no botão Sair e Atualizar Relatório
	Então os campos Demitidos e Aposentados, Filial Empresa, Moeda, Empresa, Data de Competência e Produto são apresentados
	Quando seleciono a opção "<opcao_filtro_demitidos_e_aposentados>" no filtro Demitidos e Aposentados
	Quando seleciono a opção "<opcao_filtro_moeda>" no filtro Moeda Gestao Dental
	Quando seleciono <competencias_em_meses> da última competência mais duas competências anteriores
	Quando seleciono a opção "<opcao_filtro_produto>" no filtro Produto
	Quando clico no botão Exibir Relatório
	Então visualizo o relatório "<relatorio>"
	Então confiro os dados do relatório36_03 com os dados do banco de dados para as competências "<competencia1>", "<competencia2>" e "<competencia3>"
	
Exemplos:
	| opcao_filtro_demitidos_e_aposentados | opcao_filtro_moeda | relatorio										               | competencia1 | competencia2 | competencia3 |  empresa  | sigla_empresa                | competencias_em_meses | opcao_filtro_produto |
	| DA_Todas 						       | REAL               | Gestão Dental - Análise de Custos e Receita Emitida/Contábil | 201712	      | 201801		 | 201802       |  948206   | 948206 - ARMARINHOS FERNANDO | 3                     | PR_Todas             |


@cenario4_relatorio36	 
Esquema do Cenário: Gerar relatório 36, Demitidos Aposentados = TODOS, inserir coligadas empresa 948206, Moeda = REAL, Produto = Todos e verificar os resultados apresentados para 3 últimas competências
	Quando seleciono a opção Gestão Dental
	E seleciono a opção Análise de Custos e Receita Emitida Contábil no menu Gestão Dental
	Então as opções Filtrar empresa, Limpar Filtro e Gerar Relatório são apresentadas
	Quando seleciono a opção Filtrar Empresa
	Então o campo Pesquisar do grid Filtrar Empresa é apresentado
	Quando pesquiso pela empresa "<empresa>"
	Então o sistema apresenta a empresa "<empresa>" no grid Filtrar Empresa
	Quando seleciono coligadas da empresa "<sigla_empresa>" no grid Filtrar Empresa
	Quando adiciono a empresa "<sigla_empresa>" no grid Filtrar Empresa
	Quando clico no botão Sair e Atualizar Relatório
	Então os campos Demitidos e Aposentados, Filial Empresa, Moeda, Empresa, Data de Competência e Produto são apresentados
	Quando seleciono a opção "<opcao_filtro_demitidos_e_aposentados>" no filtro Demitidos e Aposentados
	Quando seleciono a opção "<opcao_filtro_moeda>" no filtro Moeda Gestao Dental
	Quando seleciono <competencias_em_meses> da última competência mais duas competências anteriores 
	Quando seleciono a opção "<opcao_filtro_produto>" no filtro Produto
	Quando clico no botão Exibir Relatório
	Então visualizo o relatório "<relatorio>"
	Então confiro os dados do relatório36_04 com os dados do banco de dados para as competências "<competencia1>", "<competencia2>" e "<competencia3>"
	
Exemplos:
	| opcao_filtro_demitidos_e_aposentados | opcao_filtro_filial_empresa | opcao_filtro_empresa | opcao_filtro_moeda | relatorio										            | empresa  | sigla_empresa                 | competencia1 | competencia2 | competencia3 | opcao_filtro_produto | competencias_em_meses |
	| DA_Todas 						       | FE_Todas			         | E_Todas              | REAL               | Gestão Dental - Análise de Custos e Receita Emitida/Contábil | 948206   | 948206 - ARMARINHOS FERNANDO  | 201712	     | 201801		 | 201802       | PR_Todas            | 3                     |