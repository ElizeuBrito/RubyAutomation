Dado("que estou conectado no sistema BI Book") do
    visit(PaginaInicial)
end

Quando("seleciono a opção Gestão Saúde") do
  on(MenusTopo).selecionar_menu_gestao_saude
end

Quando("seleciono a opção Análise de Custos e Receita Emitida Contábil no menu Gestão Saúde") do
  navigate_to(OpcoesMenuGestaoSaude, :using => :default).selecionar_analise_de_custos_e_receita_emitida_contabil_menu_gestao_saude
end

Então("as opções Filtrar empresa, Limpar Filtro e Gerar Relatório são apresentadas") do
  on(SubmenusTopo).botao_filtrar_empresa_visivel?
  on(SubmenusTopo).botao_limpar_filtro_visivel?
  on(SubmenusTopo).botao_gerar_relatorio_visivel?
end

Quando("seleciono a opção Gerar Relatório") do
  on(SubmenusTopo).selecionar_opcao_gerar_relatorio
end

Quando("seleciono a opção Filtrar Empresa") do
  on(SubmenusTopo).selecionar_opcao_filtrar_empresa
end

Então("os campos Demitidos e Aposentados, Filial Empresa, Data de Competência, Empresa e Moeda são apresentados") do
  on(FuncoesGenericas).campos_exibir_relatorio31_visiveis?
end

Então("o campo Pesquisar do grid Filtrar Empresa é apresentado") do
  on(GestaoSaudeFiltrarEmpresa).campos_filtrar_empresa_visiveis?
end

Quando("pesquiso pela empresa {string}") do |empresa|
  on(GestaoSaudeFiltrarEmpresa).pesquisar_empresa(empresa)
end

Quando("seleciono a opção {string} no filtro Demitidos e Aposentados") do |opcao_filtro_demitidos_e_aposentados|
  on(FuncoesGenericas).selecionar_opcao_no_filtro_demitidos_e_aposentados(opcao_filtro_demitidos_e_aposentados)
end

Quando("seleciono a opção {string} no filtro Filial Empresa") do |opcao_filtro_filial_empresa|
  on(FuncoesGenericas).selecionar_opcao_no_filtro_filial_empresa(opcao_filtro_filial_empresa)
end

Quando("seleciono {int} últimas competências no campo Data de Competência") do |competencias_em_meses|
  on(FuncoesGenericas).selecionar_quantidade_de_competencias_em_meses_gestao_saude(competencias_em_meses)
end

#Quando("seleciono as opções ultima_competencia, penultima_competencia e antepenultima_competencia no filtro Data de Competência") do |table|
	#table.hashes.each do |row|
		#on(FuncoesGenericas).selecionar_opcao_no_filtro_data_de_competencia(row["ultima_competencia"])
		#on(FuncoesGenericas).selecionar_opcao_no_filtro_data_de_competencia(row["penultima_competencia"])
		#on(FuncoesGenericas).selecionar_opcao_no_filtro_data_de_competencia(row["antepenultima_competencia"])
	#end
#end

Quando("seleciono a opção {string} no filtro Empresa") do |opcao_filtro_empresa|
  on(FuncoesGenericas).selecionar_opcao_no_filtro_empresa(opcao_filtro_empresa)
end

Quando("seleciono a opção {string} no filtro Moeda Gestao Saude") do |moeda|
  on(FuncoesGenericas).selecionar_moeda_no_fltro_moeda_gestao_saude = moeda
end

Quando("seleciono a opção {string} no filtro Produto") do |opcao_filtro_produto|
  on(FuncoesGenericas).selecionar_opcao_no_filtro_produto(opcao_filtro_produto)
end

Quando("clico no botão Exibir Relatório") do
	on(FuncoesGenericas).pressionar_botao_exibir_relatorio
  sleep 4
  #Aguarndo o ícone de carregamento da tela desaparecer
  @browser.div(:id => Locators::LOCATOR_ICONE_CARREGANDO).wait_while_present(timeout:60000)
end

Então("visualizo o relatório {string}") do |relatorio|
  on(FuncoesGenericas).relatorio_visivel?(relatorio)
end

Quando("seleciono todos os campos apresentados no relatório") do
  on(GestaoSaudeGerarRelatorio).obter_dados_do_relatorio31
end

Então("confiro os dados do relatório31 de demitidos e aposentados igual a TODOS com os dados do banco de dados para as competências {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string} e {string}") do |competencia1, competencia2, competencia3, competencia4, competencia5, competencia6, competencia7, competencia8, competencia9, competencia10, competencia11, competencia12, competencia13|
  on(GestaoSaudeGerarRelatorio).conferir_dados_do_relatorio31_01b(competencia1, competencia2, competencia3, competencia4, competencia5, competencia6, competencia7, competencia8, competencia9, competencia10, competencia11, competencia12, competencia13)
end

Então("confiro os dados do relatório31 de demitidos e aposentados igual a TODOS com os dados do banco de dados para as competências {string}, {string} e {string}") do |ultima_competencia, penultima_competencia, antepenultima_competencia|
  on(GestaoSaudeGerarRelatorio).conferir_dados_do_relatorio31_01(ultima_competencia, penultima_competencia, antepenultima_competencia)
end

Então("confiro os dados do relatório31 de demitidos e aposentados igual a SIM com os dados do banco de dados para as competências {string}, {string} e {string}") do |ultima_competencia, penultima_competencia, antepenultima_competencia|
  on(GestaoSaudeGerarRelatorio).conferir_dados_do_relatorio31_02(ultima_competencia, penultima_competencia, antepenultima_competencia)
end

Então("confiro os dados do relatório31 Filial Empresa demitidos e aposentados igual a TODOS com os dados do banco de dados para as competências {string}, {string} e {string}") do |ultima_competencia, penultima_competencia, antepenultima_competencia|
  on(GestaoSaudeFiltrarEmpresa).conferir_dados_do_relatorio31_03(ultima_competencia, penultima_competencia, antepenultima_competencia)
  sleep 5
end

Quando("seleciono {int} de um ano no filtro Data de Competência") do |competencias_em_meses|
    on(FuncoesGenericas).selecionar_quantidade_de_competencias_em_meses_gestao_saude(competencias_em_meses)
end

Quando("clicno na lupa do grid Filtrar Empresa") do
  on(GestaoSaudeFiltrarEmpresa).acionar_lupa
end

Quando("seleciono coligadas da empresa {string} no grid Filtrar Empresa") do |sigla_empresa|
 on(GestaoSaudeFiltrarEmpresa).inserir_coligadas_empresa_no_grid_filtrar_empresa(sigla_empresa)
end

Quando("adiciono a empresa {string} no grid Filtrar Empresa") do |sigla_empresa|
  on(GestaoSaudeFiltrarEmpresa).selecionar_empresa_no_grid_filtrar_empresa(sigla_empresa)
end

Quando("clico no botão Sair e Atualizar Relatório") do
  on(GestaoSaudeFiltrarEmpresa).acionar_botao_sair_e_atualizar_relatorio
end

Quando("seleciono todos os campos apresentados no relatório 31 para Filial Empresa") do
  on(GestaoSaudeFiltrarEmpresa).obter_dados_do_relatorio31_filial_empresa
end

Quando("aciono a opção Empresas Selecionadas") do
  on(GestaoSaudeFiltrarEmpresa).acionar_opcao_empresas_selecionadas
end

Então("o sistema apresenta a empresa {string} no grid Filtrar Empresa") do |empresa|
  on(GestaoSaudeFiltrarEmpresa).verficar_empresa_apresentada_no_grid_fltrar_empresa(empresa)
end