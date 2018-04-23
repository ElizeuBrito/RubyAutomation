Quando("seleciono a opção DICOP Saúde") do
	on(MenusTopo).selecionar_menu_dicop_saude
end

E("seleciono a opção Análise de Custos por Especialidade Beneficiários no menu DICOP Saúde") do
  navigate_to(OpcoesMenuDICOPSaude, :using => :rotas_menu_dicop_saude).selecionar_analise_de_custos_por_especialidade_beneficiarios_menu_dicop_saude
end

Então("os campos Demitidos e Aposentados, Filial Amil, Empresa, Moeda, Tipo de Evento, Célula, Operadora, Filial Empresa, Data de Competência e P&L são apresentados") do
  on(FuncoesGenericas).campos_exibir_relatorio192_visiveis?
end

Quando("seleciono a opção {string} no filtro Filial Amil DICOP Saúde") do |opcao_filtro_filial_amil|
	on(FuncoesGenericas).selecionar_opcao_no_filtro_filial_amil(opcao_filtro_filial_amil)
end

Quando("seleciono a opção {string} no filtro Empresa DICOP Saúde") do |opcao_filtro_empresa|
	on(FuncoesGenericas).selecionar_opcao_no_filtro_empresa_relatorio192(opcao_filtro_empresa)
end

Quando("seleciono a opção {string} no filtro Moeda DICOP Saúde") do |opcao_filtro_moeda|
	on(FuncoesGenericas).selecionar_moeda_no_fltro_moeda_dicop_saude = opcao_filtro_moeda
end

Quando("seleciono a opção {string} no filtro Tipo de Evento DICOP Saúde") do |opcao_filtro_tipo_de_evento|
	on(FuncoesGenericas).selecionar_tipo_evento_no_fltro_tipo_de_evento_dicop_saude = opcao_filtro_tipo_de_evento
end

Quando("seleciono a opção {string} no filtro Célula DICOP Saúde") do |opcao_filtro_celula|
	on(FuncoesGenericas).selecionar_opcao_no_filtro_celula_relatorio192(opcao_filtro_celula)
end

Quando("seleciono a opção {string} no filtro Operadora DICOP Saúde") do |opcao_filtro_operadora|
	on(FuncoesGenericas).selecionar_opcao_no_filtro_operadora_relatorio192(opcao_filtro_operadora)
end

Quando("seleciono a opção {string} no filtro Filial Empresa DICOP Saúde") do |opcao_filtro_filial_empresa|
	on(FuncoesGenericas).selecionar_opcao_no_filtro_filial_empresa_relatorio192(opcao_filtro_filial_empresa)
end

Quando("seleciono {int} últimas competências no campo Data de Competência DICOP Saúde") do |competencias_em_meses|
	on(FuncoesGenericas).selecionar_quantidade_de_competencias_em_meses_dicop_saude(competencias_em_meses)
end

Quando("seleciono a opção {string} no filtro PL Dicop Saúde") do |opcao_filtro_pl|
	on(FuncoesGenericas).selecionar_opcao_no_filtro_pl_relatorio192(opcao_filtro_pl)
end

Então("as filiais da empresa {string} são apresentadas com sucesso") do |empresa|
	on(FuncoesGenericas).verificar_filiais_da_empresa_relatorio192(empresa)
end

Então("confiro os dados de Especialidades do relatório192 com os dados do banco de dados para as competências {string}, {string} e {string}") do |ultima_competencia, penultima_competencia, antepenultima_competencia|
	on(DicopSaudeFiltrarEmpresa).conferir_dados_de_especialidades_relatorio192_01(antepenultima_competencia, penultima_competencia, ultima_competencia)
end

Quando("seleciono a especialidade {string} na tabela de Especialidades") do |especialidade|
	on(FuncoesGenericas).selecionar_especialidade_na_tabela_de_especialidades(especialidade)
end

Então("visualizo o detalhamento do relatório {string}") do |detalhamento_relatorio|
	on(FuncoesGenericas).relatorio_visivel?(detalhamento_relatorio)	
end

Então("visualizo a especialidade {string} selecionada no detalhamento do relatório") do |especialidade_selecionada|
	on(FuncoesGenericas).verificar_especialidade_apresentada_relatorio192_2(especialidade_selecionada)
end

Então("confiro os dados do Detalhamento da Especialidade do relatório192 com os dados do banco de dados para as competências {string}, {string} e {string}") do |ultima_competencia, penultima_competencia, antepenultima_competencia|
	on(DicopSaudeFiltrarEmpresa).conferir_detalhamento_de_especialidade_relatorio192_02(antepenultima_competencia, penultima_competencia, ultima_competencia)
end

Quando("seleciono o beneficiário {string} na tabela de Beneficiários") do |beneficiario|
	on(FuncoesGenericas).selecionar_beneficiario_na_tabela_de_beneficiarios(beneficiario)
end

Então("visualizo o relatório {string} de detalhes do prestador por beneficiário") do |relatorio_beneficiario|
	on(FuncoesGenericas).relatorio_visivel?(relatorio_beneficiario)
end

Então("visualizo o nome {string} do beneficiário") do |beneficiario|
	on(FuncoesGenericas).verificar_beneficiario_apresentado_relatorio192_3(beneficiario)
end

