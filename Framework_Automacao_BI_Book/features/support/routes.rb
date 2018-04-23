require 'require_all'
require_rel 'pages'

PageObject::PageFactory.routes = {
	#Rota default diz respeito ao menu Gestão Saúde
	:default => [[OpcoesMenuGestaoSaude,:selecionar_analise_de_custos_e_receita_emitida_contabil_menu_gestao_saude]],
	:rotas_menu_gestao_dental => [[OpcoesMenuGestaoDental,:selecionar_analise_de_custos_e_receita_emitida_contabil_menu_gestao_dental]],
	:rotas_menu_dicop_saude => [[OpcoesMenuDICOPSaude,:selecionar_analise_de_custos_por_especialidade_beneficiarios_menu_dicop_saude]],
	:rotas_menu_amil_planos_gestao => [[OpcoesMenuAmilPlanosGestao,:selecionar_analise_de_receita_competencia_menu_amil_planos_gestao]]
}